document.addEventListener('turbolinks:load', () => {
    let createQuestionButton = document.getElementById('add-question-link')
    if (createQuestionButton) {
        createQuestionButton.addEventListener('click', show_form)
    }
});

function show_form(event) {
    event.preventDefault()

    document.getElementById('new-question-form').classList.remove('hidden');

    document.getElementById('add-question-link').className = 'btn btn-outline-danger';
    document.getElementById('add-question-link').innerText = 'Cancel';

    document.getElementById('add-question-link').removeEventListener('click', show_form)
    document.getElementById('add-question-link').addEventListener('click', hide_form)
}

function hide_form(event) {
    event.preventDefault()

    document.getElementById('new-question-form').classList.add('hidden');

    document.getElementById('add-question-link').className = 'btn btn-outline-primary';
    document.getElementById('add-question-link').innerText = 'Add question';

    document.getElementById('add-question-link').removeEventListener('click', hide_form)
    document.getElementById('add-question-link').addEventListener('click', show_form)
}
