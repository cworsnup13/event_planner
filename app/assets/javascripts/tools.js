var fn = function(){
   $("#toolsContainer").css("width",$("#sidebar").position().left-50); 
};

$(document).on('page:load', fn);
$(document).ready(fn);
