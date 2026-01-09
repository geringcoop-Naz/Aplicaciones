// State
let slides = [
    {
        id: 1,
        title: "Bienvenido a PPT Creator",
        body: "Esta es tu primera diapositiva.\n\nPuedes editar el texto, cambiar los colores y agregar más diapositivas desde la barra lateral.",
        backgroundColor: "#ffffff",
        textColor: "#000000"
    }
];
let currentSlideIndex = 0;

// DOM Elements
const slidesListEl = document.getElementById('slides-list');
const addSlideBtn = document.getElementById('add-slide-btn');
const exportBtn = document.getElementById('export-btn');
const slideTitleInput = document.getElementById('slide-title');
const slideBodyInput = document.getElementById('slide-body');
const bgColorPicker = document.getElementById('bg-color-picker');
const textColorPicker = document.getElementById('text-color-picker');
const currentSlideEl = document.getElementById('current-slide');

// Initialization
function init() {
    renderSlidesList();
    loadSlide(0);
    setupEventListeners();
}

// Event Listeners
function setupEventListeners() {
    addSlideBtn.addEventListener('click', addNewSlide);

    slideTitleInput.addEventListener('input', (e) => updateCurrentSlide('title', e.target.value));
    slideBodyInput.addEventListener('input', (e) => updateCurrentSlide('body', e.target.value));

    bgColorPicker.addEventListener('input', (e) => {
        updateCurrentSlide('backgroundColor', e.target.value);
        currentSlideEl.style.backgroundColor = e.target.value;
        updateThumbnail(currentSlideIndex);
    });

    textColorPicker.addEventListener('input', (e) => {
        updateCurrentSlide('textColor', e.target.value);
        currentSlideEl.style.color = e.target.value;
        updateThumbnail(currentSlideIndex);
    });

    exportBtn.addEventListener('click', exportPresentation);
}

// Core Logic
function addNewSlide() {
    const newSlide = {
        id: Date.now(),
        title: "Nueva Diapositiva",
        body: "Agrega tu contenido aquí...",
        backgroundColor: "#ffffff",
        textColor: "#000000"
    };
    slides.push(newSlide);
    currentSlideIndex = slides.length - 1;
    renderSlidesList();
    loadSlide(currentSlideIndex);
}

function updateCurrentSlide(key, value) {
    slides[currentSlideIndex][key] = value;
    // Debounce thumbnail update for text changes could be good, but simple for now
    if (key === 'title' || key === 'body') {
        updateThumbnail(currentSlideIndex);
    }
}

function loadSlide(index) {
    currentSlideIndex = index;
    const slide = slides[index];

    // Update inputs
    slideTitleInput.value = slide.title;
    slideBodyInput.value = slide.body;
    bgColorPicker.value = slide.backgroundColor;
    textColorPicker.value = slide.textColor;

    // Update visual editor
    currentSlideEl.style.backgroundColor = slide.backgroundColor;
    currentSlideEl.style.color = slide.textColor;

    // Update active state in sidebar
    document.querySelectorAll('.slide-thumbnail').forEach((el, idx) => {
        if (idx === index) el.classList.add('active');
        else el.classList.remove('active');
    });
}

function renderSlidesList() {
    slidesListEl.innerHTML = '';
    slides.forEach((slide, index) => {
        const thumb = document.createElement('div');
        thumb.className = `slide-thumbnail ${index === currentSlideIndex ? 'active' : ''}`;
        thumb.onclick = () => loadSlide(index);

        // Mini preview
        thumb.innerHTML = `
            <div class="slide-thumbnail-content" style="background-color: ${slide.backgroundColor}; color: ${slide.textColor}">
                <h1 style="font-size: 2.5rem; font-weight: 700; margin-bottom: 1rem;">${slide.title}</h1>
                <p style="font-size: 1.2rem;">${slide.body}</p>
            </div>
            <div class="slide-number">${index + 1}</div>
        `;

        slidesListEl.appendChild(thumb);
    });
}

function updateThumbnail(index) {
    const slide = slides[index];
    const thumb = slidesListEl.children[index];
    if (thumb) {
        const content = thumb.querySelector('.slide-thumbnail-content');
        content.style.backgroundColor = slide.backgroundColor;
        content.style.color = slide.textColor;
        content.querySelector('h1').textContent = slide.title;
        content.querySelector('p').textContent = slide.body;
    }
}

// Export Logic
function exportPresentation() {
    const pptx = new PptxGenJS();

    slides.forEach(slideData => {
        const slide = pptx.addSlide();

        // Background
        slide.background = { color: slideData.backgroundColor };

        // Title
        slide.addText(slideData.title, {
            x: 0.5, y: 0.5, w: '90%', h: 1,
            fontSize: 32,
            bold: true,
            color: slideData.textColor.replace('#', ''),
            align: 'center'
        });

        // Body
        slide.addText(slideData.body, {
            x: 0.5, y: 1.8, w: '90%', h: 3.5,
            fontSize: 18,
            color: slideData.textColor.replace('#', ''),
            align: 'top',
            valign: 'top'
        });
    });

    pptx.writeFile({ fileName: "Mi-Presentacion.pptx" });
}

// Start
init();
