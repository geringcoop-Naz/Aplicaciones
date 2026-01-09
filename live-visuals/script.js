// DOM Elements
const deckA = {
    video: document.getElementById('video-a'),
    playBtn: document.getElementById('play-a'),
    stopBtn: document.getElementById('stop-a'),
    speed: document.getElementById('speed-a'),
    hue: document.getElementById('hue-a'),
    contrast: document.getElementById('contrast-a'),
    blur: document.getElementById('blur-a'),
    pixel: document.getElementById('pixel-a'),
    tint: document.getElementById('tint-a'),
    reactBtn: document.getElementById('react-a'),
    bank: document.getElementById('bank-a'),
    fileInput: document.getElementById('file-input-a'),
    sourceBtns: document.querySelectorAll('.source-btn[data-target="deck-a"]'),
    sourceType: 'video',
    stream: null,
    isReacting: false
};

const deckB = {
    video: document.getElementById('video-b'),
    playBtn: document.getElementById('play-b'),
    stopBtn: document.getElementById('stop-b'),
    speed: document.getElementById('speed-b'),
    hue: document.getElementById('hue-b'),
    contrast: document.getElementById('contrast-b'),
    blur: document.getElementById('blur-b'),
    pixel: document.getElementById('pixel-b'),
    tint: document.getElementById('tint-b'),
    reactBtn: document.getElementById('react-b'),
    bank: document.getElementById('bank-b'),
    fileInput: document.getElementById('file-input-b'),
    sourceBtns: document.querySelectorAll('.source-btn[data-target="deck-b"]'),
    sourceType: 'video',
    stream: null,
    isReacting: false
};

const mixer = {
    canvas: document.getElementById('master-canvas'),
    ctx: null,
    crossfader: document.getElementById('crossfader'),
    masterOpacity: document.getElementById('master-opacity'),
    strobeBtn: document.getElementById('strobe-btn'),
    noiseBtn: document.getElementById('noise-btn'),
    glitchBtn: document.getElementById('glitch-btn'),
    kaleidoBtn: document.getElementById('kaleido-btn'),
    blackoutBtn: document.getElementById('blackout-btn'),
    camBtn: document.getElementById('cam-btn'),
    audioStatus: document.getElementById('audio-status'),
    midiStatus: document.getElementById('midi-status'),
    audioBars: [
        document.getElementById('audio-bar-1'),
        document.getElementById('audio-bar-2'),
        document.getElementById('audio-bar-3')
    ]
};

const clockEl = document.getElementById('clock');
const fullscreenBtn = document.getElementById('fullscreen-btn');

// State
let isStrobing = false;
let isNoise = false;
let isGlitch = false;
let isKaleido = false;
let isBlackout = false;
let isCamActive = false;
let camStream = null;
let camVideo = null;
let strobeInterval = null;

// Audio Context
let audioCtx;
let analyser;
let dataArray;
let isAudioActive = false;
let audioLevel = 0;

// Initialize
function init() {
    // Canvas Setup
    mixer.ctx = mixer.canvas.getContext('2d', { willReadFrequently: true });
    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    // Clock
    setInterval(() => {
        const now = new Date();
        clockEl.textContent = now.toLocaleTimeString();
    }, 1000);

    // Setup Decks
    setupDeck(deckA);
    setupDeck(deckB);

    // Setup Mixer
    setupMixer();

    // Setup Audio
    mixer.audioStatus.addEventListener('click', initAudio);

    // Setup MIDI
    setupMIDI();

    // Start Render Loop
    requestAnimationFrame(renderLoop);
}

function resizeCanvas() {
    mixer.canvas.width = 1280; // Fixed internal resolution
    mixer.canvas.height = 720;
}

function setupDeck(deck) {
    // Playback
    deck.playBtn.addEventListener('click', () => {
        if (deck.video.paused) {
            deck.video.play().catch(e => console.log('Playback failed', e));
            deck.playBtn.classList.add('playing');
            deck.playBtn.innerHTML = '<i class="fa-solid fa-pause"></i>';
        } else {
            deck.video.pause();
            deck.playBtn.classList.remove('playing');
            deck.playBtn.innerHTML = '<i class="fa-solid fa-play"></i>';
        }
    });

    deck.stopBtn.addEventListener('click', () => {
        deck.video.pause();
        deck.video.currentTime = 0;
        deck.playBtn.classList.remove('playing');
        deck.playBtn.innerHTML = '<i class="fa-solid fa-play"></i>';
    });

    deck.speed.addEventListener('input', (e) => {
        deck.video.playbackRate = e.target.value;
    });

    // Audio React Toggle (Cycle Modes)
    const reactionModes = ['OFF', 'ZOOM', 'SHAKE', 'ROTATE'];
    deck.reactionMode = 'OFF';

    deck.reactBtn.addEventListener('click', () => {
        let currentIndex = reactionModes.indexOf(deck.reactionMode);
        let nextIndex = (currentIndex + 1) % reactionModes.length;
        deck.reactionMode = reactionModes[nextIndex];

        deck.reactBtn.classList.toggle('active', deck.reactionMode !== 'OFF');

        // Update button text with icon
        let icon = 'fa-music';
        if (deck.reactionMode === 'ZOOM') icon = 'fa-expand';
        if (deck.reactionMode === 'SHAKE') icon = 'fa-bolt';
        if (deck.reactionMode === 'ROTATE') icon = 'fa-sync';

        deck.reactBtn.innerHTML = `<i class="fa-solid ${icon}"></i> ${deck.reactionMode === 'OFF' ? 'REACT' : deck.reactionMode}`;
    });

    // File Loading
    deck.fileInput.addEventListener('change', (e) => {
        const file = e.target.files[0];
        if (file) {
            const url = URL.createObjectURL(file);
            loadVideoToBank(deck, url, file.name);
        }
    });
}

function loadVideoToBank(deck, url, name) {
    const slot = document.createElement('div');
    slot.className = 'bank-slot';

    const vid = document.createElement('video');
    vid.src = url;
    vid.muted = true;
    vid.preload = 'metadata';

    slot.appendChild(vid);
    slot.title = name;

    slot.addEventListener('click', () => {
        Array.from(deck.bank.children).forEach(c => c.classList.remove('active'));
        slot.classList.add('active');

        const wasPlaying = !deck.video.paused;
        deck.video.src = url;
        if (wasPlaying) deck.video.play();
    });

    deck.bank.appendChild(slot);
}



function setupMixer() {
    // Strobe
    mixer.strobeBtn.addEventListener('mousedown', () => {
        isStrobing = true;
        strobeInterval = setInterval(() => {
            mixer.canvas.style.filter = mixer.canvas.style.filter === 'invert(1)' ? 'invert(0)' : 'invert(1)';
        }, 50);
    });

    // Global MouseUp to stop momentary effects
    window.addEventListener('mouseup', () => {
        if (isStrobing) {
            isStrobing = false;
            clearInterval(strobeInterval);
            mixer.canvas.style.filter = 'none';
        }
        isNoise = false;
        isGlitch = false;
        isBlackout = false;
    });

    mixer.noiseBtn.addEventListener('mousedown', () => isNoise = true);
    mixer.glitchBtn.addEventListener('mousedown', () => isGlitch = true);
    mixer.blackoutBtn.addEventListener('mousedown', () => isBlackout = true);

    // Toggle Kaleido
    mixer.kaleidoBtn.addEventListener('click', () => {
        isKaleido = !isKaleido;
        mixer.kaleidoBtn.classList.toggle('active', isKaleido);
    });

    // Toggle Camera
    mixer.camBtn.addEventListener('click', async () => {
        if (!isCamActive) {
            try {
                const stream = await navigator.mediaDevices.getUserMedia({ video: true });
                camVideo = document.createElement('video');
                camVideo.srcObject = stream;
                camVideo.play();
                camStream = stream;
                isCamActive = true;
                mixer.camBtn.classList.add('active');
            } catch (err) {
                console.error("Camera Error:", err);
                alert("Camera access denied.");
            }
        } else {
            if (camStream) {
                camStream.getTracks().forEach(track => track.stop());
                camStream = null;
            }
            camVideo = null;
            isCamActive = false;
            mixer.camBtn.classList.remove('active');
        }
    });

    fullscreenBtn.addEventListener('click', () => {
        if (!document.fullscreenElement) {
            document.documentElement.requestFullscreen();
        } else {
            document.exitFullscreen();
        }
    });
}

// --- AUDIO SYSTEM ---
async function initAudio() {
    if (isAudioActive) return;

    try {
        audioCtx = new (window.AudioContext || window.webkitAudioContext)();
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        const source = audioCtx.createMediaStreamSource(stream);
        analyser = audioCtx.createAnalyser();
        analyser.fftSize = 64;
        source.connect(analyser);

        dataArray = new Uint8Array(analyser.frequencyBinCount);
        isAudioActive = true;

        mixer.audioStatus.classList.add('active');
        mixer.audioStatus.querySelector('.status-text').textContent = 'ON';
    } catch (err) {
        console.error("Audio Init Error:", err);
        alert("Microphone access denied.");
    }
}

function updateAudioAnalysis() {
    if (!isAudioActive) return;

    analyser.getByteFrequencyData(dataArray);

    // Calculate average volume
    let sum = 0;
    for (let i = 0; i < dataArray.length; i++) {
        sum += dataArray[i];
    }
    audioLevel = sum / dataArray.length; // 0-255

    // Update Visualizer Bars
    const low = dataArray[2];
    const mid = dataArray[10];
    const high = dataArray[20];

    mixer.audioBars[0].style.height = (low / 255 * 20) + 'px';
    mixer.audioBars[1].style.height = (mid / 255 * 20) + 'px';
    mixer.audioBars[2].style.height = (high / 255 * 20) + 'px';
}

// --- MIDI SYSTEM ---
function setupMIDI() {
    if (navigator.requestMIDIAccess) {
        navigator.requestMIDIAccess()
            .then(onMIDISuccess, onMIDIFailure);
    }
}

function onMIDISuccess(midiAccess) {
    mixer.midiStatus.classList.add('active');
    mixer.midiStatus.querySelector('.status-text').textContent = 'READY';

    for (var input of midiAccess.inputs.values()) {
        input.onmidimessage = getMIDIMessage;
    }
}

function onMIDIFailure() {
    console.log('Could not access your MIDI devices.');
}

function getMIDIMessage(message) {
    var command = message.data[0];
    var note = message.data[1];
    var velocity = (message.data.length > 2) ? message.data[2] : 0;

    // Simple Mapping Example
    // CC Messages usually start with 176 (Channel 1)
    if (command >= 176 && command <= 191) {
        // Map CC 1 (Mod Wheel) to Crossfader
        if (note === 1) {
            mixer.crossfader.value = (velocity / 127) * 100;
        }
        // Map CC 7 (Volume) to Master Opacity
        if (note === 7) {
            mixer.masterOpacity.value = (velocity / 127) * 100;
        }
    }
}

// --- RENDER LOOP ---
function renderLoop() {
    updateAudioAnalysis();

    const ctx = mixer.ctx;
    const width = mixer.canvas.width;
    const height = mixer.canvas.height;

    // Clear
    ctx.fillStyle = '#000';
    ctx.fillRect(0, 0, width, height);

    if (isBlackout) {
        requestAnimationFrame(renderLoop);
        return;
    }

    // Draw Idle Text if nothing is showing
    if (!isCamActive && deckA.video.readyState < 2 && deckB.video.readyState < 2) {
        ctx.fillStyle = '#111';
        ctx.font = 'bold 40px Outfit, sans-serif';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText('IRIS LIVE MIXER', width / 2, height / 2);
    }

    // Draw Camera Background if Active
    if (isCamActive && camVideo && camVideo.readyState >= 2) {
        ctx.save();
        // Center crop cover
        const vRatio = camVideo.videoWidth / camVideo.videoHeight;
        const cRatio = width / height;
        let dw, dh, dx, dy;

        if (vRatio > cRatio) {
            dh = height;
            dw = height * vRatio;
            dx = (width - dw) / 2;
            dy = 0;
        } else {
            dw = width;
            dh = width / vRatio;
            dx = 0;
            dy = (height - dh) / 2;
        }
        ctx.globalAlpha = 1.0;
        ctx.drawImage(camVideo, dx, dy, dw, dh);
        ctx.restore();
    }

    const crossfaderVal = mixer.crossfader.value / 100;
    const masterAlpha = mixer.masterOpacity.value / 100;

    // Draw Decks
    const alphaA = (1 - crossfaderVal) * masterAlpha;
    if (alphaA > 0.01) {
        ctx.globalAlpha = isCamActive ? alphaA * 0.8 : alphaA; // Blend if cam active
        drawDeckWithEffects(ctx, deckA, width, height);
    }

    const alphaB = crossfaderVal * masterAlpha;
    if (alphaB > 0.01) {
        ctx.globalAlpha = isCamActive ? alphaB * 0.8 : alphaB; // Blend if cam active
        drawDeckWithEffects(ctx, deckB, width, height);
    }

    // Reset Alpha
    ctx.globalAlpha = 1.0;
    ctx.filter = 'none';

    // Global Post-Processing
    if (isNoise) drawNoise(ctx, width, height);
    if (isGlitch) drawGlitch(ctx, width, height);
    if (isKaleido) drawKaleidoscope(ctx, width, height);

    requestAnimationFrame(renderLoop);
}

function drawDeckWithEffects(ctx, deck, width, height) {
    // Check if video is ready
    const isVideoReady = deck.video.readyState >= 2;

    // If not ready, do nothing (leave black/transparent)
    if (!isVideoReady) return;

    ctx.save(); // Save state for filters

    // Apply Filters
    const hue = deck.hue ? deck.hue.value : 0;
    const contrast = deck.contrast ? deck.contrast.value : 100;
    const blur = deck.blur ? deck.blur.value : 0;
    ctx.filter = `hue-rotate(${hue}deg) contrast(${contrast}%) blur(${blur}px)`;

    // Audio Reactivity (Movement Effects)
    let xOffset = 0;
    let yOffset = 0;
    let scale = 1.0;
    let rotation = 0;

    if (isAudioActive && deck.reactionMode !== 'OFF') {
        const intensity = audioLevel / 255; // 0.0 to 1.0

        switch (deck.reactionMode) {
            case 'ZOOM':
                // Pulse scale based on volume
                scale = 1.0 + (intensity * 0.4);
                break;
            case 'SHAKE':
                // Random jitter
                const shake = intensity * 40;
                xOffset = (Math.random() - 0.5) * shake;
                yOffset = (Math.random() - 0.5) * shake;
                break;
            case 'ROTATE':
                // Rocking rotation
                rotation = (intensity * 15) * (Math.sin(Date.now() / 100));
                break;
        }
    }

    // Draw Video or Pattern
    const w = width * scale;
    const h = height * scale;

    // Calculate center position
    const centerX = width / 2 + xOffset;
    const centerY = height / 2 + yOffset;
    const x = centerX - (w / 2);
    const y = centerY - (h / 2);

    ctx.save(); // Save for transform

    // Apply Rotation if needed
    if (rotation !== 0) {
        ctx.translate(centerX, centerY);
        ctx.rotate(rotation * Math.PI / 180);
        ctx.translate(-centerX, -centerY);
    }

    if (isVideoReady) {
        // Pixelate Effect
        const pixelSize = deck.pixel ? parseInt(deck.pixel.value) : 1;
        if (pixelSize > 1) {
            ctx.imageSmoothingEnabled = false;
            const smallW = w / pixelSize;
            const smallH = h / pixelSize;
            ctx.drawImage(deck.video, x, y, smallW, smallH);
            ctx.drawImage(mixer.canvas, x, y, smallW, smallH, x, y, w, h);
            ctx.imageSmoothingEnabled = true;
        } else {
            ctx.drawImage(deck.video, x, y, w, h);
        }
    }

    ctx.restore(); // Restore transform (rotation)

    // Apply Tint
    const tintColor = deck.tint ? deck.tint.value : '#ffffff';
    if (tintColor !== '#ffffff') {
        ctx.globalCompositeOperation = 'multiply';
        ctx.fillStyle = tintColor;
        ctx.fillRect(0, 0, width, height);
        ctx.globalCompositeOperation = 'source-over';
    }

    ctx.restore(); // Restore state (filters)
}

function drawNoise(ctx, width, height) {
    ctx.fillStyle = `rgba(255, 255, 255, ${Math.random() * 0.3})`;
    for (let i = 0; i < 20; i++) {
        const x = Math.random() * width;
        const y = Math.random() * height;
        const w = Math.random() * width;
        const h = Math.random() * 5;
        ctx.fillRect(x, y, w, h);
    }
}

function drawGlitch(ctx, width, height) {
    // RGB Shift
    const shift = (Math.random() - 0.5) * 40;
    const sliceHeight = Math.random() * 100;
    const sliceY = Math.random() * height;

    // Draw slice shifted
    try {
        ctx.drawImage(mixer.canvas, 0, sliceY, width, sliceHeight, shift, sliceY, width, sliceHeight);
    } catch (e) { } // Ignore if canvas not ready

    // Color overlay
    ctx.fillStyle = `rgba(${Math.random() * 255}, 0, 255, 0.2)`;
    ctx.fillRect(0, 0, width, height);
}

function drawKaleidoscope(ctx, width, height) {
    // Simple 4-way mirror
    // Grab left half
    const leftHalf = ctx.getImageData(0, 0, width / 2, height);

    // Put it on right half, flipped? No, putImageData doesn't flip.
    // Let's just draw the canvas onto itself flipped.
    ctx.save();
    ctx.translate(width, 0);
    ctx.scale(-1, 1);
    ctx.drawImage(mixer.canvas, 0, 0, width / 2, height, 0, 0, width / 2, height);
    ctx.restore();
}

// Start
window.addEventListener('DOMContentLoaded', init);
