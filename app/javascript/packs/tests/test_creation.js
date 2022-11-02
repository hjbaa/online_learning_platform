document.addEventListener('turbolinks:load', () => {
    if (document.getElementById('create-test-button')) {
        document.getElementById('create-test-button').addEventListener('click', () => {
            alert('molodec')
        })
    }
});