	String.prototype.trim = function()
	{
		return this.replace(/(^\s*)|(\s*$)/gi, "");
	}
	function doSubmit(frm)
	{
		frm.searchKeywordBookType1.value 	= frm.searchKeywordBookType1.value.trim();
		frm.searchKeywordReqNo.value 			= frm.searchKeywordReqNo.value.trim();
		frm.searchKeywordBookName.value 	= frm.searchKeywordBookName.value.trim();
		frm.searchKeywordPublisher.value 	= frm.searchKeywordPublisher.value.trim();
		frm.searchKeywordAuthor.value 		= frm.searchKeywordAuthor.value.trim();
		frm.searchKeywordUserName.value 	= frm.searchKeywordUserName.value.trim();
		var bookType	= frm.searchKeywordBookType1.value;
		var reqNo 		= frm.searchKeywordReqNo.value;
		var bookName 	= frm.searchKeywordBookName.value;
		var publisher = frm.searchKeywordPublisher.value;
		var author 		= frm.searchKeywordAuthor.value;
		var userName 	= frm.searchKeywordUserName.value;
		
		if(bookType == "" && reqNo == "" && bookName == "" && publisher == "" && author == "" && userName == "")
		{
			alert("검색조건을 입력하세요.");
			frm.searchKeywordBookName.focus();
			return;
		}
		frm.submit();
	}
	
	// 대출 /반납
	function doLend(frm, data)
	{
		var lendType = data;
		var max = Number(document.all.max.value);
		var do_confirm;
		var flag;
		var count = 0;
		
		// 검색결과 1 (배열아님)
		if(max == 1)
		{
			if(document.all.arrayLend.checked == false)
			{
				alert('도서를 선택하세요.');
				return;
			}
			else
			{
				if( lendType == 'startLend' && document.all.arrayLendType.value == '대출중' ) 
				{
					alert('대출중인 도서를 대출할 수 없습니다.');
					document.all.arrayLend.checked = false;
					return;
				}
				else if( lendType == 'endLend' && document.all.arrayLendType.value == '대출가능' )
				{
					alert('대출하지 않은 도서를 반납할 수 없습니다.');
					document.all.arrayLend.checked = false;
					return;
				}
				else if(document.all.arrayLendType.value == '사용불가' )
				{
					alert('해당도서는 사용불가인 도서입니다.');
					document.all.arrayLend.checked = false;
					return;
				}
				
				document.all.arraySelectLend.value = "true";
			}
		}
		// 검색결과 1 이상 (배열)
		else
		{
			// 선택한 값이 있는지 없는지 체크
			for( var i = 0; i < max; i++ )
				if(document.all.arrayLend[i].checked == false)
					count++;
				
			// 선택한 값이 없다면 return
			if(max == count)
			{
				alert('도서를 선택하세요.');
				return;
			}
			else
			{
				for( var i = 0; i < max; i++ )
				{
					if( lendType == 'startLend' && document.all.arrayLend[i].checked == true && document.all.arrayLendType[i].value == '대출중' ) 
					{
						alert('대출중인 도서를 대출할 수 없습니다.');
						document.all.arrayLend[i].checked = false;
						return;
					}
					else if( lendType == 'endLend' && document.all.arrayLend[i].checked == true && document.all.arrayLendType[i].value == '대출가능' )
					{
						alert('대출하지 않은 도서를 반납할 수 없습니다.');
						document.all.arrayLend[i].checked = false;
						return;
					}
					if(document.all.arrayLend[i].checked == true && document.all.arrayLendType[i].value == '사용불가' )
					{
						alert('해당도서는 사용불가인 도서입니다.');
						document.all.arrayLend[i].checked = false;
						return;
					}
					
					if(document.all.arrayLend[i].checked == true)
						document.all.arraySelectLend[i].value = "true";
					else
						document.all.arraySelectLend[i].value = "false";
				}
			}			
		}
		
		// 대출일때
		if( lendType == 'startLend' ) 
		{
			if(frm.lendUser.value == "")
			{
				alert('대출자를 입력하세요');
				frm.lendUser.focus();
				return;
			}
			if(frm.lendPosition.value == "")
			{
				alert('대출자 소속을 입력하세요');
				frm.lendPosition.focus();
				return;
			}
			if(frm.lendPhone.value == "")
			{
				alert('휴대폰을 입력하세요');
				frm.lendPhone.focus();
				return;
			}
			
			var do_confirm = confirm("대출하시겠습니까?");
			if(do_confirm != true)
			{
				return;
			}			
			document.all.lendType.value = lendType;
		}
		// 반납일때
		else
		{
			var do_confirm = confirm("반납하시겠습니까?");
			if(do_confirm != true)
			{
				return;
			}
			document.all.lendType.value = lendType;
		}
		
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		frm.searchBookType.value 	= sfrm.searchKeywordBookType1.value;
		frm.searchReqNo.value 		= sfrm.searchKeywordReqNo.value;
		frm.searchBookName.value 	= sfrm.searchKeywordBookName.value;
		frm.searchPublisher.value = sfrm.searchKeywordPublisher.value;
		frm.searchAuthor.value 		= sfrm.searchKeywordAuthor.value;
		frm.searchUserName.value = sfrm.searchKeywordUserName.value;
		
		frm.submit();
	}
	
	//초기화함수
	function clearText() 
	{
		document.all.lendUser.value="";
		document.all.lendPosition.value="";
		document.all.lendPhone.value="";
	}
	
	// 도서 상세보기
	function modifyLib(num)
	{
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		frm.searchBookType.value 	= sfrm.searchKeywordBookType1.value;
		frm.searchReqNo.value 		= sfrm.searchKeywordReqNo.value;
		frm.searchBookName.value 	= sfrm.searchKeywordBookName.value;
		frm.searchPublisher.value = sfrm.searchKeywordPublisher.value;
		frm.searchAuthor.value 		= sfrm.searchKeywordAuthor.value;
		frm.searchUserName.value 	= sfrm.searchKeywordUserName.value;
		frm.bookCode.value				= num;
		
		frm.action = 'rscLib.act?task=modify';		
		frm.submit();
	}
	
	// 신규 도서
	function newLib()
	{
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		frm.searchBookType.value 	= sfrm.searchKeywordBookType1.value;
		frm.searchReqNo.value 		= sfrm.searchKeywordReqNo.value;
		frm.searchBookName.value 	= sfrm.searchKeywordBookName.value;
		frm.searchPublisher.value = sfrm.searchKeywordPublisher.value;
		frm.searchAuthor.value 		= sfrm.searchKeywordAuthor.value;
		frm.searchUserName.value 	= sfrm.searchKeywordUserName.value;
		
		frm.action = 'rscLib.act?task=create';		
		frm.submit();
	}
	
	// 대출현황조회
	function lendLib()
	{
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		frm.searchBookType.value 	= sfrm.searchKeywordBookType1.value;
		frm.searchReqNo.value 		= sfrm.searchKeywordReqNo.value;
		frm.searchBookName.value 	= sfrm.searchKeywordBookName.value;
		frm.searchPublisher.value = sfrm.searchKeywordPublisher.value;
		frm.searchAuthor.value 		= sfrm.searchKeywordAuthor.value;
		frm.searchUserName.value 	= sfrm.searchKeywordUserName.value;
		
		frm.action = 'rscLib.act?task=lendStatus';		
		frm.submit();
	}
	
	// 도서분류별통계
	function cateLib()
	{
		var sfrm = document.forms[0];
		var frm = document.forms[1];
		frm.searchBookType.value 	= sfrm.searchKeywordBookType1.value;
		frm.searchReqNo.value 		= sfrm.searchKeywordReqNo.value;
		frm.searchBookName.value 	= sfrm.searchKeywordBookName.value;
		frm.searchPublisher.value = sfrm.searchKeywordPublisher.value;
		frm.searchAuthor.value 		= sfrm.searchKeywordAuthor.value;
		frm.searchUserName.value 	= sfrm.searchKeywordUserName.value;
		
		frm.action = 'rscLib.act?task=cateStatus';			
		frm.submit();
	}