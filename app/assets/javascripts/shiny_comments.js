
$(document).ready(function() {
	$('.close').click(function(){
    $('.popup_parent_cont').hide();  
	});
});

$(document).ready(function() {
	$('.call_popup').click(function(){
    $('.popup_parent_cont').show();  
	});
});

$(document).ready(function() {
  $('.for_login_add_sub_comment_link').click(function(){
    $('.popup_parent_cont').show();  
  });
});

$(document).ready(function() {
	$('.add_sub_comment_link').click ( function () {

    $.ajax ({
      url: '/new_sub_comment',
      type: 'GET',
      data: { parent_comment_id: $(this).attr('data-parent_comment_id') },
      success: function () {
      }
    });
	});

});


