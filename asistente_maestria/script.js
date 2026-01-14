// ========== NAVIGATION ========== 
const navItems = document.querySelectorAll('.nav-item');
const sections = document.querySelectorAll('.section');

navItems.forEach(item => {
    item.addEventListener('click', (e) => {
        e.preventDefault();

        // Remove active class from all nav items and sections
        navItems.forEach(nav => nav.classList.remove('active'));
        sections.forEach(section => section.classList.remove('active'));

        // Add active class to clicked item
        item.classList.add('active');

        // Show corresponding section
        const sectionId = item.getAttribute('data-section');
        document.getElementById(sectionId).classList.add('active');

        // Smooth scroll to top
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
});

// ========== RESEARCH FILTER ========== 
const filterBtns = document.querySelectorAll('.filter-btn');
const publicationCards = document.querySelectorAll('.publication-card');

filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // Remove active class from all buttons
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        const filter = btn.getAttribute('data-filter');

        publicationCards.forEach(card => {
            if (filter === 'all' || card.getAttribute('data-category') === filter) {
                card.style.display = 'block';
                card.style.animation = 'fadeIn 0.5s ease';
            } else {
                card.style.display = 'none';
            }
        });
    });
});

// ========== LOCAL STORAGE FOR DATA ========== 
// Save data to localStorage
function saveData(key, data) {
    localStorage.setItem(key, JSON.stringify(data));
}

// Load data from localStorage
function loadData(key) {
    const data = localStorage.getItem(key);
    return data ? JSON.parse(data) : null;
}

// ========== FINANCIAL DATA MANAGEMENT ========== 
class FinanceManager {
    constructor() {
        this.income = loadData('income') || 15000;
        this.fixedExpenses = loadData('fixedExpenses') || [
            { name: 'Renta', amount: 6000 },
            { name: 'Servicios', amount: 1500 },
            { name: 'Transporte', amount: 1000 }
        ];
        this.variableExpenses = loadData('variableExpenses') || [
            { name: 'Alimentación', amount: 1800 },
            { name: 'Material de Estudio', amount: 800 },
            { name: 'Personal', amount: 600 }
        ];
    }

    getTotalFixed() {
        return this.fixedExpenses.reduce((sum, exp) => sum + exp.amount, 0);
    }

    getTotalVariable() {
        return this.variableExpenses.reduce((sum, exp) => sum + exp.amount, 0);
    }

    getTotalExpenses() {
        return this.getTotalFixed() + this.getTotalVariable();
    }

    getBalance() {
        return this.income - this.getTotalExpenses();
    }

    getSavingsPercentage() {
        return ((this.getBalance() / this.income) * 100).toFixed(0);
    }

    addExpense(type, name, amount) {
        const expense = { name, amount };
        if (type === 'fixed') {
            this.fixedExpenses.push(expense);
            saveData('fixedExpenses', this.fixedExpenses);
        } else {
            this.variableExpenses.push(expense);
            saveData('variableExpenses', this.variableExpenses);
        }
        this.updateFinanceDisplay();
    }

    updateFinanceDisplay() {
        // Update balance card
        document.querySelectorAll('.finance-amount').forEach((el, index) => {
            switch (index) {
                case 0: // Balance
                    el.textContent = `$${this.getBalance().toLocaleString('es-MX', { minimumFractionDigits: 2 })}`;
                    break;
                case 1: // Income
                    el.textContent = `$${this.income.toLocaleString('es-MX', { minimumFractionDigits: 2 })}`;
                    break;
                case 2: // Total Expenses
                    el.textContent = `$${this.getTotalExpenses().toLocaleString('es-MX', { minimumFractionDigits: 2 })}`;
                    break;
                case 3: // Savings
                    el.textContent = `$${this.getBalance().toLocaleString('es-MX', { minimumFractionDigits: 2 })}`;
                    break;
            }
        });

        // Update stat card
        const statCards = document.querySelectorAll('.stat-card');
        if (statCards[2]) {
            statCards[2].querySelector('.stat-value').textContent =
                `$${this.getBalance().toLocaleString('es-MX')}`;
        }
    }
}

// Initialize finance manager
const financeManager = new FinanceManager();
financeManager.updateFinanceDisplay();

// ========== ACADEMIC DATA MANAGEMENT ========== 
class AcademicManager {
    constructor() {
        this.subjects = loadData('subjects') || [
            {
                id: 1,
                name: 'Hidrología Avanzada',
                credits: 6,
                professor: 'Dr. Martínez',
                schedule: 'Lun-Mié 10:00-12:00',
                progress: 75,
                grade: 9.5
            },
            {
                id: 2,
                name: 'Calidad del Agua',
                credits: 4,
                professor: 'Dra. López',
                schedule: 'Mar-Jue 14:00-16:00',
                progress: 60,
                grade: 8.8
            },
            {
                id: 3,
                name: 'Modelación Hidrológica',
                credits: 4,
                professor: 'Dr. García',
                schedule: 'Vie 9:00-13:00',
                progress: 50,
                grade: 9.0
            },
            {
                id: 4,
                name: 'Gestión de Recursos Hídricos',
                credits: 3,
                professor: 'Dr. Ramírez',
                schedule: 'Lun 16:00-19:00',
                progress: 40,
                grade: 8.5
            },
            {
                id: 5,
                name: 'Seminario de Investigación',
                credits: 1,
                professor: 'Varios profesores',
                schedule: 'Mié 18:00-20:00',
                progress: 30,
                grade: null
            }
        ];
    }

    getTotalCredits() {
        return this.subjects.reduce((sum, sub) => sum + sub.credits, 0);
    }

    getAverageGrade() {
        const gradesSubjects = this.subjects.filter(s => s.grade !== null);
        const sum = gradesSubjects.reduce((total, sub) => total + sub.grade, 0);
        return (sum / gradesSubjects.length).toFixed(1);
    }

    getTotalProgress() {
        const avgProgress = this.subjects.reduce((sum, sub) => sum + sub.progress, 0) / this.subjects.length;
        return Math.round(avgProgress);
    }
}

// Initialize academic manager
const academicManager = new AcademicManager();

// Update academic stats
document.addEventListener('DOMContentLoaded', () => {
    const statsGrid = document.querySelector('.semester-stats');
    if (statsGrid) {
        const statNumbers = statsGrid.querySelectorAll('.stat-number');
        statNumbers[0].textContent = academicManager.subjects.length;
        statNumbers[1].textContent = academicManager.getTotalCredits();
        statNumbers[2].textContent = academicManager.getAverageGrade();
    }
});

// ========== THEME SWITCHER ========== 
const themeBtns = document.querySelectorAll('.theme-btn');

themeBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        themeBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        const theme = btn.getAttribute('data-theme');
        document.body.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
    });
});

// Load saved theme
const savedTheme = localStorage.getItem('theme');
if (savedTheme) {
    document.body.setAttribute('data-theme', savedTheme);
    themeBtns.forEach(btn => {
        if (btn.getAttribute('data-theme') === savedTheme) {
            btn.classList.add('active');
        }
    });
}

// ========== NOTIFICATIONS SYSTEM ========== 
class NotificationManager {
    constructor() {
        this.notifications = loadData('notifications') || [];
    }

    addNotification(type, title, message, dueDate) {
        const notification = {
            id: Date.now(),
            type,
            title,
            message,
            dueDate,
            read: false,
            timestamp: new Date().toISOString()
        };

        this.notifications.unshift(notification);
        saveData('notifications', this.notifications);
        this.checkUpcoming();
    }

    checkUpcoming() {
        const now = new Date();
        const twoDaysFromNow = new Date(now.getTime() + (2 * 24 * 60 * 60 * 1000));

        this.notifications.forEach(notif => {
            if (!notif.alerted && new Date(notif.dueDate) <= twoDaysFromNow) {
                this.showAlert(notif);
                notif.alerted = true;
            }
        });

        saveData('notifications', this.notifications);
    }

    showAlert(notification) {
        // Create a simple toast notification
        const toast = document.createElement('div');
        toast.className = 'toast-notification';
        toast.innerHTML = `
            <div class="toast-content">
                <i class="fas fa-exclamation-circle"></i>
                <div>
                    <strong>${notification.title}</strong>
                    <p>${notification.message}</p>
                </div>
            </div>
        `;

        document.body.appendChild(toast);

        setTimeout(() => {
            toast.classList.add('show');
        }, 100);

        setTimeout(() => {
            toast.classList.remove('show');
            setTimeout(() => toast.remove(), 300);
        }, 5000);
    }
}

const notificationManager = new NotificationManager();

// ========== SIMPLE CHART FOR FINANCE ========== 
function initFinanceChart() {
    const canvas = document.getElementById('financeChart');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');
    const width = canvas.width = canvas.parentElement.offsetWidth;
    const height = canvas.height = 300;

    // Simple bar chart data
    const months = ['Ago', 'Sep', 'Oct', 'Nov', 'Dic', 'Ene'];
    const data = [12000, 13500, 11800, 12450, 13200, 12450];
    const maxValue = Math.max(...data);

    // Clear canvas
    ctx.clearRect(0, 0, width, height);

    // Draw bars
    const barWidth = width / (months.length * 2);
    const barSpacing = barWidth;

    data.forEach((value, index) => {
        const barHeight = (value / maxValue) * (height - 40);
        const x = (index * (barWidth + barSpacing)) + barSpacing;
        const y = height - barHeight - 20;

        // Gradient
        const gradient = ctx.createLinearGradient(0, y, 0, height);
        gradient.addColorStop(0, '#667eea');
        gradient.addColorStop(1, '#764ba2');

        // Bar
        ctx.fillStyle = gradient;
        ctx.fillRect(x, y, barWidth, barHeight);

        // Month label
        ctx.fillStyle = '#64748b';
        ctx.font = '12px Inter';
        ctx.textAlign = 'center';
        ctx.fillText(months[index], x + barWidth / 2, height - 5);

        // Value label
        ctx.fillStyle = '#1e293b';
        ctx.font = 'bold 11px Inter';
        ctx.fillText(`$${(value / 1000).toFixed(1)}k`, x + barWidth / 2, y - 5);
    });
}

// Initialize chart when finance section is active
const financeNavItem = document.querySelector('[data-section="finanzas"]');
if (financeNavItem) {
    financeNavItem.addEventListener('click', () => {
        setTimeout(initFinanceChart, 100);
    });
}

// ========== ADD EXPENSE FUNCTIONALITY ========== 
const addExpenseBtn = document.querySelector('.btn-primary');
if (addExpenseBtn) {
    addExpenseBtn.addEventListener('click', () => {
        const name = prompt('Nombre del gasto:');
        if (!name) return;

        const amount = parseFloat(prompt('Cantidad:'));
        if (isNaN(amount)) return;

        const type = confirm('¿Es un gasto fijo? (Cancelar = gasto variable)') ? 'fixed' : 'variable';

        financeManager.addExpense(type, name, amount);
        alert('Gasto agregado exitosamente');
    });
}

// ========== SMOOTH ANIMATIONS ========== 
// Animate numbers on load
function animateValue(element, start, end, duration) {
    const range = end - start;
    const increment = range / (duration / 16);
    let current = start;

    const timer = setInterval(() => {
        current += increment;
        if ((increment > 0 && current >= end) || (increment < 0 && current <= end)) {
            current = end;
            clearInterval(timer);
        }
        element.textContent = Math.round(current);
    }, 16);
}

// Animate stat values on page load
window.addEventListener('DOMContentLoaded', () => {
    const statValues = document.querySelectorAll('.stat-value');
    statValues.forEach((element, index) => {
        const text = element.textContent;
        const value = parseInt(text.replace(/[^0-9]/g, ''));
        if (!isNaN(value) && value < 1000) {
            element.textContent = '0';
            setTimeout(() => animateValue(element, 0, value, 1000), index * 100);
        }
    });
});

// ========== PROGRESS BARS ANIMATION ========== 
const observerOptions = {
    threshold: 0.5,
    rootMargin: '0px 0px -100px 0px'
};

const progressObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const fills = entry.target.querySelectorAll('.progress-fill, .balance-fill, .expense-fill');
            fills.forEach(fill => {
                const width = fill.style.width;
                fill.style.width = '0';
                setTimeout(() => {
                    fill.style.transition = 'width 1s ease';
                    fill.style.width = width;
                }, 100);
            });
            progressObserver.unobserve(entry.target);
        }
    });
}, observerOptions);

// Observe all sections with progress bars
document.querySelectorAll('.section').forEach(section => {
    progressObserver.observe(section);
});

// ========== SEARCH FUNCTIONALITY (Future Enhancement) ========== 
// This would integrate with a real API for publications
async function searchPublications(query) {
    // Placeholder for API integration
    console.log('Searching for:', query);
    // In production, this would call CrossRef, PubMed, or similar APIs
}

// ========== AUTO-SAVE FUNCTIONALITY ========== 
let autoSaveTimeout;

function autoSave() {
    clearTimeout(autoSaveTimeout);
    autoSaveTimeout = setTimeout(() => {
        saveData('lastSaved', new Date().toISOString());
        console.log('Auto-saved at', new Date().toLocaleTimeString());
    }, 2000);
}

// Add auto-save to input changes
document.querySelectorAll('input, select').forEach(input => {
    input.addEventListener('change', autoSave);
});

console.log('Asistente de Maestría initialized successfully!');
