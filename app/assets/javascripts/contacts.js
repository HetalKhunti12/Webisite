$( document ).ready(function() {
	$("#contact_mobile_phone").mask("9999 999 999");
  $("#contact_work_phone").mask("(99) 9999 9999");
  $("#contact_abn").mask("99 999 999 999");

  /*$(".artist_mobile").mask("9999 999 999");
  $(".artist_phone").mask("(99) 9999 9999");*/

  $('#artist_profile_price').on('change', function() {
	  if (this.value == "other"){

	    $(".other_price").fadeOut( "slow" );
	    $(".other_price").css( "display", "block" );
	  } 
	})

	$(".upload_video").change(function () {
    $(this).closest('.profile-video-section').find(".video_url1").css("display", "none");
    $(this).closest('.profile-video-section').find("#upload_video").css("display", "block");
  });


  $(".video_url").change(function () {
    $(this).closest('.profile-video-section').find(".video_url1").css("display", "block");
    $(this).closest('.profile-video-section').find("#upload_video").css("display", "none");
   });

  
  $("#artist_profile_country").change(function() {
    if($(this).val() != ""){
      $.ajax({
        type: "GET",
        url: '/states/'+ $(this).val(),
        dataType: "script"
      });
    }
  });

  $("#artist_profile_state").change(function() {
    if($(this).val() != ""){
      $.ajax({
        type: "GET",
        url: '/cities/'+ $(this).val(),
        dataType: "script"
      });
    }
  });

  $("#artist_profile_category_id").change(function() {
  	if($(this).val() != ""){
      $.ajax({
        type: "GET",
        url: '/sub_category/'+ $(this).val(),
        dataType: "script"
      });
    }
  });

  $('#contact_type_artist').click(function(){
      $('.packages').css('display', 'block')
      $('.packages_service').css('display', 'none')
  });
  $('#contact_type_service').click(function(){
      $('.packages_service').css('display', 'block')
      $('.packages').css('display', 'none')
  });

});
