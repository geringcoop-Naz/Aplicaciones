const ui = {
    init() {
        this.setupNavigation();
        this.setupDragAndDrop();
        this.setupEventListeners();
    },

    setupNavigation() {
        const navLinks = document.querySelectorAll('.nav-links li');
        const views = document.querySelectorAll('.view');
        const pageTitle = document.getElementById('page-title');

        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                // Remove active class from all
                navLinks.forEach(l => l.classList.remove('active'));
                views.forEach(v => v.classList.remove('active'));

                // Add active class to clicked
                link.classList.add('active');
                const tabId = link.getAttribute('data-tab');
                document.getElementById(`${tabId}-view`).classList.add('active');
                
                // Update title
                pageTitle.textContent = link.querySelector('span').textContent;
            });
        });
    },

    navigateTo(tabId) {
        const link = document.querySelector(`.nav-links li[data-tab="${tabId}"]`);
        if (link) link.click();
    },

    setupDragAndDrop() {
        const dropZone = document.getElementById('drop-zone');
        const fileInput = document.getElementById('file-input');

        dropZone.addEventListener('click', () => fileInput.click());

        dropZone.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropZone.classList.add('dragover');
        });

        dropZone.addEventListener('dragleave', () => {
            dropZone.classList.remove('dragover');
        });

        dropZone.addEventListener('drop', (e) => {
            e.preventDefault();
            dropZone.classList.remove('dragover');
            const files = e.dataTransfer.files;
            if (files.length) {
                this.handleFiles(files);
            }
        });

        fileInput.addEventListener('change', (e) => {
            if (fileInput.files.length) {
                this.handleFiles(fileInput.files);
            }
        });
    },

    handleFiles(files) {
        const file = files[0];
        if (file && file.type === "text/csv" || file.name.endsWith('.csv')) {
            // Show loading or file info
            const fileList = document.getElementById('file-list');
            fileList.innerHTML = `
                <div class="file-item">
                    <i class="fa-solid fa-file-csv"></i>
                    <span>${file.name}</span>
                    <span class="status">Procesando...</span>
                </div>
            `;
            
            // Trigger analysis
            app.processFile(file);
        } else {
            alert('Por favor sube un archivo CSV válido.');
        }
    },

    updateStats(stats) {
        document.getElementById('station-count').textContent = stats.stationCount || 1;
        document.getElementById('years-count').textContent = stats.yearsCount || 0;
        document.getElementById('max-flow').textContent = `${stats.maxFlow.toFixed(2)} m³/s`;

        const tbody = document.querySelector('#stats-table tbody');
        tbody.innerHTML = '';
        
        const metrics = [
            { label: 'Caudal Medio', value: stats.meanFlow, unit: 'm³/s' },
            { label: 'Caudal Máximo', value: stats.maxFlow, unit: 'm³/s' },
            { label: 'Caudal Mínimo', value: stats.minFlow, unit: 'm³/s' },
            { label: 'Desviación Estándar', value: stats.stdDev, unit: 'm³/s' },
            { label: 'Coeficiente de Variación', value: stats.cv, unit: '-' },
            { label: 'Precipitación Total Anual Promedio', value: stats.avgPrecip, unit: 'mm' }
        ];

        metrics.forEach(m => {
            const row = `
                <tr>
                    <td>${m.label}</td>
                    <td>${m.value.toFixed(2)}</td>
                    <td>${m.unit}</td>
                </tr>
            `;
            tbody.innerHTML += row;
        });
    },

    setupEventListeners() {
        document.getElementById('year-filter').addEventListener('change', (e) => {
            analysis.filterByYear(e.target.value);
        });
    }
};
