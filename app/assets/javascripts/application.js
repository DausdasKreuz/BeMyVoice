var picList = [];

function renderPicList() {
  // clean old list
  var message = document.querySelector('.message-content');
  message.innerHTML = '';

  // iterate and render
  for (var i = 0; i < picList.length; i++) {
    picURL = picList[i].attributes.src.value;
    message.innerHTML += '<div class="message-card"><img src="' + picURL + '" /><i class="material-icons close">clear</i></div>';
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
