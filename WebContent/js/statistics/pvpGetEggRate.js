var x_d=[];
var dayGetEggRate=[];
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
		chartTitle = 'PVPGetEggRate Statistics';
		yTitle = 'Get Egg Rate';
		series1 = 'Day Get Egg Rate';
	}else{
		chartTitle = 'PVP抽蛋率统计';
		yTitle = '抽蛋率';
		series1 = '每日抽蛋率';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pr = strArray[i].split(',');
		
		x_d[i]=pr[0];
		dayGetEggRate[i]=parseInt(pr[1]);
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
            data: dayGetEggRate
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

