
var x_d=[];
var dayLossRate=[];
var weekLossRate=[];
var monthLossRate=[];
var chartTitle;
var yTitle;
var series1;
var series2;
var series3;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Loss Statistics';
		yTitle = 'Loss Rate';
		series1 = 'Day Loss Rate';
		series2 = 'Week Loss Rate';
		series3 = 'Month Loss Rate';
	}else{
		chartTitle = '玩家流失统计';
		yTitle = '流失率';
		series1 = '日流失率';
		series2 = '周流失率';
		series3 = '月流失率';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pr = strArray[i].split(',');
		
		x_d[i]=pr[0];
		dayLossRate[i]=parseFloat(pr[1]);
		weekLossRate[i]=parseFloat(pr[2]);
		monthLossRate[i]=parseFloat(pr[3]);
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
            data: dayLossRate
        },{
            name: series2,
            data: weekLossRate
        },{
            name: series3,
            data: monthLossRate
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

