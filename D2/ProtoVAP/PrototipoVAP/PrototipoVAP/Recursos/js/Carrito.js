const carrito = document.getElementById('carrito');
const titulo = document.getElementById('TituloCarrito');
const total = document.getElementById('TotalCarrito');
const divPedido = document.getElementById('confirmarPedido');

let carritoLleno = [];
let totalFinal = 0;

function limpiarPantallaCarrito() {
    divPedido.style.visibility = 'hidden';
    carrito.innerHTML = "";
    total.innerHTML = "";
    carritoLleno = [];
    totalFinal = 0;
}

function renderCarrito() {
    if (localStorage.length > 0) {
        for (let i = 1; i <= localStorage.length; i++) { carritoLleno.push(JSON.parse(localStorage.getItem(i))); }

        titulo.textContent = "Mi Carrito";

        carritoLleno.forEach(producto => {
            carrito.innerHTML += `
            <div class="card text-white bg-info" style="width: 100%; margin-bottom: 24px;">
                <div class="card-header">${producto.tipo} - ${producto.concepto}</div>
                <div class="card-body row">
                    <div class="col-9">
                        <h4 class="card-title" style="text-align: left!important;">$MXN${producto.precio}</h4>
                        <h5 class="card-text">color ${producto.Color} - talla ${producto.Talla}</h5>
                    </div>
                    <div class="col-3 text-center">
                        <a href="#" class="text-white">
                            <i class="bi bi-trash-fill lead"></i>
                        </a>
                    </div>
                </div>
            </div>`;

            totalFinal += producto.precio;
        });

        total.innerHTML = `
            $MXN${totalFinal}`;

        divPedido.style.visibility = 'visible';

    } else {
        titulo.textContent = "Aun no has agregado productos a tu carrito";
        limpiarPantallaCarrito()
    }
}

limpiarPantallaCarrito()
renderCarrito()