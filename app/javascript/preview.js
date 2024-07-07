document.addEventListener('turbo:load', function() {
  const forms = document.querySelectorAll('form[id$="_form"]');

  forms.forEach(form => {
    const fileField = form.querySelector('input[type="file"][name$="[image]"]');
    if (!fileField) return;

    const previewList = form.querySelector(`#previews_${form.id.split('_')[0]}`);

    fileField.addEventListener('change', function(e) {
      const alreadyPreview = previewList.querySelector('.preview');
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