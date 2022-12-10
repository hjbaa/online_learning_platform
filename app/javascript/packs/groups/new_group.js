document.addEventListener('turbolinks:load', () => {
    const newGroupBtn = document.getElementById('new-group-btn');

    if (newGroupBtn) {
        newGroupBtn.addEventListener('click', (e) => {
            e.preventDefault();
            document.getElementById('new-group-form').classList.remove('hidden');
        })
    }
});
