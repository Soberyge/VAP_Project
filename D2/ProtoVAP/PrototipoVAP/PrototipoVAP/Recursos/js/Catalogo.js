const catalogo = document.getElementById('catalogo');
const todo = document.getElementById('fltTodo');
const sudadera = document.getElementById('fltSudadera');
const playera = document.getElementById('fltPlayera');
const menor = document.getElementById('odbMenor');
const mayor = document.getElementById('odbMayor');

const productos = [
    {
        "id": 1,  
        "tipo": "playera",
        "concepto": "luffy sentado de pana",
        "marca": "chingona",
        "precio": 109.99
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 2,
        "tipo": "sudadera",
        "concepto": "trafalgar",
        "marca": "perrona",
        "precio": 349.59
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 3,
        "tipo": "playera",
        "concepto": "zoro",
        "marca": "chingona",
        "precio": 212.99
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 4,
        "tipo": "sudadera",
        "concepto": "nami",
        "marca": "perrona",
        "precio": 399.59
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 5,
        "tipo": "playera",
        "concepto": "usopp",
        "marca": "chingona",
        "precio": 409.99
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 6,
        "tipo": "sudadera",
        "concepto": "chopper",
        "marca": "perrona",
        "precio": 112.59
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 7,
        "tipo": "playera",
        "concepto": "sanji",
        "marca": "chingona",
        "precio": 99.99
        //"imagen_1": 
        //"imagen_2":
    },
    {
        "id": 8,
        "tipo": "sudadera",
        "concepto": "robin",
        "marca": "perrona",
        "precio": 102.11
        //"imagen_1": 
        //"imagen_2":
    },
]
let productos_filtrados = productos.slice();
let ordenando = false;

todo.onclick = () => renderProducts(productos);

sudadera.onclick = () => {
    const sudaderas = productos.filter(producto => producto.tipo === "sudadera");
    renderProducts(sudaderas)
}

playera.onclick = () => {
    const playeras = productos.filter(producto => producto.tipo === "playera");
    renderProducts(playeras)
}

mayor.onclick = () => {
    const mayores = productos_filtrados.sort((p1, p2) => (p1.precio < p2.precio) ? 1 : (p1.precio > p2.precio) ? -1 : 0);
    ordenando = true;
    renderProducts(mayores)
}

menor.onclick = () => {
    const menores = productos_filtrados.sort((p1, p2) => (p1.precio > p2.precio) ? 1 : (p1.precio < p2.precio) ? -1 : 0);
    ordenando = true;
    renderProducts(menores)
}

const renderProducts = (filtrados) => {    

    catalogo.innerHTML = '';

    filtrados.forEach(producto => {
        catalogo.innerHTML += `
        <div class="card" style="width: 18rem;">
            <img src="Recursos/Imagenes/VAP_Logo.png" class="card-img-top" alt="<imagen>">
            <div class="card-body text-center">
                <h5 class="card-title">MXN$${producto.precio}</h5>
                <p class="card-text">${producto.tipo} ${producto.concepto}</p>
                <a href="#" class="btn btn-primary">Ver detalles</a>
            </div>
        </div>
    `;
    });

    if (!ordenando) productos_filtrados = filtrados.slice();
    else ordenando = false;
}

renderProducts(productos)
