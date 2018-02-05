<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head lang="en">
        <title>登录</title>
        <%@include file="WEB-INF/views/common/common.jsp"%>
        <link rel="stylesheet" href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" />
        <link href="${ctx}/static/css/dlstyle.css" rel="stylesheet" type="text/css">
        <style type="text/css">body{background-color: white}</style>
        <script type="text/javascript" src="static/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $("#submit").click(function () {
                    var membername = $("#membername").val();
                    var password = $("#password").val();
                    var formdata = {
                        membername:membername,
                        password:password
                    };
                    if(membername!=""){
                        if(password!=""){
                            $.ajax({
                                url:"${ctx}/member/login",
                                type:"post",
                                data:formdata,
                                success:function (result) {
                                    if(result.error!=null){
                                        alert(result.error);
                                    }else if(result.success!=null){
                                        location = "${ctx}/searchProduct/home";
                                    }
                                },
                                error:function () {

                                }
                            });
                        }else{
                            alert("请输入密码！");
                        }
                    }else{
                        alert("请输入账户名！");
                    }
                })
            })
        </script>
    </head>
    <body>
        <div class="login-boxtitle"></div>
        <div class="login-banner">
            <div class="login-main">
                <div class="login-banner-bg"><span></span><img style="margin-top: 100px" src="${ctx}/static/img/logreg.jpg" /></div>
                <div class="login-box">
                    <h3 style="margin-top: 25px" class="title">登录商城</h3>
                    <div class="clear"></div>
                    <form id="login" method="post">
                        <div style="margin-top: 20px" class="am-tabs-bd">
                            <input type="hidden" name="returnUrl" value="${param.returnUrl}">
                            <div class="user-name">
                                <label for="membername"><i class="am-icon-user"></i></label>
                                <input type="text" name="membername" id="membername" placeholder="请输入账户名">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="login-links">
                            <a href="pwd.jsp" class="am-fr">忘记密码</a>
                            <a href="register.jsp" class="zcnext am-fr am-btn-default">注册</a>
                            <a style="margin-right: 45px" href="${ctx}/searchProduct/home" class="zcnext am-fr am-btn-default">商城首页</a>
                            <br />
                        </div>
                        <div class="partner">
                            <div class="am-btn-group"></div>
                        </div>
                    </form>
                    <div class="am-cf">
                        <input id="submit" type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/views/common/foot.jsp"%>
    </body>
</html>