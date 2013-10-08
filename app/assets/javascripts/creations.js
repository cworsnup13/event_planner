$(document).on('page:load', function(){
  
  //Replaces the source
  $(".creation_thumb").click(function(){
  });
  
  $(".creation_thumb").parent().hover(function(){
    $(this).css("opacity","0.5");
  }, function() {
    $(this).css("opacity","1");
  });

  $(".subPic").click(function(){
    $("#mainCreationPic").attr("src",$(this).attr("src"));
  });
});
