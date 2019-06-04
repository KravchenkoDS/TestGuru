document.addEventListener('turbolinks:load', function(){
    var password = document.getElementById('user_password');
    var passwordConfirmation = document.getElementById('user_password_confirmation');

    if(password){
        password.addEventListener('input',   passwordCheck);
    };
    if(passwordConfirmation){
        passwordConfirmation.addEventListener('input', passwordCheck);
    };
});

function  passwordCheck(){
    var password = document.getElementById('user_password');
    var passwordConfirmation = document.getElementById('user_password_confirmation');

    var correctIcon = document.querySelector('.octicon.text-success');
    var wrongIcon = document.querySelector('.octicon.text-danger');

    if (passwordConfirmation.value === '') {
        correctIcon.classList.add('hide');
        wrongIcon.classList.add('hide');
    } else if (passwordConfirmation.value === password.value) {
        correctIcon.classList.remove('hide');
        wrongIcon.classList.add('hide');
    } else {
        correctIcon.classList.add('hide');
        wrongIcon.classList.remove('hide');
    }
};
