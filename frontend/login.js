document.getElementById('logInForm').addEventListener('submit', (e) => {
    e.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:8080/api/auth/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        credentials: 'include', // Important for sending cookies
        body: JSON.stringify({ email, password })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // Correctly parse the JSON response
    })
    .then(data => {
        console.log('Success:', data);
        // Navigate to dashboard.html after successful login
        location.replace('./dashboard.html');
    })
    .catch(error => console.error('Error:', error));
});