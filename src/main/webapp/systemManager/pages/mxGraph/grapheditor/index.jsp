<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=5,IE=9" ><![endif]-->
<!DOCTYPE html>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <title>div</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="systemManager/pages/mxGraph/grapheditor/styles/grapheditor.css">
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Init.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/deflate/pako.min.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/deflate/base64.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/jscolor/jscolor.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/sanitizer/sanitizer.min.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/mxClient.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/EditorUi.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Editor.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Sidebar.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Graph.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Format.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Shapes.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Actions.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Menus.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Toolbar.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/Dialogs.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/jquery.min.js"></script>
    <script type="text/javascript" src="systemManager/pages/mxGraph/grapheditor/js/getParameter.js"></script>
    <style type="text/css">
        .saveBtn {
            width: 60px;
            height: 30px;
            background-image: linear-gradient(90deg,
            #479cfd 0%,
            #3f92f5 50%,
            #2a79e0 100%);
            box-shadow: 0px 2px 7px 0px rgba(23, 75, 115, 0.26);
            border-radius: 20px;
            font-size: 15px;
            letter-spacing: 2px;
            color: #ffffff;
            border: none;
            position: absolute;
            top: 0;
            right: 15px;
            cursor: pointer;
        }

        .mxPopupMenu {
            background-color: #fff;
        }
    </style>
    <script>
        function saveBtn() {
            var ontologyName = $("#ontologyName").val();
            if (ontologyName == null || ontologyName == undefined || ontologyName == "") {
                alert("请输入本体名称");
                return false;
            }
            var ontologyType = $("#ontologyType").val();
            if (ontologyType == null || ontologyType == undefined || ontologyType == "") {
                alert("请输入本体类型");
                return false;
            }
            //获取mxgraph拓扑图数据
            var enc1 = new mxCodec(mxUtils.createXmlDocument());
            var node1 = enc1.encode(graph.getModel());
            var xml1 = mxUtils.getXml(node1);
            // console.log("enc1" + enc1);
            // console.log("node1"+ node1);
            // console.log("xml1" + xml1);
            var id = $("#ontologyId").val();
            <%--var url = '<%=basePath%>baseInfo/ontologyData';--%>
            $.ajax({
                type: 'get',
                url: '<%=basePath%>ontology/createOntologyData',
                dataType: 'json',
                // data: "xml="+urlEncode(xmlstr),
                //encodeURIComponent
                // data: {xmlStr: encodeURIComponent(xml1)},
                data: {
                    'data': xml1,
                    "id": id,
                    "ontologyName": ontologyName,
                    "ontologyType": ontologyType
                },
                // data: {xmlStr: xml1},
                success: function (res) {
                    //请求成功后回传函数
                    if (res.code == 200) {
                        alert("创建成功");
                    } else {
                        alert(res.messgae);
                    }
                }
            });

        }
    </script>
</head>
<body <%--class="geEditor"--%>>
<div style="top: 0px; left: 0px; right: 0px; height: 30px;background-color: #fbfbfb;
    overflow: hidden;
    position: absolute;
    cursor: default;">
    <span style="font-size: 13px;color: #000;bottom:0;padding-left: 15px;">本体名称：</span><input id="ontologyName"
                                                                                              style="left: 100px;border: solid 1px #d9d9d9;height: 25px"
                                                                                              value=""/>
    <span style="font-size: 13px;color: #000;bottom:0">本体类型：</span><input id="ontologyType"
                                                                          style="border: solid 1px #d9d9d9;height: 25px"
                                                                          value=""
                                                                          onkeyup="this.value=this.value.replace(/[^\w_]/g,'');"/>
    <input id="ontologyId" hidden value=""/>
    <button class="saveBtn" onclick="saveBtn()" style="right:100px;">提交</button>
    <button class="saveBtn" onclick="saveBtn()" <%--style="background-image: linear-gradient(90deg,
            #c6c6c6 0%,
            #696969 50%,
            #666666 100%);"--%>>取消
    </button>
</div>
<div class="geEditor">
    <script type="text/javascript">
        var graph;
        /*Object.assign(mxEvent, {
            EDGE_START_MOVE: 'edgeStartMove',
            VERTEX_START_MOVE: 'vertexStartMove',
        });*/

        function importModelXML(xmlTxt) {
            graph.getModel().beginUpdate();
            try {
                var doc = mxUtils.parseXml(xmlTxt);
                var root = doc.documentElement;
                var dec = new mxCodec(root.ownerDocument);
                dec.decode(root, graph.getModel());
            } finally {
                graph.getModel().endUpdate();
            }
            this.restoreModel();
        }

        function restoreModel() {
            Object.values(graph.getModel().cells).forEach(function (cell) {
                if (cell.vertex && cell.data) {
                    cell.data = JSON.parse(cell.data);
                }
            });
        }

        $(function () {
            var ontologyId = getParameter("id");
            if (ontologyId != null && ontologyId != undefined && ontologyId != "") {
                $.ajax({
                    type: 'POST',
                    url: '<%=basePath%>ontology/getOnlotogyById/' + ontologyId,
                    dataType: 'json',
                    data: {
                        "ontologyId": ontologyId
                    },
                    success: function (res) {
                        //请求成功后回传函数
                        if (res.code == 200) {
                            if (res.data == "") {
                                window.location = "systemManager/pages/ontologyManager";
                            } else {
                                var xmlString = res.data.content;
                                var domainName = res.data.domainName;
                                var domainType = res.data.domainType;
                                $("#ontologyName").val(domainName);
                                $("#ontologyType").val(domainType);
                                importModelXML(xmlString);
                            }
                        } else {
                            alert(res.message);
                            window.location = "systemManager/pages/ontologyManager";
                        }
                    }
                })
            }

        });

        (function () {
            var editorUiInit = EditorUi.prototype.init;

            EditorUi.prototype.init = function () {
                editorUiInit.apply(this, arguments);
                this.actions.get('export').setEnabled(false);

                // 是否是直接打开xml
                if (!Editor.useLocalStorage) {
                    mxUtils.post(OPEN_URL, '', mxUtils.bind(this, function (req) {
                        var enabled = req.getStatus() != 404;
                        this.actions.get('open').setEnabled(enabled || Graph.fileSupport);
                        this.actions.get('import').setEnabled(enabled || Graph.fileSupport);
                        this.actions.get('save').setEnabled(enabled);
                        this.actions.get('saveAs').setEnabled(enabled);
                        this.actions.get('export').setEnabled(enabled);
                    }));
                }
                graph = this.editor.graph;
            };

            // Adds required resources (disables loading of fallback properties, this can only
            // be used if we know that all keys are defined in the language specific file)
            mxResources.loadDefaultBundle = false;
            var bundle = mxResources.getDefaultBundle(RESOURCE_BASE, mxLanguage) ||
                mxResources.getSpecialBundle(RESOURCE_BASE, mxLanguage);

            // Fixes possible asynchronous requests
            mxUtils.getAll([bundle, STYLE_PATH + '/default.xml'], function (xhr) {
                // Adds bundle text to resources
                mxResources.parse(xhr[0].getText());

                // Configures the default graph theme
                var themes = new Object();
                themes[Graph.prototype.defaultThemeName] = xhr[1].getDocumentElement();

                // Main
                new EditorUi(new Editor(urlParams['chrome'] == '0', themes));
            }, function () {
                document.body.innerHTML = '<center style="margin-top:10%;">加载资源文件时出错,请检查环境</center>';
            });

            $('g').dblclick(function (e) {
                e.stopPropagation();
                e.preventDefault();
                return false;
            });

            $('div.geDiagramContainer.geDiagramBackdrop').dblclick(function (e) {
                e.stopPropagation();
                e.preventDefault();
                return false;
            });
        })();


    </script>
</div>
</body>
</html>
