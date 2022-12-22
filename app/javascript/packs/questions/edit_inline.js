document.addEventListener('turbolinks:load', function () {
    let controls = document.querySelectorAll('.form-inline-link');

    if (controls.length) {
        for (let i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }
})

function formInlineLinkHandler(event) {
    event.preventDefault();
    let questionId = this.dataset.questionId
    formInlineHandler(questionId)
}

function formInlineHandler(questionId) {
    let questionTitle = document.querySelector('.question-title[data-question-id="' + questionId + '"]');
    let editButton = document.querySelector('.form-inline-link[data-question-id="' + questionId + '"]');
    let formInline = document.querySelector('.form-inline[data-question-id="' + questionId + '"]');

    if (formInline) {
        if (formInline.classList.contains('hidden')) {
            questionTitle.classList.add('hidden');
            formInline.classList.remove('hidden');
            editButton.className = 'icon-delete form-inline-link'
            editButton.firstChild.className = 'bi bi-x-lg';
        } else {
            questionTitle.classList.remove('hidden');
            formInline.classList.add('hidden');
            editButton.className = 'icon-edit form-inline-link'
            editButton.firstChild.className = 'bi bi-pencil-square';
        }
    }
}
