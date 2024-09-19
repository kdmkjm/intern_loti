/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.removePlugins = 'toolbar,elementspath,resize';
	config.contentsLanguage = 'ko';
	config.skin = 'v2';
	config.uiColor = '#FFFFFF';
	config.resize_enabled = true;
	config.extraPlugins = 'autogrow';
	config.autoGrow_onStartup = true;
	config.width = '100%';
/*
	
	config.enterMode = CKEDITOR.ENTER_BR;
	config.docType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
	//config.uiColor = '#FFFFFF';
	config.font_names = '굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';
	config.fontSize_defaultLabel = '12px';
	config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
	config.toolbar =
	[
		['Source','-','Cut','Copy','Paste','PasteText','PasteFromWord'],
		['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
		['NumberedList', 'BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		'/',
		['BidLtr','BidRtl','Link','Unlink','Anchor','-','Table','HorizontalRule','SpecialChar','PageBreak'],
		['Font','FontSize','Undo','Redo']
	];
	//config.theme = 'default';
	
	*/
};


