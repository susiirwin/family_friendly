$(function() {
  $('.rating_star').click(function(){
    var star = $(this);
    var business_id = $(this).attr('data-business-id');
    var stars = $(this).attr('data-stars');

    for(i=1; i<=5; i++){
      if(i <= stars){
        $('#' + business_id + '_' + i).addClass('on');
      } else {
        $('#' + business_id + '_' + i).removeClass('on');
      }
    }

    // $.ajax({
    //   type: "post",
    //   url: $
    // })
  });
});
