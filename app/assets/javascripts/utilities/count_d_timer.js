document.addEventListener('turbolinks:load', function() {
    var timer = document.getElementById('timer');

    if (timer) { changeTimer(timer) }
});

function changeTimer(timer) {
    var testCreated = timer.dataset.testCreated,
        timeTest = timer.dataset.timeTest,
        timeNow = (Date.now() / 1000).toFixed(),
        passedTime = timeNow - testCreated;

    if (passedTime > timeTest) {
        alert('Время вышло!');
        window.location.href = timer.dataset.resultLink;

    }

    timer.textContent = timeTest - passedTime;

    setTimeout(changeTimer, 1000, timer);
}
