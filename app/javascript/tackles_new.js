var button = document.getElementById("suggestion");
button.addEventListener("click", function() {
    // 要素を取得する
    // alert('ok');
    var message = document.getElementById("wait");
    message.classList.remove('hidden');
    this.classList.add("hidden");
});
