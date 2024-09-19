
//-- ��ũ��Ʈ include
document.write('<script type="text/javascript" src="/common/js/jquery-1.7.1.min.js"></script>');

//-- ��Ÿ���±� ����
var css = 'div.table {	margin: 0; padding: 0;} div.table ul {clear: left; margin: 0; padding: 0; list-style-type: none;} div.table ul li {float: left; text-align: left;}'+
		'#commentList {width : 100%; margin: 0px; padding: 0px 15px; display:block; background-color:#EBECE4; overflow:hidden; margin-top:10px; border:2px solid #91B475; border-top:0px solid white;}'+
		'#commentList .row{overflow:hidden; width : 100%; margin: 0px; clear:both; border-bottom:1px dotted black;}'+
		'#commentList .row .leftMargin{ float:left;} #commentList .row div{float:left;} #commentForm{margin:10px;}'+
		'#commentForm textarea{overflow:hidden;}',
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


var boardCommentInstance;
function BoardComment(baseAction, baseData,commentListID, commentFormID){
	this.baseAction = baseAction;
	this.baseData = baseData;
	this.$commentList = jQuery('#'+commentListID);
	this.$commentForm = jQuery('#'+commentFormID);
	this.$commentHeader = jQuery('<div/>');
	
	this.$commentHeader.css({
		'display' : 'inline',
		'float' : 'left',
		'overflow' : 'hidden',
		'background-color' : '#91B475',
		'margin-top' : '15px',
		'padding' : '0px 15px',
		'width' : this.$commentList.width(),
		'height' : '20px',
		'inline-height' : '20px',
		'font-weight' : 'bold',
		'border' : '2px solid #91B475',
		'border-bottom' : '0px solid #91B475'
	});
	
	this.$commentHeader.html(
			'<span style="display:inline; vertical-align:middle;"><img src="/images/poll/poll_dot3.gif" style="width: 15px; height: 15px; vertical-align: middle;" />' +
			'��� ' + this.$commentList.find('.commentContent').length + '</span>'
			)
	.insertBefore(this.$commentList);
	
	this.$commentForm.find('ul:last li:first').before('<li>* 1000 Byte���� �Էµ˴ϴ�.(<span>0</span>/1000)</li>')
		.end().find('textarea[name="content"]').on('keyup keydown',function(){
	        var minusnum = 0, multibyte = 0, singlebyte = 0;
	        var $s = jQuery(this).val();
	        
	        for(var i=0;i<$s.length;i++){
	        	var charCode = $s.charCodeAt(i);
	        	if(charCode == 13 || charCode == 10){
	        		minusnum++;
	        	}
	        	
	        	if(charCode > 255){
	        		multibyte++;
	        	}else{
	        		singlebyte++;
	        	}
	        }
	        jQuery('div.table').has(this).find('span').text((multibyte*2) + singlebyte - minusnum);
		});
		
	
	boardCommentInstance = this;
	return this;
}

BoardComment.prototype.constructor = BoardComment;
BoardComment.prototype.makeForm = function(task, toAttachEle){	
	return jQuery(document.createElement('form'))
			.attr({action: '/'+this.baseAction+'?task='+task+'&'+this.baseData,
					method:'post'
				  })
			.hide()
			.appendTo('body')
			.append(toAttachEle);
};


//DEFINE : selectors = {submitBtn: '', writeBtn: '', updateBtn: '', deleteBtn:''}
BoardComment.prototype.setEvents = function(selectors){
	var bcObj = this;
	var onSubmitContentCheck = function($form){
		if(jQuery.trim($form.find('[name="content"]').val()) == ''){
			alert('�ּ� 1�� �̻� �Է����ּ���.');
			return false;
		}
	};
	// ��� ��Ϲ�ư ����
	bcObj.$commentForm.find(selectors.submitBtn).click(function(){
		var $commentFormCln = bcObj.$commentForm.clone();
		bcObj.makeForm('insertComment', $commentFormCln).submit(onSubmitContentCheck($commentFormCln)).submit();
	});
	
	// ��� �ۼ� ��ư ����
	bcObj.$commentList.find(selectors.writeBtn).each(function(){
		jQuery(this).click(function(){
			// �Է��� �ʱ�ȭ
			bcObj.$commentList.find('.commentContent:hidden').each(function(){
				jQuery(this).show().next().remove()
							.end().next().show();
			});
			bcObj.$commentList.find('div.table').each(function(){
				jQuery(this).remove();
			});
			
			
			var $commentFormCln = bcObj.$commentForm.clone(true);
			$commentFormCln.find('textarea[name="content"]').text('');
			var $containedRow = bcObj.$commentList.find('div.row').has(this);
			$commentFormCln.appendTo($containedRow)
				.append('<input type="hidden" name="re_Idx" value="'+$containedRow.find('input[name="comment_Idx"]').val()+'"/>')
				.find('input[type="button"]').off('click')
					.click(function(){
						bcObj.makeForm('insertComment', $commentFormCln)
							.submit(onSubmitContentCheck($commentFormCln))
							.submit();
					});
			$commentFormCln.find('textarea[name="content"]').trigger('keyup');
		});
	});
	
	// ��� ���� ��ư ����
	bcObj.$commentList.find(selectors.updateBtn).each(function(){
		jQuery(this).click(function(){
			// �Է��� �ʱ�ȭ
			bcObj.$commentList.find('.commentContent:hidden').each(function(){
				jQuery(this).show().next().remove()
							.end().next().show();
			});
			bcObj.$commentList.find('div.table').each(function(){
				jQuery(this).remove();
			});
			
			
			var $commentContentTD = bcObj.$commentList.find('div.row').has(this).find('.commentContent');
			var $commentFormCln = bcObj.$commentForm.clone(true);
			$commentFormCln.find('textarea[name=content]').text($commentContentTD.text())
			.end().append(bcObj.$commentList.find('div.row').has(this).find('input[name="comment_Idx"]'))
			.find('input[type="button"]').off('click')
				.click(function(){
					bcObj.makeForm('updateComment', $commentFormCln)
						.submit(onSubmitContentCheck($commentFormCln))
						.submit();
				});
			
			$commentContentTD.next().hide();
			$commentContentTD.hide().after(jQuery('<td/>').append($commentFormCln));
			$commentFormCln.find('textarea[name="content"]').trigger('keyup');
		});
	});
	
	// ��� ���� ��ư ����
	bcObj.$commentList.find(selectors.deleteBtn).each(function(){
		jQuery(this).click(function(){
			if(confirm('�����Ͻðڽ��ϱ�?')){
				bcObj.makeForm('deleteComment', bcObj.$commentList.find('div.row').has(this).find('input[name="comment_Idx"]')).submit();
			}
		});
	});
};


function checkDelete(){
	if(jQuery('#mainTable input[name="board_Idx_array"]:checked').size() == 0){
		alert('������ �Խù��� �������ּ���');
	}
	else{
		if(confirm('�����Ͻðڽ��ϱ�?')){
			var $form = jQuery('<form action="/'+boardCommentInstance.baseAction+'?task=delete" method="post"/>').appendTo('body');
			$form.append(jQuery('#mainTable input[name="board_Idx_array"]:checked').clone(true));
			$form.submit();
		}
	}
}