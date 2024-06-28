document.addEventListener("turbo:load", function() {
    var button = document.getElementById("suggestion");
    var form = document.getElementById("fishing-gear-form");

    button.addEventListener("click", function() {
        var message = document.getElementById("wait");
        message.classList.remove('hidden');
        this.classList.add("hidden");
    });

    form.addEventListener("ajax:error", function() {
        var message = document.getElementById("wait");
        var button = document.getElementById("suggestion");
        message.classList.add('hidden');
        button.classList.remove('hidden');
    });
});
