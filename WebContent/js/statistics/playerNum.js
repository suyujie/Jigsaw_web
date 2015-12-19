
var x_d=[];
var playerNum=[];
var chartTitle;
var yTitle;
var series1;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Num Statistics';
		yTitle = 'Player Num';
		series1 = 'PlayerNum';
	}else{
		chartTitle = '分段统计玩家数量';
		yTitle = '玩家数量';
		series1 = '分段玩家数量';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pr = strArray[i].split(',');
		
		x_d[i]=pr[0];
		playerNum[i]=parseInt(pr[1]);
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
            data: playerNum
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