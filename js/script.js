document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Evitar el envío del formulario
    
    var username = document.getElementById("user").value;
    var password = document.getElementById("contra").value;

    // Verificar el rol del usuario
    if (username === "admin" && password === "admin123") {
        // Redirigir al panel de administrador
        window.location.href = "a_alphaTeam.html";
    } else if (username === "estudiante" && password === "estudiante123") {
        // Redirigir al panel de estudiante
        window.location.href = "e_alphaTeam.html";
    } else if (username === "profesor" && password === "profesor123") {
        // Redirigir al panel de profesor
        window.location.href = "p_alphaTeam.html";
    } else {
        // Mostrar un mensaje de error si las credenciales son incorrectas
        alert("Nombre de usuario o contraseña incorrectos.");
    }
});
