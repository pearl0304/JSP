/**
 * 
 */
var isUidOk=false;
var isPasswordOk=false;
var isNamedOk=false;
var isUidEngOk=false;
var isNickOk=false;
var isEmailOk=false;
var isHpOk=false;
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

    var regUid=/^[a-z]+[a-z0-9]{3,10}$/;

    //아이디중복 체크 && 아이디 영소문자 여부 확인 
    $('input[name=uid]').focusout(function(){
        var uid =$(this).val();
        var jsonData={'uid':uid};
        $.ajax({
            url:'/Jboard/user/proc/checkUid.jsp',
            type:'get',
            data:jsonData,
            dataType:'json',
            success:function(data){
                if(data.result==0){
                    isUidOk=true;
                    $('.resultId').css('color','green').text('사용가능한 아이디입니다');
                    if(regUid.test(uid)==true){
                        isUidOk=true;
                    }else{
                        isUidOk=false;
                        $('.resultId').css('color','red').text('아이디는 영소문자, 숫자조합 4~10자입니다');
                    }
                }else{
                    isUidOk=false;
                    $('.resultId').css('color','red').text('이미 사용중인 아이디입니다');
                }
            }
        });
    });
	//비밀번호 일치여부 확인
    $('input[name=pass2]').focusout(function(){
        var pass1 = $('[name=pass1]').val();
        var pass2 = $('[name=pass2]').val();

        if(pass1==pass2){
            isPasswordOk=true;
            $(".resultPass").css('color','green').text('비밀번호가 일치합니다');
        }else{
            isPasswordOk=false;
            $(".resultPass").css('color','green').text('비밀번호가 일치하지 않습니다');
        }
    });
    //이름 한글 여부
    var regName = /^[가-힣]{2,10}$/;
    $('input[name=name]').focusout(function(){
        var name = $(this).val();
        if(regName.test(name)==true){
            isNamedOk=true;
            $('.resultName').text('');
        }else{
            isNamedOk=false;
            $('.resultName').css('color','red').text('이름은 한글 2~10까지 입력하세요');
        }
    });
    //별명 중복 확인 
    $('input[name=nick]').focusout(function(){
        var nick =$(this).val();
        var jsonData={'nick':nick};
        $.ajax({
            url:'/Jboard/user/proc/checkNick.jsp',
            type:'get',
            data:jsonData,
            dataType:'json',
            success:function(data){
                if(data.result==0){
                    isNickOk=true;
                    $('.resultNick').css('color','green').text('사용가능한 닉네임입니다');
                }else{
                    isNickOk=false;
                    $('.resultNick').css('color','red').text('이미 사용중인 닉네임입니다');
                }
            }
        });
    });
        //Email 중복확인
        $('input[name=email]').focusout(function(){
        var email =$(this).val();
        var jsonData={'email':email};
        $.ajax({
            url:'/Jboard/user/proc/checkEmail.jsp',
            type:'get',
            data:jsonData,
            dataType:'json',
            success:function(data){
                if(data.result==0){
                    isEmailOk=true;
                    $('.resultEmail').css('color','green').text('사용가능한 이메일입니다');
                }else{
                    isEmailOk=false;
                    $('.resultEmail').css('color','red').text('이미 사용중인 이메일입니다');
              		 }
           		 }
       		 });
   		});
    //hp 중복확인
    $('input[name=hp]').focusout(function(){
        var hp =$(this).val();
        var jsonData={'hp':hp};
        $.ajax({
            url:'/Jboard/user/proc/checkHp.jsp',
            type:'get',
            data:jsonData,
            dataType:'json',
            success:function(data){
                if(data.result==0){
                    isHpOk=true;
                    $('.resultHp').css('color','green').text('사용가능한 전화번호입니다.');
                }else{
                    isHpOk=false;
                    $('.resultHp').css('color','red').text('이미 등록된 전화번호입니다');
                }
            }
        });
    });
});