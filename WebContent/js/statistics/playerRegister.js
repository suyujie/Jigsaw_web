
var x_d=[];
var dayRegisterPlayerNum=[];
var monthRegisterPlayerNum=[];
var chartTitle;
var yTitle;
var series1;
var series2;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	$('#chart').hide();
	languageTag = $('#languageTag',parent.document).val();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Register Statistics';
		yTitle = 'Player Num';
		series1 = 'Day Register Player Num';
		series2 = 'Month Register Player Num';
	}else{
		chartTitle = '玩家注册统计';
		yTitle = '玩家数量';
		series1 = '日新增玩家数量';
		series2 = '月新增玩家数量';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var ps = strArray[i].split(',');
		
		x_d[i]=ps[0];
		dayRegisterPlayerNum[i] = parseInt(ps[1]);
		monthRegisterPlayerNum[i] = parseInt(ps[2]);
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
            data: dayRegisterPlayerNum
        }, {
            name: series2,
            data: monthRegisterPlayerNum
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
		
