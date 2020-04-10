<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2020/1/19
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>

    <%@include file="../common/w_include_header.jsp" %>
    <link rel="stylesheet" href="../css/reset_0119.css">
    <link rel="stylesheet" href="../css/style_0119.css">
    <link rel="stylesheet" href="../css/ol.css">

    <script type="text/javascript" src="../js/echarts.min.js"></script>
    <script type="text/javascript" src="../js/scroll.js"></script>
    <script type="text/javascript" src="../js/ol.js"></script>
    <script type="text/javascript" src="../common/w_common_method.js"></script>
    <script type="text/javascript" src="../js/warningUtil.js"></script>
    <!-- <script type="text/javascript" src="../js/scroll.js"></script> -->
    <style>
        .backG {
            background: url('../images/noImage.png') no-repeat bottom center;
        }
    </style>
</head>
<body>
<div class="neofx">

    <div class="neofx-bg" id="map">
        <div class="neofx-bg-out" id="fly" style="z-index: 100">
            <div class="neofx-bg-fly js-fly" id="js-fly">
                <div class="sub-tit">
                    <h4 id="title"></h4>
                    <i class="mapclose1">×</i>
                </div>
                <div class="warningMess">
                    <div class="warningMessBox">
                        <div class="view">
                        </div>
                    </div>
                </div>
                <div style="text-align: center;" id="pagiDiv">
                    <div id="pagi" class="y-pagi">
                        <div id="pagi_left" class="pagi_left pagi-arrow">&lt;</div>
                        <div class="pagi-item js-cur">1</div>
                        <div class="pagi-item">2</div>
                        <div class="pagi-item">3</div>
                        <div class="pagi-item">4</div>
                        <div class="pagi-item">5</div>
                        <div class="pagi-item">6</div>
                        <div id="pagi_right" class="pagi_right pagi-arrow">&gt;</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="neofx-btns js-left">
        <div class="neofx-tab-stuff" onclick="getEvent(true,1)">
            <i class="sty4"></i>
            <b>事件分布</b>
        </div>
        <div class="neofx-tab-stuff" onclick="getWarning(true,1)">
            <i class="sty5"></i>
            <b>预警分布</b>
        </div>
    </div>
    <div class="fxdc-center" style="z-index: 100">
        <div>
            <div id="popup" style="display:block;z-index: 3000;height: 235px;width:416px;left:-200px;top: -255px"
                 class="ditu-popup2">
                <a href="#" id="popup-closer" class="mapclose" style="float: right">×</a>
                <div id="popup-content" class="popup-content"></div>
            </div>
        </div>
    </div>
</div>
<input id="total" type="hidden">
<input id="searchType" type="hidden">
</body>

<script>
    function closeJD() {
        $("#fly1").hide();
    }


    function getAllEvent() {
        $.ajax({
            type: 'post',
            url: '/eventInfo/findAll',
            dataType: 'json',
            success: function (result) {
                addpoints(result.data, 'event');
            }
        });
    }

    function getAllWarning() {
        $.ajax({
            type: 'post',
            url: '/warnings/findAll',
            dataType: 'json',
            data: {
                page: 1,
                pageSize: 5
            },
            success: function (result) {
                var formatData = [];
                for (let i = 0; i < result.data.length; i++) {
                    if ((result.data[i].noticeLongi != null && result.data[i].noticeLongi != '') && (result.data[i].noticeLati != null && result.data[i].noticeLati != '')) {
                        formatData.push(result.data[i]);
                    }
                }
                console.log(formatData)
                addpoints(formatData, 'warning');
            }
        });
    }

    function getEvent(flag, page) {
        $("#title").text("事件列表")
        $("#searchType").val('event');
        $("#fly").show();
        var data = {};
        data.page = page;
        data.pageSize = 5;
        $.ajax({
            type: "post",
            url: "/eventInfo/findByParam",
            dataType: "json",
            data: data,
            success: function (result) {

                if (flag) {
                    getAllEvent();
                    $("#pagi").empty();
                    if (result.data.count <= 5) {
                        $("#total").val(1);
                        $("#pagi").append('<div id="pagi_left" class="pagi_left pagi-arrow">&lt;</div>\n' +
                            '                    <div class="pagi-item js-cur">1</div>\n' +
                            '                    <div id="pagi_right" class="pagi_right pagi-arrow">&gt;</div>')
                    } else {
                        let pages = parseInt(result.data.count % 5 != 0 ? result.data.count / 5 + 1 : result.data.count / 5);
                        $("#total").val(pages);
                        $("#pagi").append('<div id="pagi_left" class="pagi_left pagi-arrow">&lt;</div>')
                        pages = pages > 6 ? 6 : pages;
                        for (let i = 0; i < pages; i++) {
                            if (i == 0) {
                                $("#pagi").append('<div class="pagi-item js-cur">' + (i + 1) + '</div>');
                            } else {
                                $("#pagi").append('<div class="pagi-item">' + (i + 1) + '</div>');
                            }

                        }
                        $("#pagi").append('<div id="pagi_right" class="pagi_right pagi-arrow">&gt;</div>')
                    }
                    ypagi("#pagi", $("#total").val());
                }

                $(".view").empty();
                for (var i = 0; i < result.data.events.length; i++) {
                    var date = new Date(result.data.events[i].occurredTime).format("yyyy-MM-dd hh:mm:ss");
                    if (result.data.events[i].occurredTime == null) {
                        date = "无";
                    }
                    var str = '';
                    str = '<dl>\n' +
                        '                    <dt>\n' +
                        '                    <a>' + judgeNull(result.data.events[i].eventName) + '</a>\n' +
                        '                    <div class="icon">\n' +
                        '                        <i class="warning1"</i>\n' +
                        '                        </div>\n' +
                        '                        </dt>\n' +
                        '                        <dd class="time">' + date + '</dd>\n' +
                        '                        <dd>\n' +
                        '                        </div>\n' +
                        '                        </dd>\n' +
                        '                        </dl>';
                    $(".view").append(str);
                }


                $("#fly").show();
                $("#js-fly").show();


                if ($(".neofx-bg-fly").height() <= 523) {
                    $(".neofx-bg-fly").height($(".sub-tit").height() + $(".warningMess").height() + $(".y-pagi").height() + 20)
                }
            }
        })
    };

    function getWarning(flag, page) {
        $("#title").text("预警列表")
        $("#searchType").val('warning');
        $("#fly").show();
        var data = {};
        data.page = page;
        data.pageSize = 5;
        $.ajax({
            type: 'post',
            url: '/warnings/find',
            dataType: 'json',
            data: data,
            success: function (result) {
                if (flag) {
                    getAllWarning();
                    $("#pagi").empty();
                    if (result.data.total <= 5) {
                        $("#total").val(1);
                        $("#pagi").append('<div id="pagi_left" class="pagi_left pagi-arrow">&lt;</div>\n' +
                            '                    <div class="pagi-item js-cur">1</div>\n' +
                            '                    <div id="pagi_right" class="pagi_right pagi-arrow">&gt;</div>')
                    } else {
                        let pages = parseInt(result.data.total % 5 != 0 ? result.data.total / 5 + 1 : result.data.total / 5);
                        $("#total").val(pages);
                        $("#pagi").append('<div id="pagi_left" class="pagi_left pagi-arrow">&lt;</div>')
                        pages = pages > 6 ? 6 : pages;
                        for (let i = 0; i < pages; i++) {
                            if (i == 0) {
                                $("#pagi").append('<div class="pagi-item js-cur">' + (i + 1) + '</div>');
                            } else {
                                $("#pagi").append('<div class="pagi-item">' + (i + 1) + '</div>');
                            }

                        }
                        $("#pagi").append('<div id="pagi_right" class="pagi_right pagi-arrow">&gt;</div>')
                    }
                    ypagi("#pagi", $("#total").val());
                }

                $(".view").empty();
                for (var i = 0; i < result.data.data.length; i++) {
                    var date = new Date(result.data.data[i].noticeDate).format("yyyy-MM-dd hh:mm:ss");
                    if (result.data.data[i].noticeDate == null) {
                        date = "无";
                    }
                    var str = '';
                    str = '<dl>\n' +
                        '                    <dt>\n' +
                        '                    <a>' + judgeNull(result.data.data[i].noticeName) + '</a>\n' +
                        '                    <div class="icon">\n' +
                        '                        <i class="warning1"</i>\n' +
                        '                        </div>\n' +
                        '                        </dt>\n' +
                        '                        <dd class="time">' + date + '</dd>\n' +
                        '                        <dd>\n' +
                        '                        </div>\n' +
                        '                        </dd>\n' +
                        '                        </dl>';
                    $(".view").append(str);
                }


                $("#fly").show();
                $("#js-fly").show();


                if ($(".neofx-bg-fly").height() <= 523) {
                    $(".neofx-bg-fly").height($(".sub-tit").height() + $(".warningMess").height() + $(".y-pagi").height() + 20)
                }
            }
        })
    }

    var parserDate = function (date) {
        var t = Date.parse(date);
        if (!isNaN(t)) {
            return new Date(Date.parse(date.replace(/-/g, "/")));
        } else {
            return new Date();
        }
    };

    function topage(jsp) {
        window.location.href = "/wwpt/riskwarning/" + jsp;
    }

    $(function () {
    })
    var points = [];
    var overlay;
    var locationPointMarker;
    var locationPointMarkerPerson;
    var mapUrl = "t{0-6}.tianditu.gov.cn";

    function initMap() {

        $(".map").css("height", document.body.clientHeight);
        var projection = ol.proj.get('EPSG:4326');
        var projectionExtent = projection.getExtent();
        var size = ol.extent.getWidth(projectionExtent) / 256;
        var resolutions = new Array(20);
        var matrixIds = new Array(20);


        for (var z = 0; z <= 20; ++z) {
            resolutions[z] = size / Math.pow(2, z);
            matrixIds[z] = z;
        }

        var baseLayer = new ol.layer.Tile({
            name: "baseVec",
            source: new ol.source.WMTS({
                url: 'http://' + mapUrl + '/vec_c/wmts?tk=30812b5aef18377d83bc80ba6f257cf5',
                layer: 'vec',
                format: 'tiles',
                tileGrid: new ol.tilegrid.WMTS({
                    origin: ol.extent.getTopLeft(projectionExtent),
                    resolutions: resolutions,
                    matrixIds: matrixIds,
                }),
                matrixSet: "c",
                style: 'default'
            })
        });
        var baseVec = new ol.layer.Tile({
            name: "Vec",
            source: new ol.source.WMTS({
                url: 'http://' + mapUrl + '/cva_c/wmts?tk=30812b5aef18377d83bc80ba6f257cf5',
                layer: 'cva',
                format: 'tiles',
                tileGrid: new ol.tilegrid.WMTS({
                    origin: ol.extent.getTopLeft(projectionExtent),
                    resolutions: resolutions,
                    matrixIds: matrixIds,
                }),
                matrixSet: "c",
                style: 'default'
            })
        });

        var map = new ol.Map({
            logo: false,
            layers: [baseLayer, baseVec],
            target: 'map',
            view: new ol.View({
                center: [121.438319, 31.105656],
                projection: ol.proj.get("EPSG:4326"),
                zoom: 13,
                maxZoom: 18,
                minZoom: 10
            }),
            interactions: ol.interaction.defaults({
                doubleClickZoom: false
            }),
            loadTilesWhileAnimating: true
        });


        var container = document.getElementById("popup");
        var closer = document.getElementById("popup-closer");
        overlay = new ol.Overlay({
            element: container,
            positioning: 'center-center',
            autoPan: true,
            offset: [0, -10],
            autoPanAnimation: {
                duration: 250   //当Popup超出地图边界时，为了Popup全部可见，地图移动的速度.
            }
        });

        closer.onclick = function () {
            overlay.setPosition(undefined);
            closer.blur();
            return false;
        };
        map.addOverlay(overlay);
        return map;
    }

    var map = initMap();

    //设置地图中心点
    function setMapCenter(x, y) {
        var xy = [parseFloat(x), parseFloat(y)];
        map.getView().setCenter(xy);
    }


    function safeToStr(str) {
        if (str == null || str == undefined) {
            return "";
        } else {
            return str;
        }
    }

    var tag = '';

    //标签
    function getTags(objectId) {
        $.ajax({
            type: "POST",
            url: "/tagBaseInfo/findByObjectId",
            dataType: "json",
            async: false,
            data: {
                objectId: objectId
            },
            success: function (result) {
                var str = '';
                if (result.code === "success") {
                    var tags = result.data;
                    var tagCount = 4;
                    if (tags.length >= tagCount) {
                        tags.length = tagCount;
                    }
                    for (var i = 0; i < tags.length; i++) {
                        str += '<span style="background: ' + JSON.parse(tags[i].tagCssCode).color + '" class="green">' + tags[i].tagName + '</span>';
                    }
                }
                tag = str;

            }
        });
    }

    //地图撒点
    function addpoints(rows, type) {
        for (var i = 0; i < points.length; i++) {
            map.removeLayer(points[i])
        }
        var pointfeatures = new Array();

        if (type == 'event') {
            for (let i = 0; i < rows.length; i++) {
                getTags(rows[i].eventId);
                var x = rows[i].occurredLongti;
                var y = rows[i].occurredLati;
                var point = [parseFloat(x), parseFloat(y)];
                var data = {}

                if (rows[i].occurredTime == null) {
                    rows[i].occurredTime = "暂无"
                } else {
                    rows[i].occurredTime = new Date(rows[i].occurredTime).format('yyyy-MM-dd hh:mm:ss')
                }
                var locationPointfeature = new ol.Feature({
                    geometry: new ol.geom.Point(point),
                    name: safeToStr(rows[i].eventName),
                    occuredTime: rows[i].occurredTime,
                    occuredPlace: safeToStr(rows[i].occurredPlace),
                    eventContent: safeToStr(rows[i].eventContent),
                    tags: tag,
                    x: safeToStr(x),
                    y: safeToStr(y)
                });
                locationPointfeature.setStyle(new ol.style.Style({
                        fill: new ol.style.Fill({
                            color: 'rgba(255,255,255,0.2)'
                        }),
                        stroke: new ol.style.Stroke({
                            color: '#ffffff',
                            width: 2
                        }),
                        image: new ol.style.Icon({
                            src: '../images/location_pointR.png', // 设置Image对象
                            imgSize: [30, 40], // 及图标大小
                            anchor: [0.5, 1],
                        }),
                    })
                );
                setMapCenter(121.438319, 31.135656);
                pointfeatures.push(locationPointfeature);
            }
        } else {
            for (var i = 0; i < rows.length; i++) {
                var x = rows[i].noticeLongi;
                var y = rows[i].noticeLati;
                var point = [parseFloat(x), parseFloat(y)];
                var data = {}

                if (rows[i].noticeDate == null) {
                    rows[i].noticeDate = "暂无"
                } else {
                    rows[i].noticeDate = new Date(rows[i].noticeDate).format('yyyy-MM-dd hh:mm:ss')
                }
                var locationPointfeature;
                locationPointfeature = new ol.Feature({
                    geometry: new ol.geom.Point(point),
                    noticeAddr: rows[i].noticeAddr,
                    noticeContent: rows[i].noticeContent,
                    noticeId: rows[i].noticeId,
                    noticeDate: rows[i].noticeDate,
                    noticeName: rows[i].noticeName,
                    warningTags: rows[i].warningTags,
                    noticeLevel: rows[i].noticeLevel,
                    noticeObjectType: rows[i].noticeObjectType,
                    noticeObjectId: rows[i].noticeObjectId,
                    noticeObjectName: rows[i].noticeObjectName,
                    x: x,
                    y: y,
                });
                var noticeLevel = rows[i].noticeLevel
                var img = 'location_pointR.png';//默认
                if (noticeLevel == '4') {
                    img = 'yzpoint.png'
                } else if (noticeLevel == '3') {
                    img = 'zdpoint.png'
                } else if (noticeLevel == '2') {
                    img = 'ybpoint.png'
                } else {
                    img = 'ybpoint.png';
                }
                locationPointfeature.setStyle(new ol.style.Style({
                        fill: new ol.style.Fill({
                            color: 'rgba(255,255,255,0.2)'
                        }),
                        stroke: new ol.style.Stroke({
                            color: '#ffffff',
                            width: 2
                        }),
                        image: new ol.style.Icon({
                            src: '../images/' + img, // 设置Image对象
                            imgSize: [30, 40], // 及图标大小
                            anchor: [0.5, 1]
                        }),
                    })
                )
                setMapCenter(121.438319, 31.135656);
                pointfeatures.push(locationPointfeature);
            }
        }

        locationPointMarker = new ol.layer.Vector({
            source: new ol.source.Vector({
                features: pointfeatures
            })
        });
        points.push(locationPointMarker);
        map.addLayer(locationPointMarker);
        mapClick(type)
    }


    //地图点击
    function mapClick(type) {
        if (type == 'event') {
            map.on('click', function (e) {
                var pixel = map.getEventPixel(e.originalEvent);
                map.forEachFeatureAtPixel(pixel, function (feature, layer) {
                    var property = feature.getProperties();
                    var name = feature.get('name');
                    var occuredTime = feature.get('occuredTime');
                    var occuredPlace = feature.get('occurredPlace');
                    var eventContent = feature.get('eventContent');
                    var x = feature.get('x');
                    var y = feature.get('y');
                    var tags = feature.get('tags');
                    var coodinate = [];
                    coodinate[0] = x;
                    coodinate[1] = y;

                    if (occuredTime == null || occuredTime == "") {
                        occuredTime = '无'
                    }
                    $("#popup-content").empty();
                    var showStr = '<div class="ditu-popup2-arrow"></div>\n' +
                        '    <div class="ditu-popup2-line1" style="width: 348px;\n' +
                        '    overflow: hidden;\n' +
                        '    text-overflow: ellipsis;\n' +
                        '    white-space: nowrap;cursor: pointer"><img class="ditu-popup2-icon" src="../images/ditu-icon2.png" style="clear:both"/>' + name + '</div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '                                    <div class="labelBox" style="top: 0px;width: 348px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;height: 30px;">\n' + tags +
                        '                                    </div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon3.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class="ditu-popup2-line1-inner1" style="width: 80%;">事件名称:<span>' + judgeNull(name) + '</span></div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line2" style="height: auto;max-height: 50px">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon4.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class=\'ditu-popup2-line2-inner1\'>事件内容:</div>\n' +
                        '        <div class="ditu-popup2-line2-inner2" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + judgeNull(eventContent) + '\t</div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon5.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class=\'ditu-popup2-line1-inner\'>发生时间:<span>' + occuredTime + '</span></div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon1.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class=\'ditu-popup2-line1-inner\'>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点:<span>' + judgeNull(occuredPlace) + '</span></div>\n' +
                        '    </div>\n';

                    overlay.setPosition(coodinate);
                    map.addOverlay(overlay);
                    $("#popup-content").append(showStr);
                    // }
                });
            });
        } else {
            map.on('click', function (e) {
                var pixel = map.getEventPixel(e.originalEvent);
                map.forEachFeatureAtPixel(pixel, function (feature, layer) {
                    // var coodinate = e.coordinate;
                    var property = feature.getProperties();
                    var noticeAddr = feature.get('noticeAddr');
                    var noticeContent = feature.get('noticeContent');
                    if (!noticeContent || noticeContent == 'null') {
                        noticeContent = '无';
                    }
                    var noticeDate = feature.get('noticeDate');
                    var noticeId = feature.get('noticeId');
                    var noticeName = feature.get('noticeName');
                    var warningTags = feature.get('warningTags');
                    var noticeObjectType = feature.get('noticeObjectType');
                    var noticeObjectName = feature.get('noticeObjectName');
                    var noticeObjectId = feature.get('noticeObjectId');
                    var noticeLevel = feature.get('noticeLevel');
                    var x = feature.get('x');
                    var y = feature.get('y');
                    var coodinate = [];
                    coodinate[0] = x;
                    coodinate[1] = y;
                    var tags = feature.get('warningTags');
                    console.log(tags)
                    if (tags == null || tags == "") {
                        tags = [];
                    } else {
                        tags = JSON.parse(tags);
                    }
                    var tagStr = '';
                    var length = 4;
                    length = tags.length > 4 ? 4 : tags.length;
                    if (tags) {
                        for (var t = 0; t < tags.length; t++) {
                            tagStr += '<span name="' + tags[t].tagName + '" style="background: ' + tags[t].tagCssCode.color + '" class="green">' + tags[t].tagName + '</span>';
                        }
                    }
                    var showStr = '<div class="ditu-popup2-arrow"></div>\n' +
                        '    <div class="ditu-popup2-line1" style="width: 348px;\n' +
                        '    overflow: hidden;\n' +
                        '    text-overflow: ellipsis;\n' +
                        '    white-space: nowrap;cursor: pointer"><img class="ditu-popup2-icon" src="../images/ditu-icon2.png" style="clear:both"/>' + judgeNull(noticeName) + '</div>\n' +

                        '    <div class="ditu-popup2-line1">\n' +
                        '                                    <div class="labelBox" style="top: 0px;width: 348px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;height: 30px;">\n' + tagStr +
                        '                                    </div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon3.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class="ditu-popup2-line1-inner1">预警对象:<span>' + judgeNull(noticeObjectName) + '</span></div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line2" style="height: auto;max-height: 50px">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon4.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class=\'ditu-popup2-line2-inner1\'>预警内容:</div>\n' +
                        '        <div class="ditu-popup2-line2-inner2" style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">' + judgeNull(noticeContent) + '\t</div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon5.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class=\'ditu-popup2-line1-inner\'>预警时间:<span>' + noticeDate + '</span></div>\n' +
                        '    </div>\n' +
                        '    <div class="ditu-popup2-line1">\n' +
                        '        <img class="ditu-popup2-icon" src="../images/ditu-icon1.png" style="float: left;margin-right: 6px;"/>\n' +
                        '        <div class=\'ditu-popup2-line1-inner\'>预警地点:<span>' + judgeNull(noticeAddr) + '</span>' +
                        // '<a href="javascript:;" style="bottom: 0px" class="jumpBtn"  onclick="tomore(\'' + noticeId + '\')">关联事件</a></div>\n' +
                        '    </div>\n';

                    overlay.setPosition(coodinate);
                    map.addOverlay(overlay);
                    $("#popup-content").html(showStr);
                });
            });
        }

    }

    function todetail(id, type, objectId) {
        openNewWindow('warningDetail_cj.jsp?noticeId=' + id + "&&noticeObjectType=" + type + "&&noticeObjectId=" + objectId);
    }

    function tomore(id) {
        openNewWindow('warningEventsList.jsp?noticeId=' + id);
    }

    function todetail(id, type, objectId, noticeType) {
        if (noticeType == '自动') {
            openNewWindow('/wwpt/riskwarning/warningDetail.jsp?noticeId=' + id + "&&noticeObjectType=" + type + "&&noticeObjectId=" + objectId);

        } else {
            openNewWindow('/wwpt/riskwarning/warningDetail_cj.jsp?noticeId=' + id + "&&noticeObjectType=" + type + "&&noticeObjectId=" + objectId);

        }
    }

    function search(serchType, page) {
        if ('event' == serchType) {
            getEvent(false, page);
        }
        if ('warning' == serchType) {
            getWarning(false, page);
        }

    }
</script>
<script type="text/javascript">
    $(function () {
        $(".neofx-tab-stuff").hover(function () {
            $(this).find(".pop").fadeIn();
        }, function () {
            $(this).find(".pop").fadeOut();
        });

        $(".neofx-bg").click(function () {
            $(".neofx-tab-item .neofx-tab-down").fadeOut();
        })
        $(".mapclose1").click(function () {
            $(this).parents(".js-fly").fadeOut();
            $(".neofx-bg-fly").fadeOut();
        })
        $(".neofx-tab-stuff.js-in").click(function (e) {
            e.stopPropagation();
            $(".neofx-bg-fly").fadeIn();
        })
        $(".neofx-tab-stuff .pop-li").click(function (e) {
            e.stopPropagation();
            $(".neofx-bg-fly").fadeIn();
        })
        $(".js-left .neofx-tab-stuff").click(function () {
            $(".neofx-bg-outb1").fadeIn();
            $(this).addClass("js-cur").siblings().removeClass("js-cur");
        })
        $(".js-right .neofx-tab-stuff").click(function () {
            switch ($(this).index()) {
                case 0: {
                    $(".neofx-b1").fadeIn();
                    break;
                }
                case 1: {
                    $(".neofx-b2").fadeIn();
                    break;
                }
                case 2: {
                    break;
                }
            }
        })


    })
</script>
<script>

    function ypagi(shell, pages) {
        var sum = pages;
        var shownum = $(shell).find(".pagi-item").length;
        var current = 0;
        $(shell).find(".pagi-item").click(function () {
            var index = $(this).index(".pagi-item");
            // var index = $(this).text();
            // console.log(index)
            if (index == 0) {
                if ($(this).text() == 1) {
                    $(this).addClass("js-cur").siblings().removeClass("js-cur");
                    current = 0;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                    return;
                } else {
                    $(shell).find(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(--number);
                    })
                    $(shell).find(".pagi-item").eq(index + 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index + 1;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());

                }
            } else if (index == shownum - 1) {
                if ($(this).text() == sum) {
                    $(this).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());

                    return;
                } else {
                    $(shell).find(".pagi-item").each(function (idx, item) {
                        // console.log($(item).text());
                        var number = $(item).text();
                        $(item).text(++number);
                    })
                    $(shell).find(".pagi-item").eq(index - 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index - 1;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());

                }
            } else {
                $(this).addClass("js-cur").siblings().removeClass("js-cur");
                current = index;
                //console.log($(".pagi-item").eq(current).text())
                search($("#searchType").val(), $(".pagi-item").eq(current).text());

            }
        })
        $(shell).find(".pagi_left").click(function () {
            var index = current - 1;
            var that = $(shell).find(".pagi-item").eq(index);
            if (index < 0) return;
            if (index == 0) {
                if (that.text() == 1) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = 0;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());

                    return;
                } else {
                    $(shell).find(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(--number);
                    })
                    $(shell).find(".pagi-item").eq(index + 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index + 1;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());

                }
            } else if (index == shownum - 1) {
                if (that.text() == sum) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = index;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                    return;
                } else {
                    $(shell).find(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(++number);
                    })
                    $(shell).find(".pagi-item").eq(index - 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index - 1;
                    //console.log($(".pagi-item").eq(current).text())
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                }
            } else {
                that.addClass("js-cur").siblings().removeClass("js-cur");
                current = index;
                //console.log($(".pagi-item").eq(current).text())
                search($("#searchType").val(), $(".pagi-item").eq(current).text());
            }
        })
        $(shell).find(".pagi_right").click(function () {
            var index = current + 1;
            // console.log(index);
            var that = $(shell).find(".pagi-item").eq(index);
            if (index >= shownum) return;
            if (index == 0) {
                if (that.text() == 1) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = 0;
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                    return;
                } else {
                    $(shell).find(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(--number);
                    })
                    $(shell).find(".pagi-item").eq(index + 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index + 1;
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                }
            } else if (index == shownum - 1) {
                if (that.text() == sum) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = index;
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                    return;
                } else {
                    $(shell).find(".pagi-item").each(function (idx, item) {
                        // console.log($(item).text());
                        var number = $(item).text();
                        $(item).text(++number);
                    })
                    $(shell).find(".pagi-item").eq(index - 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index - 1;
                    search($("#searchType").val(), $(".pagi-item").eq(current).text());
                }
            } else {
                that.addClass("js-cur").siblings().removeClass("js-cur");
                current = index;
                search($("#searchType").val(), $(".pagi-item").eq(current).text());
            }
        })
        $(shell).find(".pagi_first").click(function () {
            var cur = 1;
            $(shell).find(".pagi-item").each(function (idx, item) {
                var number = $(item).text();
                $(item).text(cur++);
            })
            $(shell).find(".pagi-item").eq(0).addClass("js-cur").siblings().removeClass("js-cur");
        })
        $(shell).find(".pagi_last").click(function () {
            var cur = sum - shownum + 1;
            $(shell).find(".pagi-item").each(function (idx, item) {
                var number = $(item).text();
                $(item).text(cur++);
            })
            $(shell).find(".pagi-item").eq(shownum - 1).addClass("js-cur").siblings().removeClass("js-cur");
        })
    }

    function initPage(total, type) {
        // ==============pagi===========================
        $("#pagi").empty();
        $("#pagi").append('<div id="pagi_left" class="pagi-arrow">&lt;</div>');
        if (total <= 5) {
            // for (let i = 1; i <=total; i++) {
            //     if(i==1){
            $("#pagi").append('<div class="pagi-item js-cur">1</div>');
            // }else {
            //     $("#pagi").append('<div class="pagi-item">'+i+'</div>');
            // }
            // }
        } else {
            $("#pagi").append('<div class="pagi-item js-cur">1</div> ' +
                '               <div class="pagi-item">2</div>\n' +
                '            <div class="pagi-item">3</div>\n' +
                '            <div class="pagi-item">4</div>\n' +
                '            <div class="pagi-item">5</div>');
        }
        $("#pagi").append('<div id="pagi_right" class="pagi-arrow">&gt;</div>');

        var sum = total;
        var shownum = $(".pagi-item").length;
        var current = 0;
        $(".pagi-item").click(function () {
            var index = $(this).index(".pagi-item");
            if (index == 0) {
                if ($(this).text() == 1) {
                    $(this).addClass("js-cur").siblings().removeClass("js-cur");
                    current = 0;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                    return;
                } else {
                    $(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(--number);
                    })
                    $(".pagi-item").eq(index + 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index + 1;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                }
            } else if (index == shownum - 1) {
                if ($(this).text() == sum) {
                    $(this).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                    return;
                } else {
                    $(".pagi-item").each(function (idx, item) {
                        // console.log($(item).text());
                        var number = $(item).text();
                        $(item).text(++number);
                    })
                    $(".pagi-item").eq(index - 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index - 1;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                }
            } else {
                $(this).addClass("js-cur").siblings().removeClass("js-cur");
                current = index;
                console.log($(".pagi-item").eq(current).text())
                if (type == 'event') {

                }
                if (type == 'warning') {
                    getList("", $(".pagi-item").eq(current).text(), false);
                }
            }
        })
        $("#pagi_left").click(function () {
            var index = current - 1;
            var that = $(".pagi-item").eq(index);
            if (index < 0) return;
            if (index == 0) {
                if (that.text() == 1) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = 0;
                    return;
                } else {
                    $(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(--number);
                    })
                    $(".pagi-item").eq(index + 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index + 1;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                }
            } else if (index == shownum - 1) {
                if (that.text() == sum) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = index;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                    return;
                } else {
                    $(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(++number);
                    })
                    $(".pagi-item").eq(index - 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index - 1;
                    console.log($(".pagi-item").eq(current).text())
                    if (type == 'event') {

                    }
                    if (type == 'warning') {
                        getList("", $(".pagi-item").eq(current).text(), false);
                    }
                }
            } else {
                that.addClass("js-cur").siblings().removeClass("js-cur");
                current = index;
                console.log($(".pagi-item").eq(current).text())
                if (type == 'event') {

                }
                if (type == 'warning') {
                    getList("", $(".pagi-item").eq(current).text(), false);
                }
            }
        })
        $("#pagi_right").click(function () {
            var index = current + 1;
            var that = $(".pagi-item").eq(index);
            if (index >= shownum) return;
            if (index == 0) {
                if (that.text() == 1) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = 0;
                    return;
                } else {
                    $(".pagi-item").each(function (idx, item) {
                        var number = $(item).text();
                        $(item).text(--number);
                    })

                    $(".pagi-item").eq(index + 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index + 1;
                }
            } else if (index == shownum - 1) {
                if (that.text() == sum) {
                    that.addClass("js-cur").siblings().removeClass("js-cur");
                    current = index;
                    return;
                } else {
                    $(".pagi-item").each(function (idx, item) {
                        console.log($(item).text());
                        var number = $(item).text();
                        $(item).text(++number);
                    })
                    $(".pagi-item").eq(index - 1).addClass("js-cur").siblings().removeClass("js-cur");
                    current = index - 1;

                }
            } else {
                that.addClass("js-cur").siblings().removeClass("js-cur");
                current = index;
            }

            console.log($(".js-cur").text().substr(0, 1));
        })
        $("#pagi_first").click(function () {
            var cur = 1;
            $(".pagi-item").each(function (idx, item) {
                var number = $(item).text();
                $(item).text(cur++);
            })
            $(".pagi-item").eq(0).addClass("js-cur").siblings().removeClass("js-cur");
        })
        $("#pagi_last").click(function () {
            var cur = sum - shownum + 1;
            $(".pagi-item").each(function (idx, item) {
                var number = $(item).text();
                $(item).text(cur++);
            })
            $(".pagi-item").eq(shownum - 1).addClass("js-cur").siblings().removeClass("js-cur");
        })
        // ===================pagi end==================
    }

    $(function () {
        // ==================拖动=============================
        function dragFunc(id) {
            var Drag = document.getElementById(id);
            Drag.onmousedown = function (event) {
                var ev = event || window.event;
                event.stopPropagation();
                var disX = ev.clientX - Drag.offsetLeft;
                var disY = ev.clientY - Drag.offsetTop;
                document.onmousemove = function (event) {
                    var ev = event || window.event;
                    Drag.style.left = ev.clientX - disX + "px";
                    Drag.style.top = ev.clientY - disY + "px";
                    Drag.style.cursor = "move";
                };
            };
            Drag.onmouseup = function () {
                document.onmousemove = null;
                this.style.cursor = "default";
            };
        };
        dragFunc("fly");
        // dragFunc("fly1");
        // dragFunc("fly2");
    })
</script>
</html>
