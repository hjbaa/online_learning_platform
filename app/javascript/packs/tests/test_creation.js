document.addEventListener('turbolinks:load', () => {
    let createTestButton = document.getElementById('create-test-button')
    if (createTestButton) {
        createTestButton.addEventListener('click', (e) => {
            e.preventDefault();
            let form = document.getElementById('test-form');
            form.classList.remove('hidden');
            createTestButton.remove();
        })
    }
});
