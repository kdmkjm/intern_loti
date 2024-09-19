 
//-- ��ũ��Ʈ include
document.write('<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>');
document.write('<link rel="stylesheet" href="/common/css/jquery-ui.css" />');
document.write('<script src="/common/js/jquery-ui.js"></script>');
document.write('<script src="/common/js/jquery.form.js"></script>');
//-- ��Ÿ���±� ����
var css = '#mask {position: absolute;z-index: 9000;background-color: #000;display: none;left: 0;top: 0;} .window {display: none;border: 2px;position: absolute;left: 100px;top: 100px;width: 350px;height: 70px;z-index: 10000;background-color: #FFFFFF;text-align: center;align: center;vertical-align: middle;} div.table {margin: 0;padding: 0;} div.table ul {clear: left;margin: 0;padding: 0;list-style-type: none;} div.table ul li {float: left;margin: 3px;}',
	head = document.getElementsByTagName('head')[0],
	style = document.createElement('style');

style.type = 'text/css';
if (style.styleSheet){
	style.styleSheet.cssText = css;
} else {
	style.appendChild(document.createTextNode(css));
}
head.appendChild(style);
// -- ��Ÿ���±� ���� ��

function BoardFile(baseAction, files_divID, file_listID, progressLayerID){
	this.baseAction = baseAction;
	this.$div_files = jQuery('#'+files_divID);
	this.$file_list = jQuery('#'+file_listID);
	this.$progressLayer = jQuery('#'+progressLayerID);

//	CKEDITOR.instances.content.on('select click keyup', function(){
//		if(this.createTextRange){
//			this.caretPos = document.selection.createRange().duplicate();
//		}
//	});
	var befunload = function(){
		var deletefileidx = '';
		this.$div_files.find('option').each(function(){
			deletefileidx += '&file_Idx_array='+this.value;
		});
		jQuery.ajax({
			url : bf.baseAction,
			async : false,
			data : 'task=onPageUnload'+deletefileidx,
			dataType : 'text',
			success : function(data){
			}
		});
		return false;
	};
	jQuery(window).on('beforeunload', befunload);
	
	
	this.setEvents();
	
	return this;
}

BoardFile.prototype.constructor = BoardFile;

BoardFile.prototype.getFileUploadProgress = function(){
	var bf = this;
	jQuery.ajax({
		url : bf.baseAction,
		data : 'task=uploadstatus',
		dataType:'json',
		success : function(data){
			jQuery('#progressText').text('��ûó�����Դϴ�(' + data.item + ')...');
			jQuery('#progressbar').progressbar({
				value: parseInt(data.percent)
			});
		}
	});
};
BoardFile.prototype.setEvents = function(){
	var bf = this;
	// ÷������ �߰���ư. (����ũ�� üũ, ���÷��� ������Ʈ)
	jQuery('#FileAddBtn').click(function(){
		
		var $file = bf.$div_files.find('input[type="file"]:last');
		
		if($file.val() != ''){
			// ���ϸ�
			var $fileForm = jQuery(document.forms[0]);
			var option = {
					dataType:'text',
					success : function(data){
						var result = data.split('$');
						if(result[0] == 'error' || result[0] == undefined){
							alert('���� ���ε� ����');
						}
						else if(result[0] == 'ok'){					
							bf.$file_list.append('<option value="'+result[3]+'">'+result[1]+'('+result[2]+' byte)'+'</option>');
						}
						bf.$div_files.find('ul:first > li:first').append('<input type="file" name="file" style="width:300px;"/>');
						$file.remove();
						$fileForm.find('input[name="fileYN"]').val('Y');
						clearInterval(intervalID);
						jQuery('#mask').hide();
						jQuery('.window').hide(); 
					},
					error : function(){
						clearInterval(intervalID);
						jQuery('#mask').hide();
						jQuery('.window').hide(); 
						bf.$div_files.find('ul:first > li:first').append('<input type="file" name="file" style="width:300px;"/>');
						$file.remove();
					}
				};
			$fileForm.attr('action','/'+bf.baseAction+'?task=uploadFile');
			
			jQuery($fileForm).ajaxForm(option).submit();
			
		}
	});
	
	// ÷������ ����. (& ���÷��� ������Ʈ)
	jQuery('#FileDelBtn').click(function(){
		
		bf.$file_list.find('option:selected').each(function(idx){
			jQuery.ajax({
				url : bf.baseAction,
				data : 'task=delFile&file_Idx='+this.value,
				dataType : 'text',
				success : function(data){
					if(data == "ok"){
						// ���� ó�� (if necessary)
					}
					else{
						// ���� ó�� (if necessary)
					}
				}
			});
		}).remove();
	});
	
	// ajax ��û ����& ���� �� ���ε� ���� ���÷��� ������Ʈ 
	var intervalID = 0;
	bf.$progressLayer.ajaxStart(function(){
		
		intervalID = setInterval(function(){
			bf.getFileUploadProgress();
		}, 50);
		
		// �������
		var left = ( jQuery(window).scrollLeft() + (jQuery(window).width() - jQuery(this).width()) / 2 );
		var top = ( jQuery(window).scrollTop() + (jQuery(window).height() - jQuery(this).height()) / 2 );
		jQuery(this).css({'left':left,'top':top, 'position':'absolute'});
		jQuery('body').css('position','relative').append(jQuery(this));
		
		// ȭ���� ���̿� �ʺ� ���Ѵ�.
		var maskHeight = jQuery('form:first').height();  
		var maskWidth = jQuery('form:first').width();  
		
		// ����ũ�� ���̿� �ʺ� ȭ�� ������ ����� ��ü ȭ���� ä���.
		jQuery('#mask').css({'width':maskWidth,'height':maskHeight});  
		
		// �ִϸ��̼� ȿ�� - �ϴ�  ��İ� �ƴٰ� 80% �������� ����.
		//jQuery('#mask').fadeIn(50);
		jQuery('#mask').fadeTo("fast",0.6);
		
		// ���̾� ����.
		jQuery('.window').show();
	})
	.ajaxStop(function(){
		clearInterval(intervalID);
		jQuery('#mask').hide();
		jQuery('.window').hide(); 
	});
	
	
	
	var SubmitCallback = function(){
		var frm = document.forms[0];
		var title = frm.title.value;
		title = title.replace(" ","");
		
		if(jQuery.trim(title) == "")
		{
			alert('������ �Է��ϼ���.');
			frm.title.focus();
			return;
		}
		if(jQuery.trim(CKEDITOR.instances.content.getData()) == '' && CKEDITOR.instances.content.checkDirty() == false) // true: ��������, false: ���� ����
		{
		   alert('������ �Է��� �ּ���.');
		   CKEDITOR.instances.content.focus();
		   return;
		}
		
		if(confirm('�����Ͻðڽ��ϱ�?')){
			
			bf.$div_files.find('input[type="file"]:last').remove();
			jQuery('#content').val(CKEDITOR.instances.content.getData());
			bf.$file_list.find('option').each(function(idx){
				bf.$div_files.append('<input type="hidden" name="file_Idx_array" value="'+ this.value +'">');
			});
			frm.action = '/'+bf.baseAction+'?task=insert';
			frm.submit();
		}
	};
	
	// Submit On Click
	jQuery('#SubmitBtn, #ModifyBtn').click(SubmitCallback);
	
};


BoardFile.prototype.embedImageOnEditor = function(){
	var errorCheck = true;
	var errorMsg = '';
	var idxs = [];
	var $options = this.$file_list.find('option');
	this.$file_list.find('option:selected').each(function(idx){
		idxs[idx] = $options.index(this);
	});
	
	if(idxs.length < 1){
		errorMsg = '������ ÷���� �̹��� ������ �������ּ���';
		errorCheck = false;
	}
	
	var $tempDiv = jQuery('<div/>');
	var $file_container = this.$div_files;
	jQuery.each(idxs, function(idx){
		$tempDiv.append($file_container.find('[name="files'+this+'"]'));
	});
	
	$tempDiv.find('input[type="file"]').each(function(){
		var val = this.val().split("\\");
		var ext = val[val.length-1].split('.').pop();	// Ȯ����
		switch(ext){
		case 'jpg':
		case 'png':
		case 'gif':
		case 'jpeg':
			break;
		default:
			errorMsg = 'jpg, jpeg, png, gif ���ϸ� ������ ÷�� �����մϴ�';
			errorCheck = false;
			return;
			break;
		}
	});
	
	if(errorCheck == false){
		alert(errorMsg);
		return;
	}
	
	// ajaxForm Options
	var options = {
		url : '/' + this.baseAction,
		data : 'task=attachImage',
		dataType:'json',
		success : function(data){
			if(data == 'error'){
				alert('�̹��� ��� ����');
			}
			else{
				// on completly success : ���� Ŀ�� ��ġ�� �̹����±� ����
				// data = { src, width, height }
				var imgTagString = '<img src="'+data.src+'" width="'+data.width+'" height="'+data.height+'"/>';
				if(CKEDITOR.instances.content.createTextRange && CKEDITOR.instances.content.caretPos){
					var caretPos = CKEDITOR.instances.content.caretPos; 
					caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ''? imgTagString+'' : imgTagString;
				}
				else{
					CKEDITOR.instances.content.setData(CKEDITOR.instances.content.getDate()+imgTagString);
				}
			}
		},
		error : function(){
			alert('�̹��� ��� ����');
		}
	};
	
	var $file_upload_form = jQuery('<form/>')
								.hide()
								.appendTo('body')
								.append($tempDiv);
	$file_upload_form.ajaxForm(options).submit();
	
};