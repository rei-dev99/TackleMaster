document.addEventListener("turbo:load", function() {
    var button = document.getElementById("suggestion");
    button.addEventListener("click", function() {
        var message = document.getElementById("wait");
        message.classList.remove('hidden');
        this.classList.add("hidden");
    });
});