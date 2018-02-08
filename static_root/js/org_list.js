 var close=$('.jsCloseDialog'), tips=$('#jsSuccessTips'),tips_box=$('#jsDialog');
 tips.css({'margin': '200px auto'});
 //  点击发送成功提示关闭按钮时调用
         close.click(function () {
            tips_box.fadeOut(1000);
            tips.fadeOut(1000);
        });

var box =$('#org_box'), city=0,tab=0,page=1,order=0;
// 定义刷新函数
var refresh=function (page, order, tab, city) {
    $.get(
    '/org/org_list/'+page+'/' ,
    {'order': order, 'tab': tab, 'city':city},
    function (result) {
        box.html(result.result);

        var page_list=$('#pagelist'),max_page = page_list.attr('num_pages'),next = $('#next'),prev = $('#prev'),
        tab_header= $('#tab_header');
// 点击页码时改变样式并调用刷新函数
        page_list.find('a').removeClass('my_active').css({'color':'#717171'});
        page_list.find('a').eq(page).addClass('my_active').css({'color':'#fff'});

        tab_header.children('li').removeClass('active');
        tab_header.children('li').eq(order).addClass('active');

        tab_header.children('li').click(function () {
            order = $(this).index();
            refresh(1,order,tab,city)
        });

page_list.children('li').slice(1,Number(max_page)+1).click(function () {
    page = $(this).index();
    refresh(page,order,tab,city);
});
prev.click(function () {
   page=page-1;
   if (page<1){page=1}
   refresh(page,order,tab,city)

});
//var max_page=page_list.children('li').size();
    next.click(function(){
    page=page+1;
   if (page>max_page){page=max_page}
   refresh(page,order,tab,city)
});
    }
);
    return false;
};
// 页面载入时调用一次刷新函数
refresh(page,order,tab,city);
// 类型和城市点击时改变样式并调用刷新函数
var tab_ul=$('#tab'),city_ul=$('#city');

    tab_ul.children('span').click(function () {
    tab_ul.children('span').removeClass('active2');
    tab = $(this).index();
    $(this).addClass('active2');
    refresh(page,order,tab,city);
}
    );
city_ul.children('span').click(function () {
    city_ul.children('span').removeClass('active2');
    city=$(this).index();
    $(this).addClass('active2');
    refresh(page,order,tab,city);
}
    );

// 用户咨询脚本
var user_consult=$('#jsStayBtn');
user_consult.click(function () {
    $.ajax({
            url:'/user_operation/user_consult/',
            method:'POST',
            cache:false,
            data:$('#jsStayForm').serialize(),
            success:function (result) {
            if (result.status === 1) {
                tips_box.show();
                tips.show();
                setTimeout(function(){close.click()}, 3000)
            }
            else{
                var name_error='',tell_error='',course_error='';
                if(result.errors.name){name_error='姓名格式错误'}
                if(result.errors.tell){tell_error='电话格式错误'}
                if(result.errors.course){course_error='课程名格式错误'}
                alert(name_error+'\r\n'+tell_error+'\r\n'+course_error)
            }
        }
});
    return false
});