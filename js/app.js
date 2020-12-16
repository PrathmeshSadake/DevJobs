let controller;
let slideScene;

function animateSlide(){
    //Todo : Init Controller
    controller = new ScrollMagic.Controller();
    // Todo select something
    const sliders = document.querySelectorAll('.slide');
    const nav = document.querySelector('.nav-header');


    // Todo Loop over each slide
    sliders.forEach(slide => {
        const revealImg = slide.querySelector('.reveal-img');
        const img = slide.querySelector('img');
        const revealText = slide.querySelector('.reveal-text');

        // GSAP library
        // gsap.to(revealImg, 1, {x:"100%"});
        // console.log("gsap running");

        const slideTl = gsap.timeline({
            defaults: {duration: 1.5, ease: "power4.in"},
        });

        slideTl.fromTo(revealImg, {x: "0%"}, {x: "100%"});
        slideTl.fromTo(img, {scale: 1.1}, {scale: 1}, "-=0.8");
        slideTl.fromTo(revealText, {x:"0%"}, {x:"100%"}, "-=0.5");
        slideTl.fromTo(nav, {y: "-100%"}, {y:"0"}, "-=0.5");

    });

}

animateSlide();