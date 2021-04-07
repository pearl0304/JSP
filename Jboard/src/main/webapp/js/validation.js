/**
 * 
 */
$(function(){
	$('#user form').submit(function(){
    if(!isUidOk){
        alert('이미 사용 중인 아이디입니다. \n 다시입력하세요');
        return false;
    }
    if(!isUidEngOk){
        alert('아이디는 영문 소문자이어야 합니다. \n 다시입력하세요');
        return false;
    }
    if(!isPasswordOk){
        alert('비밀번호가 일치하지 않습니다. \n 다시입력하세요');
        return false;
    }
    if(!isNamedOk){
        alert('이름은 한글 2~10까지 입력 가능합니다. \n 다시입력하세요');
        return false;
    }
    if(!isNickOk){
        alert('이미 사용중인 닉네임입니다. \n 다시입력하세요');
        return false;
    }
    if(!isEmailOk){
        alert('이미 사용중인 이메일입니다. \n 다시입력하세요');
        return false;
    }
    if(!isHpOk){
        alert('이미 등록된 번호입니다. \n 다시입력하세요');
        return false;
    }                     
 
});
	
});