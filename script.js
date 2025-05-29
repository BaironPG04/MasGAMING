document.addEventListener("DOMContentLoaded", () => {
  const botonesAgregar = document.querySelectorAll(".btn-agregar");

  botonesAgregar.forEach((boton) => {
    boton.addEventListener("click", () => {
      const id = boton.dataset.id;
      const nombre = boton.dataset.nombre;
      const precio = parseInt(boton.dataset.precio);

      const nuevoProducto = { id, nombre, precio };

      let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

      // Verificar si el producto ya existe y sumar la cantidad
      const indexExistente = carrito.findIndex((item) => item.id === id);

      if (indexExistente !== -1) {
        carrito[indexExistente].cantidad += 1;
      } else {
        nuevoProducto.cantidad = 1;
        carrito.push(nuevoProducto);
      }

      localStorage.setItem("carrito", JSON.stringify(carrito));
      alert(`${nombre} fue agregado al carrito`);
    });
  });
});
