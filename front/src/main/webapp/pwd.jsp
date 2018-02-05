<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <title>忘记密码</title>
    <%-- 引入common.jsp --%>
    <%@include file="WEB-INF/views/common/common.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="${ctx}/static/css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <style type="text/css">body{background-color: white}</style>
    <script type="text/javascript" src="static/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#submit").click(function () {
                var email = $("#email").val();
                var membername = $("#membername").val();
                var password1 = $("#password1").val();
                var password2 = $("#password2").val();
                if(email!=""){
                    if(membername!=""){
                        if(password1!=""){
                            if(password2!=""){
                                if(password1==password2){
                                    var formdata = {
                                        email:email,
                                        membername:membername,
                                        password:password1
                                    };
                                    $.ajax({
                                        url:"${ctx}/member/lookFor",
                                        type:"post",
                                        data:formdata,
                                        success:function (result) {
                                            if(result.error!=null){
                                                alert(result.error);
                                            }else if(result.success!=null){
                                                location = "${ctx}/login.jsp";
                                            }else if(result.msg!=null){
                                                alert(result.msg);
                                            }
                                        },
                                        error:function () {

                                        }
                                    });
                                }else{
                                    alert("两次密码不一致，请重新输入！")
                                }
                            }else{
                                alert("确认密码不能为空！");
                            }
                        }else{
                            alert("密码不能为空！");
                        }
                    }else{
                        alert("账户名不能为空！");
                    }
                }else{
                    alert("邮箱不能为空！");
                }
            });
        });
    </script>
</head>
<body>
<div class="login-boxtitle"></div>
<div class="res-banner">
    <div class="res-main">
        <div class="login-banner-bg"><span></span><img style="margin-top: 100px;height: 300px" src="${ctx}/static/img/logreg.jpg" /></div>
        <div class="login-box">
            <div style="margin-top: 20px" class="am-tabs" id="doc-my-tabs">
                <div class="regiter-links">
                    <a href="${ctx}/searchProduct/home" class="zcnext am-fr am-btn-default">商城首页</a>
                </div>
                <h3 style="margin-top: 25px" class="title">忘记密码</h3>
                <div style="margin-top: -20px" class="am-tabs-bd">
                    <div class="am-tab-panel am-active">
                        <form id="register" method="post">
                            <div class="user-email">
                                <label for="email"><i class="am-icon-envelope-o"></i></label>
                                <input type="email" name="email" id="email" placeholder="请输入邮箱账号">
                            </div>
                            <div class="user-name">
                                <label for="membername"><i class="am-icon-user"></i></label>
                                <input type="text" name="membername" id="membername" placeholder="请输入账户名">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password1" placeholder="设置新密码">
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="password" id="password2" placeholder="确认密码">
                            </div>
                        </form>
                        <div class="am-cf">
                            <input id="submit" type="submit" name="" value="重置密码" class="am-btn am-btn-primary am-btn-sm am-fl">
                        </div>
                    </div>
                    <div class="am-tab-panel">
                        <form method="post">
                            <div class="verification">
                                <label for="code"><i class="am-icon-code-fork"></i></label>
                                <input type="tel" name="" id="code" placeholder="请输入验证码">
                                <a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
                                    <span id="dyMobileButton">获取</span></a>
                            </div>
                            <div class="user-pass">
                                <label for="password"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="password" placeholder="设置密码">
                            </div>
                            <div class="user-pass">
                                <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                <input type="password" name="" id="passwordRepeat" placeholder="确认密码">
                            </div>
                        </form>
                        <div class="login-links">
                            <label for="reader-me">
                                <input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
                            </label>
                        </div>
                        <div class="am-cf">
                            <input type="submit" name="" value="忘记密码" class="am-btn am-btn-primary am-btn-sm am-fl">
                        </div>
                        <hr>
                    </div>
                    <%--<script>
                        $(function() {
                            $('#doc-my-tabs').tabs();
                        })
                    </script>--%>
                </div>
            </div>
        </div>
    </div>
    <%@include file="WEB-INF/views/common/foot.jsp"%>
</div>
</body>
</html>