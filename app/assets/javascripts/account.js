var fn = function(){
  $(".mainContainer").css("width",$("#sidebar").position().left-100);
        var scntDiv = $('#vendor-container');
        var i = $('#vendor-container p').size() + 1;
        
        $('#addVendor').click(function() {
                $('<p><input type="text" id="vendor" size="20" name="vendor_' + i +'" value=""  placeholder="Vendor Name" ></p>').appendTo(scntDiv);
                i++;
                return false;
        });
        
        $('#remVendor').click( function() { 
                if( i > 2 ) {
                        $(this).parents('p').remove();
                        i--;
                }
                return false;
        });
};

$(document).on('page:load', fn);
$(document).ready(fn);
