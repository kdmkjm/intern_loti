//	var clocktext;
//	if (document.FORM.LoginTime)	{
//		document.FORM.LoginTime.value = getLoginTime();
//	}
//    start = new Date();

	Today = '오늘은 ' + getCurDate() + ' ('+getCurWeek()+') 입니다.    [현재시각] ';

	function scroll() {
		clocktimer = setTimeout("scroll()", 500);
/*		if (document.FORM.CurTime){
			cur = getCurTime();
			document.FORM.CurTime.value = cur;
		}
		if (document.FORM.CurDate){
			cur = getCurDate();
			document.FORM.CurDate.value = cur;
		}

		if (document.FORM.CurWeek){
			cur = getCurWeek();
			document.FORM.CurWeek.value = cur;
		}
*/
		cur = Today + getCurTime();
		window.status = cur;

	}
	scroll();

//	document.FORM.CurTime.blur();
//	document.FORM.CurDate.blur();
//	document.FORM.CurWeek.blur();
//	function getLoginTime(){
//		today = new Date();
//		sec = today.getSeconds();
//		hr = today.getHours();
//		min = today.getMinutes();
//		if (hr <= 9) hr = "0" + hr;
//		if (min <= 9) min = "0" + min;
//		if (sec <= 9) sec = "0" + sec;
//		clocktext = hr + ":" + min + ":" + sec;
//		return clocktext;
//	}

	function getCurTime(){
		var CurTime="";
		today = new Date();
		sec = today.getSeconds();
		hr = today.getHours();
		min = today.getMinutes();
		if (hr>=12){
			a_p = "오후";
			if (hr > 12)
				hr = hr - 12;
		}	else	{
			a_p = "오전";
		}
		if (hr <= 9) hr = "0" + hr;
		if (min <= 9) min = "0" + min;
		if (sec <= 9) sec = "0" + sec;
		CurTime = a_p + " " + hr + ":" + min + ":" + sec;

//		timer = parseInt((today - start)/1000);
//		hr  = parseInt(timer / 3600);
//		min = parseInt((timer - (hr * 3600)) / 60);
//		sec = (timer - (hr * 3600) - (min * 60));

//		if (hr <= 9) hr = "0" + hr;
//		if (min <= 9) min = "0" + min;
//		if (sec <= 9) sec = "0" + sec;
//		ElapsTime = hr + ":" + min + ":" + sec;

//		document.FORM.ElapsTime.value = ElapsTime;

		return CurTime;
	}

	function getCurDate(){
		var CurDate="";
		today = new Date();
		year = today.getYear();
		month = today.getMonth()+1;
		date = today.getDate();

		if (month <= 9) month = "0" + month;
		if (date <= 9) date = "0" + date;
		CurDate = year + "년 " + month + "월 " + date + "일";

		return CurDate;
	}

	function getCurWeek(){
		var CurWeek="";
		today = new Date();
		day = today.getDay();
		switch (day)	{
		case 0 :
				CurWeek = "일";
				break;
		case 1 :
				CurWeek = "월";
				break;
		case 2 :
				CurWeek = "화";
				break;
		case 3 :
				CurWeek = "수";
				break;
		case 4 :
				CurWeek = "목";
				break;
		case 5 :
				CurWeek = "금";
				break;
		case 6 : 
				CurWeek = "토";
				break;
		}
		return CurWeek;
	}
