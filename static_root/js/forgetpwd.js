var captcha=$('#id_captcha_1'), captcha_img=$('.captcha');
// 验证码输入框的样式调整
        captcha.attr({'placeholder': '点击图片更换验证码'}).css({'width': '110px'});
        captcha_img.css({'width': '85px'});

         // 刷新验证码
         captcha_img.click(function () {
              refresh()
          });

// 验证输入是否合法
var pattern = /(\w|\d){5,11}@(qq|163|sina).com/i,pattern2=/[a-zA-Z]{4}/,email=$('#account'),submit=$('#jsFindPwdBtn'),
errors =$('#jsForgetTips');
var check_captcha=function () {
    if(captcha.val().length==4&&pattern2.test(captcha.val())){return true}
    else {return false}
};
email.blur(function () {
    errors.empty();
    if (pattern.test(email.val())===false){errors.show(); errors.prepend('<li>邮箱格式不正确</li>'); return false}
});
captcha.blur(
    function () {
        errors.empty();
     if(check_captcha()===false){errors.show();
     errors.prepend('<li>验证码格式不正确</li>');
     return false}
    }
);

//提交表单时调用
submit.click(function () {
    status=true;
    errors.empty();
    if (status&&pattern.test(email.val())&&check_captcha()){
         errors.empty('.errorlist');
        $('#jsDialog').show();
        setTimeout(function () {
            $('#jsSuccessTips').fadeIn(600);
        },200);
        $.post(
            '/forgetpwd/',
            $('#jsFindPwdForm').serialize(),
            function (result) {
                if(result.status===1){
                    refresh();
                    errors.prepend('<li class="errorlist">邮箱有误</li>');
                    errors.show();
                    $('.errorlist').first().show().siblings().hide();
                    $('.successbox').hide();
                    $('#jsDialog').hide();
                }
                else if(result.status===2){
                    refresh();
                    errors.prepend('<li class="errorlist">验证码有误</li>');
                    errors.show();
                    $('.errorlist').first().show().siblings().hide();
                    $('.successbox').hide();
                    $('#jsDialog').hide();
                }
                else {
                    errors.empty('.errorlist');
                    $('#jsEmailToActive').text(email.val());
                    $('#jsDialog').show();
                    $('#jsSuccessTips').hide();
                    $('#jsUnactiveForm').fadeIn(600);
                }
            }
        );
        return false
    }
    else {errors.show();
        errors.prepend('<li>请填写必要信息</li>');
        return false
    }
});