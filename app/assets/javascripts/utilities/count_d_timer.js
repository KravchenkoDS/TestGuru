document.addEventListener('turbolinks:load', function() {
    var field = document.getElementById('count_d_timer');

    if (field) {
        var countDownDate = new Date(Number(field.innerHTML)).getTime();
        setInterval(changeValue, 1000, countDownDate);
    }
});

function changeValue(countDownDate) {
    var now = new Date().getTime();
    var distance = countDownDate - now;
    var minutes = Math.floor(distance / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    document.getElementById("count_d_timer").innerHTML = minutes + "m " + seconds + "s";
    document.getElementById("count_d_timer").classList.remove('hide');

    if (distance <= 0) {
        var form = document.querySelector('.passed_test-form');
        var passed_test_id = form.dataset.passed_test_id;

        document.querySelector('.passed_test-form[data-passed_test-id="' + passed_test_id + '"]').submit();
        document.getElementById("count_d_timer").classList.add('hide');
    }
}
