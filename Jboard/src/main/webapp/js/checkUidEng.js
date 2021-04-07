/**
 * 
 */

var isUidEngOk=false;
$(function(){
	//아이디 영문자 확인 
    var reguidEng=/^[a-z]+[a-z0-9]{3,10}$/;
    $('input[name=uid]').focusout(function(){
        var uid=$(this).val();
        if(reguidEng.test(uid)==true){
            isUidEngOk=true;
        }else{
            isUidEngOk=false;
        }
    });
});