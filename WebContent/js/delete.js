$(document).ready(function(){
	
		$("input:text[numberOnly]").on("keyup", function() {
		      $(this).val($(this).val().replace(/[^0-9]/g,""));
		   });
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
