
var x_d=[];
var rate1=[];
var rate7=[];
var rate30=[];
var totalPayRate=[];
var amount1=[];
var amount7=[];
var amount30=[];
var totalAmount=[];
var arpu=[];
var arppu=[];
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

jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	if(languageTag == 'en-US'){
		chartTitle = 'Player Pay Statistics';
		yTitle = 'Player Pay';
		series1 = 'Day Pay Rate';
		series2 = 'Week Pay Rate';
		series3 = 'Month Pay Rate';
		series4 = 'Total Pay Rate';
		series5 = 'Day Pay Amount';
		series6 = 'Week Pay Amount';
		series7 = 'Month Pay Amount';
		series8 = 'Total Pay Amount';
		series9 = 'arpu';
		series10 = 'arppu';
	}else{
		chartTitle = '玩家付费统计';
		yTitle = '玩家付费';
		series1 = '日付费率';
		series2 = '周付费率';
		series3 = '月付费率';
		series4 = '总付费率';
		series5 = '日付费总额';
		series6 = '周付费总额';
		series7 = '月付费总额';
		series8 = '总付费额';
		series9 = '玩家平均收入';
		series10 = '付费玩家平均收入';
	}
	
	var strArray = data.split(';');
	
	for(var i=0;i<strArray.length-1;i++){
		var pp = strArray[i].split(',');
		
		x_d[i]=pp[0];
		rate1[i]=parseFloat(pp[1]);
		rate7[i]=parseFloat(pp[2]);
		rate30[i]=parseFloat(pp[3]);
		totalPayRate[i]=parseFloat(pp[4]);
		amount1[i]=parseFloat(pp[5]);
		amount7[i]=parseFloat(pp[6]);
		amount30[i]=parseFloat(pp[7]);
		totalAmount[i]=parseFloat(pp[8]);
		arpu[i]=parseFloat(pp[9]);
		arppu[i]=parseFloat(pp[10]);
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
            data: rate1
        },{
            name: series2,
            data: rate7
        },{
            name: series3,
            data: rate30
        },{
            name: series4,
            data: totalPayRate
        },{
            name: series5,
            data: amount1
        },{
            name: series6,
            data: amount7
        },{
            name: series7,
            data: amount30
        },{
            name: series8,
            data: totalAmount
        },{
            name: series9,
            data: arpu
        },{
            name: series10,
            data: arppu
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

