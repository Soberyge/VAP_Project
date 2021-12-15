import 'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js' //importamos bootstrap Modal para poder manipular el modal de login

const carrito = document.getElementById('carrito');
const titulo = document.getElementById('TituloCarrito');
const total = document.getElementById('TotalCarrito');
const divPedido = document.getElementById('confirmarPedido');
const btnConfirmarPedido = document.getElementById('btnConfirmarPedido');
//Login
const mainModal = new bootstrap.Modal(document.getElementById('mainModal'));

let carritoLleno = [];
let keys = [];
let totalFinal = 0;

//funcion para vaciar las variables y los elementos en la pantalla
function limpiarPantallaCarrito() {
    titulo.textContent = "Aun no has agregado productos a tu carrito";
    divPedido.style.visibility = 'hidden';
    carrito.innerHTML = "";
    total.innerHTML = "";
    carritoLleno = [];
    keys = [];
    totalFinal = 0;
}

//funcion que guarda las keys del localStorage
function getKeys() { for (let i = 0; i < localStorage.length; i++) { keys.push(localStorage.key(i)); } }

//funcion para cargar los productos que se almacenaron en el localStorage
function renderCarrito() {
    limpiarPantallaCarrito()
    if (localStorage.length > 0) {
        getKeys()
        for (let i = 0; i < localStorage.length; i++) { carritoLleno.push(JSON.parse(localStorage.getItem(keys[i]))); }

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
                    <div class="col-3 text-center"></div>
                </div>
            </div>`;

            let borrarBtn = document.createElement('a');
            borrarBtn.classList.add('btn', 'text-white');
            borrarBtn.innerHTML = '<i class="i bi bi-trash-fill lead"></i>';
            borrarBtn.children[0].setAttribute('id', producto.IdVariante);
            carrito.children[carrito.childElementCount - 1].children[1].children[1].appendChild(borrarBtn);

            totalFinal += producto.precio;
        });

        total.innerHTML = `
            $MXN${totalFinal}`;

        divPedido.style.visibility = 'visible';
    }
}

//Asignación de evento al botón Ver Detalles
document.attachEvent = function (evt, q, fn) {
    document.addEventListener(evt, (e) => {
        if (e.target.matches(q)) {
            fn.apply(e.target, [e]);
        }
    });
};

//Funcion del evento click del boton borrar
document.attachEvent('click', '.i', function () {
    borrarCarrito(this.id)
    renderCarrito()
});

//borrar producto del localStorage
function borrarCarrito(id) {
    keys.forEach(key => {
        let productoSeVa = JSON.parse(localStorage.getItem(key));
        if (productoSeVa.IdVariante === id) localStorage.removeItem(key);
    })
}

//evento y funcion al dar clic en confirmar pedido
btnConfirmarPedido.onclick = (e) => {    
    e.preventDefault();

    if (cliente != "") {
        let idArray = [];
        carritoLleno.forEach(producto => idArray.push(producto.IdVariante))
        let data = { idArray: idArray, total: totalFinal, idCliente: JSON.parse(cliente).IdCliente }

        enviarCarrito(data).then((data) => {
            console.info('Response:', data.d)
            limpiarPantallaCarrito()
            localStorage.clear()
        })
    } else {
        mainModal.show();
    }
}

//funcion para enviar el arreglo que contiene los id de los productos que hay en el carrito
async function enviarCarrito(data) {
    let result
    try {
        result = await $.ajax({
            type: "POST",
            url: "Carrito.aspx/GetCarrito",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true
        });
        return result
    } catch (error) {
        console.error(error)
    }    
}

//Carga del carrito al cargar la pagina
renderCarrito()