
var x_d=[];
var todayRentRobotCost=[];
var todayRobotPartUpCost=[];
var todayPVPLose=[];
var todayLottery=[];
var todayPVPUse=[];
var todayPartRarityUpgrade=[];
var todayBergUpgrade=[];
var todayCostAmount=[];

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

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Gold Cost Statistics';
		yTitle = 'Gold Cost';
		series1 = 'TodayRentRobotCost';
		series2 = 'TodayRobotPartUpCost';
		series3 = 'TodayPVPLose';
		series4 = 'TodayLottery';
		series5 = 'TodayPVPUse';
		series6 = 'TodayPartRarityUpgrade';
		series7 = 'TodayBergUpgrade';
		series8 = 'TodayCostAmount';
	}else{
		chartTitle = '玩家金币消耗统计';
		yTitle = '金币数量';
		series1 = '日租赁机器人消耗';
		series2 = '日机器人部件升级消耗';
		series3 = '日PVP损失';
		series4 = '日抽奖消耗';
		series5 = '日PVP消耗';
		series6 = '日部件升级消耗';
		series7 = '日水晶消耗总数';
		series8 = '日消耗总数';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pgg = strArray[i].split(',');
		
		x_d[i]=pgg[0];
		todayRentRobotCost[i]=parseFloat(pgg[1]);
		todayRobotPartUpCost[i]=parseFloat(pgg[2]);
		todayPVPLose[i]=parseFloat(pgg[3]);
		todayLottery[i]=parseFloat(pgg[4]);
		todayPVPUse[i]=parseFloat(pgg[5]);
		todayPartRarityUpgrade[i]=parseFloat(pgg[6]);
		todayBergUpgrade[i]=parseFloat(pgg[7]);
		todayCostAmount[i]=parseFloat(pgg[8]);
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
            data: todayRentRobotCost
        },{
            name: series2,
            data: todayRobotPartUpCost
        },{
            name: series3,
            data: todayPVPLose
        },{
            name: series4,
            data: todayLottery
        },{
            name: series5,
            data: todayPVPUse
        },{
            name: series6,
            data: todayPartRarityUpgrade
        },{
            name: series7,
            data: todayBergUpgrade
        },{
            name: series8,
            data: todayCostAmount
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
