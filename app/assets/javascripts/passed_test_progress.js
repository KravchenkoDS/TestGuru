document.addEventListener('turbolinks:load', function() {
    var progress = document.querySelector('.progress');
    var progressBar = document.querySelector('.progress-bar');

    if (progress && progressBar) {
        progressBar.style.width = progress.dataset.percent + '%';
    }
});