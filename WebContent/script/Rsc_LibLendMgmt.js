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
			alert("�˻������� �Է��ϼ���.");
			frm.searchKeywordBookName.focus();
			return;
		}
		frm.submit();
	}
	
	// ���� /�ݳ�
	function doLend(frm, data)
	{
		var lendType = data;
		var max = Number(document.all.max.value);
		var do_confirm;
		var flag;
		var count = 0;
		
		// �˻���� 1 (�迭�ƴ�)
		if(max == 1)
		{
			if(document.all.arrayLend.checked == false)
			{
				alert('������ �����ϼ���.');
				return;
			}
			else
			{
				if( lendType == 'startLend' && document.all.arrayLendType.value == '������' ) 
				{
					alert('�������� ������ ������ �� �����ϴ�.');
					document.all.arrayLend.checked = false;
					return;
				}
				else if( lendType == 'endLend' && document.all.arrayLendType.value == '���Ⱑ��' )
				{
					alert('�������� ���� ������ �ݳ��� �� �����ϴ�.');
					document.all.arrayLend.checked = false;
					return;
				}
				else if(document.all.arrayLendType.value == '���Ұ�' )
				{
					alert('�ش絵���� ���Ұ��� �����Դϴ�.');
					document.all.arrayLend.checked = false;
					return;
				}
				
				document.all.arraySelectLend.value = "true";
			}
		}
		// �˻���� 1 �̻� (�迭)
		else
		{
			// ������ ���� �ִ��� ������ üũ
			for( var i = 0; i < max; i++ )
				if(document.all.arrayLend[i].checked == false)
					count++;
				
			// ������ ���� ���ٸ� return
			if(max == count)
			{
				alert('������ �����ϼ���.');
				return;
			}
			else
			{
				for( var i = 0; i < max; i++ )
				{
					if( lendType == 'startLend' && document.all.arrayLend[i].checked == true && document.all.arrayLendType[i].value == '������' ) 
					{
						alert('�������� ������ ������ �� �����ϴ�.');
						document.all.arrayLend[i].checked = false;
						return;
					}
					else if( lendType == 'endLend' && document.all.arrayLend[i].checked == true && document.all.arrayLendType[i].value == '���Ⱑ��' )
					{
						alert('�������� ���� ������ �ݳ��� �� �����ϴ�.');
						document.all.arrayLend[i].checked = false;
						return;
					}
					if(document.all.arrayLend[i].checked == true && document.all.arrayLendType[i].value == '���Ұ�' )
					{
						alert('�ش絵���� ���Ұ��� �����Դϴ�.');
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
		
		// �����϶�
		if( lendType == 'startLend' ) 
		{
			if(frm.lendUser.value == "")
			{
				alert('�����ڸ� �Է��ϼ���');
				frm.lendUser.focus();
				return;
			}
			if(frm.lendPosition.value == "")
			{
				alert('������ �Ҽ��� �Է��ϼ���');
				frm.lendPosition.focus();
				return;
			}
			if(frm.lendPhone.value == "")
			{
				alert('�޴����� �Է��ϼ���');
				frm.lendPhone.focus();
				return;
			}
			
			var do_confirm = confirm("�����Ͻðڽ��ϱ�?");
			if(do_confirm != true)
			{
				return;
			}			
			document.all.lendType.value = lendType;
		}
		// �ݳ��϶�
		else
		{
			var do_confirm = confirm("�ݳ��Ͻðڽ��ϱ�?");
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
	
	//�ʱ�ȭ�Լ�
	function clearText() 
	{
		document.all.lendUser.value="";
		document.all.lendPosition.value="";
		document.all.lendPhone.value="";
	}
	
	// ���� �󼼺���
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
	
	// �ű� ����
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
	
	// ������Ȳ��ȸ
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
	
	// �����з������
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