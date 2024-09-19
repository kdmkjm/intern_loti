// �����˻� selectbox ����
$.noConflict();

var searchYear, searchCourseCode, searchCourseCardinal;  // �⵵, �����ڵ�, �������

// �����⵵ SelectBox OnChange CallBack
var searchYearOnChange = function(){
	jQuery.ajax({
		url : '/cmnCourse.act',
		data : 'task=selectCourseName&searchYear='+jQuery('#searchYear').val()+'&isCyber='+jQuery('input[name="isCyber"]').val(),
		dataType : 'json',
		success : function(data){
			jQuery('#searchCourseName').html('<option value="">과정 선택</option>');
			jQuery.each(data, function(key, val){
				jQuery('#searchCourseName').append('<option value='+val+'>'+key+'</option>');
			});
			var cname = jQuery('#searchCourseName').focus().val(searchCourseCode).val();
			if(cname != ''){
				jQuery('#searchCourseName').trigger('change');
			}
		}
	});
	jQuery('#searchKeyword').html('<option value="">과정기수 선택</option>');
}
// ������ SelectBox OnChange CallBack
var searchCourseNameOnChange = function(){
	if(jQuery(this).val() != ''){
		jQuery.ajax({
			url : '/cmnCourse.act',
			data : 'task=selectCourseCardinal&searchCourseName='+jQuery('#searchCourseName').val(),
			dataType : 'json',
			success : function(data){
				jQuery('#searchKeyword').html('<option value="">과정기수 선택</option>');
				jQuery.each(data, function(key, val){
					jQuery('#searchKeyword').append('<option value='+val+'>'+key+'</option>');
				});
				if(jQuery('#searchCourseName').val() == searchCourseCode){
					jQuery('#searchKeyword').val(searchCourseCardinal);
				}else{
					jQuery('#searchKeyword').focus();
				}
				//jQuery('#searchKeyword').val("1");
			}
		});
	}else{
		jQuery('#searchKeyword').html('<option value="">과정 선택</option>');
	}
}

// �˻� OnSubmit CallBack
var formOnSubmit = function(){
	jQuery('input[name="searchCourseCode"]').val(getSearchCourseCode());
	jQuery('input[name="searchColumn"]').val(jQuery('#searchYear').val());
	return true;
}

jQuery(function(){
	searchYear = jQuery('input[name="searchColumn"]').val();
	if(jQuery('input[name="searchCourseCode"]').val() == null){
		searchCourseCode = '';
		searchCourseCardinal = '';
	}
	else{
		searchYear = jQuery('input[name="searchCourseCode"]').val().substr(3, 4);
		searchCourseCode = jQuery('input[name="searchCourseCode"]').val().substr(0,10);
		searchCourseCardinal = jQuery('input[name="searchCourseCode"]').val().substr(11,1);
	}
	var odate = new Date();
	var cyear = odate.getFullYear();
	
	// Setting OnChange, OnSubmit CallBack
	jQuery('#searchYear').on('change', searchYearOnChange);
	jQuery('#searchCourseName').on('change', searchCourseNameOnChange);
	jQuery(document.forms[0]).submit(formOnSubmit);
	
	// �⵵ SelectBox Setting
	for(var i=cyear; i>=1962; i--){
		jQuery('#searchYear').append('<option value="'+i+'">'+i+'</option>');
	}
	
	jQuery('#searchYear').val(searchYear).trigger('change');
});
  
function doSearch(){
	if(jQuery('#searchCourseName').val() == '')
	{
		alert('과정을 선택해주세요');
		return;
	}
	if(jQuery('#searchKeyword').val() == '')
	{
		alert('과정기수를 선택해주세요');
		return;
	}
	jQuery(document.forms[0]).submit();
}

function getSearchCourseCode(){
	var returnVal;
	if(parseInt(jQuery('#searchKeyword').val())>9){
		returnVal = ''+jQuery('#searchCourseName').val()+jQuery('#searchKeyword').val()+'000';
	}else{
		returnVal = jQuery('#searchCourseName').val()+'0'+jQuery('#searchKeyword').val()+'000';
	}
	return returnVal;
}
