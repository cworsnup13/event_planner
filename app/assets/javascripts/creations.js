var fn = function(){
 
  //Replaces the source

  $(".creation_thumb").parent().hover(function(){
    $(this).css("opacity","0.5");
  }, function() {
    $(this).css("opacity","1");
  });

  $(".subPic").click(function(){
    $("#mainCreationPic").attr("src",$(this).attr("src"));
  });
};

$(document).ready(fn);
$(document).on('page:load', fn);

