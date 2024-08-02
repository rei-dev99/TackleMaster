document.addEventListener("turbo:load", function() {
    var button = document.getElementById("suggestion");
    var form = document.getElementById("fishing-suggestion-form");
    var modal = document.getElementById("loading-modal");
  
    button.addEventListener("click", function(event) {
      var message = document.getElementById("wait");
      modal.classList.remove('hidden');
      button.classList.add("hidden");
    });
  
    form.addEventListener("ajax:success", function() {
      modal.classList.add('hidden');
      button.classList.remove('hidden');
    });
  
    form.addEventListener("ajax:error", function() {
      modal.classList.add('hidden');
      button.classList.remove('hidden');
    });
  });