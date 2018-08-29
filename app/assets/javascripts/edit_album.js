$(function(){
 
  //album/:id/edit_album

  //背景カラー設定
   $(".bg_color").click(function(){  
    var image = $(this).attr('src');
    $(".layout_bg").attr("src",image);
    //背景カラーを次項へ渡す
    var bg =  $(this).attr("name");
    $('input:hidden[name="layout"]').attr("value",bg);
   });

   $(".reset_bg").click(function(){
    $(".layout_bg").removeAttr('src image');
   });

 //album/:id/upload

 //画像削除機能
 $('.picture').hover(
  function(){
    $(this).find(".picture_edit").removeClass("btn_destroy_close");
    $(this).find(".picture_edit").addClass("btn_destroy_open");
  },
  function(){
    $(this).find(".picture_edit").removeClass("btn_destroy_open");
    $(this).find(".picture_edit").addClass("btn_destroy_close");
  }
);

//album/:id/create_album
  
//ドロップエリア＆リサイズ設定
$('.pictureimage').draggable({
    snap: ".layout_middle", /* ターゲットにスナップする */
    snapMode: "inner",   /* 内側にスナップする */
    revert:'invalid',/* 範囲外へのドロップ時 */
    refreshPositions: "true",
    stack: ".pictureimage",//ドラッグした画像を一番上へ配置*/
    start: function(event,uni){
      $(".img_list",this).addClass("able")
    }
  // stop:function(event, ui) {
  //ドラッグ終了時の処理　:一度ドラッグしたらリサイズ発動
  // $(".pictureimage").not(this).draggable("disable")/* 画像１枚のみドロップ、それ以外を無効 */      
  // }
});

/* リサイズ比率、サイズ最大値設定 */
$(".img_list").resizable({
  aspectRatio:true,
  containment:".layout_middle"}).resizable("disable");

//プレビュー画面クリックで画像の座標とサイズをセッションへ保存
$(".preview").click(function(){
 var size = $(".able").width().height();
 var coordinate = $(".able").position(".layout_middle");

});


//ドロップ機能設定
$('.layout_middle').droppable({
  over: function(e,ui) {
    $(this)
      .css('background-color', 'gray')
      .css('opacity', '0.5')
  },
  out: function(e,ui) {
    $(this)
      .css('background-color', 'white')
      .css('opacity', '1')
  },
  drop: function(e,ui) {
    $(".text").hide();
    var w = $(".img_list").width();
    var h = $(".img_list").height(); 
    $(".pictureimage").width(w).height(h);     
    $(".able").resizable("enable");
  }
});

//画像ホバー時の効果設定
$('.pictureimage').hover(
  function(){
    $(this).css("opacity","0.7").css("cursor","grab");
  },
  function(){
    $(this).css("opacity","1").css("cursor","default");
  }
);

//ドロップリセット
var w = $(".img_list").width();
var h = $(".img_list").height();
var gpw = $(".pictureimage").width();
var gph = $(".pictureimage").height();
$('#listclear').click(function(){
  $('.layout_middle').css('background-color','white').css('opacity','1')
  $(".text").show();
  $('.pictureimage').css("position","relative").css({top:"0",left:"0"}).width(gpw).height(gph)
  $('.ui-wrapper').width(w).height(h)
  $(".img_list").removeClass(".able").width(w).height(h).resizable("disable"); 
  });


});