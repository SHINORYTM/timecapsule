$(function(){

  //users/user_top

  // $(".sent_email").click(function(){
  //    $(this).next()
  // });
 
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
    scroll: false,
    //containment:".layout_middle",
    //snap: ".layout_middle", /* ターゲットにスナップする */
    //snapMode: "inner",   /* 内側にスナップする */
    revert:'invalid',/* 範囲外へのドロップ時 */
    //refreshPositions: "true",
    stack: ".pictureimage",//ドラッグした画像を一番上へ配置*/
    start: function(event,ui){
      $(".img_list",this).addClass("able")
    },
    stop:function(event, ui) {
      //ドラッグ終了時、画像の座標を取得
      //var coordinate_t = (ui.position.top); 現在位置からの座標
      //var coordinate_l = (ui.position.left);
      var top = $(".img_list",this).offset().top;
      var left = $(".img_list",this).offset().left;
      var that = $(".img_list",this)
      var index = that.attr("name");
      $('input:hidden[name="image_date[' + index + '][left]"]').attr("value",left);
      $('input:hidden[name="image_date[' + index + '][top]"]').attr("value",top); 
    }
  //ドラッグ終了時の処理　:一度ドラッグしたらリサイズ発動
  // $(".pictureimage").not(this).draggable("disable")/* 画像１枚のみドロップ、それ以外を無効 */      
  // }
});

var height = $(".layout_middle").height();
var width = $(".layout_middle").width();
/* リサイズ比率、サイズ最大値設定 */
$(".img_list").resizable({
  //maxWidth: height,
  //maxHeight: width,
  aspectRatio:true,
  containment:".layout_middle",
  stop: function(event, ui) {
    //リサイズ終了時、画像のサイズを取得
    var index = $(".img_list",this).attr("name");
    $('input:hidden[name="image_date[' + index + '][height]"]').attr("value",ui.size.height);
    $('input:hidden[name="image_date[' + index + '][width]"]').attr("value",ui.size.width);
  }
  }).resizable("disable");

//プレビュー画面クリックでドラッグしていない画像の[id]を空にする
$(".preview").click(function(){

  for (var i=0; i<$(".img_list").length; i++){
  var w = $(".img_select" + i).width();
  var h = $(".img_select" + i).height();
  //ドラッグ移動している且つリサイズはしていない場合、元のサイズを入れる
  if ($('input:hidden[name="image_date[' + i + '][height]"]').val() == ""){
    $('input:hidden[name="image_date[' + i + '][height]"]').attr("value",h)
    $('input:hidden[name="image_date[' + i + '][width]"]').attr("value",w)
  }
  if ($('input:hidden[name="image_date[' + i + '][left]"]').val() == ""){
    $('input:hidden[name="image_date[' + i + '][id]"]').remove();
    $('input:hidden[name="image_date[' + i + '][left]"]').remove();
    $('input:hidden[name="image_date[' + i + '][top]"]').remove();
    $('input:hidden[name="image_date[' + i + '][height]"]').remove();
    $('input:hidden[name="image_date[' + i + '][width]"]').remove();
  }
  }
  //layout_middleの座標とサイズをoffsetで取得
  var layout_offset_top = $(".layout_middle").offset().top;
  var layout_offset_left = $(".layout_middle").offset().left;
  $('input:hidden[name="layout_offset_top"]').attr("value",layout_offset_top);
  $('input:hidden[name="layout_offset_left"]').attr("value",layout_offset_left);
  var layout_height = $(".layout_middle").height();
  var layout_width = $(".layout_middle").width();
  $('input:hidden[name="layout_height"]').attr("value",layout_height);
  $('input:hidden[name="layout_width"]').attr("value",layout_width);
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
　
  for (var i=0; i<$(".img_list").length; i++){
  $('input:hidden[name="image_date[' + i + '][height]"]').attr("value","");
  $('input:hidden[name="image_date[' + i + '][width]"]').attr("value","");
  $('input:hidden[name="image_date[' + i + '][left]"]').attr("value","");
  $('input:hidden[name="image_date[' + i + '][top]"]').attr("value",""); 
  };

  });



});

$(window).on('load', function(){

  //_layout/preview

//create_albumページのレイアウト挿入枠のサイズと座標を取得
var offset_top = $('input:hidden[name="offset_top"]').attr("value");
var offset_left = $('input:hidden[name="offset_left"]').attr("value");
var layout_height = $('input:hidden[name="prev_height"]').attr("value");
var layout_width = $('input:hidden[name="prev_width"]').attr("value");
//プレビュー画面のレイアウト挿入枠のサイズと座標を取得
var preview_offset_top = $(".layout_middle").offset().top;
var preview_offset_left = $(".layout_middle").offset().left;
var preview_height = $(".layout_middle").height();
var preview_width = $(".layout_middle").width();

//$(".layout_middle").offset({top: offset_top});
//$(".layout_middle").offset({left: offset_left});
//$(".layout_middle").width(layout_width);
//$(".layout_middle").height(layout_height);




//レイアウトのプレビュー画面に取得したサイズ、座標で表示　プレビュー画面のサイズに比率を合わせる
for (var i=0; i<$(".img_placed").length; i++){
  var index = $(".image" + i).attr("name");
  var height = $('input:hidden[name="height' + index + '"]').attr("value");
  var width = $('input:hidden[name="width' + index + '"]').attr("value");
  var top = $('input:hidden[name="top' + index + '"]').attr("value");
  var left = $('input:hidden[name="left' + index + '"]').attr("value");
  sum_top = top - (offset_top - preview_offset_top)
  sum_left = left - (offset_left - preview_offset_left)
  ratio_height = preview_height/layout_height
  ratio_width =  preview_width/layout_width
  $(".img" + index).width(width);
  $(".img" + index).height(height);
  $(".img" + index).offset({top: sum_top,left: sum_left});
   
}
//TODO:２枚目の画像移動で１枚目の画像に影響 for文二回繰り返しで対処
for (var i=0; i<$(".img_placed").length; i++){
  var index = $(".image" + i).attr("name");
  var height = $('input:hidden[name="height' + index + '"]').attr("value");
  var width = $('input:hidden[name="width' + index + '"]').attr("value");
  var top = $('input:hidden[name="top' + index + '"]').attr("value");
  var left = $('input:hidden[name="left' + index + '"]').attr("value");
  sum_top = top - (offset_top - preview_offset_top)
  sum_left = left - (offset_left - preview_offset_left)
  ratio_height = preview_height/layout_height
  ratio_width =  preview_width/layout_width
  $(".img" + index).width(width);
  $(".img" + index).height(height);
  $(".img" + index).offset({top: sum_top,left: sum_left});
   
}

//creation_screen

//macbookproのウィンドウサイズのみ対応

 var screen_offset_top = $(".screen_area").offset().top;
 var screen_offset_left = $(".screen_area").offset().left;
// var screen_height = $(".screen_area").height();
// var screen_width = $(".screen_area").width();

for (var i=0; i<$(".screen").length; i++){
  var index = $(".screen" + i).attr("name");
  var height = $('input:hidden[name="screen_height' + index + '"]').attr("value");
  var width = $('input:hidden[name="screen_width' + index + '"]').attr("value");
  var screen_top = $('input:hidden[name="screen_top' + index + '"]').attr("value");
  var screen_left = $('input:hidden[name="screen_left' + index + '"]').attr("value");
  sum_top = screen_top - (264 - screen_offset_top)
  sum_left = screen_left - (476 - screen_offset_left)
  //ratio_height = preview_height/layout_height
  //ratio_width =  preview_width/layout_width
  $(".screen" + index).width(width);
  $(".screen" + index).height(height);
  $(".screen" + index).offset({top: sum_top,left: sum_left});
  
}

//TODO:２枚目の画像移動で１枚目の画像に影響 for文二回繰り返しで対処
for (var i=0; i<$(".screen").length; i++){
  var index = $(".screen" + i).attr("name");
  var height = $('input:hidden[name="screen_height' + index + '"]').attr("value");
  var width = $('input:hidden[name="screen_width' + index + '"]').attr("value");
  var screen_top = $('input:hidden[name="screen_top' + index + '"]').attr("value");
  var screen_left = $('input:hidden[name="screen_left' + index + '"]').attr("value");
  sum_top = screen_top - (264.34 - screen_offset_top)
  sum_left = screen_left - (476.11 - screen_offset_left)
  //ratio_height = preview_height/layout_height
  //ratio_width =  preview_width/layout_width
  $(".screen" + index).width(width);
  $(".screen" + index).height(height);
  $(".screen" + index).offset({top: sum_top,left: sum_left});
  
}

// $('.img_placed').click(function(){
//   var index = $(this).attr("name");
//   var top = $('input:hidden[name="top' + index + '"]').attr("value");
//   var left = $('input:hidden[name="left' + index + '"]').attr("value");
//   var height = $('input:hidden[name="height' + index + '"]').attr("value");
//   var width = $('input:hidden[name="width' + index + '"]').attr("value");
 
//  $(this).width(width);
//  $(this).height(height);
//  $(this).offset({top: top,left: left});
//  alert($(this).offset().top);
//  alert($(this).offset().left);
// });


  
});