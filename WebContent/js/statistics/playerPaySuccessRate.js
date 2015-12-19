
var x_d=[];
var wpPaySuccessRate=[];
var paypalPaySuccessRate=[];
var chartTitle;
var yTitle;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Pay Success Rate Statistics';
		yTitle = 'Pay Success Rate';
	}else{
		chartTitle = '玩家支付成功率统计';
		yTitle = '支付成功率';
	}
	
	var seriesArray = [];
	var end = data.indexof("]");
	var payChannels = data.substring(1,end);
	var payChannelArray = payChannels.split(", ");
	for(var i=0; i<payChannelArray.length; i++){
		series
	}
	
	
	var strArray = data.substring(end+1).split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pr = strArray[i].split(',');
		
		x_d[i]=pr[0];
		wpPaySuccessRate[i]=parseFloat(pr[1]);
		paypalPaySuccessRate[i]=parseFloat(pr[2]);
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
            data: wpPaySuccessRate
        },{
            name: series2,
            data: paypalPaySuccessRate
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

