
function drawDistortedVideo(ctx, video, x, y, w, h, intensity) {
    const slices = 20;
    const sliceHeight = h / slices;

    for (let i = 0; i < slices; i++) {
        const sy = (video.videoHeight / slices) * i;
        const sHeight = video.videoHeight / slices;
        const dy = y + (sliceHeight * i);

        // Offset based on random + intensity
        const xShift = (Math.random() - 0.5) * (intensity / 5);

        try {
            ctx.drawImage(video, 0, sy, video.videoWidth, sHeight, x + xShift, dy, w, sliceHeight);
        } catch (e) { }
    }
}

function drawTestPattern(ctx, width, height, label) {
    // SMPTE-style Color Bars
    const colors = ['#ffffff', '#ffff00', '#00ffff', '#00ff00', '#ff00ff', '#ff0000', '#0000ff'];
    const barWidth = width / colors.length;

    for (let i = 0; i < colors.length; i++) {
        ctx.fillStyle = colors[i];
        ctx.fillRect(i * barWidth, 0, barWidth, height);
    }

    // Label
    ctx.fillStyle = '#000';
    ctx.fillRect(width / 2 - 100, height / 2 - 50, 200, 100);
    ctx.fillStyle = '#fff';
    ctx.font = 'bold 40px Arial';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    ctx.fillText(`DECK ${label}`, width / 2, height / 2);
    ctx.font = '20px Arial';
    ctx.fillText('NO SIGNAL', width / 2, height / 2 + 30);
}
