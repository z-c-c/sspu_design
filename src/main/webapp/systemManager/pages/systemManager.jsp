<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>系统样式管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/page.css">
    <link rel="stylesheet" href="../../systemManager/css/jquery.mloading.css">
    <script type="text/javascript" src="../../systemManager/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../systemManager/js/jquery.mloading.js"></script>
    <script type="text/javascript" src="../../systemManager/js/pop.js"></script>
    <style>
        dd{
            margin-right: 3%;
        }
    </style>
</head>
<script>
    $(function () {
        // getProp();
    });
    function getProp(){
        $('body').mLoading("show");
        $.ajax({
            url:'baseInfo/obtain',
            type:'post',
            async:false,
            data:{
                fieldName:''
            },
            dataType:'json',
            success:function (data) {
                $('body').mLoading("hide");
                $("#infoList").empty();
                var html='';
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        var item=data[i];
                        html+='<dd><div class="fullcard"><div class="fz-top"><div class="fz-left">';
                        html+='<img src="../../systemManager/images/p1-1-icon1.png"><span>'+item.fieldExplain+'</span>';
                        html+='</div><div class="fz-right">';
                        html+='<img id="img-alter-btn-'+i+'" src="../../systemManager/images/p1-1-icon2.png"><span onclick="alterProp(\''+i+'\',\''+item.fieldType+'\')">修改</span>';
                        html+='<img id="img-cancel-btn-'+i+'" style="display: none" src="../../systemManager/images/p1-1-icon1.png"><span style="display: none" onclick="cancelAlterProp(\''+i+'\',\''+item.fieldType+'\')">取消</span>';
                        html+='&nbsp;&nbsp;<img id="img-save-btn-'+i+'" style="display: none" src="../../systemManager/images/p2-1-icon1.png"><span style="display: none" onclick="saveAlterProp(\''+item.id+'\',\''+i+'\',\''+item.fieldType+'\')">保存</span>';
                        html+='</div></div>';
                        if(item.fieldType=='Image'){
                            html+='<div class="fz-bott" id="fz-bott-'+i+'">';
                            html+='<img src="'+item.fieldValue+'">';
                            html+='<input id="alter-file-'+i+'" type="file" style="display: none" onchange="fileSelect(\'alter-file-'+i+'\',\'alter-file-value-'+i+'\');">';
                            html+='<input id="alter-file-value-'+i+'" type="hidden">';
                            html+='</div></div></dd>';
                        }else if(item.fieldType=='String'){
                            html+='<div class="fz-bott" id="fz-bott-'+i+'">';
                            html+='<span>'+item.fieldValue+'</span>';
                            html+='<input id="alter-value-'+i+'" style="display: none" type="text" value="'+item.fieldValue+'"></div></div></dd>';
                        }else{
                            html+='<div class="fz-bott" id="fz-bott-'+i+'">'+item.fieldValue;
                            html+='<input id="alter-value-'+i+'" style="display: none" type="text" value="'+item.fieldValue+'"></div></div></dd>';
                        }
                    }
                }
                html+='<dd id="addTypeDiv"><div class="nonecard"><div class="f-all"><i>+</i><span onclick="popup()">新增类型</span></div></div></dd>';
                $("#infoList").append(html);
            }
        })
    }
    function alterProp(obj,type) {
        $("#img-alter-btn-"+obj).hide();
        $("#img-alter-btn-"+obj).next().hide();
        $("#img-cancel-btn-"+obj).show();
        $("#img-cancel-btn-"+obj).next().show();
        $("#img-save-btn-"+obj).show();
        $("#img-save-btn-"+obj).next().show();
        if(type=='Image'){//图片
            $("#fz-bott-"+obj+" img").hide();
            $("#alter-file-"+obj).show();
        }else if(type=='String'){
            $("#fz-bott-"+obj+" span").hide();
            $("#alter-value-"+obj).show();
        }else{
            $("#fz-bott-"+obj+" span").hide();
            $("#alter-value-"+obj).show();
        }
    }
    function cancelAlterProp(obj,type){
        $("#img-alter-btn-"+obj).show();
        $("#img-alter-btn-"+obj).next().show();
        $("#img-cancel-btn-"+obj).hide();
        $("#img-cancel-btn-"+obj).next().hide();
        $("#img-save-btn-"+obj).hide();
        $("#img-save-btn-"+obj).next().hide();
        if(type=='Image'){//图片
            $("#alter-file-"+obj).hide();
            $("#fz-bott-"+obj+" img").show();
        }else if(type=='String'){
            $("#alter-value-"+obj).val($("#fz-bott-"+obj+" span").text());
            $("#alter-value-"+obj).hide();
            $("#fz-bott-"+obj+" span").show();
        }else{
            $("#alter-value-"+obj).val($("#fz-bott-"+obj+" span").text());
            $("#alter-value-"+obj).hide();
            $("#fz-bott-"+obj+" span").show();
        }
    }
    function saveAlterProp(id,obj,type){
        var fieldValue='';
        if(type=='Image') {//图片
            fieldValue=$("#alter-file-value-"+obj).val();
            if(fieldValue==''){
                mmodalAlert('warn','提示','请选择有效文件');
                return;
            }
        }else if(type=='String'){
            fieldValue=$("#alter-value-"+obj).val();
        }else{
            fieldValue=$("#alter-value-"+obj).val();
        }
        var param=new Object();
        param.id=id;
        param.fieldValue=fieldValue;
        saveProp(param);
    }
    function saveProp(param) {
        $('body').mLoading({text:'保存中'});
        $('body').mLoading("show");
        $.ajax({
            url:'baseInfo/save',
            async:false,
            type:'post',
            data: param,
            success:function (data) {
                $('body').mLoading("hide");
                if(data!=null&&data!='error'){
                    if(data == 'alter'){//修改
                        mmodalAlert('success','提示','修改成功');
                    }else if(data == 'add'){//添加
                        mmodalAlert('success','提示','添加成功');
                    }
                }else{
                    mmodalAlert('error','提示','操作失败');
                }
                getProp();
            }
        })
    }
    function popup(){
        $("#m1").show();
    }
    function popdown(){
        $("#m1").hide();
    }
    function changeDateType() {
        var fieldType=$("#fieldType").val();
        if(fieldType=='Image'){
            $("#fieldValue").val('');
            $("#fieldValue").hide();
            $("#upload").show();
        }else{
            $("#upload").hide();
            $("#fieldValue").val('');
            $("#fieldValue").show();
        }
    }
    function fileSelect(sourceObj,targetObj){
        $('body').mLoading({text:'读取文件中'});
        $('body').mLoading("show");
        var obj=document.getElementById(sourceObj);
        var file = obj.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        var fileName=obj.value;
        var s = fileName.substring(fileName.lastIndexOf(".")+1);
        reader.onload = function(e) {
            $('body').mLoading("hide");
            var base64=e.target.result;
            $("#"+targetObj).val(base64);//data:image/"+s+";base64,
        }
    }
    function formSubmit(){
        var param=$("#dataForm").serialize();
        saveProp(param);
        popdown();
    }
</script>
<body>
<div class="f-content p1-1">
    <div class="f-top">
        <div class="f-title"><span>基本信息管理&nbsp;/&nbsp;</span>系统样式管理</div>
    </div>
    <div class="f-bott">
        <div class="inner-title">基本信息</div>
        <div class="f-inner">
            <dl id="infoList" style="justify-content:flex-start;">
            </dl>
        </div>
    </div>
</div>
<div id="m1" class="mmodal">
    <div class="modal-form">
        <div class="modal-title">
            <img class="modal-title__img" src="../../systemManager/images/modal2.png" />
            <span class="modal-title__span">新增系统配置</span>
            <img class="modal-title__cancel js-cancel" src="../../systemManager/images/modal4.png" onclick="popdown()"/>
        </div>
        <form class="modal-content" id="dataForm">
            <input type="hidden" name="id">
            <div class="modal-inputset">
                <label class="modal-label">属性名称</label>
                <input type="text" class="modal-inputset__input" name="fieldName" />
            </div>
            <div class="modal-inputset">
                <label class="modal-label">属性说明</label>
                <input type="text" class="modal-inputset__input" name="fieldExplain"/>
            </div>
            <div class="modal-inputset">
                <label class="modal-label">数据类型</label>
                <select id="fieldType" class="modal-inputset__input" name="fieldType" onchange="changeDateType()">
                    <option value="String">字符串</option>
                    <option value="Image">图片</option>
                </select>
            </div>
            <div class="modal-inputset">
                <label class="modal-label">属性值</label>
                <input id="upload" type="file" style="display: none" accept=".png,.jpg,.jpeg,.ico" onchange="fileSelect('upload','fieldValue')"/>
                <input id="fieldValue" type="text" class="modal-inputset__input" name="fieldValue" />
            </div>
        </form>
        <div class="modal-buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel" onclick="popdown()">取消</div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="formSubmit()">确定</div>
        </div>
    </div>
</div>
<div id="m3" class="mmodal">
    <div class="modal-pop">
        <div class="modal-title">
            <img class="modal-title__img" id="alertImg" src="../../systemManager/images/modal1.png" />
            <span class="modal-title__span" id="alertTitle">提示</span>
        </div>
        <div class="modal-content">
            <div class="modal-content__text" id="alertMessage"></div>
        </div>
        <div class="modal-buttons">
            <div id="m3-mmodal-cancel" class="modal-btns__btn modal-btns__btn--cancel js-cancel" onclick="mmodalCancel()">取消</div>
            <div id="m3-mmodal-sure" class="modal-btns__btn modal-btns__btn--primary" onclick="mmodalSure()">确定</div>
        </div>
    </div>
</div>
</body>
</html>

