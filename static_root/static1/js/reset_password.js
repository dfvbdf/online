var pwd1=$('#password1'), pwd2=$('#password2'),error = $('#jsForgetTips'),btn=$('#jsFindPwdBtn'),
    form=$('#jsFindPwdForm');
var check_password1=function () {
    if (pwd1.val().length<6||pwd1.val().length>20){
        error.empty();
        var text_error = '<li class="errorlist">密码长度应大于6位小于20位</li>';
        error.prepend(text_error);
        error.show();
        return false
    }
    else {return true}
};
var check_password2=function () {
    if(pwd1.val()!==pwd2.val()){
        error.empty();
        var text_error = '<li class="errorlist">两次密码输入不一致</li>';
        error.prepend(text_error);
        error.show();
        return false
    } else {return true}
};
pwd1.blur(function () {
   check_password1()
});
pwd2.blur(function () {
    check_password2();
    }
);
btn.click(function () {
   if(check_password1()&&check_password2()){
       $.post(
           '/reset_pwd/',
           {'password1': pwd1.val(), 'password2':pwd2.val()},
           function (result) {
               if(result.status===1){
                   var text_error = '<li class="errorlist">'+result.error+'</li>';
                   error.empty().show();
                   error.prepend(text_error);
               }
               else if(result.status===0){
                   var tips=$('#jsSuccessTips');
                   $('#jsDialog').show();
                   tips.children('.cont').children('h2').text('密码重设成功，3秒后自动跳转到个人中心');
                   tips.show();
                   setTimeout(
                       function () {
                           $(document).attr('location').href=result.url
                       },3000
                   );
               }
               else {
                   var text_error = '<li class="errorlist">出现了未知错误，重设未完成</li>';
                   error.empty().show();
                   error.prepend(text_error);
               }
           }
       );
       return false
   }
   else {
       return false
   }
});