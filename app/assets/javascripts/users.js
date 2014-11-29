$(document).ready(function() {
  add_place_link = $("a:contains('Add your place')");
  add_place_link.on('click', function(event){
    event.preventDefault();
    $('#add_place').css('display', 'block')
  })
});
