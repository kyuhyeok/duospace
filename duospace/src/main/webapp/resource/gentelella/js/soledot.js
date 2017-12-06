/*
 * @author : soledot
 * @since : 20170322
 * @description : soledot default plugin
 * @editdate : 20170323
 */

(function($){
    $.soledot = {
		ckall : function(name, val){
			$('input[name="'+name+'"]').prop('checked',val);
		}
		,ckval : function(name){
			var valArr = new Array();
			$('input[name="'+name+'"]:checked').each(function(i){
				valArr[i] = $(this).val();
			});
			return valArr;
		}
		,datepicker : function(name){
			$( 'input[name="'+name+'"' ).datepicker({
				changeMonth: true
				,changeYear: true
				,showButtonPanel: true     
				,dateFormat: "yy-mm-dd"
			});
		}
		,datepickerrange : function(sname,ename){
			$( 'input[name="'+sname+'"]' ).datepicker({
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,     
				dateFormat: "yy-mm-dd",
				numberOfMonths : 3,
				onClose : function ( selectedDate ){
					$( 'input[name="'+ename+'"]' ).datepicker( 'option', 'minDate', selectedDate ); 
				}
			});
			$( 'input[name="'+ename+'"]' ).datepicker({
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: "yy-mm-dd",
				numberOfMonths : 3, 
				onClose : function ( selectedDate ){
					$( 'input[name="'+sname+'"]' ).datepicker( 'option', 'maxDate', selectedDate );
				}
			});
		}
        ,move : function(url){
        	$(location).attr('href',url);
        }
        ,submit : function(frm,url){
        	if( '' == frm ) frm = $('#frm');
        	else frm = $('#'+frm);
        	
        	if( '' != url ) $(frm).attr('action',url);
        	$(frm).submit();
        }
        ,getsubmit : function(frm,url){
        	if( '' == frm ) frm = $('#frm');
        	else frm = $('#'+frm);
        	
        	if( '' != url ) $(frm).attr('action',url);
        	$(frm).attr('method','GET');
        	$(frm).submit();
        }
        ,validate : function(name, method, msg){
        	
        	var ckYn = true;
        	
        	var obj;
        	var val = '';
        	var nodeName = $('[name="'+name+'"')[0].nodeName.toLowerCase();
        	if( 'input' == nodeName ){
        		obj = $('input[name="'+name+'"');
        		val = $('input[name="'+name+'"').val();        		
        	}else if( 'select' == nodeName ){
        		obj = $('select[name="'+name+'"');
        		val = $('select[name="'+name+'"').val();
        	}

        	if( 'required' == method ){
        		if( '' == val ){
        			alert(msg+'를 입력해주십시오');
        			$(obj).focus();
        			return ckYn=false;
        		}
        	}
        	
        	var num_reg = /[^\d]/;              										//숫자만
        	var num_reg1 = /^[0-9]+\.[0-9]{2}$/;										//소수 2자리 폼함 숫자만 허용
        	var freg = /^\d+\.\d{2}$/;													//소수 2자리 폼함 숫자만 허용	
        	var eng_reg = /[^a-z]/;              										//영어(소문자)
        	var Eng_reg = /[^A-Z]/;              										//영어(대문자)
        	var engnum_reg = /[^\w\_\-\[\]\(\)]/;             							//영어,숫자(대소문자 모두허용)
        	var kor_reg = /[^ㄱ-ㅎㅏ-ㅣ가-힣]/;           								//한글만
        	var id_reg = /[^\w_-]/;              										//아이디
        	var business_reg = /[\d]{3}-[\d]{2}-[\d]{5}$/;        						//사업자번호
        	var tel_reg = /^0[\d]{1,2}-[\d]{3,4}-[\d]{4}$/;        						//전화번호
        	var phone_reg = /^01[\d]{1}-[\d]{3,4}-[\d]{4}$/;        					//휴대폰
        	var date_reg = /^[\d]{4}-[\d]{2}-[\d]{2}$/;									//날짜
        	var time_reg = /^[\d]{2}:[\d]{2}:[\d]{2}$/;									//시간
        	var email_reg = /^[\w]([-_\.]?[\w])*@[\w]([-_\.]?[\w])*\.[\w]{2,3}$/i;		//이메일
        	var spc_reg = /[^\wㄱ-ㅎㅏ-ㅣ가-힣\(\)\-\,\s\.\[\]\-\_\/\?]/;					//특수문자
        	var quot_reg = /[\"\']/;             										//따옴표검색
        	var img_reg = /\.gif$|\.jpg$|\.png$/i;										//이미지
        	var url_reg = /(?:(?:(https?|ftp|telnet):\/\/|[\s\t\r\n\[\]\`\<\>\"\'])((?:[\w$\-_\.+!*\'\(\),]|%[0-9a-f][0-9a-f])*\:(?:[\w$\-_\.+!*\'\(\),;\?&=]|%[0-9a-f][0-9a-f])+\@)?(?:((?:(?:[a-z0-9\-가-힣]+\.)+[a-z0-9\-]{2,})|(?:[\d]{1,3}\.){3}[\d]{1,3})|localhost)(?:\:([0-9]+))?((?:\/(?:[\w$\-_\.+!*\'\(\),;:@&=ㄱ-ㅎㅏ-ㅣ가-힣]|%[0-9a-f][0-9a-f])+)*)(?:\/([^\s\/\?\.:<>|#]*(?:\.[^\s\/\?:<>|#]+)*))?(\/?[\?;](?:[a-z0-9\-]+(?:=[^\s:&<>]*)?\&)*[a-z0-9\-]+(?:=[^\s:&<>]*)?)?(#[\w\-]+)?)/gmi;
        	var atc_reg = /\.gif$|\.jpg$|\.png$|\.doc$|\.xls$|\.xlsx$|\.ppt$|\.txt$/i;	//첨부파일
        	
        	if( 'number' == method ){
        		if(!num_reg.test){
        			alert('숫자만 입력가능합니다');
        			$(obj).focus();
        		}
        	}
        	if( 'phone' == phone_reg ){
        		if(!num_reg.test){
        			alert('휴대전화번호 형식이 맞지않습니다.');
        			$(obj).focus();
        		}
        	}
        	if( 'tel' == tel_reg ){
        		if(!num_reg.test){
        			alert('전화번호 형식이 맞지않습니다.');
        			$(obj).focus();
        		}
        	}
        	
        	return ckYn;
        }
        
	}
})(jQuery);

//---*기본
var handling = {
	dataAlert : function(msg){
		alert( msg );
	},
	dataAdd : function(){},
	dataIn : function(){},
	dataSearch : function(){},
	dataUp : function(){},
	dataDel : function(){},
	dataEdit : function(){},
	excelDown : function(){},
	dataList : function(){},
	pageMove : function( r_url, param ){
		if( '' == r_url || undefined == r_url ){
			if( '' == param || undefined == param ) $( location ).attr( 'href', '' );
			else $( location ).attr( 'href', ''+'?'+param );
		}else{
			if( '' == param || undefined == param ) $( location ).attr( 'href', r_url );
			else $( location ).attr( 'href', r_url+'?'+param );
		}
	},
	submit : function( fName, r_url ){
		if( '' == fName || undefined == fName ) frmObj = $( 'form[name="frm"]' ); 
		else frmObj = $( 'form[name="'+fName+'"]' );
		if( '' == r_url || undefined == r_url) frmObj.submit();
		else frmObj.attr( 'action', r_url ).submit();
//			else $( frmObj ).attr( 'action', r_url ).submit();
	}
};
//---기본


//---*문자열관련
var strFn = {
	delLastDelim : function( data, delim ){
		return data.substring(0, data.lastIndexOf(delim) );
	},
	splitDelim : function( data, delim ){
		return data.split(delim);
	},
	delDelim : function(data, delim){
		return data.replace(eval('/'+delim+'/gi'), '');
	},
};
//---문자열관련


//---*생성관련
var createHandling = {
	popup : function(r_url, param, name, option){
		if( '' == option ){
			option = 'toolbar=no, location=no, status=yes, menubar=no, scrollbars=yes, resizable=yes, width=400, height=300';
		}
		window.open(r_url+'?'+param, name, option);
	},
};
//---생성관련