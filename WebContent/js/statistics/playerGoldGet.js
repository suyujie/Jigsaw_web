
var x_d=[];
var todayManagerGive=[];
var todayBuy=[];
var todayMissionGet=[];
var todayTaskGet=[];
var todayDailyJobGet=[];
var todayToturialGet=[];
var todayNoticeGive=[];
var todayPointGive=[];
var todayInitGive=[];
var todayHandbookReward=[];
var todayCompensate=[];
var todayMonthCard=[];
var todayFirstBuyDouble=[];
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
var series12;
var series13;
var series14;

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
		series2 = 'TodayBuy';
		series3 = 'TodayMissionGet';
		series4 = 'TodayTaskGet';
		series5 = 'TodayDailyJobGet';
		series6 = 'TodayToturialGet';
		series7 = 'TodayNoticeGive';
		series8 = 'TodayPointGive';
		series9 = 'TodayInitGive';
		series10 = 'TodayHandbookReward';
		series11 = 'TodayCompensate';
		series12 = 'TodayMonthCard';
		series13 = 'TodayFirstBuyDouble';
		series14 = 'TodayGetAmount';
	}else{
		chartTitle = '玩家钻石获得统计';
		yTitle = '钻石数量';
		series1 = '管理员给予';
		series2 = '购买';
		series3 = '关卡获得';
		series4 = '任务获得';
		series5 = '每日任务获得';
		series6 = '教程获得';
		series7 = '公告给予';
		series8 = '关卡给予';
		series9 = '初始给予';
		series10 = '图鉴奖励';
		series11 = '补钻';
		series12 = '月卡发放';
		series13 = '首次bug双倍';
		series14 = '获得总数';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pgg = strArray[i].split(',');
		
		x_d[i]=pgg[0];
		todayManagerGive[i]=parseFloat(pgg[1]);
		todayBuy[i]=parseFloat(pgg[2]);
		todayMissionGet[i]=parseFloat(pgg[3]);
		todayTaskGet[i]=parseFloat(pgg[4]);
		todayDailyJobGet[i]=parseFloat(pgg[5]);
		todayToturialGet[i]=parseFloat(pgg[6]);
		todayNoticeGive[i]=parseFloat(pgg[7]);
		todayPointGive[i]=parseFloat(pgg[8]);
		todayInitGive[i]=parseFloat(pgg[9]);
		todayHandbookReward[i]=parseFloat(pgg[10]);
		todayCompensate[i]=parseFloat(pgg[11]);
		todayMonthCard[i]=parseFloat(pgg[12]);
		todayFirstBuyDouble[i]=parseFloat(pgg[13]);
		todayGetAmount[i]=parseFloat(pgg[14]);
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
            data: todayBuy
        },{
            name: series3,
            data: todayMissionGet
        },{
            name: series4,
            data: todayTaskGet
        },{
            name: series5,
            data: todayDailyJobGet
        },{
            name: series6,
            data: todayToturialGet
        },{
            name: series7,
            data: todayNoticeGive
        },{
            name: series8,
            data: todayPointGive
        },{
            name: series9,
            data: todayInitGive
        },{
            name: series10,
            data: todayHandbookReward
        },{
            name: series11,
            data: todayCompensate
        },{
            name: series12,
            data: todayMonthCard
        },{
            name: series13,
            data: todayFirstBuyDouble
        },{
            name: series14,
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

