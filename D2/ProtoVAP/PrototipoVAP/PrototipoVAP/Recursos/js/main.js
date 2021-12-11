const btn_toggle = document.getElementById('btn_toggle');
const navbar = document.getElementById('navbar');
const sidebar = document.getElementById('sidebar-container');
const content = document.getElementById('content1');

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
