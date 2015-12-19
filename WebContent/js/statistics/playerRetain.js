
var x_d=[];
var retention1=[];
var retention2=[];
var retention3=[];
var retention7=[];
var retention14=[];
var retention30=[];
var chartTitle;
var yTitle;
var series1;
var series2;
var series3;
var series4;
var series5;
var series6;

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Retain Statistics';
		yTitle = 'Retention';
		series1 = '1 Day Retention';
		series2 = '2 Day Retention';
		series3 = '3 Day Retention';
		series4 = '7 Day Retention';
		series5 = '14 Day Retention';
		series6 = '30 Day Retention';
	}else{
		chartTitle = '玩家留存统计';
		yTitle = '留存率';
		series1 = '次日留存率';
		series2 = '2日留存率';
		series3 = '3日留存率';
		series4 = '7日留存率';
		series5 = '14日留存率';
		series6 = '月留存率';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pr = strArray[i].split(',');
		
		x_d[i]=pr[0];
		retention1[i]=parseFloat(pr[1]);
		retention2[i]=parseFloat(pr[2]);
		retention3[i]=parseFloat(pr[3]);
		retention7[i]=parseFloat(pr[4]);
		retention14[i]=parseFloat(pr[5]);
		retention30[i]=parseFloat(pr[6]);
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
            data: retention1
        },{
            name: series2,
            data: retention2
        },{
            name: series3,
            data: retention3
        },{
            name: series4,
            data: retention7
        },{
            name: series5,
            data: retention14
        },{
            name: series6,
            data: retention30
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

