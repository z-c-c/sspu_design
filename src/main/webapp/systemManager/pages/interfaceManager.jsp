<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2019-09-07
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>div</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="systemManager/css/page.css">
    <link rel="stylesheet" href="systemManager/css/scrollbar.css" />
    <script type="text/javascript" src="systemManager/js/jquery.min.js"></script>
    <script src="systemManager/js/scrollbar.min.js"></script>
    <style>
	.inline-list__li {
	    float: left;
	    width: 60px;
	    height: 40px;
	    line-height: 40px;
	    text-align: center;
	}
	.modal-title__img {
	    margin-right: 6px;
	    vertical-align: -4px;
	    cursor:pointer;
	}
	.inline-list input::-ms-input-placeholder {
    	text-align: center;
    }
 
    .inline-list input::-webkit-input-placeholder {
    	text-align: center;
    }
    
    .textStys{
    	padding-left: 0px;
    	width: 40px;
    	text-align: center;
    }
    </style>
    <script type="text/javascript">
        $(function () {
            InterfaceList("");
        });
        function InterfaceList(name) {
            $.ajax({
                type: "post",
                url:'datainterfaceManager/showList',
                dataType:'json',
                data: {interfaceName: name},
                success: function(data){
                    var resultlist=data.resultList;
                    $('#dl1').empty();
                    for (var i = 0; i <resultlist.length; i++) {
                        // alert(resultlist[i].name);
                        var $name=resultlist[i].name;
                        var $method=resultlist[i].requestMethod;
                        var $statues;
                        var $id=resultlist[i].id;
                        if(resultlist[i].statues==1){
                            $statues="启用";
                        }else{
                            $statues="停用";
                        }
                        $('#dl1').append('<dd style="margin-inline-end: 32px;"> <div class="fz-top"> <div class="img-box"><img src="systemManager/images/p3-1-icon1.png"></div><div>' +
                            '                    <div class="interface">' +
                            '                        <span>'+'接口名称'+'</span>'+' <h6>'+$name+'</h6>' +
                            '                    </div>' +
                            '                    <div class="method">\n' +
                            '                        <div><span>'+'请求方式'+'</span><b style="font-size:20px;">'+$method+'</b></div>' +
                            '                        <div><span>'+'状态'+'</span><b class="close">'+$statues+'</b></div>' +
                            '                    </div>' +
                            '                </div>' +
                            '            </div>' +
                            '            <div class="fz-bott">' +
                            '                <div onclick="javaScrtpt:IdToDel(\'' + $id + '\')"><img src="systemManager/images/p3-1-icon2.png">删除</div>' +
                            '                <div onclick="showupdateInterface(\''+$id+'\')"><img src="systemManager/images/p3-1-icon3.png">修改</div>' +
                            '                <div onclick="showDemo(\'' + $id + '\')"><img src="systemManager/images/p3-1-icon4.png">查看示例</div>' +
                            '            </div>' +
                            '        </dd>');
                    }
                }
            });
        }
        function addshow() {
            $('#addname').val("");
            $('#addaddress').val("");
            $('#addreturn').val("");
            $('#adddemocode').val("");
            $('#add-params').empty();
            $('#add-params').append(
                '                   <dt class="modal-list-dt">' +
                '                        <ul class="inline-list">' +
                '                            <li class="inline-list__li">序号</li>' +
                '                            <li class="inline-list__li">名称</li>' +
                '                            <li class="inline-list__li">必填</li>' +
                '                            <li class="inline-list__li">类型</li>' +
                '                            <li class="inline-list__li">说明</li>' +
                '                            <li class="inline-list__li">操作</li>' +
                '                        </ul>' +
                '                    </dt>');

            $("#m1").show();
        }
        function addparams() {
            $('#add-params').append('<dd class="modal-list-dd">' +
            '                        <ul class="inline-list">' +
            '                            <li class="inline-list__li"><input type="number" placeholder="输入" class="textStys" style="padding-left: 10px;"></li>' +
            '                            <li class="inline-list__li"><input placeholder="输入" class="textStys"></li>' +
            '                            <li class="inline-list__li"><select><option value="是">是</option><option value="否">否</option></select></li>' +
            '                            <li class="inline-list__li"><input placeholder="输入" class="textStys"></li>' +
            '                            <li class="inline-list__li"><input placeholder="输入" class="textStys"></li>' +
            '							 <li class="inline-list__li"><img class="modal-title__img" onclick="$(this).parent().parent().parent().remove();" src="systemManager/images/modal4.png"/></li>'+
            '                        </ul>' +
            '                    </dd>');
        }

        function add() {
            var $size= $('#add-params').children("dd").length;//参数的个数
            var paramsArray=[];
            for (var i = 0; i <$size ; i++) {
               var $param_index= $('#add-params').find("dd:eq("+i+")").find("input:eq(0)").val();
               var $param_name= $('#add-params').find("dd:eq("+i+")").find("input:eq(1)").val();
               var $param_notnull= $('#add-params').find("dd:eq("+i+")").find("select:eq(0)").val();
               var $param_type= $('#add-params').find("dd:eq("+i+")").find("input:eq(2)").val();
               var $param_explanation= $('#add-params').find("dd:eq("+i+")").find("input:eq(3)").val();
               var param={"index":$param_index,"name":$param_name,"not_null":$param_notnull,"type":$param_type,"explanation":$param_explanation};
               paramsArray.push(param);
            }
            var $name = $('#addname').val();
            var $address=$('#addaddress').val();
            var $method = $('#addmethod').val();
            var $return = $('#addreturn').val();
            var $codeDemo = $('#adddemocode').val();

            var judgeparam_index=false;
            var judgeparam_name=false;
            var judgeparam_type=false;
            for(var i = 0; i <$size ; i++){
                // alert($('#add-params').findByName("dd:eq("+i+")").findByName("input:eq(0)").val())
                if($('#add-params').find("dd:eq("+i+")").find("input:eq(0)").val()==""||$('#add-params').find("dd:eq("+i+")").find("input:eq(0)").val()==null) {
                    judgeparam_index=true;break;}}
            for(var i = 0; i <$size ; i++){
                if($('#add-params').find("dd:eq("+i+")").find("input:eq(1)").val()==""||$('#add-params').find("dd:eq("+i+")").find("input:eq(1)").val()==null) {
                    judgeparam_name=true;break;}}
            for(var i = 0; i <$size ; i++){
                if($('#add-params').find("dd:eq("+i+")").find("input:eq(2)").val()==""||$('#add-params').find("dd:eq("+i+")").find("input:eq(2)").val()==null) {
                    judgeparam_type=true;break;}}
            if ($name == "" || $name == null) {
                alert("接口名称不能为空")
            }else if($address == "" || $address == null){
                alert("请求地址不能为空")
            }else if(judgeparam_index==true){
                alert("参数序号不能为空")
            }else if (judgeparam_name==true){
                alert("参数名称不能为空")
            } else if(judgeparam_type==true){
                alert("参数类型不能为空")
            } else if($return==""||$return==null){
                alert("返回格式不能为空")
            } else{
                $.ajax({
                    type: "post",
                    url: 'datainterfaceManager/add',
                    dataType: 'json',
                    data:{
                        name: $name,
                        address:$address,
                        request_method: $method,
                        return_demonstration: $return,
                        code_demo: $codeDemo,
                        params:JSON.stringify(paramsArray)
                    },
                    success: function (data) {
                        $('#m1').hide();
                        InterfaceList("");
                    },
                    error: function (data) {
                        alert("添加失败!" );
                    }
                });
            }
        }

        function showDemo(iid) {
            $.ajax({
                type: 'POST',
                url: 'datainterfaceManager/showDemo',
                dataType: 'json',
                data:
                    {
                        id: iid
                    },
                success: function (data) {
                    if (data.message == "success") {
                        var interfaceBo = data.interface;
                        var iname = interfaceBo.name;
                        var iaddress=interfaceBo.address;
                        var imethod = interfaceBo.requestMethod;
                        var icodeDemo=interfaceBo.codeDemo;
                        // var params=data.params;
                        var params=eval(interfaceBo.params);
                        // for(var i=0;i<params.length;i++){
                        //     alert(params[i].name);
                        // }
                        $('#interface-content').empty();
                        $('#params-content').empty();
                        $('#interface-content').append('<div class="modal-info">\n' +
                            '                        <span class="modal-label modal-label--strong">接口名称:</span>\n' +
                            '                        <span class="modal-info__span"\n' +
                            '                              >'+iname+
                            '</span>\n' +
                            '                    </div>\n' +
                            '                    <div class="modal-info">\n' +
                            '                        <span class="modal-label modal-label--strong">请求地址:</span>\n' +
                            '                        <span class="modal-info__span">'+iaddress+'</span>\n' +
                            '                    </div>\n' +
                            '                    <div class="modal-info">\n' +
                            '                        <span class="modal-label modal-label--strong">请求方式:</span>\n' +
                            '                        <span class="modal-info__span">'+imethod+'</span>\n' +
                            '                    </div>\n' +
                            '                    <div class="modal-info">\n' +
                            '                        <span class="modal-label modal-label--strong">请求参数说明</span>\n' +
                            '                        <dl class="modal-list" id="params-content">\n' +
                            '                            <dt class="modal-list-dt">\n' +
                            '                                <ul class="inline-list">\n' +
                            '                                    <li class="inline-list__li">序号</li>\n' +
                            '                                    <li class="inline-list__li">名称</li>\n' +
                            '                                    <li class="inline-list__li">必填</li>\n' +
                            '                                    <li class="inline-list__li">类型</li>\n' +
                            '                                    <li class="inline-list__li">说明</li>\n' +
                            '                                </ul>\n' +
                            '                            </dt>');
                        for (var i = 0; i <params.length ; i++) {
                            $('#params-content').append('  <dd class="modal-list-dd">\n' +
                                '                                <ul class="inline-list">\n' +
                                '                                    <li class="inline-list__li">'+params[i].index+'</li>\n' +
                                '                                    <li class="inline-list__li">'+params[i].name+'</li>\n' +
                                '                                    <li class="inline-list__li">'+params[i].not_null+'</li>\n' +
                                '                                    <li class="inline-list__li">'+params[i].type+'</li>\n' +
                                '                                    <li class="inline-list__li">'+params[i].explanation+'</li>\n' +
                                '                                </ul>\n' +
                                '                            </dd>');
                        }
                        $('#interface-content').append(' </dl></div><div class="modal-info">\n' +
                            '                        <span class="modal-label modal-label--strong">返回示例</span>\n' +
                            '                        <div class="modal-info__div">\n' +
                            '                            <code class="code">\n' +icodeDemo+
                            '                            </code>\n' +
                            '                        </div>\n' +
                            '                    </div>');


                    }
                }
            });
            $("#m2").show();
        }

        function IdToDel(id) {
            $('#TodelId').val(id);
            $("#m3").show();
        }

        function confrimdel() {
            var delid = $('#TodelId').val();
            $.ajax({
                type: 'POST',
                url: 'datainterfaceManager/delInterface',
                dataType: 'json',
                data:
                    {
                        dataInterfaceId: delid
                    },
                success: function (result) {
                    $('#m3').hide();
                    InterfaceList("");
                },
                error: function (result) {
                    alert("删除失败!");
                }
            });
        }
        function showupdateInterface($id) {
            $.ajax({
                type: 'POST',
                url: 'datainterfaceManager/showDemo',
                dataType: 'json',
                data:
                    {
                        id:$id
                    },
                success: function (data){
                    if (data.message == "success") {
                        var interfaceBo = data.interface;
                        var iname = interfaceBo.name;
                        var iaddress=interfaceBo.address;
                        var imethod = interfaceBo.requestMethod;
                        var icodeDemo = interfaceBo.codeDemo;
                        var returnformat=interfaceBo.returndemonstration;
                        var params = eval(interfaceBo.params)
                        var statues=interfaceBo.statues;
                        $('#ToUpdateId').val(interfaceBo.id);
                        $('#update-form').empty();
                        $('#update-form').append('<div class="modal-inputset">\n' +
                            '                <label class="modal-label  modal-label--strong">接口名称</label>\n' +
                            '                <input class="modal-inputset__input" id="updatename" value="'+iname+'"/>\n' +
                            '            </div>\n' +
                            '<div class="modal-inputset">\n' +
                            '                <label class="modal-label  modal-label--strong">请求地址</label>\n' +
                            '                <input class="modal-inputset__input" id="updateaddress" value="'+iaddress+'"/>\n' +
                            '            </div>\n' +
                            '            <div class="modal-inputset">\n' +
                            '                <label class="modal-label  modal-label--strong">请求方式</label>\n' +
                            '              <select class="modal-inputset__input" id="updatemethod">\n' +
                            '                                <option value="post">post</option>\n' +
                            '                                <option value="get">get</option>\n' +
                            '                            </select>  '+
                            '            </div>' +
                            '            <div class="modal-info" id="updateparams-div">\n' +
                            '                <span class="modal-label modal-label--strong">请求参数</span>\n' +
                            '                <img class="modal-title__img" onclick="updateAddparams()" src="systemManager/images/modal2.png"/>\n' +
                            '                <span class="modal-label modal-label--strong">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;接口状态:</span>'+
                            '                <select id="statues_select"><option value="1">启用</option><option value="0">停用</option></select>'+
                            '                <dl class="modal-list" id="update-params">\n' +
                            '                </dl>\n' +
                            '            </div> <div class="modal-inputset">\n' +
                            '                <label class="modal-label  modal-label--strong">返回格式</label>\n' +
                            '                <input class="modal-inputset__input" id="updatereturn" value="'+returnformat+'"/>\n' +
                            '            </div>\n'
                            +
                            '            <div class="modal-txt">\n' +
                            '                <label class="modal-label modal-label--top  modal-label--strong">返回示例</label>\n' +
                            '                <textarea class="modal-txt__textarea" id="updatedemocode" >'+icodeDemo+'</textarea>\n' +
                            '            </div>'
                        );
                        if(imethod=="post"){
                            $('#update-form').find("select:eq(0)").find("option:eq(0)").attr("selected","selected");
                        }else{
                            $('#update-form').find("select:eq(0)").find("option:eq(1)").attr("selected","selected");
                        }
                        if(statues==1){
                            $('#statues_select').find("option:eq(0)").attr("selected","selected");
                        }else{
                            $('#statues_select').find("option:eq(1)").attr("selected","selected");
                        }
                        $('#update-params').empty();
                        $('#update-params').append(
                            '                   <dt class="modal-list-dt">' +
                            '                        <ul class="inline-list">' +
                            '                            <li class="inline-list__li">序号</li>' +
                            '                            <li class="inline-list__li">名称</li>' +
                            '                            <li class="inline-list__li">必填</li>' +
                            '                            <li class="inline-list__li">类型</li>' +
                            '                            <li class="inline-list__li">说明</li>' +
                            '                            <li class="inline-list__li">操作</li>' +
                            '                        </ul>' +
                            '                    </dt>');
                        for (var i = 0; i <params.length ; i++) {
                            $('#update-params').append('  <dd class="modal-list-dd">\n' +
                                '                                <ul class="inline-list">\n' +
                                '                                    <li class="inline-list__li"><input value="'+params[i].index+'"  placeholder="输入" class="textStys" style="padding-left: 0px;"></li>\n' +
                                '                                    <li class="inline-list__li"><input value="'+params[i].name+'"  placeholder="输入" class="textStys"></li>\n' +
                                '                                    <li class="inline-list__li"><select><option value="是">是</option><option value="否">否</option></select>'+
                                '                                    <li class="inline-list__li"><input value="'+params[i].type+'"  placeholder="输入" class="textStys"></li>\n' +
                                '                                    <li class="inline-list__li"><input value="'+params[i].explanation+'"  placeholder="输入" class="textStys"></li>\n' +
                                '							 <li class="inline-list__li"><img class="modal-title__img" onclick="$(this).parent().parent().parent().remove();" src="systemManager/images/modal4.png"/></li>'+
                                '                                </ul>\n' +
                                '                            </dd>');
                            if(params[i].not_null=="是"){
                                $('#update-params').find("dd:eq("+i+")").find("select:eq(0)").find("option:eq(0)").attr("selected","selected");
                            }else if(params[i].not_null=="否"){
                                $('#update-params').find("dd:eq("+i+")").find("select:eq(0)").find("option:eq(1)").attr("selected","selected");
                            }
                        }
                        $('#m4').show();
                    }
                }
            });
        }
        function updateAddparams() {
            $('#update-params').append('<dd class="modal-list-dd">' +
                '                        <ul class="inline-list">' +
                '                            <li class="inline-list__li"><input type="number"  placeholder="输入" class="textStys" style="padding-left: 10px;"></li>' +
                '                            <li class="inline-list__li"><input placeholder="名称" placeholder="输入" class="textStys"></li>' +
                '                            <li class="inline-list__li" ><select><option value="是">是</option><option value="否">否</option></select></li>' +
                '                            <li class="inline-list__li"><input  placeholder="输入" class="textStys"></li>' +
                '                            <li class="inline-list__li"><input  placeholder="输入" class="textStys"></li>' +
                '							 <li class="inline-list__li"><img class="modal-title__img" onclick="$(this).parent().parent().parent().remove();" src="systemManager/images/modal4.png"/></li>'+
                '                        </ul>' +
                '                    </dd>');
        }
        function update() {
            var $id=$('#ToUpdateId').val();
            var $size= $('#update-params').children("dd").length;//参数的个数
            var paramsArray=[];
            for (var i = 0; i <$size ; i++) {
                var $param_index= $('#update-params').find("dd:eq("+i+")").find("input:eq(0)").val();
                var $param_name= $('#update-params').find("dd:eq("+i+")").find("input:eq(1)").val();
                var $param_notnull= $('#update-params').find("dd:eq("+i+")").find("select:eq(0)").val();
                var $param_type= $('#update-params').find("dd:eq("+i+")").find("input:eq(2)").val();
                var $param_explanation= $('#update-params').find("dd:eq("+i+")").find("input:eq(3)").val();
                var param={"index":$param_index,"name":$param_name,"not_null":$param_notnull,"type":$param_type,"explanation":$param_explanation};
                paramsArray.push(param);
            }
            var $name=$('#updatename').val();
            var $address=$('#updateaddress').val();
            var $method=$('#updatemethod').val();
            var $statues=$('#statues_select option:selected').val();
            var $returnformat=$('#updatereturn').val();
            var $updatedemocode=$('#updatedemocode').val();

            var judgeparam_index=false;
            var judgeparam_name=false;
            var judgeparam_type=false;
            for (var i = 0; i <$size ; i++) {
                if($('#update-params').find("dd:eq("+i+")").find("input:eq(0)").val()==""||$('#update-params').find("dd:eq("+i+")").find("input:eq(0)").val()==null){
                    judgeparam_index=true;break;}}
            for (var i = 0; i <$size ; i++) {
                if($('#update-params').find("dd:eq("+i+")").find("input:eq(1)").val()==""||$('#update-params').find("dd:eq("+i+")").find("input:eq(1)").val()==null){
                    judgeparam_name=true;break;}}
            for (var i = 0; i <$size ; i++) {
                if($('#update-params').find("dd:eq("+i+")").find("input:eq(2)").val()==""||$('#update-params').find("dd:eq("+i+")").find("input:eq(2)").val()==null){
                    judgeparam_type=true;break;}}
            if ($name == "" || $name == null) {
                alert("接口名称不能为空")
            }else if($address == "" || $address == null){
                alert("请求地址不能为空")
            }else if(judgeparam_index==true){
                alert("参数序号不能为空")
            }else if (judgeparam_name==true){
                alert("参数名称不能为空")
            } else if(judgeparam_type==true){
                alert("参数类型不能为空")
            }else if($returnformat==""||$returnformat==null){
                alert("返回格式不能为空")
            } else{
                $.ajax({
                    type: "post",
                    url: 'datainterfaceManager/updateInterface',
                    dataType: 'json',
                    data:{
                        dataInterfaceId:$id,
                        name: $name,
                        address:$address,
                        method: $method,
                        statues:$statues,
                        return_demonstration: $returnformat,
                        codeDemo: $updatedemocode,
                        params:JSON.stringify(paramsArray)
                    },
                    success: function (data) {
                        $('#m4').hide();
                        InterfaceList("");
                    },
                    error: function (data) {
                        alert("修改失败");
                    }
                });
            }
        }
        function search() {
            var $interfacename = $('#search').val();
            InterfaceList($interfacename);
        }
    </script>
</head>
<body>
<input id="TodelId" type="text" style="display: none"><%--用于暂存要删除的接口的id--%>
<input id="ToUpdateId" style="display: none"><%--用于暂存要修改的接口的id--%>
<div class="f-content p3-1">
    <div class="f-top">
        <div class="f-title"><span>数据接口管理&nbsp;/&nbsp;</span>接口管理</div>
        <div class="search-box">
            <div class="fz-left m1_ctrl" onclick="addshow()">
                <img src="systemManager/images/p2-1-icon4.png">
                <span>新增</span>
            </div>
            <div class="fz-right">
                <img src="systemManager/images/p2-1-icon5.png">
                <input id="search" placeholder="接口名称/请求方式/状态"/>
                <button onclick=search()>搜索</button>
            </div>
        </div>
    </div>
    <div class="f-bott">
        <div class="inner-title">接口列表</div>
        <div class="f-inner">
            <dl id="dl1" style="justify-content:flex-start;">
            </dl>
        </div>
    </div>
</div>

<div id="m1" class="mmodal">
    <div class="modal-form">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal2.png"/>
            <span class="modal-title__span">新增</span>
            <img class="modal-title__cancel js-cancel" src="systemManager/images/modal4.png"/>
        </div>
        <div id="scroll_m1" style="overflow: hidden;height: 450px;position: relative;" class="scrollBox">
                <div >
                    <form class="modal-content">
                        <div class="modal-inputset">
                            <label class="modal-label  modal-label--strong">接口名称</label>
                            <input class="modal-inputset__input" id="addname" required/>
                        </div>
                        <div class="modal-inputset">
                            <label class="modal-label  modal-label--strong">请求地址</label>
                            <input class="modal-inputset__input" id="addaddress" required/>
                        </div>
                        <div class="modal-inputset">
                            <label class="modal-label  modal-label--strong">请求方式</label>
                            <select class="modal-inputset__input" id="addmethod">
                                <option value="post" >post</option>
                                <option value="get">get</option>
                            </select>
                        </div>
                        <div class="modal-info" id="addparams-div">
                            <span class="modal-label modal-label--strong">请求参数</span>
                            <img class="modal-title__img" onclick="addparams()" src="systemManager/images/modal2.png"/>
                            <dl class="modal-list" id="add-params">
                            </dl>
                        </div>
                        <div class="modal-inputset">
                            <label class="modal-label  modal-label--strong">返回格式</label>
                            <input class="modal-inputset__input" id="addreturn"/>
                        </div>
                        <div class="modal-txt">
                            <label class="modal-label modal-label--top  modal-label--strong">返回示例</label>
                            <textarea class="modal-txt__textarea" id="adddemocode"></textarea>
                        </div>
                    </form>
                    <div class="modal-buttons">
                        <div class="modal-btns__btn modal-btns__btn--cancel js-cancel" >取消</div>
                        <div class="modal-btns__btn modal-btns__btn--primary" onclick="add()" >确定</div>
                    </div>
            </div>
        </div>
    </div>
</div>


<div id="m2" class="mmodal">

    <div class="modal-form">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal3.png"/>
            <span class="modal-title__span">接口示例</span>
            <img onclick="javascript:$('#m2').hide()" class="modal-title__cancel js-cancel" src="systemManager/images/modal4.png"/>
        </div>
        <div id="scroll" style="overflow: hidden;height: 450px;position: relative;" class="scrollBox">
            <div>
                <div class="modal-content" id="interface-content">
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">接口名称:</span>
                        <span class="modal-info__span"
                              title="zsjjdbc:mysql://10.1.93.215:3306/flzsjjdbc:mysql://10.1.93.215:3306/flzsj">名称</span>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">请求方式:</span>
                        <span class="modal-info__span">jdbc:mysql://10.1.93.215:3306/flzsj</span>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">请求参数说明</span>
                        <dl class="modal-list" id="params-content">
                        </dl>
                    </div>
                    <div class="modal-info">
                        <span class="modal-label modal-label--strong">返回示例</span>
                        <div class="modal-info__div">
                            <code class="code">
                            </code>
                        </div>
                    </div>
                </div>
                <div class="modal-buttons">
                    <div class="modal-btns__btn modal-btns__btn--primary js-cancel"
                         onclick="javascript:$('#m2').hide()">关闭
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div id="m3" class="mmodal">
    <div class="modal-pop">
        <div class="modal-title">
            <img class="modal-title__img" src="systemManager/images/modal1.png"/>
            <span class="modal-title__span">提示</span>
        </div>
        <div class="modal-content">
            <div class="modal-content__text">确认删除?</div>
        </div>
        <div class="modal-buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="confrimdel()">确定</div>
        </div>
    </div>
</div>
<div id="m4" class="mmodal">
    <div class="modal-form">
        <div class="modal-title">
<%--            <img class="modal-title__img" src="../images/modal2.png"/>--%>
            <span class="modal-title__span">修改</span>
            <img class="modal-title__cancel js-cancel" src="systemManager/images/modal4.png"/>
        </div>
        <div id="scroll_m4" style="overflow: hidden;height: 450px;position: relative;" class="scrollBox">
            <div>
            <form class="modal-content" id="update-form">

            </form>
            <div class="modal-buttons">
                <div class="modal-btns__btn modal-btns__btn--cancel js-cancel" >取消</div>
                <div class="modal-btns__btn modal-btns__btn--primary" onclick="update()">修改</div>
            </div>
            </div>
        </div>
    </div>
</div>


</body>
<script >
    $(function() {
        $("#scroll").perfectScrollbar();
        $("#scroll_m1").perfectScrollbar();
        $("#scroll_m4").perfectScrollbar();
        $(".js-cancel").click(function(){
            $(this).parents(".mmodal").hide();
        })
    })
</script>
</html>
