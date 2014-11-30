$(document).ready(function() {
  add_place_link = $("a:contains('Add your place')");
  add_place_link.on('click', function(event){
    event.preventDefault();
    $('#add_place').toggle();
  });

  all_reply_form_links = $("a:contains('Send')");
  all_reply_form_links.on('click', function(event){
    event.preventDefault();
    var href = event.currentTarget;
    var reply_form = $(href).next();
    reply_form.toggle();
  });
});
