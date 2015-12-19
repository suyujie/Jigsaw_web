
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#chart').hide();
});

function chart(data){
	var tempArray = data.substring(0,data.indexOf(";")).split(",");
	//length==2表示一天；length==3表示多天    （仅限于这个页面，不适应于所有）
	if(tempArray.length == 2){
		var chartTitle;//图标题
		var yTitle;//Y轴标题
		var x_d=[];//X轴数据
		var hourOnlinePlayers=[];//统计数据的数组
		var series1;//统计数据的名称
		
		if(languageTag == 'en-US'){
			chartTitle = 'Player Online Statistics';
			yTitle = 'Online Players Num';
			series1 = 'Hour Online Players';
		}else{
			chartTitle = '玩家在线统计';
			yTitle = '在线玩家数量';
			series1 = '在线玩家数量';
		}
		
		var strArray = data.split(';');
		
		for(var i=0;i<strArray.length-1;i++){
			var pr = strArray[i].split(',');
			
			x_d[i]=pr[0]+"H";
			hourOnlinePlayers[i]=parseFloat(pr[1]);
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
	            data: hourOnlinePlayers
	        }]
	    });
	}else{
		var chartTitle;//图标题
		var yTitle;//Y轴标题
		var x_d=[];//X轴数据
		var acu=[];//统计数据的数组
		var pcu=[];
		var series1;//统计数据的名称
		var series2;
		
		if(languageTag == 'en-US'){
			chartTitle = 'Player Online Statistics';
			yTitle = 'Online Players Num';
			series1 = 'Average Concurrent Players';
			series2 = 'Peak Concurrent Players';
		}else{
			chartTitle = '玩家在线统计';
			yTitle = '在线玩家数量';
			series1 = '单日平均在线玩家数量';
			series2 = '单日最高在线玩家数量';
		}
		
		var strArray = data.split(';');
		
		for(var i=0;i<strArray.length-1;i++){
			var pr = strArray[i].split(',');
			
			x_d[i]=pr[0];
			acu[i]=parseFloat(pr[1]);
			pcu[i]=parseFloat(pr[2]);
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
	            data: acu
	        },{
	            name: series2,
	            data: pcu
	        }]
	    });
	}
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

