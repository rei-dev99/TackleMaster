// Turbo:load イベントでローディング画面を隠す
document.addEventListener("turbo:load", function() {
    const spinner = document.getElementById('loading');
    if (spinner) {
        spinner.classList.add('loaded');
    }
});

// ページロード時にローディング画面を隠す
window.onload = function() {
    const spinner = document.getElementById('loading');
    if (spinner) {
        spinner.classList.add('loaded');
    }
};
