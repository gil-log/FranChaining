			
				    //토글키
    $('#toggle--daynight').on('click', function() {
      if ( $(this).prop('checked') ) {
    	  
        $("#expand-checkedbox-content").css("background", "#72DFD5");
        $("#display").removeClass("displaynone");
        
      } else {
    	  
        $("#expand-checkedbox-content").css("background", "transparent");
        $("#display").addClass("displaynone");
        
      }
    });

    $('#toggle--like').on('click', function() {
      if ( $(this).prop('checked') ) {
    	  
    	  $("#p_nochoice").addClass("displaynone");
          $("#e_no").removeClass("displaynone");
          
          $("#e_name").addClass("displaynone");
          $("#phone1").addClass("displaynone");
          $("#phone2").addClass("displaynone");
          $("#phone3").addClass("displaynone");
          

          
        
      } else {
    	  
    	  $("#p_nochoice").removeClass("displaynone");
          $("#e_no").addClass("displaynone");

          $("#e_name").removeClass("displaynone");
          $("#phone1").removeClass("displaynone");
          $("#phone2").removeClass("displaynone");
          $("#phone3").removeClass("displaynone");
          
        
      }
    });