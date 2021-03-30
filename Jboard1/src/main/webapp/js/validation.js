/**
 * 
 */
$(document).ready(function(){
	$('#user > form').submit(function(){
		
		//아이디 중복 확인
		if(!isUidOk){
			alert('이미 사용중인 아이디입니다. /n 아이디를 다시 입력하세요');
			return false;
		}
		
		//아이디 영문 소문자 확인
		if(!isUidEngOk){
			alert('영문 소문자로 아이디를 다시 입력해주세요');
			return false;
		}	
					

		//비밀번호 일치여부 확인 
		if(!isPasswordOk){
			alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요');
			return false;
		}
		
		//이름 한글여부 확인 
		if(!isNameOk){
			alert('이름 양식이 일치하지 않습니다. 다시 입력해주세요');
			return false;		
		}		
		
	});
});