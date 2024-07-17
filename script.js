// Detect and apply the initial theme based on system preferences
function applyTheme(theme) {
    if (theme === 'dark') {
        document.body.classList.add('dark-theme');
    } else {
        document.body.classList.remove('dark-theme');
    }
}

function detectTheme() {
    const darkSchemeQuery = window.matchMedia('(prefers-color-scheme: dark)');
    applyTheme(darkSchemeQuery.matches ? 'dark' : 'light');

    darkSchemeQuery.addEventListener('change', (e) => {
        applyTheme(e.matches ? 'dark' : 'light');
    });
}

document.addEventListener('DOMContentLoaded', detectTheme);
