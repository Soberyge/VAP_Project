const pedidosDiv = document.getElementById('pedidos');
const tiuloPedidos = document.getElementById('tituloPedidos');

const pedidoArray = [
    {
        idPedido: 1,
        fechaPedido: '2021-12-12',
        totalPedido: 400.00,
        estadoPedido: 'empacado',
        productosSeleccionados: [
            {
                talla: "G",
                color: "negro",
                tipo: "sudadera",
                concepto: "Rocky1",
                marca: "hc",
                precio: 200
            },
            {
                talla: "EG",
                color: "blanco",
                tipo: "sudadera",
                concepto: "Rocky2",
                marca: "hc",
                precio: 200
            }
        ]
    },
    {
        idPedido: 2,
        fechaPedido: '2021-12-14',
        totalPedido: 500.00,
        estadoPedido: 'pendiente',
        productosSeleccionados: [
            {
                talla: "CH",
                color: "negro",
                tipo: "sudadera",
                concepto: "Rocky1",
                marca: "hc",
                precio: 250
            },
            {
                talla: "M",
                color: "blanco",
                tipo: "sudadera",
                concepto: "Rocky2",
                marca: "hc",
                precio: 250
            }
        ]
    }
]

//Funcion para imprimir pedidos en pantalla
const renderPedidos = () => {
    if (pedidoArray.length > 0) {
        tiuloPedidos.innerHTML = '<h1>Mis Pedidos</h1>';
        pedidosDiv.innerHTML = '';

        pedidoArray.forEach(pedido => {
            pedidosDiv.innerHTML += `
                <div class="card text-white bg-warning mb-3" style="width: 100%;">
                    <div class="card-header row">
                        <div class="col-3">Pedido - ${pedido.idPedido}</div>
                        <div class="col-3">Total: $MXN${pedido.totalPedido}</div>
                        <div class="col-3">Fecha: ${pedido.fechaPedido}</div>
                        <div class="col-3">Estado: ${pedido.estadoPedido}</div>
                    </div>
                    <div class="card-body row">
                        <div class="col-9"></div>
                        <div class="col-3" style="display: flex;align-items: center;"></div>
                    </div>
                </div>
            `;
            pedido.productosSeleccionados.forEach(producto => {
                pedidosDiv.children[pedidosDiv.childElementCount - 1].children[1].children[0].innerHTML += `
                    <div class="mb-4">
                        <h4 class="card-title" style="text-align: left!important;">${producto.tipo} ${producto.concepto}-${producto.marca} - $MXN${producto.precio}</h4>
                        <h5 class="card-text">color ${producto.color} - talla ${producto.talla}</h5>
                    </div>
                `;
            })

            if (pedido.estadoPedido === "pendiente" || pedido.estadoPedido === "empacado") {
                let cancelarBtn = document.createElement('button');
                cancelarBtn.setAttribute('id', pedido.idPedido);
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
    event.preventDefault();
    let id = this.id;
    if (confirm(`Seguro que deseas cancelar el pedido: ${id} ?`)) {
        let data = { idPedido: id }
        CancelarPedido(data).then((data) => {
            alert(data.d)
            renderPedidos()
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

//Llamada a la funcion para imprimir pedidos
renderPedidos()