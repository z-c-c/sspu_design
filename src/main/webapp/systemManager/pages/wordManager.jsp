<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>div</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../systemManager/css/page.css">
    <link rel="stylesheet" href="../../systemManager/css/jquery.mloading.css">
    <script type="text/javascript" src="../../systemManager/js/jquery.min.js"></script>
    <script type="text/javascript" src="../..//systemManager/js/jquery.mloading.js"></script>
    <script type="text/javascript" src="../../systemManager/js/pop.js"></script>
    <style type="text/css">
        .drop-down-load:after{
            display: inline;
            content: "下拉加载更多";
        }
        .drop-down-load.no-more:after{
            content: "所有数据加载完毕";
        }
        input::-webkit-input-placeholder { /* WebKit browsers */
            opacity:0.5;

        }
    </style>
    <script type="text/javascript">
        var timer2 = null;
        var page=1;
        var maxPages=0;
        $(function () {

            // getWordList();
            // isNeedCutWord();
            $(".js-cancel").click(function(){
                $(this).parents(".mmodal").hide();
            });
            //初始化分页
            $(window).scroll(function(e) {
                var wH = $(window).height();
                var wT = $(window).scrollTop();
                var bH = $(".f-content").height();
                clearTimeout(timer2);
                timer2 = setTimeout(function() {

                    if(Math.abs(bH-wH-wT) <= 100){//下滚(若修改页面元素高度则需调整此判断)
                        page++;
                        $.ajax({
                            type: "POST",
                            url: "wordManager/searchWordList",
                            dataType:'json',
                            data: {
                                wordType: $("#wordType").val(),
                                content: $("#content").val(),
                                pageNumber: page,
                                pageSize: 10,
                            },
                            success: function(data){
                                if (data.message=='success'){
                                    var resultList = data.resultList.content;
                                    var str='';
                                    for (var i=0;i<resultList.length;i++){
                                        str +='<dd>\n' +
                                            '                        <ul>\n' +
                                            '                            <li style="width: 30%">'+resultList[i].content+'</li>\n' +
                                            '                            <li style="width: 30%">暂无</li>\n' +
                                            '                            <li style="width: 30%">'+getWordType(resultList[i].wordType)+'</li>\n' +
                                            '                            <li style="width: 10%"><a style="color: red" onclick="delWord('+resultList[i].id+')" id="'+resultList[i].id+'">删&nbsp;除</a></li>\n' +
                                            '                        </ul>\n' +
                                            '                    </dd>'
                                    }
                                    $("#tbody").append(str)
                                }
                            }


                        });
                        if(page >= maxPages){//检测没有下一页数据
                            $(".drop-down-load").addClass("no-more");//改变底部提示文字
                        }else{
                            $(".drop-down-load").removeClass("no-more");
                        }
                    }
                },800);
            });
        });
        //删除
        function delWord(id) {
            mmodalConfirm("success","提示","是否删除",function (e) {
                if (e){
                    $.ajax({
                        type: "POST",
                        url: "wordManager/delWord",
                        dataType:'json',
                        data: {
                            ids: id,
                        },
                        success: function(data){
                            if (data.message=='success') {
                                getWordList($("#wordType").val());
                                isNeedCutWord();
                            }
                        }
                    });
                }
            })

        }
        //保存
        function saveWord() {
            $('body').mLoading("show");
            // $("#buttons").hide();
            // $("#saveloading").show();
            var addType=$("#addType").val();
            if (addType=='sd'){
                var wordType = $("#type").val();
                var wordContent= $("#wordContent").val();
                if (!wordContent){
                    $("#warning").text("请填写内容！");
                    $("#warning").show();
                    $('body').mLoading("hide");
                } else {
                    $.ajax({
                        type: "POST",
                        url: "wordManager/checkWord",
                        dataType:'json',
                        data: {
                            wordType: wordType,
                            words: wordContent,
                        },
                        success: function (data) {
                            if (data.message=='success'){
                                if (data.isrepeat=='true'){
                                    $("#warning").text("词库中已存在！");
                                    $("#warning").show();
                                    $('body').mLoading("hide");
                                } else {
                                    $.ajax({
                                        type: "POST",
                                        url: "wordManager/addWord",
                                        dataType:'json',
                                        data: {
                                            wordType: wordType,
                                            words: wordContent,
                                        },
                                        success: function (data) {
                                            if (data.message=='success'){
                                                $(".mmodal").hide();
                                                mmodalAlert('success','提示','保存成功');
                                                getWordList($("#wordType").val());
                                                isNeedCutWord()
                                            }
                                            $('body').mLoading("hide");
                                        }

                                    });
                                }
                            }
                        }
                    });

                }
            } else {
                // var file = $("#file").val();
                // if (file.indexOf(".dic")==-1){}
                var form = new FormData(document.getElementById("actionForm"));
                $.ajax({
                    url:"wordManager/upload",
                    type:"post",
                    data:form,
                    processData:false,
                    contentType:false,
                    success:function(data){
                        if (data='success'){
                            $(".mmodal").hide();
                            getWordList($("#wordType").val());
                            isNeedCutWord()
                        } else {
                            $("#filewarning").show();
                        }
                        $('body').mLoading("hide");

                    }
                });
            }

        }
        //获取词库列表
        function getWordList(wordType) {
            $('body').mLoading("show");
            $("#tbody").html("");
            if (wordType){
                $("#wordType").val(wordType)
            }else {
                $("#wordType").val("")
            }
            $.ajax({
                type: "POST",
                url: "wordManager/searchWordList",
               dataType:'json',
                data: {
                    wordType: $("#wordType").val(),
                    content: $("#content").val(),
                    pageNumber: 1,
                    pageSize: 10,
                },
                success: function (data) {
                    if (data.message=='success'){
                        var resultList = data.resultList.content;
                        var str='';
                        $("#totle").text("("+data.resultList.totalElements+"条)")
                        maxPages= data.resultList.totalPages;
                        for (var i=0;i<resultList.length;i++){
                            str +='<dd>\n' +
                                '                        <ul>\n' +
                                '                            <li style="width: 30%">'+resultList[i].content+'</li>\n' +
                                '                            <li style="width: 30%">暂无</li>\n' +
                                '                            <li style="width: 30%">'+getWordType(resultList[i].wordType)+'</li>\n' +
                                '                            <li style="width: 10%"><a style="color: red" onclick="delWord('+resultList[i].id+')" id="'+resultList[i].id+'">删&nbsp;除</a></li>\n' +
                                '                        </ul>\n' +
                                '                    </dd>'
                        }
                        $("#tbody").html(str)
                        if(page >= maxPages){//检测没有下一页数据
                            $(".drop-down-load").addClass("no-more");//改变底部提示文字
                        }else{
                            $(".drop-down-load").removeClass("no-more");
                        }
                        $('body').mLoading("hide");
                    }
                    console.log(data)
                }
            });
        }
        //返回词库类型中文
        function getWordType(type) {
            if (type=='stopword')return '停用词库';
            if (type=='extword')return '自定义词库';
            if (type=='baseword')return '基础词库';
        }
        //显示添加窗口
        function addWord() {
            $("#wordContent").val("");
            $("#file").val("");
            $("#m1").show();
            $("#warning").hide();
            // $("#buttons").show();
            // $("#saveloading").hide();
        }
        //批量添加或手动添加
        function changeType(e) {
            if ($(e).val()=='pl'){
                $("#wordContentdiv").hide()
                $("#fileDiv").show()
            }else{
                $("#wordContentdiv").show()
                $("#fileDiv").hide()
            }
        }
        function isNeedCutWord() {
            $.ajax({
                type: "POST",
                url: "wordManager/isNeedCutWord",
                dataType:'json',
                success: function (data) {
                    console.log(data.resultList)
                    if (data.message='success'){
                        if (data.resultList){
                            $("#isneedcutword").show();
                        }else {
                            $("#isneedcutword").hide();
                        }
                    }
                }
            });
        }
    </script>
</head>
<body>

<input type="hidden" id="wordType">
<div class="f-content p2-2">
    <div class="f-top">
        <div class="f-title"><span>知识库管理&nbsp;/&nbsp;</span>词库管理</div>
        <div class="search-box">
            <div class="fz-left" onclick="addWord()">
                <img src="../../systemManager/images/p2-1-icon4.png">
                <span>新增</span>
            </div>
            <div class="fz-right">
                <img src="../../systemManager/images/p2-1-icon5.png">
                <input id="content" placeholder="请输入内容进行搜索"/>
                <button onclick="getWordList()">搜索</button>
            </div>
        </div>
        <p id="isneedcutword" style="color: red;text-align: center;margin-top: 16px;display: none">词库已被修改，请重新生成标签</p>
        <ul class="nav-box">
            <li onclick="getWordList()" class="clicked">全部</li>
            <li onclick="getWordList('stopword')">停用词库</li>
            <li onclick="getWordList('extword')">自定义词库</li>
            <li onclick="getWordList('baseword')">基础词库</li>
            <%--<li>更多标签</li>--%>
        </ul>
    </div>
    <div class="f-bott">
        <div class="inner-title">搜索结果<span id="totle" style="color: #479bfd;">(0条)</span></div>
        <div class="dl-box">
            <dl>
                <dt>
                    <ul>
                        <li style="width: 10%">
                            <label>
                                <input type="checkbox"/>
                            </label>
                        </li>
                        <li style="width: 20%">标签名称</li>
                        <li style="width: 20%">标签颜色</li>
                        <li style="width: 20%">标签描述</li>
                        <li style="width: 20%">标注对象</li>
                        <li style="width: 10%">操作</li>
                    </ul>
                </dt>
                <div id="tbody">
                        <dd>
                            <ul>
                                <li style="width: 10%">
                                    <label>
                                        <input type="checkbox"/>
                                    </label>
                                </li>
                                <li style="width: 20%">标签1</li>
                                <li style="width: 20%"><span style="background-color: red">&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
                                <li style="width: 20%">描述</li>
                                <li style="width: 20%">对象</li>
                                <li style="width: 10%"><a style="color: red">删&nbsp;除</a></li>
                            </ul>
                        </dd>
                </div>

            </dl>
        </div>
    </div>
</div>
<div id="m1" class="mmodal">
    <div class="modal-form">
        <div class="modal-title">
            <img class="modal-title__img" src="../../systemManager/images/modal2.png" />
            <span class="modal-title__span">新增</span>
            <img onclick="javascript:$('#ml').hide()" class="modal-title__cancel js-cancel" src="../../systemManager/images/modal4.png" />
        </div>
        <form class="modal-content" id="actionForm">
            <div class="modal-inputset">
                <label class="modal-label">词库</label>
                <select id="type" name="type" class="modal-inputset__input" style="margin-left: 28px">
                    <option value="stopword">停用词库</option>
                    <option value="extword">自定义词库</option>
                    <option value="baseword">基础词库</option>
                </select>
            </div>
            <div class="modal-inputset">
                <label class="modal-label">添加方式</label>
                <select onchange="changeType(this)" id="addType" class="modal-inputset__input" style="margin-left: 0px">
                    <option value="sd">手动添加</option>
                    <option value="pl">批量添加</option>
                </select>
            </div>
            <div class="modal-inputset" id="wordContentdiv">
                <label class="modal-label" style="display: block;">内容</label>
                <textarea id="wordContent" class="modal-inputset__input" style="margin-top: -21px;margin-left: 75px;height: 100px;"></textarea>
                <p id="warning" style="text-align: center;color: red">请填写内容！</p>
            </div>
            <div class="modal-inputset" id="fileDiv" style="display: none">
                <label class="modal-label">上传文件</label>
                <input id="file" name="file" type="file" class="modal-inputset__input" style="margin-left: 0px" />
                <p id="filewarning" style="text-align: center;color: red;display: none">添加失败！</p>
            </div>

        </form>
        <%--<p id="saveloading" style="color: red;text-align: center;margin-bottom: 15px;display: none">正在导入。。。</p>--%>
        <div class="modal-buttons" id="buttons">
            <div class="modal-btns__btn modal-btns__btn--cancel js-cancel">取消</div>
            <div class="modal-btns__btn modal-btns__btn--primary" onclick="saveWord()">保存</div>
        </div>
    </div>
</div>
<div id="jiafeng" class="drop-down-load">
    <div class="loading">
        <i></i><i></i><i></i><i></i>
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
<script>
    $(function(){
        $(".nav-box li").click(function(){
            $(this).addClass("clicked").siblings().removeClass("clicked");
        })
    })
</script>
</html>