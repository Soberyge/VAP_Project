const pedidosDiv = document.getElementById('pedidos');
const tiuloPedidos = document.getElementById('tituloPedidos');

//Funcion para imprimir pedidos en pantalla
const renderPedidos = () => {
    if (pedidos.length > 0) {
        tiuloPedidos.innerHTML = '<h1>Mis Pedidos</h1>';
        pedidosDiv.innerHTML = '';

        pedidos.forEach(pedido => {
            pedidosDiv.innerHTML += `
                <div class="card text-white bg-warning mb-3" style="width: 100%;">
                    <div class="card-header row">
                        <div class="col-3">Pedido - ${pedido.IdPedido}</div>
                        <div class="col-3">Total: $MXN${pedido.Total}</div>
                        <div class="col-3">Fecha: ${pedido.Fecha}</div>
                        <div class="col-3">Estado: ${pedido.Estado}</div>
                    </div>
                    <div class="card-body row">
                        <div class="col-9"></div>
                        <div class="col-3" style="display: flex;align-items: center;"></div>
                    </div>
                </div>
            `;
            pedido.Producto.forEach(producto => {
                pedidosDiv.children[pedidosDiv.childElementCount - 1].children[1].children[0].innerHTML += `
                    <div class="mb-4">
                        <h4 class="card-title" style="text-align: left!important;">${producto.Tipo} ${producto.Concepto}-${producto.Marca} - $MXN${producto.Precio}</h4>
                        <h5 class="card-text">color ${producto.Variante.Color} - talla ${producto.Variante.Talla}</h5>
                    </div>
                `;
            })

            if (pedido.Estado === "pendiente" || pedido.Estado === "empacado") {
                let cancelarBtn = document.createElement('button');
                cancelarBtn.setAttribute('id', pedido.IdPedido);
                cancelarBtn.classList.add('b', 'btn', 'btn-danger');
                cancelarBtn.textContent = "Cancelar Pedido";
                pedidosDiv.children[pedidosDiv.childElementCount - 1].children[1].children[1].appendChild(cancelarBtn);
            }            
        });

    } else {
        tiuloPedidos.innerHTML = '<h1>Parece que no tienes pedidos...</h1>';
        pedidosDiv.innerHTML = '';
    }
}

//Asignación de evento al botón cancelar pedido
document.attachEvent = function (evt, q, fn) {
    document.addEventListener(evt, (e) => {
        if (e.target.matches(q)) {
            fn.apply(e.target, [e]);
        }
    });
};

//Funcion del evento click del boton Ver Detalles
document.attachEvent('click', '.b', function (event) {
    let id = this.id;
    if (confirm(`Seguro que deseas cancelar el pedido: ${id} ?`)) {
        let data = { idPedido: id }
        CancelarPedido(data).then((data) => {            
            alert(data.d)
            return false;
        })        
    }
});

//funcion asincrona para enviar el id del pedido que debe ser cancelado
async function CancelarPedido(data) {
    let result
    try {
        result = await $.ajax({
            type: "POST",
            url: "PedidosCliente.aspx/CancelarPedido",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true
        });
        return result
    } catch (error) {
        alert(error)
    }
}

//funcion para recargar la pagina una vez que las peticiones ajax se hayan terminado
$(document).ajaxStop(function () {
    window.location.reload();
});

//Llamada a la funcion para imprimir pedidos
renderPedidos()