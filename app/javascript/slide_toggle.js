document.addEventListener('turbo:load', function() {
    var buttons = document.querySelectorAll('.toggle-button');
    var slides = document.querySelectorAll('.slide-content');

    buttons.forEach((button, index) => {
        button.addEventListener('click', function() {
            slides[index].classList.toggle('hidden');
        });
    });
});