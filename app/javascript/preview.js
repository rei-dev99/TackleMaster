document.addEventListener('turbo:load', function() {
  const formIds = ['tackle_form', 'rod_form', 'reel_form', 'accessory_form'];

  formIds.forEach(id => {
      const postForm = document.getElementById(id);
      if (!postForm) return;

      const fileField = postForm.querySelector('input[type="file"][name$="[image]"]');
      const previewList = postForm.querySelector('#previews');

      fileField.addEventListener('change', function(e) {
        const alreadyPreview = postForm.querySelector('.preview');
        if (alreadyPreview) {
            alreadyPreview.remove();
        }

        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);

        const previewWrapper = document.createElement('div');
        previewWrapper.setAttribute('class', 'preview');

        const previewImage = document.createElement('img');
        previewImage.setAttribute('class', 'preview-image');
        previewImage.setAttribute('src', blob);

        previewWrapper.appendChild(previewImage);
        previewList.appendChild(previewWrapper);
      });
  });
});