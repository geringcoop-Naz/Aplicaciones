const analysis = {
    data: [],
    charts: {},

    processData(results) {
        // Assume headers: Date, Precipitation, Flow
        // Or try to map them
        const rawData = results.data;
        const headers = results.meta.fields;

        // Simple mapping logic (case insensitive)
        const dateCol = headers.find(h => h.toLowerCase().includes('date') || h.toLowerCase().includes('fecha'));
        const precipCol = headers.find(h => h.toLowerCase().includes('precip') || h.toLowerCase().includes('lluvia'));
        const flowCol = headers.find(h => h.toLowerCase().includes('flow') || h.toLowerCase().includes('caudal') || h.toLowerCase().includes('q'));

        if (!dateCol || !flowCol) {
            alert('No se pudieron identificar las columnas de Fecha o Caudal. Asegúrate que el CSV tenga cabeceras.');
            return;
        }

        this.data = rawData.map(row => ({
            date: new Date(row[dateCol]),
            precip: parseFloat(row[precipCol] || 0),
            flow: parseFloat(row[flowCol] || 0)
        })).filter(d => !isNaN(d.flow) && !isNaN(d.date.getTime()));

        this.data.sort((a, b) => a.date - b.date);

        this.calculateStats();
        this.renderCharts();
        this.populateYearFilter();

        // Switch to analysis view
        ui.navigateTo('analysis');
    },

    calculateStats() {
        const flows = this.data.map(d => d.flow);
        const precips = this.data.map(d => d.precip);

        // Basic stats
        const meanFlow = ss.mean(flows);
        const maxFlow = ss.max(flows);
        const minFlow = ss.min(flows);
        const stdDev = ss.standardDeviation(flows);
        const cv = stdDev / meanFlow;

        // Annual stats
        const years = [...new Set(this.data.map(d => d.date.getFullYear()))];
        const avgPrecip = ss.sum(precips) / years.length;

        const stats = {
            stationCount: 1, // Single file assumption
            yearsCount: years.length,
            meanFlow,
            maxFlow,
            minFlow,
            stdDev,
            cv,
            avgPrecip
        };

        ui.updateStats(stats);
    },

    renderCharts() {
        this.renderMainChart(this.data);
        this.renderFDC(this.data);
        this.renderMonthlyChart(this.data);
    },

    renderMainChart(data) {
        const ctx = document.getElementById('mainChart').getContext('2d');

        if (this.charts.main) this.charts.main.destroy();

        this.charts.main = new Chart(ctx, {
            type: 'line',
            data: {
                labels: data.map(d => d.date.toLocaleDateString()),
                datasets: [
                    {
                        label: 'Caudal (m³/s)',
                        data: data.map(d => d.flow),
                        borderColor: '#0ea5e9',
                        backgroundColor: 'rgba(14, 165, 233, 0.1)',
                        borderWidth: 2,
                        yAxisID: 'y',
                        pointRadius: 0,
                        fill: true
                    },
                    {
                        label: 'Precipitación (mm)',
                        data: data.map(d => d.precip),
                        backgroundColor: '#38bdf8',
                        type: 'bar',
                        yAxisID: 'y1',
                        barThickness: 5
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                interaction: {
                    mode: 'index',
                    intersect: false,
                },
                plugins: {
                    legend: { labels: { color: '#94a3b8' } }
                },
                scales: {
                    x: { ticks: { color: '#94a3b8' }, grid: { color: '#334155' } },
                    y: {
                        type: 'linear',
                        display: true,
                        position: 'left',
                        title: { display: true, text: 'Caudal (m³/s)', color: '#94a3b8' },
                        ticks: { color: '#94a3b8' },
                        grid: { color: '#334155' }
                    },
                    y1: {
                        type: 'linear',
                        display: true,
                        position: 'right',
                        reverse: true,
                        title: { display: true, text: 'Precipitación (mm)', color: '#94a3b8' },
                        grid: { drawOnChartArea: false },
                        ticks: { color: '#94a3b8' }
                    }
                }
            }
        });
    },

    renderFDC(data) {
        const flows = data.map(d => d.flow).sort((a, b) => b - a);
        const n = flows.length;
        const exceedance = flows.map((_, i) => ((i + 1) / (n + 1)) * 100);

        const ctx = document.getElementById('fdcChart').getContext('2d');
        if (this.charts.fdc) this.charts.fdc.destroy();

        this.charts.fdc = new Chart(ctx, {
            type: 'line',
            data: {
                labels: exceedance, // Simplified, ideally should be formatted
                datasets: [{
                    label: 'Curva de Duración',
                    data: flows,
                    borderColor: '#10b981',
                    borderWidth: 2,
                    pointRadius: 0,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        type: 'linear',
                        title: { display: true, text: '% Excedencia', color: '#94a3b8' },
                        ticks: { color: '#94a3b8' },
                        grid: { color: '#334155' }
                    },
                    y: {
                        type: 'logarithmic',
                        title: { display: true, text: 'Caudal (m³/s)', color: '#94a3b8' },
                        ticks: { color: '#94a3b8' },
                        grid: { color: '#334155' }
                    }
                },
                plugins: { legend: { display: false } }
            }
        });
    },

    renderMonthlyChart(data) {
        const monthlyFlows = new Array(12).fill(0);
        const monthlyCounts = new Array(12).fill(0);

        data.forEach(d => {
            const month = d.date.getMonth();
            monthlyFlows[month] += d.flow;
            monthlyCounts[month]++;
        });

        const averages = monthlyFlows.map((sum, i) => monthlyCounts[i] ? sum / monthlyCounts[i] : 0);
        const months = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];

        const ctx = document.getElementById('monthlyChart').getContext('2d');
        if (this.charts.monthly) this.charts.monthly.destroy();

        this.charts.monthly = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [{
                    label: 'Caudal Promedio Mensual',
                    data: averages,
                    backgroundColor: '#8b5cf6',
                    borderRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: { ticks: { color: '#94a3b8' }, grid: { display: false } },
                    y: { ticks: { color: '#94a3b8' }, grid: { color: '#334155' } }
                },
                plugins: { legend: { display: false } }
            }
        });
    },

    populateYearFilter() {
        const years = [...new Set(this.data.map(d => d.date.getFullYear()))].sort();
        const select = document.getElementById('year-filter');
        select.innerHTML = '<option value="all">Todos los años</option>';
        years.forEach(y => {
            select.innerHTML += `<option value="${y}">${y}</option>`;
        });
    },

    filterByYear(year) {
        if (year === 'all') {
            this.renderMainChart(this.data);
        } else {
            const filtered = this.data.filter(d => d.date.getFullYear() === parseInt(year));
            this.renderMainChart(filtered);
        }
    }
};
