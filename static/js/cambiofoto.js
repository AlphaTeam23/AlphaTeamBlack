document.getElementById('uploadButton').addEventListener('click', function(event) {
    event.preventDefault();
    const input = document.getElementById('imageInput');
    if (input.files && input.files[0]) {
        const file = input.files[0];
        const reader = new FileReader();
        
        reader.onload = function(event) {
            const base64Image = event.target.result;
            localStorage.setItem('uploadedImage', base64Image);
            document.getElementById('imagenPrevia').src = base64Image;
        };
        
        reader.readAsDataURL(file);
    }
});

// Al cargar la página, verifica si hay una imagen en localStorage y la muestra
document.addEventListener('DOMContentLoaded', function() {
    const storedImage = localStorage.getItem('uploadedImage');
    if (storedImage) {
        document.getElementById('imagenPrevia').src = storedImage;
    }
});

// Añade un evento de clic a la imagen de borrar para eliminar la foto
document.querySelector('.borrar').addEventListener('click', function() {
    localStorage.removeItem('uploadedImage');
    document.getElementById('imagenPrevia').src = '/static/imagenes/usuario.svg';
    alert("Se eliminó la imagen del perfil.")
});