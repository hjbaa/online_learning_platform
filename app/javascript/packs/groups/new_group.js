document.addEventListener('turbolinks:load', () => {
    document.getElementById('new-group-btn').addEventListener('click', (e) => {
        e.preventDefault();
        document.getElementById('new-group-form').classList.remove('hidden');
    })
});
