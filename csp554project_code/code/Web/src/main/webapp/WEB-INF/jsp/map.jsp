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
<h3 >Update frequency：
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


    var points =[
        // {"lng":116.191031,"lat":39.988585,"count":100},
        // {"lng":116.389275,"lat":39.925818,"count":60},
        // {"lng":116.287444,"lat":39.810742,"count":200},
        // {"lng":116.481707,"lat":39.940089,"count":30},
        // {"lng":116.410588,"lat":39.880172,"count":200},
        // {"lat":39.905637761392,	"lng":116.39763057232,"count":40},
        // {"lat":40.359759768836,	"lng":116.02002181113,"count":40}
        // {"lat":40.258186,"lng":116.225404,"count":100},
        {"lng":116.272876,"lat":39.99243,"count":9},
        {"lng":116.397026,"lat":39.918058,"count":5},
        {"lng":116.225404,"lat":40.258186,"count":10},
        {"lng":116.544079,"lat":40.417555,"count":1}

    ];

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