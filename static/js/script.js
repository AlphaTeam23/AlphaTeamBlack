document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Evitar el envío del formulario
    
    var username = document.getElementById("user").value;
    var password = document.getElementById("contra").value;

    // Verificar el rol del usuario
    if (username === "admin" && password === "admin123") {
        // Perfil de administrador
        window.location.href = "/alphaTeam/admin";
    } else if (username === "estudiante" && password === "estudiante123") {
        // Perfil de estudiante
        window.location.href = "/alphaTeam/estudiante";
        // Si no introduce datos
    } else if (username === "profesor" && password === "profesor123") {
        // Perfil de profesor
        window.location.href = "/alphaTeam/profesor";
    } else {
        // Mostrar un mensaje de error si las credenciales son incorrectas
        alert("Nombre de usuario o contraseña incorrectos.");
    }
});



document.getElementById("reportarForm").addEventListener("submit", function(event) {
    event.preventDefault();
    alert("reporte enviado correctamente")

});


document.getElementById("Borrar").addEventListener("click", function() {
    document.getElementById("reportar2").value = "" ;
});