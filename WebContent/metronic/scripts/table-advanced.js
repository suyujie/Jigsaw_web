var TableAdvanced = function () {
	 
	 var initTable1 = function() {
		 var oTable = $('#sample_1').dataTable( {           
			 //"aoColumnDefs": [
			 //    { "aTargets": [ 0 ] }
			 //],
			 // set the initial value
			 //"iDisplayLength": 10,
			 //"bProcessing" : true, //DataTables载入数据时，是否显示‘进度’提示
			 //"bServerSide" : true, //是否启动服务器端数据导入
			 //"bStateSave" : true, //是否打开客户端状态记录功能,此功能在ajax刷新纪录的时候不会将个性化设定回复为初始化状态
			 //"bJQueryUI" : true, //是否使用 jQury的UI theme
			 //"sScrollY" : 450, //DataTables的高
			 //"sScrollX" : 600, //DataTables的宽
			 //"aLengthMenu" : [20, 40, 60], //更改显示记录数选项
			 //"iDisplayLength" : 40, //默认显示的记录数
			 "bAutoWidth" : true, //是否自适应宽度
			 "bScrollInfinite" : true, //是否启动初始化滚动条
			 "bScrollCollapse" : true, //是否开启DataTables的高度自适应，当数据条数不够分页数据条数的时候，插件高度是否随数据条数而改变
			 "bPaginate" : false, //是否显示（应用）分页器
			 "bInfo" : false, //是否显示页脚信息，DataTables插件左下角显示记录数
			 "sPaginationType" : "full_numbers", //详细分页组，可以支持直接跳转到某页
			 "bSort" : true, //是否启动各个字段的排序功能
			 "aaSorting" : [[0, "asc"]], //默认的排序方式，第2列，升序排列
		 });
		 
		 jQuery('#sample_1_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
		 jQuery('#sample_1_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
		 jQuery('#sample_1_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
		 
		 $('#sample_1_column_toggler input[type="checkbox"]').change(function(){
			 var iCol = parseInt($(this).attr("data-column"));
			 var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
			 oTable.fnSetColumnVis(iCol, (bVis ? false : true));
		 });
	 }

     var initTable2 = function() {
        var oTable = $('#sample_2').dataTable( {           
            "aoColumnDefs": [
                { "aTargets": [ 0 ] }
            ],
            "aaSorting": [[1, 'asc']],
             "aLengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });

        jQuery('#sample_2_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
        jQuery('#sample_2_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
        jQuery('#sample_2_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

        $('#sample_2_column_toggler input[type="checkbox"]').change(function(){
            /* Get the DataTables object again - this is not a recreation, just a get of the object */
            var iCol = parseInt($(this).attr("data-column"));
            var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
            oTable.fnSetColumnVis(iCol, (bVis ? false : true));
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            
            if (!jQuery().dataTable) {
                return;
            }

            initTable1();
            initTable2();
        }

    };

}();