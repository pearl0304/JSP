$(function(){

    var btnnext = $(".term_btn .next");

    btnnext.click(function(){
        var isOkchk1 = $('input[name=chk1]').is(':checked');
        var isOkchk2 = $('input[name=chk2]').is(':checked');

        if (isOkchk1&&isOkchk2){
            return true;
        }else{
            alert("동의에 모두 체크하셔야 합니다");
            return false;
        }
    });
});