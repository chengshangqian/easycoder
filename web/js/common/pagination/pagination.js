$(function(){
	//��ʼ����ҳ��
	initPagination();
});

/**
 * ��ʼ����ҳ��
 * @author ����ǫ
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
 * ÿҳ��¼��
 * @author ����ǫ
 */
function changePageCount(evt){
	window.setTimeout(function(){
	    var pageIndex = 1;
	    page(pageIndex);
	}, 150);
}

/**
 * GO/��ת����
 * @author ����ǫ
 */
function jumpPage(evt){
	evt.preventDefault();
	
    var pageIndex = $.trim($('#pageIndex').val());
    
    if (!pageIndex) {
    	$('#pageIndex').val('');
    	esAlert("��������ת��ҳ������");
        return;
    }
    
    if(isNaN(pageIndex)) {
    	$('#pageIndex').val('');
    	esAlert("��תҳ�����Ϊ��ֵ��");
        return;
    }
    
    page(parseInt(pageIndex));
}

/**
 * ��ҳ
 * @author ����ǫ
 */
function firstPage(evt){
    evt.preventDefault();
    
    var pageIndex = 1;
    page(pageIndex);
}

/**
 * ��һҳ
 * @author ����ǫ
 */
function previousPage(evt){
	evt.preventDefault();
	
	var current = parseInt($('#current').val());
    var pageIndex = current - 1;
    page(pageIndex);
}

/**
 * ��һҳ
 * @author ����ǫ
 */
function nextPage(evt){
	evt.preventDefault();
	
    var current = parseInt($('#current').val());
    var pageIndex = current + 1;
    page(pageIndex);    	
}

/**
 * ĩҳ
 * @author ����ǫ
 */
function lastPage(evt){
	evt.preventDefault();
	
    var pageIndex = parseInt($('#pages').val());
    page(pageIndex);        	
}

/**
 * ���ĳһҳ
 * @author ����ǫ
 */
function clickPage(evt){
	evt.preventDefault();
	
	var title = $(this).attr('title');
	var pageIndex = parseInt(title);
	
	page(pageIndex);
}

/**
 * �ύĳҲ��ѯ
 * @author ����ǫ
 * @param pageIndex,int����
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