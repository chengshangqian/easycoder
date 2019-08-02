$(function(){
	//初始化分页条
	initPagination();
});

/**
 * 初始化分页条
 * @author 成尚谦
 */
function initPagination(){
	
	$('#pageCount').change(changePageCount);
	
    $('#jumpPage').click(jumpPage);
    
    $('#firstPage').click(firstPage);
    
    $('#previousPage').click(previousPage);
    
    $('a.paginationNumberCls').each(function(){
        var el = $(this);
        el.click(clickPage);
    });	    
    
    $('#nextPage').click(nextPage);
    
    $('#lastPage').click(lastPage);
    
}

/**
 * 每页记录数
 * @author 成尚谦
 */
function changePageCount(evt){
	window.setTimeout(function(){
	    var pageIndex = 1;
	    page(pageIndex);
	}, 150);
}

/**
 * GO/跳转操作
 * @author 成尚谦
 */
function jumpPage(evt){
	evt.preventDefault();
	
    var pageIndex = $.trim($('#pageIndex').val());
    
    if (!pageIndex) {
    	$('#pageIndex').val('');
    	esAlert("请输入跳转的页面数！");
        return;
    }
    
    if(isNaN(pageIndex)) {
    	$('#pageIndex').val('');
    	esAlert("跳转页面必须为数值型");
        return;
    }
    
    page(parseInt(pageIndex));
}

/**
 * 首页
 * @author 成尚谦
 */
function firstPage(evt){
    evt.preventDefault();
    
    var pageIndex = 1;
    page(pageIndex);
}

/**
 * 上一页
 * @author 成尚谦
 */
function previousPage(evt){
	evt.preventDefault();
	
	var current = parseInt($('#current').val());
    var pageIndex = current - 1;
    page(pageIndex);
}

/**
 * 下一页
 * @author 成尚谦
 */
function nextPage(evt){
	evt.preventDefault();
	
    var current = parseInt($('#current').val());
    var pageIndex = current + 1;
    page(pageIndex);    	
}

/**
 * 末页
 * @author 成尚谦
 */
function lastPage(evt){
	evt.preventDefault();
	
    var pageIndex = parseInt($('#pages').val());
    page(pageIndex);        	
}

/**
 * 点击某一页
 * @author 成尚谦
 */
function clickPage(evt){
	evt.preventDefault();
	
	var title = $(this).attr('title');
	var pageIndex = parseInt(title);
	
	page(pageIndex);
}

/**
 * 提交某也查询
 * @author 成尚谦
 * @param pageIndex,int类型
 */
function page(pageIndex) {
    
    if(pageIndex <= 0){
        pageIndex = 1;
    }
    
    var pages = parseInt($('#pages').val());
    if(pageIndex > pages){
        pageIndex = pages;
    }
    
    $('#current').val(pageIndex);
    
    var queryForm = $('#queryForm') ? $('#queryForm') : $(document.forms[0]);
    
    queryForm.submit();
}    