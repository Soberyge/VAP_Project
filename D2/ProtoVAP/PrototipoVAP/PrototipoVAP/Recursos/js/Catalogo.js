const catalogo = document.getElementById('catalogo');
const todo = document.getElementById('fltTodo');
const sudadera = document.getElementById('fltSudadera');
const playera = document.getElementById('fltPlayera');
const menor = document.getElementById('odbMenor');
const mayor = document.getElementById('odbMayor');
const imgModal = document.getElementById('modalImg');
const concepto = document.getElementById('modalTyC');
const precio = document.getElementById('modalPrecio');
const tallaChica = document.getElementById('rbCH');
const tallaMediana = document.getElementById('rbM');
const tallaGrande = document.getElementById('rbG');
const tallaExtraGrande = document.getElementById('rbEG');
const colorNegro = document.getElementById('rbNegro');
const colorBlanco = document.getElementById('rbBlanco');
const existencias = document.getElementById('existencias');
const carritoBtn = document.getElementById('btnAgregarCarrito');
const btnCancelar = document.getElementById('btnCancelarmodal');
const btnCerrar = document.getElementById('btnCerrarmodal');
const headCatalogo = document.getElementById('head-catalogo');
const labelNegro = document.getElementById('rbN');
const labelBlanco = document.getElementById('rbB');
const labelCH = document.getElementById('rbChico');
const labelM = document.getElementById('rbMediano');
const labelG = document.getElementById('rbGrande');
const labelEG = document.getElementById('rbExtraGrande');

let tallaEscogida = "";
let colorEscogido = "";
let idProducto = 0;
let variante = undefined;

let productos_filtrados = productos.slice();    //arreglo con filtros 
let ordenando = false;  //variable para saber si se esta ordenando el contenido o no

//Evento click del filtro: todo
todo.onclick = () => renderProducts(productos);

//Evento click del filtro: sudadera
sudadera.onclick = () => {
    const sudaderas = productos.filter(producto => producto.Tipo === "sudadera");
    renderProducts(sudaderas)
}

//Evento click del filtro: playera
playera.onclick = () => {
    const playeras = productos.filter(producto => producto.Tipo === "playera");
    renderProducts(playeras)
}

//Evento click del order by: mayor
mayor.onclick = () => {
    const mayores = productos_filtrados.sort((p1, p2) => (p1.Precio < p2.Precio) ? 1 : (p1.Precio > p2.Precio) ? -1 : 0);
    ordenando = true;
    renderProducts(mayores)
}

//Evento click del order by: menor
menor.onclick = () => {
    const menores = productos_filtrados.sort((p1, p2) => (p1.Precio > p2.Precio) ? 1 : (p1.Precio < p2.Precio) ? -1 : 0);
    ordenando = true;
    renderProducts(menores)
}

//Render de la ventana Catalogo
const renderProducts = (filtrados) => {
    if (productos.length > 0) {
        catalogo.innerHTML = '';
        headCatalogo.style.display = "";

        filtrados.forEach(producto => {            

            catalogo.innerHTML += `
             <div class="card" style="width: 18rem;">
                <img src="${producto.ImgNegro}" class="card-img-top" alt="<image failed>">
                <div class="card-body text-center">
                    <h5 class="card-title">$MXN${producto.Precio}</h5>
                    <p class="card-text">${producto.Tipo} - ${producto.Concepto}</p>
                </div>
            </div>`;

            let detallesBtn = document.createElement('a');
            detallesBtn.setAttribute('id', producto.Id);
            detallesBtn.classList.add('a', 'btn', 'btn-primary');
            detallesBtn.textContent = "Ver detalles";
            detallesBtn.setAttribute('data-bs-toggle', 'modal');
            detallesBtn.setAttribute('data-bs-target', '#staticBackdrop');
            catalogo.children[catalogo.childElementCount - 1].children[1].appendChild(detallesBtn);
        });

        if (!ordenando) productos_filtrados = filtrados.slice();
        else ordenando = false;
    } else {
        headCatalogo.style.display = "none";
        catalogo.innerHTML = '<h1 style="font-weight:bold;" >Parece que no existen productos...</h1>';
    } 
}

//Trae el producto seleccionado de vuelta
function encuentraProducto() { return productos.find(producto => producto.Id == idProducto) };

//Asignación de evento al botón Ver Detalles
document.attachEvent = function (evt, q, fn) {
    document.addEventListener(evt, (e) => {
        if (e.target.matches(q)) {
            fn.apply(e.target, [e]);
        }
    });
};

//Funcion del evento click del boton Ver Detalles
document.attachEvent('click', '.a', function () {
    idProducto = this.id;
    const producto = encuentraProducto();
    concepto.innerHTML = `${producto.Tipo} - ${producto.Concepto}`;
    precio.innerHTML = `$MXN${producto.Precio}`;
    imgModal.src = producto.ImgNegro;
});

//Cachando el valor de los radio buttons
tallaChica.onclick = () => {
    tallaEscogida = "CH";
    buscarVariacion();
    checkBtnTalla(labelCH, labelM, labelG, labelEG);
}

tallaMediana.onclick = () => {
    tallaEscogida = "M";
    buscarVariacion();
    checkBtnTalla(labelM, labelCH, labelG, labelEG);
}

tallaGrande.onclick = () => {
    tallaEscogida = "G";
    buscarVariacion();
    checkBtnTalla(labelG, labelCH, labelM, labelEG);
}

tallaExtraGrande.onclick = () => {
    tallaEscogida = "EG";
    buscarVariacion();
    checkBtnTalla(labelEG, labelCH, labelM, labelG);
}

colorNegro.onclick = () => {
    colorEscogido = "negro";
    buscarVariacion();
    imgModal.src = productos[idProducto - 1].ImgNegro;
    checkBtnColor(labelNegro, labelBlanco);
}

colorBlanco.onclick = () => {
    colorEscogido = "blanco";
    buscarVariacion();
    imgModal.src = productos[idProducto - 1].ImgBlanco;
    checkBtnColor(labelBlanco, labelNegro);
}

//funcion para la vista de los botones checkeados
function checkBtnColor(labelSi, labelNo) {
    labelSi.style = "background-color: #9dacff!important;color: #9dacff!important;";
    labelNo.style.backgroundColor = "";
    labelNo.style.color = "";
}

function checkBtnTalla(labelSi, label1No, label2No, label3No) {
    labelSi.style = "background-color: #9dacff!important;";
    label1No.style.backgroundColor = "";
    label2No.style.backgroundColor = "";
    label3No.style.backgroundColor = "";
}

//Valida si existe la variación solicitada por el usuario
function buscarVariacion() {
    if (tallaEscogida && colorEscogido !== "") {
        const producto = encuentraProducto();
        variante = producto.Variantes.find(v => v.Talla === tallaEscogida && v.Color === colorEscogido);

        if (variante === undefined) {
            existencias.innerHTML = `Sin Existencias`;
            carritoBtn.disabled = true;
        }            
        else {
            existencias.innerHTML = `Existencias: ${variante.Cantidad}`;
            carritoBtn.disabled = false;            
        }
    }
}

//limpiamos los campos y las variables
function limpiarDatos() {
    tallaEscogida = "";
    colorEscogido = "";
    variante = undefined;
    existencias.textContent = "";
    carritoBtn.disabled = true;
    labelBlanco.style.backgroundColor = "";
    labelBlanco.style.color = "";
    labelNegro.style.backgroundColor = "";
    labelNegro.style.color = "";
    labelCH.style.backgroundColor = "";
    labelM.style.backgroundColor = "";
    labelG.style.backgroundColor = "";
    labelEG.style.backgroundColor = "";
}

btnCancelar.onclick = limpiarDatos;
btnCerrar.onclick = limpiarDatos;

//almacenando valores en el localStorage
carritoBtn.onclick = () => {
    let id = localStorage.length + Math.random();   //id en el localStorage
    Object.assign(variante, {
        tipo: productos[idProducto-1].Tipo,
        concepto: productos[idProducto-1].Concepto,
        precio: productos[idProducto-1].Precio
    });    
    localStorage.setItem(id, JSON.stringify(variante));
    limpiarDatos();
}

//Cargar el catalogo al inicio
renderProducts(productos)
