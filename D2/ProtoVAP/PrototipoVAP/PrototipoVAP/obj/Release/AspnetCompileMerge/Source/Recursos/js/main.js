const btn_toggle = document.getElementById('btn_toggle');
const navbar = document.getElementById('navbar');
const sidebar = document.getElementById('sidebar-container');
const content = document.getElementById('content1');

//Elementos que mostrar al iniciar sesión
const ddiPerfil = document.getElementById('ddiPerfil');
const ddiPedidos = document.getElementById('ddiPedidos');
const ddd = document.getElementById('ddd');
const ddiSignOut = document.getElementById('ddiSignOut');
const a_perfil = document.getElementById('a_perfil');
const sign_off = document.getElementById('sign_off');
const ddiInSe = document.getElementById('ddiInSe');

//Al cargar el documento busca si hay o no cliente logueado
function cargaCliente() {
    asyncAjax("GetCliente").then((data) => {
        cliente = data.d;
        if (cliente !== "") {
            ddiPerfil.style.display = "block";
            ddiPedidos.style.display = "block";
            ddd.style.display = "block";
            ddiSignOut.style.display = "block";
            a_perfil.style.visibility = "visible";
            sign_off.style.visibility = "visible";
            ddiInSe.style.display = "none";
        } else ddiInSe.style.display = "block";
    })
}

cargaCliente()

//Petición AJAX para traer al cliente si es que esta logueado
async function asyncAjax(metodo) {
    let result
    try {
        result = await $.ajax({
            type: "POST",
            url: "Default.aspx/" + metodo,
            data: null,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true,
        });
        return result
    } catch (error) {
        console.error(error)
    }
}


function CerrarSesion () {
    if (confirm("Seguro que desea cerrar la sesión?")) {
        asyncAjax("CerrarSesion").then((data) => {
            console.log(data);
        })
    }
}

//PAGINA RESPONSIVA

btn_toggle.onclick = () => {
    const heightNavbar = getComputedStyle(navbar).getPropertyValue("height");
    const heightSideBar = getComputedStyle(sidebar).getPropertyValue("height");
    sidebar.style.marginTop = heightNavbar;
    const heightContainer = Number(heightNavbar.slice(0, heightNavbar.length - 2)) + Number(heightSideBar.slice(0, heightSideBar.length - 2));
    content.style.marginTop = heightContainer + "px";
}

addEventListener('resize', () => {
    let wnav = getComputedStyle(navbar).getPropertyValue("width");
    wnav = Number(wnav.slice(0, wnav.length - 2));

    let hnav = getComputedStyle(sidebar).getPropertyValue("height");
    hnav = Number(hnav.slice(0, hnav.length - 2));

    if (wnav > 991.6 && hnav > 400) {
        sidebar.style.marginTop = getComputedStyle(navbar).getPropertyValue("height");
        content.style.marginTop = getComputedStyle(navbar).getPropertyValue("height");
    } else if (wnav < 991.6 || hnav < 400) {
        const hNavbar = getComputedStyle(navbar).getPropertyValue("height");
        const hSideBar = getComputedStyle(sidebar).getPropertyValue("height");
        sidebar.style.marginTop = hNavbar;
        const hContainer = Number(hNavbar.slice(0, hNavbar.length - 2)) + Number(hSideBar.slice(0, hSideBar.length - 2));
        content.style.marginTop = hContainer + "px";
    }
})
