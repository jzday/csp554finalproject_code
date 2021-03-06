<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Base on Storm to stastic real-time tourist population by using heat map</title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
            border:0;
        }
        select{
            style:none;
            background-color: transparent;
        }
        .sel-btn {
            width:60px;
            line-height:30px;
            height:22px;
            border:1px solid #ccc;
            vertical-align:middle;
        }
        h1,h3{
            text-align:center;
            line-height: 50px;
        }
        h3 {
            line-height: 30px;
        }
        #container {
            position: absolute;
            top: 80px;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=b1365b4141cebc6ab90e7d1ddd3f257f"></script>
</head>
<body>

<h1>Base on Storm to stastic real-time tourist population by using heat map</h1>
<h3 >update frequency
    <select class="sel-btn">
        <option>30s</option>
        <option>60s</option>
        <option>90s</option>
    </select>
</h3>

<div id="container" ></div>
<script type="text/javascript">
    var map = new AMap.Map('container',{
        zoom: 10,
        resizeEnable: true,
        center: [116.39,39.9]
    });

    map.setFeatures(['road','point'])

    map.plugin(["AMap.ToolBar"],function () {
        map.addControl(new AMap.ToolBar()); 
    });


    var points = ${data_json}

    var heatmap;
    map.plugin(["AMap.Heatmap"], function() {
        heatmap = new AMap.Heatmap(map, {
            radius: 25, 
            opacity: [0, 0.8]
            /*,gradient:{
             0.5: 'blue',
             0.65: 'rgb(117,211,248)',
             0.7: 'rgb(0, 255, 0)',
             0.9: '#ffea00',
             1.0: 'red'
             }*/
        });
        
        heatmap.setDataSet({
            data: points,
            max: 10
        });
    });
</script>
</body>
</html>