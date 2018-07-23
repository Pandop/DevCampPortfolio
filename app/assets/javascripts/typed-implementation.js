function ready() {
    var options = {
        strings: ["Software development is the closest concept twe have to magic.",
            "It's my goal to ensure that anyone with a passion for coding can become a true programming artisan."
        ],
        typeSpeed: 75,
        backSpeed: 10,
        loop: true
    }

    var typed = new Typed(".element", options);

}

$(document).ready(ready);
$(document).on('turbolinks:load', ready);