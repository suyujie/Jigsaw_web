var task = [];

var x_mem = [];
var totalMemory = [];
var freeMemory = [];
var maxMemory = [];

var x_thread = [];
var maxThreadNum = [];
var realtimeThreadNum = [];
var realtimeQueueSize = [];
var realtimeScheduleNum = [];
var realtimeWindowQueueSize = [];

function taskQueueStatus() {
	$('#taskQueueStatus').highcharts(
			{
				chart : {
					type : 'spline',
				},
				title : {
					text : '',
				},
				xAxis : {
					categories : x_thread,
				},
				yAxis : {
					title : {
						text : ''
					},
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				},
				tooltip : {
					formatter : function() {
						return '<b>' + this.series.name + '</b><br/>' + this.y ;
					}
				},
				legend : {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle',
					borderWidth : 0
				},
				series : [ {
					name : 'taskQueueStatus',
					data : realtimeWindowQueueSize
				} ]
			});
}

function memoryStatus() {
	$('#memoryStatus').highcharts(
			{
				chart : {
					type : 'spline'
				},
				title : {
					text : '',
					x : -20
				},
				subtitle : {
					text : '',
					x : -20
				},
				xAxis : {
					categories : x_mem,
				},
				yAxis : {
					title : {
						text : ''
					},
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				},
				tooltip : {
					formatter : function() {
						return '<b>' + this.series.name + '</b><br/>' + this.y
								/ 1000 / 1000 + ' mb';
					}
				},
				legend : {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle',
					borderWidth : 0
				},
				series : [ {
					name : 'freeMemory',
					data : freeMemory
				}, {
					name : 'maxMemory',
					data : maxMemory
				}, {
					name : 'totalMemory',
					data : totalMemory
				} ]
			});
}

function threadStatus() {
	$('#threadStatus').highcharts({
		chart : {
			type : 'spline'
		},
		title : {
			text : '',
			x : -20
		},
		subtitle : {
			text : '',
			x : -20
		},
		xAxis : {
			categories : x_thread,
		},
		yAxis : {
			title : {
				text : ''
			},
			plotLines : [ {
				value : 0,
				width : 1,
				color : '#808080'
			} ]
		},
		tooltip : {
			valueSuffix : ''
		},
		legend : {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle',
			borderWidth : 0
		},
		series : [ {
			name : 'maxThreadNum',
			data : maxThreadNum
		}, {
			name : 'realtimeThreadNum',
			data : realtimeThreadNum
		}, {
			name : 'realtimeQueueSize',
			data : realtimeQueueSize
		}, {
			name : 'realtimeScheduleNum',
			data : realtimeScheduleNum
		} ]
	});
}

var x_db = new JHashMap();
var dbConns = new JHashMap();
var dbBusyConns = new JHashMap();
var dbIdleConns = new JHashMap();

function dbStatus() {

	for (var i = 0; i < dbTags.length; i++) {

		var dbTag = dbTags[i];

		$('#dbStatus' + dbTag).highcharts({
			chart : {
				type : 'spline'
			},
			title : {
				text : '',
				x : -20
			},
			subtitle : {
				text : '',
				x : -20
			},
			xAxis : {
				categories : x_db.get(dbTag),
			},
			yAxis : {
				title : {
					text : ''
				},
				plotLines : [ {
					value : 0,
					width : 1,
					color : '#808080'
				} ]
			},
			tooltip : {
				valueSuffix : ''
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle',
				borderWidth : 0
			},
			series : [ {
				name : 'dbConns',
				data : dbConns.get(dbTag)
			}, {
				name : 'dbBusyConns',
				data : dbBusyConns.get(dbTag)
			}, {
				name : 'dbIdleConns',
				data : dbIdleConns.get(dbTag)
			} ]
		});
	}

}

function processMemData(data) {

	var hm = "";

	for (var i = 0; i < data.length; i++) {

		var d = new Date(data[i].t);

		var hm2 = d.getHours() + ":" + d.getMinutes();
		if (hm2 != hm) {
			hm = d.getHours() + ":" + d.getMinutes();
			x_mem[i] = d.getHours() + ":" + d.getMinutes() + ":"
					+ d.getSeconds();
		} else {
			x_mem[i] = d.getSeconds();
		}

		totalMemory[i] = data[i].tm;
		freeMemory[i] = data[i].fm;
		maxMemory[i] = data[i].mm;

	}
}

function processThreadData(data) {

	var hm = "";

	for (var i = 0; i < data.length; i++) {

		var d = new Date(data[i].t);

		var hm2 = d.getHours() + ":" + d.getMinutes();
		if (hm2 != hm) {
			hm = d.getHours() + ":" + d.getMinutes();
			x_thread[i] = d.getHours() + ":" + d.getMinutes() + ":"
					+ d.getSeconds();
		} else {
			x_thread[i] = d.getSeconds();
		}

		maxThreadNum[i] = data[i].mtn;
		realtimeThreadNum[i] = data[i].rtn;
		realtimeQueueSize[i] = data[i].rqs;
		realtimeScheduleNum[i] = data[i].rsn;
		realtimeWindowQueueSize[i] = data[i].rwqs;
	}
}

function processDbData(data) {

	for (var i = 0; i < data.length; i++) {// dbs

		var dbTag = data[i].dbTag;
		var status = data[i].status;

		var x_dbList = x_db.get(dbTag);
		if (x_dbList == null) {
			x_dbList = [];
		}
		var dbConnList = dbConns.get(dbTag);
		if (dbConnList == null) {
			dbConnList = [];
		}

		var dbBusyConnList = dbBusyConns.get(dbTag);
		if (dbBusyConnList == null) {
			dbBusyConnList = [];
		}

		var dbIdleConnList = dbIdleConns.get(dbTag);
		if (dbIdleConnList == null) {
			dbIdleConnList = [];
		}

		var hm = "";
		for (var j = 0; j < status.length; j++) {
			var d = new Date(status[j].t);
			var hm2 = d.getHours() + ":" + d.getMinutes();
			if (hm2 != hm) {
				hm = d.getHours() + ":" + d.getMinutes();
				x_dbList[j] = d.getHours() + ":" + d.getMinutes() + ":"
						+ d.getSeconds();
			} else {
				x_dbList[j] = d.getSeconds();
			}

			dbConnList[j] = status[j].all;
			dbBusyConnList[j] = status[j].busy;
			dbIdleConnList[j] = status[j].idle;
		}

		x_db.put(dbTag, x_dbList);
		dbConns.put(dbTag, dbConnList);
		dbBusyConns.put(dbTag, dbBusyConnList);
		dbIdleConns.put(dbTag, dbIdleConnList);

	}
}

window.onload = function() {

	accessServerForMemory();
	accessServerForThread();
	accessServerForDb();

	taskQueueStatus();
	memoryStatus();
	threadStatus();
	dbStatus();

	setInterval("accessServerForMemory()", 10000);
	setInterval("accessServerForThread()", 10000);
	setInterval("accessServerForDb()", 10000);

	setInterval("taskQueueStatus()", 10000);
	setInterval("memoryStatus()", 10000);
	setInterval("threadStatus()", 10000);
	setInterval("dbStatus()", 10000);
};

function accessServerForMemory() {
	var nodeTag = $('#nodeTag').val();
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/memory?nodeTag=' + nodeTag,
		success : function(data) {
			processMemData(data.nodes);
		}
	});
}

function accessServerForThread() {
	var nodeTag = $('#nodeTag').val();
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/thread?nodeTag=' + nodeTag,
		success : function(data) {
			if (data != null && data.nodes != null && data.nodes.length > 0) {
				processThreadData(data.nodes);
			}
		}
	});
}

function accessServerForDb() {
	var nodeTag = $('#nodeTag').val();
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/db?nodeTag=' + nodeTag,
		success : function(data) {
			if (data != null && data.dbs != null && data.dbs.length > 0) {
				processDbData(data.dbs);
			}
		}
	});
}

function hide_show(o) {
	o.toggle(300);
}
function remove(o) {
	o.remove();
}