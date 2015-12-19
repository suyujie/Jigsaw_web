
var x_d=[];
var todayManagerGive=[];
var todayPointGet=[];
var todayRentRobotGet=[];
var todayToturialGet=[];
var todayPVPGet=[];
var todaySellPart=[];
var todayInitGive=[];
var todayMissionGain=[];
var todayBuyBlackItem=[];
var todayTreasureIslandGet=[];
var todayGetAmount=[];

var chartTitle;
var yTitle;
var series1;
var series2;
var series3;
var series4;
var series5;
var series6;
var series7;
var series8;
var series9;
var series10;
var series11;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Gold Get Statistics';
		yTitle = 'Gold Get';
		series1 = 'TodayManagerGive';
		series2 = 'TodayPointGet';
		series3 = 'TodayRentRobotGet';
		series4 = 'TodayToturialGet';
		series5 = 'TodayPVPGet';
		series6 = 'TodaySellPart';
		series7 = 'TodayInitGive';
		series8 = 'TodayMissionGain';
		series9 = 'TodayBuyBlackItem';
		series10 = 'TodayTreasureIslandGet';
		series11 = 'TodayGetAmount';
	}else{
		chartTitle = '玩家金币获得统计';
		yTitle = '金币数量';
		series1 = '日管理员给予';
		series2 = '日小关卡获得';
		series3 = '日出租机器人获得';
		series4 = '日训练获得';
		series5 = '日PVP获得';
		series6 = '日出售零件获得';
		series7 = '日初始给予';
		series8 = '日大关卡产出';
		series9 = '日购买黑市商品';
		series10 = '日金银岛获得';
		series11 = '日获得总数';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pgg = strArray[i].split(',');
		
		x_d[i]=pgg[0];
		todayManagerGive[i]=parseFloat(pgg[1]);
		todayPointGet[i]=parseFloat(pgg[2]);
		todayRentRobotGet[i]=parseFloat(pgg[3]);
		todayToturialGet[i]=parseFloat(pgg[4]);
		todayPVPGet[i]=parseFloat(pgg[5]);
		todaySellPart[i]=parseFloat(pgg[6]);
		todayInitGive[i]=parseFloat(pgg[7]);
		todayMissionGain[i]=parseFloat(pgg[8]);
		todayBuyBlackItem[i]=parseFloat(pgg[9]);
		todayTreasureIslandGet[i]=parseFloat(pgg[10]);
		todayGetAmount[i]=parseFloat(pgg[11]);
	}

	$('#chart').toggle();
	$('#chart').highcharts({
        title: {
            text: chartTitle,
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: x_d
        },
        yAxis: {
            title: {
                text: yTitle
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: series1,
            data: todayManagerGive
        },{
            name: series2,
            data: todayPointGet
        },{
            name: series3,
            data: todayRentRobotGet
        },{
            name: series4,
            data: todayToturialGet
        },{
            name: series5,
            data: todayPVPGet
        },{
            name: series6,
            data: todaySellPart
        },{
            name: series7,
            data: todayInitGive
        },{
            name: series8,
            data: todayMissionGain
        },{
            name: series9,
            data: todayBuyBlackItem
        },{
            name: series10,
            data: todayTreasureIslandGet
        },{
            name: series11,
            data: todayGetAmount
        }]
    });
}

$('.form_date').datetimepicker({
    language:  'en',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

