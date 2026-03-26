document.getElementById("miFormulario").addEventListener("submit", function (event) {

    event.preventDefault(); // evita que el formulario se envíe automáticamente

    let nombre = document.getElementById("nombre").value;
    let correo = document.getElementById("correo").value;
    let edad = document.getElementById("edad").value;
    let password = document.getElementById("password").value;
    let mensaje = document.getElementById("mensaje");

    // Validación del nombre
    if (nombre === "") {
        mensaje.textContent = "El nombre no puede estar vacío";
        return;
    }

    // Validación del correo
    if (!correo.includes("@")) {
        mensaje.textContent = "El correo debe contener @";
        return;
    }

    // Validación edad
    if (edad < 18) {
        mensaje.textContent = "Debes tener al menos 18 años";
        return;
    }

    // Validación contraseña
    if (password.length < 6) {
        mensaje.textContent = "La contraseña debe tener mínimo 6 caracteres";
        return;
    }

    // Si todo es correcto
    mensaje.textContent = "Formulario enviado correctamente ✅";

});