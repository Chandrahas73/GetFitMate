document.getElementById('signUpForm').addEventListener('submit', (e) => {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:8080/api/auth/signup', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({name, email, password})
    })
    .then(response => response.json())
    .then(data => { 
        console.log(data)
        window.location.href = './dashboard.html';
    })
    .catch(error => console.error(error));
    
})