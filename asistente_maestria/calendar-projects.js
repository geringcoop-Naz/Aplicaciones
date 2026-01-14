// ========== CALENDAR MANAGER ==========
class CalendarManager {
    constructor() {
        this.currentDate = new Date();
        this.events = loadData('calendarEvents') || this.getDefaultEvents();
        this.init();
    }

    getDefaultEvents() {
        return [
            {
                id: 1,
                title: 'Proyecto Final - Hidrología',
                date: new Date(2026, 0, 15), // 15 Ene 2026
                type: 'entrega',
                urgent: true
            },
            {
                id: 2,
                title: 'Reporte Lab - Calidad del Agua',
                date: new Date(2026, 0, 18),
                type: 'entrega',
                urgent: false
            },
            {
                id: 3,
                title: 'Examen Parcial - Modelación',
                date: new Date(2026, 0, 18),
                type: 'examen',
                urgent: false
            },
            {
                id: 4,
                title: 'Seminario de Investigación',
                date: new Date(2026, 0, 22),
                type: 'clase',
                urgent: false
            }
        ];
    }

    init() {
        this.renderCalendar();
        this.renderUpcomingEvents();
        this.attachEventListeners();
    }

    renderCalendar() {
        const grid = document.querySelector('.calendar-grid');
        const monthTitle = document.getElementById('currentMonth');

        if (!grid) return;

        // Clear previous days
        const existingDays = grid.querySelectorAll('.calendar-day');
        existingDays.forEach(day => day.remove());

        // Update month title
        const monthNames = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
        monthTitle.textContent = `${monthNames[this.currentDate.getMonth()]} ${this.currentDate.getFullYear()}`;

        // Get first day and days in month
        const firstDay = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), 1);
        const lastDay = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth() + 1, 0);
        const daysInMonth = lastDay.getDate();
        const startingDayOfWeek = firstDay.getDay();

        // Add previous month days
        const prevMonthLastDay = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), 0);
        for (let i = startingDayOfWeek - 1; i >= 0; i--) {
            const day = prevMonthLastDay.getDate() - i;
            const dayEl = this.createDayElement(day, true, null);
            grid.appendChild(dayEl);
        }

        // Add current month days
        const today = new Date();
        for (let day = 1; day <= daysInMonth; day++) {
            const date = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), day);
            const isToday = date.toDateString() === today.toDateString();
            const hasEvent = this.events.some(event =>
                event.date.toDateString() === date.toDateString()
            );

            const dayEl = this.createDayElement(day, false, date);
            if (isToday) dayEl.classList.add('today');
            if (hasEvent) dayEl.classList.add('has-event');

            grid.appendChild(dayEl);
        }

        // Add next month days to fill grid
        const totalDays = startingDayOfWeek + daysInMonth;
        const remainingDays = totalDays % 7 === 0 ? 0 : 7 - (totalDays % 7);
        for (let day = 1; day <= remainingDays; day++) {
            const dayEl = this.createDayElement(day, true, null);
            grid.appendChild(dayEl);
        }
    }

    createDayElement(day, otherMonth, date) {
        const dayEl = document.createElement('div');
        dayEl.className = 'calendar-day';
        if (otherMonth) dayEl.classList.add('other-month');
        dayEl.textContent = day;

        if (date) {
            dayEl.addEventListener('click', () => this.showDayEvents(date));
        }

        return dayEl;
    }

    showDayEvents(date) {
        const dayEvents = this.events.filter(event =>
            event.date.toDateString() === date.toDateString()
        );

        if (dayEvents.length > 0) {
            const eventTitles = dayEvents.map(e => `• ${e.title}`).join('\n');
            alert(`Actividades del ${date.toLocaleDateString('es-MX')}:\n\n${eventTitles}`);
        } else {
            const addEvent = confirm(`No hay actividades para ${date.toLocaleDateString('es-MX')}.\n¿Deseas agregar una?`);
            if (addEvent) {
                this.addNewEvent(date);
            }
        }
    }

    renderUpcomingEvents() {
        const container = document.getElementById('eventsList');
        if (!container) return;

        container.innerHTML = '';

        const upcoming = this.events
            .filter(event => event.date >= new Date())
            .sort((a, b) => a.date - b.date)
            .slice(0, 5);

        if (upcoming.length === 0) {
            container.innerHTML = '<p style="color: var(--text-secondary); text-align: center;">No hay actividades próximas</p>';
            return;
        }

        upcoming.forEach(event => {
            const eventEl = document.createElement('div');
            eventEl.className = `event-item ${event.urgent ? 'urgent' : ''}`;

            const monthNames = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
                'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];

            eventEl.innerHTML = `
                <div class="event-date">
                    <div class="event-day">${event.date.getDate()}</div>
                    <div class="event-month">${monthNames[event.date.getMonth()]}</div>
                </div>
                <div class="event-details">
                    <div class="event-title">${event.title}</div>
                    <div class="event-time">
                        ${this.getDaysUntil(event.date)}
                    </div>
                </div>
                <span class="event-type">${event.type}</span>
            `;

            container.appendChild(eventEl);
        });
    }

    getDaysUntil(date) {
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        date = new Date(date);
        date.setHours(0, 0, 0, 0);

        const diffTime = date - today;
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        if (diffDays === 0) return 'Hoy';
        if (diffDays === 1) return 'Mañana';
        if (diffDays < 0) return `Hace ${Math.abs(diffDays)} días`;
        return `En ${diffDays} días`;
    }

    attachEventListeners() {
        const prevBtn = document.getElementById('prevMonth');
        const nextBtn = document.getElementById('nextMonth');
        const addBtn = document.getElementById('addEventBtn');

        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                this.currentDate.setMonth(this.currentDate.getMonth() - 1);
                this.renderCalendar();
            });
        }

        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                this.currentDate.setMonth(this.currentDate.getMonth() + 1);
                this.renderCalendar();
            });
        }

        if (addBtn) {
            addBtn.addEventListener('click', () => this.addNewEvent());
        }
    }

    addNewEvent(date = null) {
        const title = prompt('Título de la actividad:');
        if (!title) return;

        let eventDate = date;
        if (!eventDate) {
            const dateStr = prompt('Fecha (DD/MM/YYYY):',
                new Date().toLocaleDateString('es-MX').split('T')[0]);
            if (!dateStr) return;

            const [day, month, year] = dateStr.split('/');
            eventDate = new Date(year, month - 1, day);
        }

        const type = prompt('Tipo (entrega/examen/clase):', 'entrega');

        const newEvent = {
            id: Date.now(),
            title,
            date: eventDate,
            type: type || 'entrega',
            urgent: false
        };

        this.events.push(newEvent);
        saveData('calendarEvents', this.events);

        this.renderCalendar();
        this.renderUpcomingEvents();
    }
}

// ========== PROJECTS MANAGER ==========
class ProjectsManager {
    constructor() {
        this.projects = loadData('projects') || [];
        this.githubToken = loadData('githubToken') || null;
        this.githubUsername = loadData('githubUsername') || null;
        this.init();
    }

    init() {
        this.attachEventListeners();
        this.renderProjects();
    }

    attachEventListeners() {
        // Filter buttons
        const filterBtns = document.querySelectorAll('.project-filters .filter-btn');
        filterBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                filterBtns.forEach(b => b.classList.remove('active'));
                e.target.classList.add('active');
                this.filterProjects(e.target.dataset.filter);
            });
        });

        // Add project button
        const addProjectBtn = document.getElementById('addProjectBtn');
        if (addProjectBtn) {
            addProjectBtn.addEventListener('click', () => this.addProject());
        }

        // Connect GitHub button
        const connectBtn = document.getElementById('connectGitHubBtn');
        if (connectBtn) {
            connectBtn.addEventListener('click', () => this.showGitHubPanel());
        }

        // GitHub panel buttons
        const saveGithubBtn = document.getElementById('saveGithubBtn');
        if (saveGithubBtn) {
            saveGithubBtn.addEventListener('click', () => this.saveGitHubCredentials());
        }

        const cancelGithubBtn = document.getElementById('cancelGithubBtn');
        if (cancelGithubBtn) {
            cancelGithubBtn.addEventListener('click', () => this.hideGitHubPanel());
        }
    }

    filterProjects(filter) {
        const cards = document.querySelectorAll('.project-card');
        cards.forEach(card => {
            if (filter === 'all' || card.dataset.status === filter) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    renderProjects() {
        // Projects are already in HTML, this method would update them dynamically
        console.log('Projects rendered');
    }

    addProject() {
        const title = prompt('Nombre del proyecto:');
        if (!title) return;

        const description = prompt('Descripción breve:');
        const deadline = prompt('Fecha límite (DD/MM/YYYY):');

        alert('Funcionalidad de agregar proyecto en desarrollo.\nEl proyecto se agregará a la lista.');
    }

    showGitHubPanel() {
        const panel = document.getElementById('githubPanel');
        if (panel) {
            panel.style.display = 'block';
            setTimeout(() => panel.classList.add('open'), 10);
        }
    }

    hideGitHubPanel() {
        const panel = document.getElementById('githubPanel');
        if (panel) {
            panel.classList.remove('open');
            setTimeout(() => panel.style.display = 'none', 300);
        }
    }

    async saveGitHubCredentials() {
        const token = document.getElementById('githubToken').value;
        const username = document.getElementById('githubUsername').value;

        if (!token || !username) {
            alert('Por favor completa ambos campos');
            return;
        }

        this.githubToken = token;
        this.githubUsername = username;

        saveData('githubToken', token);
        saveData('githubUsername', username);

        alert('Credenciales guardadas. Conectando con GitHub...');

        await this.fetchGitHubRepos();
        this.hideGitHubPanel();
    }

    async fetchGitHubRepos() {
        if (!this.githubToken || !this.githubUsername) {
            alert('Primero debes configurar las credenciales de GitHub');
            return;
        }

        try {
            const response = await fetch(`https://api.github.com/users/${this.githubUsername}/repos`, {
                headers: {
                    'Authorization': `token ${this.githubToken}`,
                    'Accept': 'application/vnd.github.v3+json'
                }
            });

            if (!response.ok) {
                throw new Error('Error al conectar con GitHub');
            }

            const repos = await response.json();
            this.displayGitHubRepos(repos);

            // Update project cards with commit counts
            this.updateProjectsWithGitHub(repos);

        } catch (error) {
            console.error('Error fetching GitHub repos:', error);
            alert('Error al conectar con GitHub. Verifica tu token y usuario.');
        }
    }

    displayGitHubRepos(repos) {
        const container = document.getElementById('githubRepos');
        if (!container) return;

        container.innerHTML = '<h4 style="margin: 1rem 0;">Tus Repositorios</h4>';

        repos.slice(0, 5).forEach(repo => {
            const repoEl = document.createElement('div');
            repoEl.className = 'repo-item';
            repoEl.innerHTML = `
                <div class="repo-name">${repo.name}</div>
                <div class="repo-stats">
                    <span><i class="fas fa-star"></i> ${repo.stargazers_count}</span>
                    <span><i class="fas fa-code-branch"></i> ${repo.forks_count}</span>
                    <span><i class="fas fa-circle" style="color: ${this.getLanguageColor(repo.language)}"></i> ${repo.language || 'N/A'}</span>
                </div>
            `;

            repoEl.addEventListener('click', () => {
                window.open(repo.html_url, '_blank');
            });

            container.appendChild(repoEl);
        });
    }

    async updateProjectsWithGitHub(repos) {
        // This would update the project cards with real GitHub data
        console.log('Updating projects with GitHub data:', repos.length, 'repos found');
    }

    getLanguageColor(language) {
        const colors = {
            'JavaScript': '#f1e05a',
            'Python': '#3572A5',
            'Java': '#b07219',
            'HTML': '#e34c26',
            'CSS': '#563d7c',
            'C++': '#f34b7d',
            'Go': '#00ADD8'
        };
        return colors[language] || '#666';
    }
}

// ========== INITIALIZE MANAGERS ==========
let calendarManager;
let projectsManager;

// Initialize when navigating to respective sections
const calendarNavItem = document.querySelector('[data-section="calendario"]');
const projectsNavItem = document.querySelector('[data-section="proyectos"]');

if (calendarNavItem) {
    calendarNavItem.addEventListener('click', () => {
        setTimeout(() => {
            if (!calendarManager) {
                calendarManager = new CalendarManager();
            } else {
                calendarManager.renderCalendar();
                calendarManager.renderUpcomingEvents();
            }
        }, 100);
    });
}

if (projectsNavItem) {
    projectsNavItem.addEventListener('click', () => {
        setTimeout(() => {
            if (!projectsManager) {
                projectsManager = new ProjectsManager();
            }
        }, 100);
    });
}

console.log('Calendar and Projects modules loaded successfully!');
