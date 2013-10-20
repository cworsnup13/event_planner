var fn = function(){
  $(".mainContainer").css("width",$("#sidebar").position().left-100);
  $(".contactform").validate();
};

$(document).on('page:load', fn);
$(document).ready(fn);
