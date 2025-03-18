document.getElementById('logout').addEventListener('onClick', () => {
    fetch('http://localhost:8080/api/auth/logout', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        }
    });
})