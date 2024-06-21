var button = document.getElementById("suggestion");
button.addEventListener("click", function() {
    // 要素を取得する
    var message = document.getElementById("wait");
    message.classList.remove('hidden');
    this.classList.add("hidden");
});
