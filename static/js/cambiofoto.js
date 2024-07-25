// document.addEventListener("DOMContentLoaded", () => {
//     const fileInput = document.getElementById('cargarfoto');
//     const previewImage = document.getElementById('imagenPrevia');
//     const uploadButton = document.getElementById('btnSubirFoto');

//     fileInput.addEventListener('change', () => {
//         const file = fileInput.files[0];
//         if (file && file.type.startsWith('image/') && file.size <= 2 * 1024 * 1024) {
//             const reader = new FileReader();
//             reader.onload = e => previewImage.src = e.target.result;
//             reader.readAsDataURL(file);
//         } else {
//             alert('Selecciona una imagen válida (menos de 2 MB).');
//             fileInput.value = '';
//             previewImage.src = 'imagenes/imagenprofesor.jpg';
//         }
//     });

//     uploadButton.addEventListener('click', () => {
//         if (fileInput.files.length > 0) alert('Imagen subida exitosamente');
//         else alert('Por favor, selecciona una imagen primero.');
//     });
// });



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
    alert("se elimino la imagen del pelfil.")
});