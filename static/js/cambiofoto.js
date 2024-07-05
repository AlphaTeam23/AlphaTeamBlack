document.addEventListener("DOMContentLoaded", () => {
    const fileInput = document.getElementById('cargarfoto');
    const previewImage = document.getElementById('imagenPrevia');
    const uploadButton = document.getElementById('btnSubirFoto');

    fileInput.addEventListener('change', () => {
        const file = fileInput.files[0];
        if (file && file.type.startsWith('image/') && file.size <= 2 * 1024 * 1024) {
            const reader = new FileReader();
            reader.onload = e => previewImage.src = e.target.result;
            reader.readAsDataURL(file);
        } else {
            alert('Selecciona una imagen válida (menos de 2 MB).');
            fileInput.value = '';
            previewImage.src = 'imagenes/imagenprofesor.jpg';
        }
    });

    uploadButton.addEventListener('click', () => {
        if (fileInput.files.length > 0) alert('Imagen subida exitosamente');
        else alert('Por favor, selecciona una imagen primero.');
    });
});




