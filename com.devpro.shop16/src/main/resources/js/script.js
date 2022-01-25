// Header sticky
$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop()) {
            $('#header').addClass('sticky');
        } else {
            $('#header').removeClass('sticky');
        }
    });
});

// Menu-category
const itemslidebar = document.querySelectorAll(".category-left-li");
itemslidebar.forEach(function(menu, index) {
    menu.addEventListener("click", function() {
        menu.classList.toggle("block");
    });
});

//--------------------------------------PRODUCT----------------------
const bigImg = document.querySelector(".product-content-left-big-img img")
const smalImg = document.querySelectorAll(".product-content-left-small-img img")
smalImg.forEach(function(imgItem, X) {
    imgItem.addEventListener("click", function() {
        bigImg.src = imgItem.src
    })
})


const thamkhaosize = document.querySelector(".thamkhaosize")
const chitiet = document.querySelector(".chitiet")
if (chitiet) {
    chitiet.addEventListener("click", function() {
        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "block"

    })
}
const butTon = document.querySelector(".product-content-right-bottom-top")
if (butTon) {
    butTon.addEventListener("click", function() {
        document.querySelector(".product-content-right-bottom-content-big").classList.toggle("activeB")
    })
}

/*---------------------------------MODAL----------------*/
const modal = document.querySelector(".modal");
const openModalBtn = document.querySelector(".thamkhaosize");
const iconCloseModal = document.querySelector(".modal__header i");
const buttonCloseModal = document.querySelector(".modal__footer button");

function toggleModal() {
    modal.classList.toggle("hide");
}

openModalBtn.addEventListener("click", toggleModal);
iconCloseModal.addEventListener("click", toggleModal);
buttonCloseModal.addEventListener("click", toggleModal);

modal.addEventListener("click", (e) => {
    if (e.target == e.currentTarget) toggleModal();
});