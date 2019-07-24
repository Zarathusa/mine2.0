/*组织机构*/
//初始化fileinput
function initFileInput() {
    $("#singleUpload").fileinput({
        language: 'zh', //设置语言
        dropZoneTitle: '可以将文件拖放到这里',
        uploadUrl: "index.php", //上传的地址
        uploadExtraData: function(previewId, index) {   //该插件可以向您的服务器方法发送附加数据。这可以通过uploadExtraData在键值对中设置为关联数组对象来完成。所以如果你有设置uploadExtraData={id:'kv-1'}，在PHP中你可以读取这些数据$_POST['id']
            var id = $('#id').val();
            var type= $('#organUpload').val();
            return {
                id: id,
                type: type,
            };
        },
        enctype: 'multipart/form-data',
        allowedFileExtensions: ['pdf','doc','docx'],//接收的文件后缀
        uploadAsync: true, //默认异步上传
        showUpload: true, //是否显示上传按钮
        showRemove: true, //显示移除按钮
        showPreview:true, //是否显示预览
        showCancel:true,   //是否显示文件上传取消按钮。默认为true。只有在AJAX上传过程中，才会启用和显示
        showCaption: true,//是否显示文件标题，默认为true
        browseClass: "btn btn-primary", //文件选择器/浏览按钮的CSS类。默认为btn btn-primary
        dropZoneEnabled: true,//是否显示拖拽区域
        maxFileSize: 100*1024,//单位为kb，如果为0表示不限制文件大小
        minFileCount: 0, //每次上传允许的最少文件数。如果设置为0，则表示文件数是可选的。默认为0
        maxFileCount: 1, //每次上传允许的最大文件数。如果设置为0，则表示允许的文件数是无限制的。默认为0
        previewFileIcon: "<i class='glyphicon glyphicon-file'></i>",//当检测到用于预览的不可读文件类型时，将在每个预览文件缩略图中显示的图标。默认为<i class="glyphicon glyphicon-file"></i>
        fileActionSettings: {                               // 在预览窗口中为新选择的文件缩略图设置文件操作的对象配置
            showRemove: true,                                   // 显示删除按钮
            showUpload: false,                                   // 显示上传按钮
            showDownload: false,                            // 显示下载按钮
            showZoom: false,                                    // 显示预览按钮
            showDrag: false,                                        // 显示拖拽
            removeIcon: '<i class="fa fa-trash"></i>',   // 删除图标
            uploadIcon: '<i class="fa fa-upload"></i>',     // 上传图标
            uploadRetryIcon: '<i class="fa fa-repeat"></i>'  // 重试图标
        },
        layoutTemplates:{
            actionUpload:'',//去除上传预览缩略图中的上传图片
            actionZoom:'',   //去除上传预览缩略图中的查看详情预览的缩略图标
            actionDownload:'',//去除上传预览缩略图中的下载图标
            actionDelete:'', //去除上传预览的缩略图中的删除图标
        },//对象用于渲染布局的每个部分的模板配置。您可以设置以下模板来控制窗口小部件布局.eg:去除上传图标
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",//字符串，当文件数超过设置的最大计数时显示的消息 maxFileCount。默认为：选择上传的文件数（{n}）超出了允许的最大限制{m}。请重试您的上传！
    }).on('filebatchpreupload', function(event, data) { //该方法将在上传之前触发

    });
}

// 上传成功回调
$("#singleUpload").on("filebatchuploadcomplete", function() {
    layer.msg("上传附件成功");
    setTimeout("closeUpladLayer()",2000)
});
// 上传失败回调
$('#singleUpload').on('fileerror', function(event, data, msg) {
    layer.msg(data.msg);
    tokenTimeOut(data);
});