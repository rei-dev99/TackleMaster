document.addEventListener('turbo:load', function() {
  // スムーススクロール
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
    e.preventDefault();

    const header = document.querySelector('header') ? document.querySelector('header').offsetHeight : 0;
    const id = this.getAttribute('href');
    const target = document.querySelector(id === '#' ? 'html' : id);

    if (target) {
        window.scrollTo({
        top: target.offsetTop - header,
        behavior: 'smooth'
        });
    }
  });
});

// トップに戻るボタンの動き
  document.querySelector('.to-top').addEventListener('click', function(e) {
    e.preventDefault();
    window.scrollTo({
    top: 0,
    behavior: 'smooth'
    });
  });

  // トップに戻るボタンの表示
  window.addEventListener('scroll', function() {
    if (window.scrollY > 2000) {
      document.querySelector('.to-top').classList.remove('hidden');
      document.querySelector('.to-top').classList.add('block');
    } else {
      document.querySelector('.to-top').classList.add('hidden');
      document.querySelector('.to-top').classList.remove('block');
    }
  });
});