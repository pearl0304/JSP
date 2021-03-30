/**
 * 
 */
    var isUidOk = false;
    var isUidEngOk=false;
    var isPasswordOk = false;
    var isNameOk=false;
   
   $(function(){
   	//아이디 중복 체크 && 아이디 영문자 확인
   	var regUid = /^[a-z]+[a-z0-9]{3,10}$/;
   	
   	$('input[name=uid]').inputuid.focusout(function(){
   		var uid = $(this).val();
   		var jsonData = {'uid':uid};
   		
   		$.ajax({
   			url : '/Jboard1/user/proc/checkUid.jsp', //서버주소 
   			type : 'get', // get or post 
   			data : jsonData,
   			dataType:'json', //보통 json
   			success:function(data){
   				if (data.result==0){
   					isUidOk=true;
   					$('.resultId').css('color','green').text('사용 가능한 아이디입니다.');
   					
   					if(regUid.test(uid)==true){
   						isUidEngOk=true;
   					}else{
   						isUidEngOk=false;
   						$('.resultId').css('color','red').text('영소문자,영소문자+숫자 조합 4~10자리를 입력해주세요');
   					}
   					
   				}else{
   					isUidOk = false;
   					$('.resultId').css('color','red').text('이미 사용 중인 아이디입니다.');
   				}
   				
   			}
   			
   		}); //부분통신
   	});

   	//비밀번호 일치 여부 확인
   	$('input[name=pass2]').focusout(function(){
   		var pass1=$('input[name=pass1]').val();
   		var pass2=$('input[name=pass2]').val();
   		
   		if(pass1==pass2){
   			isPasswordOk = true;
   			$('.resultPass').css('color','green').text('비밀번호가 일치합니다.');
   		}else{
   			isPasswordOk = false;
   			$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다.');
   		}	 		
   	});
   	
   	//이름 한글 여부 확인
	var regName =/^[ㄱ-힣]{2,10}$/;
   	$('input[name=name]').focusout(function(){
   		var name= $(this).val();
   		
   		if(regName.test(name)==true){
   			isNameOk=true;
   			$('.resultName').text('');
   		}else{
   			isNameOk=false;
   			$('.resultName').css('color','red').text('한글 2~10자까지 입력하십시오.');
   		}
   	});
   	//별명 중복체크
   	
   	//이메일 중복체크 
   	
   	//휴대폰 중복체크
   	
});
    
    
    
    
    
    
    
    
