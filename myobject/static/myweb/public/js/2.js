    <!-- 手机登录界面 -->
   
       
    <!-- 登录验证事件-->

    // 声明全局变量
    var NameOk = false;
    var PassOk = false;

    // 获取焦点事件 focus
    $('input').focus(function(){
        // 获取焦点时,给予提示信息
        var at = $(this).attr('value');
        // $(this).next('span').html(at).css('color','blue');
        $(this).css('border','1px solid red')
    })

    // 绑定丧失焦点事件 blur
    $('input[name=username]').blur(function(){
        // 获取用户的输入信息
        var v = $(this).val();
        var reg = /^\w{6,18}$/;
        if(reg.test(v)){
            // $(this).value().html('√').css('color','blue')
            $(this).css('border','1px solid blue');
            NameOk = true;
        }else{
            // $(this).value().html('用户名格式不正确').css('color','red')
            $(this).css('border','1px solid red')
            NameOk = false;
        }
    })

    // 绑定丧失焦点事件
    $('input[name=password]').blur(function(){
        var v = $(this).val();
        var reg = /\w{6,18}/;
        if(reg.test(v)){
            // $(this).value().html('√').css('color','blue');
            $(this).css('border','1px solid blue');
            PassOk = true;
        }else{
            // $(this).value().html('密码不正确').css('color','red')
            $(this).css('border','1px solid red');
            PassOk = false;
        }
    })

    // 表单提交事件
    $('form').submit(function(){
        // 触发input 丧失焦点事件
        $('input').trigger('blur');
        // 判断如果都正确
        if(NameOk && PassOk){
            return true
        };
        // 阻止默认行为
        return false;
    })