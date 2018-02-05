<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <script type="text/javascript" src="static/lib/html5shiv.js"></script>
        <script type="text/javascript" src="static/lib/respond.min.js"></script>
        <link href="static/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
        <link href="static/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
        <link href="static/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
        <link href="static/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="static/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
        <script>DD_belatedPNG.fix('*');</script>
        <title>后台登录</title>
        <meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
        <meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
        <%@include file="WEB-INF/views/common.jsp"%>
    </head>
    <body>
        <input type="hidden" id="TenantId" name="TenantId" value="" />
        <div class="header"></div>
        <div class="loginWraper">
            <div id="loginform" class="loginBox">
                <form class="form form-horizontal"<%-- action="${ctx}/user/login"--%> method="post">
                    <div class="row cl">
                        <h1 style="text-align: center;margin-top: -20px"><b>登&nbsp;&nbsp;&nbsp;&nbsp;录</b></h1>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                        <div class="formControls col-xs-8">
                            <input id="username" name="username" type="text" placeholder="请输入账户！" class="input-text size-L">
                        </div>
                    </div>
                    <div class="row cl">
                        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                        <div class="formControls col-xs-8">
                            <input id="password" name="password" type="password" placeholder="请输入密码！" class="input-text size-L">
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="formControls col-xs-8 col-xs-offset-3">
                            <input name="login" type="button" style="margin-left: 25%" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer">Copyright by H-ui.admin v3.1</div>
        <script type="text/javascript" src="static/lib/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="static/static/h-ui/js/H-ui.min.js"></script>
        <script>
            $(function () {
                $("input[name='login']").click(function () {
                    var username = $("#username").val();
                    var password = $("#password").val();
                    var formdata = {
                        username:username,
                        password:password
                    };
                    if(username!=""){
                        if(password!=""){
                            $.ajax({
                                url:"${ctx}/user/login",
                                type:"post",
                                data:formdata,
                                success:function (result) {
                                    console.log(result)
                                    if(result.error!=null){
                                        alert(result.error);
                                    }else if(result.success!=null){
                                        location = "${ctx}/user/index";
                                    }
                                },
                                error:function () {

                                }
                            });
                        }else{
                            alert("请输入密码！");
                        }
                    }else{
                        alert("请输入用户名！");
                    }
                })
            })
        </script>
    </body>
</html>