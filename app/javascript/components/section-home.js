
// section-home

const images = ['images/hero_bg_4.jpg',
  'images/P1070290.JPG',
  'images/P1030827.JPG',
];

const imgBackground = document.getElementById("section-home");

function displayImage(x) {
  imgBackground.style.backgroundImage = "url(" + images[x] + ")";
}
function startTimer() {
  let x = 0;
  displayImage(x);
  setInterval(function() {
    x = x + 1 >= images.length ? 0 : x + 1;
    displayImage(x);
  }, 4000);
}
