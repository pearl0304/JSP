/**
 * 
 */
var isUidEngOk=false;
$(function(){
	//정규 표현식
	var regUid = /^[a-z]+[a-z0-9]{4,10}$/
	$('input[name=uid]').focousout(function(){
		var uid = $(this).val();
		
		if(regUid.test(uid)==true){
			//아이디가 정규표현 형식에 맞으면
			isUidEngOk=true;
		}else{
			//아이디가 정규표현 형식에 맞지 않으면
			isUidEngOk=false;
		}
	});
});