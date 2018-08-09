// おまじない
Dropzone.autoDiscover = false;
$(function(){

 Dropzone.options.uploadDropzone = {
    paramName : "file",         // input fileの名前
    parallelUploads:1,            // 1度に何ファイルずつアップロードするか
    acceptedFiles:'image/*',   // 画像だけアップロードしたい場合
    maxFiles:10,                      // 1度にアップロード出来るファイルの数
    maxFilesize:2,                // 1つのファイルの最大サイズ(1=1M)
    dictFileTooBig: "ファイルが大きすぎます。 ({{filesize}}MiB). 最大サイズ: {{maxFilesize}}MiB.",
    dictInvalidFileType: "画像ファイル以外です。",
    dictMaxFilesExceeded: "一度にアップロード出来るのは10ファイルまでです。",
};

});