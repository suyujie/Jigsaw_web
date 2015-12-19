
var x_d=[];
var dayActivePlayers=[];
var weekActivePlayers=[];
var monthActivePlayers=[];
var adhesiveCapacity=[];
var chartTitle;
var yTitle;
var series1;
var series2;
var series3;
var series4;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Login Statistics';
		yTitle = 'Login Players Num';
		series1 = 'Day Active Players';
		series2 = 'Week Active Players';
		series3 = 'Month Active Players';
		series4 = 'Adhesive Capacity';
	}else{
		chartTitle = '玩家登陆统计';
		yTitle = '登陆玩家数量';
		series1 = '日活跃玩家数量';
		series2 = '周活跃玩家数量';
		series3 = '月活跃玩家数量';
		series4 = '游戏黏着度';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pr = strArray[i].split(',');
		
		x_d[i]=pr[0];
		dayActivePlayers[i]=parseInt(pr[1]);
		weekActivePlayers[i]=parseInt(pr[2]);
		monthActivePlayers[i]=parseInt(pr[3]);
		adhesiveCapacity=parseFloat(pr[4]);
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
            data: dayActivePlayers
        },{
            name: series2,
            data: weekActivePlayers
        },{
            name: series3,
            data: monthActivePlayers
        },{
            name: series4,
            data: adhesiveCapacity
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

