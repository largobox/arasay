$(document).ready(function() {
	$('.hide_content_list').click(function(){
    $('.content_list').hide(); 
    $('.hide_content_list').hide(); 
    $('.show_content_list').show();  
	});
});

$(document).ready(function() {
	$('.show_content_list').click(function(){
    $('.show_content_list').hide();  
    $('.content_list').show(); 
    $('.hide_content_list').show(); 
	});
});

