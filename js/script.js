document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Evitar el envío del formulario
    
    var username = document.getElementById("user").value;
    var password = document.getElementById("contra").value;

    // Verificar el rol del usuario
    if (username === "admin" && password === "admin123") {
        // Perfil de administrador
        window.location.href = "a_alphaTeam.html";
    } else if (username === "estudiante" && password === "estudiante123") {
        // Perfil de estudiante
        window.location.href = "e_alphaTeam.html";
        // Si no introduce datos
    } else if (username === "profesor" && password === "profesor123") {
        // Perfil de profesor
        window.location.href = "p_alphaTeam.html";
    } else {
        // Mostrar un mensaje de error si las credenciales son incorrectas
        alert("Nombre de usuario o contraseña incorrectos.");
    }
});




document.getElementById('pago').addEventListener('submit', function(event) {
  event.preventDefault();

  var password = document.getElementById('cons').value;

  if (password === '123') {
    alert('Por favor ingresa tu contraseña.');
  } else {
    alert('Pago autorizado correctamente.');
   
  }
});