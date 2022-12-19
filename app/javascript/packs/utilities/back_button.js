document.addEventListener('turbolinks:load', function () {
    let backButton = document.querySelector('.icon-back');

    if (backButton) {
        backButton.addEventListener('click', function (event) {
            event.preventDefault();
            history.go(-1);
        })
    }
})