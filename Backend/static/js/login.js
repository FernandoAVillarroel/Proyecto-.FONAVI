// static/js/login.js
document.getElementById("loginForm").addEventListener("submit", function (e) {
    e.preventDefault();

    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    fetch("/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`
    })
    .then(response => response.text().then(text => {
        if (response.ok) {
            alert(text);
        } else {
            alert("Error: " + text);
        }
    }))
    .catch(error => {
        alert("Error en la solicitud: " + error.message);
    });
});
