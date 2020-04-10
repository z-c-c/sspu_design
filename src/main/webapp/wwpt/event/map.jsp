<%--
  Created by IntelliJ IDEA.
  User: zcc
  Date: 2020-04-10
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一个简单的事件应用</title>
    <script src="../js/ol.js"></script>
    <link href="../css/ol.css">
</head>
<body>
<div id="map" style="width: 100%;height: 700px"></div>
<script>

    let layer = new ol.layer.Vector({
        source: new ol.source.Vector()
    });
    var mapUrl = "t{0-6}.tianditu.gov.cn";
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

    let map = new ol.Map({
        layers: [baseLayer, baseVec, layer],
        view: new ol.View({
            projection: 'EPSG:4326',
            center: [121.438319, 31.135656],
            zoom: 10
        }),
        target: 'map'
    });

    // 构建svg的Image对象
    let svg = '<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px" height="30px" viewBox="0 0 30 30" enable-background="new 0 0 30 30" xml:space="preserve">' +
        '<path fill="#156BB1" d="M22.906,10.438c0,4.367-6.281,14.312-7.906,17.031c-1.719-2.75-7.906-12.665-7.906-17.031S10.634,2.531,15,2.531S22.906,6.071,22.906,10.438z"/>' +
        '<circle fill="#FFFFFF" cx="15" cy="10.677" r="3.291"/></svg>';

    let mysvg = new Image();
    mysvg.src = 'data:image/svg+xml,' + escape(svg);

    let style = new ol.style.Style({
        image: new ol.style.Icon({
            img: mysvg,
            imgSize: [30, 30]    // 图标大小
            //          src: 'http://www.williambuck.com/portals/0/Skins/WilliamBuck2014/images/location-icon.svg',
            //          size: [30, 30]
        })
    });


    map.on('singleclick', function (event) {
        let feature = new ol.Feature({
            geometry: new ol.geom.Point(event.coordinate),
        });
        feature.setStyle(style);

        layer.getSource().getFeatures().forEach(function (feature) {
            layer.getSource().removeFeature(feature)
        })
        layer.getSource().addFeature(feature);
        console.log(event.coordinate)
        parent.$("#occurredLongti").val(event.coordinate[0]);
        parent.$("#occurredLati").val(event.coordinate[1]);
        parent.$("#longti").val(event.coordinate[0]);
        parent.$("#lati").val(event.coordinate[1]);
        // console.log(ol.proj.transform(event.coordinate, 'EPSG:3857', 'EPSG:4326'));
    });

    function showPoint(longi, lati) {
        let feature = new ol.Feature({
            geometry: new ol.geom.Point([longi, lati]),
        });
        feature.setStyle(style);

        layer.getSource().getFeatures().forEach(function (feature) {
            layer.getSource().removeFeature(feature)
        })
        layer.getSource().addFeature(feature);
    }


</script>
</body>
</html>
