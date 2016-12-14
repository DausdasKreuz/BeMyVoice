// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var picList = [];

function renderPicList() {
  // clean old list
  var message = document.querySelector('.message-content');
  message.innerHTML = '';

  // iterate and render
  for (var pic of picList) {
    picURL = pic.attributes.src.value;
      message.innerHTML += `<div class="message-card"><img src="${picURL}" /><i class="material-icons close">clear</i></div>`;
  }

  // bind all close buttons with their functions
  document.querySelectorAll('.material-icons.close').forEach(function(closeButton, index) {
      closeButton.onclick = removeFromList.bind(null, index);
  });
}

function addToList(image) {
  console.log("Añadiendo to list la siguiente imagen", image);
  picList.push(image.children[0]);
  renderPicList();
}

function removeFromList(index) {
  console.log("Removiendo to list la imagen con index", index);
  picList.splice(index, 1);
  renderPicList();
}

function clearList() {
  picList = [];
  renderPicList();
}

document.addEventListener('DOMContentLoaded', function() {
console.log('LOADED');
// Configure all images to be interactive
document.querySelectorAll('.card-image').forEach(function(image) {
    image.onclick = addToList.bind(null, image);
});

document.querySelector('.material-icons.done').onclick = function() { clearList() };
});
