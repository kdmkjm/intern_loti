// JavaScript Document

ovImg = function ovimgSet(param, format){
		var ov = $(param+" a[class^=ov]");
		var ov_index = 0;
		$(ov).eq(0).children().attr("src", $(ov).eq(0).children().attr("src").replace("."+format, "on."+format));
		if(ov){
			$(ov).mouseover(function(){
				var current_index = $(ov).index($(this));
				$(this).children().attr("src", $(this).children().attr("src").replace("."+format, "on."+format));
				$(ov).eq(ov_index).children().attr("src",$(ov).eq(ov_index).children().attr("src").replace("on."+format, "."+format));
				ov_index = current_index;
			});
		}
	}
	/************************************************	

	/************************************************

	*************************************************/
	// global navigation bar set
	function gnbSet(param, gnbIndex, useImg, format){
		$(param).addClass("activation");
		$(param+"> ul > li > ul").hide();
		$(param+"> ul > li:eq("+gnbIndex+") > ul").show();
		if(useImg == "Y"){
			if($(param+"> ul > li:eq("+gnbIndex+") a > span > img").attr("src")){
				$(param+"> ul > li:eq("+gnbIndex+") a > span > img").attr("src", $(param+"> ul > li:eq("+gnbIndex+") a > span > img").attr("src").replace("." + format, "on." + format));
			}else{
				$(param+"> ul > li").removeClass("hover");
				$(param+"> ul > li:eq("+gnbIndex+")").addClass("hover");
			}
		}
		var target = $(param+"> ul > li > a");
		target.bind("mouseover", function(){
			gnbInit(this, param, target, useImg, format);
		}).bind("focus", function(){
			gnbInit(this, param, target, useImg, format);
		});
	}
	function gnbInit(obj, param, target, flag, format){
		var currIndex = $(target).index($(obj));
		if(flag == "Y"){
			if($(param+"> ul > li:eq("+currIndex+") a > span > img").attr("src")){
				$(param+"> ul > li:eq("+currIndex+") a > span > img").attr("src", $(param+"> ul > li:eq("+currIndex+") a > span > img").attr("src").replace("." + format, "on." + format));
				$(param+"> ul > li:eq("+gnbIndex+") a > span > img").attr("src", $(param+"> ul > li:eq("+gnbIndex+") a > span > img").attr("src").replace("on." + format, "." + format));
			}else{
				$(param+"> ul > li").removeClass("hover");
				$(param+"> ul > li").removeClass("on");
				$(param+"> ul > li:eq("+currIndex+")").addClass("hover");
			}
		}
		$(param+"> ul > li:eq("+currIndex+") > ul").show();
		if(currIndex == gnbIndex){
			$(param+"> ul > li:eq("+gnbIndex+") > ul").show();
		} else {
			$(param+"> ul > li:eq("+gnbIndex+") > ul").hide();
		}
		gnbIndex = currIndex;
	}

	
	
	
	
	
	
	/************************************************

	*************************************************/
	// global navigation bar set
	function tabSet(param, tabIndex, useImg, format){
		$(param).addClass("activation");
		$(param+"> li > ul").hide();
		$(param+"> li:eq("+tabIndex+") > ul").show();
		if(useImg == "Y"){
			$(param+"> li:eq("+tabIndex+") strong > a > img").attr("src", $(param+"> li:eq("+tabIndex+") strong > a > img").attr("src").replace("." + format, "on." + format));
		}
		var target = $(param+"> li > strong > a");
		target.bind("mouseover", function(){
			tabInit(this, param, target, useImg, format);
		}).bind("focus", function(){
			tabInit(this, param, target, useImg, format);
		});
	}
	function tabInit(obj, param, target, flag, format){
		var currIndex = $(target).index($(obj));
		if(flag == "Y"){
			$(param+"> li:eq("+currIndex+") strong > a > img").attr("src", $(param+"> li:eq("+currIndex+") strong > a > img").attr("src").replace("." + format, "on." + format));
			$(param+"> li:eq("+tabIndex+") strong > a > img").attr("src", $(param+"> li:eq("+tabIndex+") strong > a > img").attr("src").replace("on." + format, "." + format));
		}
		$(param+"> li:eq("+currIndex+") > ul").show();
		if(currIndex == tabIndex){
			$(param+"> li:eq("+tabIndex+") > ul").show();
		} else {
			$(param+"> li:eq("+tabIndex+") > ul").hide();
		}
		tabIndex = currIndex;
	}

	
	
	
		
	
	
	
	
	
	
	