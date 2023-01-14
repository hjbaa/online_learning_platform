document.addEventListener('turbolinks:load', function () {
    let btn = document.getElementById('add-new-answer-form')
    if (btn) {
        btn.addEventListener('click', (event) => {
            event.preventDefault();

            let hiddenRow = document.querySelector('.new-answer-row');
            let newAnswerRow = hiddenRow.cloneNode(true);
            newAnswerRow.removeAttribute('class')

            document.querySelector('.new-answers-fields').insertBefore(newAnswerRow, hiddenRow);
        })
    }
})