document.addEventListener('DOMContentLoaded', () => {
    console.log("DOM fully loaded and parsed");

    let searchBtn = document.querySelector('#search-btn');
    let searchBar = document.querySelector('.search-bar-container');
    let searchClose = document.querySelector('#search-close');
    let formBtn = document.querySelector('#login-btn');
    let loginForm = document.querySelector('.login-form-container');
    let formClose = document.querySelector('#form-close');
    let menu = document.querySelector('#menu-bar');
    let navbar = document.querySelector('.navbar');
    let navbavideoBtns = document.querySelectorAll('.vid-btn');

    // Log the elements to check if they are correctly selected
    console.log("Elements selected:", {
        searchBtn,
        searchBar,
        searchClose,
        formBtn,
        loginForm,
        formClose,
        menu,
        navbar,
        navbavideoBtns
    });

    window.onscroll = () => {
        if (searchBtn) searchBtn.classList.remove('fa-times');
        if (searchBar) searchBar.classList.remove('active');
        if (menu) menu.classList.remove('fa-times');
        if (navbar) navbar.classList.remove('active');
    };

    if (menu) {
        menu.addEventListener('click', () => {
            menu.classList.toggle('fa-times');
            navbar.classList.toggle('active');
        });
    }

    if (searchBtn) {
        searchBtn.addEventListener('click', () => {
            searchBtn.classList.toggle('fa-times');
            searchBar.classList.toggle('active');
        });
    }

    if (searchClose) {
        searchClose.addEventListener('click', () => {
            searchBar.classList.remove('active');
        });
    }

    if (formBtn && loginForm) {
        formBtn.addEventListener('click', () => {
            loginForm.classList.toggle('active');
        });
    }

    if (formClose && loginForm) {
        formClose.addEventListener('click', () => {
            loginForm.classList.remove('active');
        });
    }

    if (navbavideoBtns.length > 0) {
        navbavideoBtns.forEach(btn => {
            console.log("Adding event listener to button:", btn); 
            btn.addEventListener('click', () => {
                console.log("Video button clicked:", btn); 
                document.querySelectorAll('.controls .active').forEach(activeControl => {
                    activeControl.classList.remove('active');
                });
                btn.classList.add('active');
                let videoSlider = document.querySelector('#video-slider');
                if (videoSlider) {
                    videoSlider.src = btn.getAttribute('data-src');
                }
            });
        });
    } else {
        console.log("No video buttons found");
    }

    var swiper = new Swiper(".review-slider", {
        spaceBetween: 20,
        loop: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        breakpoints: {
            640: {
                slidesPerView: 1, 
            },
            768: {
                slidesPerView: 2,      
            },
            1024: {
                slidesPerView: 3,
            },
        },
    });

    console.log("Swiper initialized:", swiper);
});
