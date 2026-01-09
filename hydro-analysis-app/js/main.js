const app = {
    init() {
        console.log('HydroStat Initialized');
        ui.init();
    },

    processFile(file) {
        Papa.parse(file, {
            header: true,
            dynamicTyping: true,
            skipEmptyLines: true,
            complete: (results) => {
                console.log('File parsed:', results);
                if (results.errors.length) {
                    console.error('Errors:', results.errors);
                    alert('Hubo errores al leer el archivo CSV.');
                }
                analysis.processData(results);
            },
            error: (err) => {
                console.error('Error:', err);
                alert('Error al leer el archivo.');
            }
        });
    },

    navigateTo(view) {
        ui.navigateTo(view);
    }
};

document.addEventListener('DOMContentLoaded', () => {
    app.init();
});
