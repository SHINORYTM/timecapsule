$(function(){

 

  $(".config_page").click(function(){
    $(".config_page").not(this).hide();
   });

   $(".reset").click(function(){
    $(".config_page").show();
   });

   $(".reset_bg").click(function(){
    $(".config_bg").show();
   });

 $('.config_page').hover(
  function(){
    $(this).css("background-color","lightpink");
  },
  function(){
    $(this).css("background-color","skyblue");
  }
);

$(".config_bg").click(function(){
  $(".config_bg").not(this).hide();
 });


});