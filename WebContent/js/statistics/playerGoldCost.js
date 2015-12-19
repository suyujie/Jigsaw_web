
var x_d=[];
var todayPainCost=[];
var todayRepairRobotCost=[];
var todayCancelRentOrderCost=[];
var todayGetEggPartCost=[];
var todayLotteryCost=[];
var todayReflushRentOrderCost=[];
var todayRobotPartUpCost=[];
var todayRobotPartUpWithGoldCost=[];
var todayBuyBlackItem=[];
var todayResetDeathWheel=[];
var todayBergUpgrade=[];
var todayResetBergWheel=[];
var todayReliveBergWheel=[];
var todayResetTreasureIsland=[];
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
var series9;
var series10;
var series11;
var series12;
var series13;
var series14;
var series15;

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
		series1 = 'todayPainCost';
		series2 = 'todayRepairRobotCost';
		series3 = 'todayCancelRentOrderCost';
		series4 = 'todayGetEggPartCost';
		series5 = 'todayLotteryCost';
		series6 = 'todayReflushRentOrderCost';
		series7 = 'todayRobotPartUpCost';
		series8 = 'todayRobotPartUpWithGoldCost';
		series9 = 'todayBuyBlackItem';
		series10 = 'todayResetDeathWheel';
		series11 = 'todayBergUpgrade';
		series12 = 'todayResetBergWheel';
		series13 = 'todayReliveBergWheel';
		series14 = 'todayResetTreasureIsland';
		series15 = 'todayCostAmount';
	}else{
		chartTitle = '玩家钻石消费统计';
		yTitle = '消费额';
		series1 = '日涂装消费额';
		series2 = '日维修消费额';
		series3 = '日取消出租消费额';
		series4 = '日抽蛋消费额';
		series5 = '日抽奖消费额';
		series6 = '日刷新租赁消费额';
		series7 = '日部件升级消费额';
		series8 = '日一键升级消费额';
		series9 = '日购买黑市商品';
		series10 = '日重置死亡轮盘消费额';
		series11 = '日水晶升级消费额';
		series12 = '日重置车轮战消费额';
		series13 = '日复活车轮战消费额';
		series14 = '日重置金银岛消费额';
		series15 = '日消费总额';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pgc = strArray[i].split(',');
		
		x_d[i]=pgc[0];
		todayPainCost[i]=parseFloat(pgc[1]);
		todayRepairRobotCost[i]=parseFloat(pgc[2]);
		todayCancelRentOrderCost[i]=parseFloat(pgc[3]);
		todayGetEggPartCost[i]=parseFloat(pgc[4]);
		todayLotteryCost[i]=parseFloat(pgc[5]);
		todayReflushRentOrderCost[i]=parseFloat(pgc[6]);
		todayRobotPartUpCost[i]=parseFloat(pgc[7]);
		todayRobotPartUpWithGoldCost[i]=parseFloat(pgc[8]);
		todayBuyBlackItem[i]=parseFloat(pgc[9]);
		todayResetDeathWheel[i]=parseFloat(pgc[10]);
		todayBergUpgrade[i]=parseFloat(pgc[11]);
		todayResetBergWheel[i]=parseFloat(pgc[12]);
		todayReliveBergWheel[i]=parseFloat(pgc[13]);
		todayResetTreasureIsland[i]=parseFloat(pgc[14]);
		todayCostAmount[i]=parseFloat(pgc[15]);
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
            data: todayPainCost
        },{
            name: series2,
            data: todayRepairRobotCost
        },{
            name: series3,
            data: todayCancelRentOrderCost
        },{
            name: series4,
            data: todayGetEggPartCost
        },{
            name: series5,
            data: todayLotteryCost
        },{
            name: series6,
            data: todayReflushRentOrderCost
        },{
            name: series7,
            data: todayRobotPartUpCost
        },{
            name: series8,
            data: todayRobotPartUpWithGoldCost
        },{
            name: series9,
            data: todayBuyBlackItem
        },{
            name: series10,
            data: todayResetDeathWheel
        },{
            name: series11,
            data: todayBergUpgrade
        },{
            name: series12,
            data: todayResetBergWheel
        },{
            name: series13,
            data: todayReliveBergWheel
        },{
            name: series14,
            data: todayResetTreasureIsland
        },{
            name: series15,
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

