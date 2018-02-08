var username=$('#id_username'),email=$('#id_email'),password=$('#id_password'),captcha=$('#id_captcha_1');
$('.errorlist').removeClass('input_error');
// 验证码输入框的样式调整
captcha.attr({'placeholder': '点击图片更换验证码'}).css({'width': '110px'});
$('.captcha').css({'width': '85px'});
// // 定义一个列表用于保存调用检查函数的参数
//     var check_list=[[username,username.val(),'用户名', 'username'],
//         [email,email.val(),'邮箱','email'],
//         [password,password.val(),'密码','password'],
//         [captcha,captcha.val(),'验证码','captcha']];

    var error_ul = $('#jsEmailTips'),form=$('#email_register_form');
// //定义检查函数，传入要检查的类型
//     function check_all(type) {
//         var error_message='';
//         var value=check_list[type][0].val();
//         if (value===''||value.length<2){
//             check_list[type][0].parent('.form-group').addClass("input_error").removeClass('blur');
//             error_message=check_list[type][2]+'输入错误';
//             var text_error = '<li class="errorlist">'+error_message+'</li>';
//             error.prepend(text_error);
//             $('.errorlist :first').show().siblings().hide();
//             return false
//         }
//         else{
//             check_list[type][0].parent('.form-group').addClass("blur").removeClass('input_error');
//             error.empty('.errorlist');
//             return true
//         }
//         }
//
//         username.blur(function(){
//             check_all(0)
//         });
//         email.blur(function () {
//             check_all(1)
//         });
//         password.blur(function () {
//             check_all(2)
//         });
//         captcha.blur(
//             function () {
//                 check_all(3)
//             }
//         );

        // 刷新验证码[base-user.html]
        $('.captcha').click(function () {
            refresh()
        });

        // 点击按钮时检查输入每一个input的值是否合法
         $('#submit_btn').click(function () {
             var status =true;
            // var status =true,type=0,form =$('#email_register_form');
            // for(;type<4; type++){
            //     status = status&&check_all(type);
            // }
            //  // 输入都正确时发送ajax
            if (status ===true){
                 $('#jsEmailTips').empty();
                $('#jsDialog').show();
                setTimeout(function () {
                    $('#jsSuccessTips').fadeIn(600);
                },100);
                $.post(
                    '/register/',
                    form.serialize(),
                    function (result) {
                        error_ul.empty();
                        error_ul.append(result).show();
                        var ajax_status=result.status;
                        alert(ajax_status);
                        if(ajax_status===1){
                            error_ul.empty('.errorlist');
                            $('#jsEmailToActive').text(email.val());
                            $('#jsSuccessTips').hide();
                            $('#jsDialog').show();
                            $('#jsUnactiveForm').fadeIn(600);}
                    if (ajax_status===0) {
                            refresh();
                            $('.errorlist').first().show().siblings().hide();
                            $('.successbox').hide();
                            $('#jsDialog').hide();
                            console.log(result.errors);
                            for (e in result.errors) {
                                error_li = '<li class="errorlist">'+result.errors[e]+'</li>';
                                $('#jsEmailTips').append(error_li)
                            }
                        }

                    }

            );
                return false
            }
            else {
                $('.errorlist').first().show().siblings().hide();
            return false}

        });

