<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
        <title>个人资料</title>
        <%@include file="common/common.jsp"%>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/personal.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/infstyle.css" rel="stylesheet" type="text/css">
        <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
        <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.min.js"></script>
        <script src="${ctx}/static/layer/layer.js"></script>
        <style>
            table,th,tr,td{border:1px solid #000000;font-size: 16px;text-align: center}
        </style>
        <script type="text/javascript">
            $(function () {
                $("#m").click(function () {
                    var id=$("#mid").val();
                    var membername=$("#membername").val();
                    var password=$("#password").val();
                    var email=$("#email").val();
                    if(membername!=""){
                        if(email!=""){
                            $.ajax({
                                url:"${ctx}/member/changeMember",
                                type:"post",
                                data:{
                                    id:id,
                                    membername:membername,
                                    password:password,
                                    email:email
                                },
                                success:function (result) {
                                    alert(result.msg)
                                }
                            });
                        }else {
                            alert("邮箱不能为空！");
                        }
                    }else{
                        alert("会员名不能为空！");
                    }
                });
                $("#a").click(function () {
                    var pwd = $("#pwd").val();
                    var pwd1 = $("#pwd1").val();
                    console.log(pwd);
                    console.log(pwd1);
                    if(pwd!=""){
                        if(pwd1!=""){
                            if(pwd==pwd1){
                                $.ajax({
                                    url:"${ctx}/member/changePWD",
                                    type:"post",
                                    data:{password:pwd},
                                    success:function (result) {
                                        alert(result.msg)
                                    }
                                })
                            }else{
                                alert("两次输入密码不一致");
                            }
                        }else{
                            alert("确认密码不能为空");
                        }
                    }else{
                        alert("密码不能为空");
                    }
                });
                $("#a2").click(function () {
                    var id = $(this).next().val();
                    console.log(id);
                    layer.confirm('您确定删除此地址吗？', {
                        btn: ['确定','取消'] //按钮
                    }, function(){
                        $.ajax({
                            url:"${ctx}/member/del",
                            type:"post",
                            data:{id:id},
                            success:function (result) {
                                if(result.msg) {
                                    layer.msg('ok', {icon: 1, time: 1000})
                                }
                            }
                        })
                    });
                });
                $("input[name='addaddr']").click(function () {
                    var pid = $(this).prev().val();
                    console.log(pid);
                    layer.open({
                        title:'新地址',
                        type: 1,
                        skin: 'layui-layer-rim', //加上边框
                        area: ['420px', '240px'], //宽高
                        content: '收件人：<input name="name1" type="text" value=""/><br/>手机号<input name="tel1" type="text" value=""/><br/>收件地址:<input name="addr1" type="text" value=""/><br/><input name="ok" style="margin-left: 40%" type="submit" value=" 提 交 " />'
                    });
                    $("input[name='ok']").click(function () {
                        var name = $("input[name='name1']").val();
                        var tel = $("input[name='tel1']").val();
                        var addr = $("input[name='addr1']").val();
                        console.log(name+tel+addr);
                        formdata={
                            name:name,
                            tel:tel,
                            addr:addr
                        };
                        $.ajax({
                            url:"${ctx}/member/addr",
                            type:"post",
                            data:formdata,
                            success:function (res) {
                                location="${ctx}/member/person";
                            },
                            error:function () {

                            }
                        })
                    })
                });
            })
        </script>
    </head>
    <body>
    <!--头 -->
        <%@include file="common/head.jsp"%>
        <div class="nav-table">
            <div class="nav-cont">
            </div>
        </div>
        <b class="line"></b>
        <div  style="margin-left: -20px" class="center">
            <div class="col-main">
                <div class="main-wrap">
                    <div class="user-info">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                        </div>
                        <hr/>
                        <!--个人信息 -->
                        <div class="info-main">
                            <form action="${ctx}/member/changeMember" class="am-form am-form-horizontal" method="post">
                                <input id="mid" type="hidden" name="id" value="${requestScope.member.id}"/>
                                <div class="am-form-group">
                                    <label for="membername" class="am-form-label">会员名</label>
                                    <div class="am-form-content">
                                        <input type="text" id="membername" name="membername" placeholder="memberName" value="${requestScope.member.membername}">
                                    </div>
                                </div>
                                <input type="hidden" id="password" name="password" value="${requestScope.member.password}"/>
                                <div class="am-form-group">
                                    <label for="email" class="am-form-label">电子邮箱</label>
                                    <div class="am-form-content">
                                        <input id="email" placeholder="Email" name="email" type="email" value="${requestScope.member.email}">
                                    </div>
                                </div>
                                <div class="info-btn">
                                    <div id="m" class="am-btn am-btn-danger">保存</div>
                                </div>
                            </form>
                        </div>
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password&nbsp;information</small></div>
                        </div>
                        <hr/>
                        <!--个人信息 -->
                        <div class="info-main">
                            <form action="${ctx}/member/changeMember" class="am-form am-form-horizontal" method="post">
                                <input id="memberId" type="hidden" name="id" value="${requestScope.member.id}"/>
                                <div class="am-form-group">
                                    <label for="membername" class="am-form-label">新密码</label>
                                    <div class="am-form-content">
                                        <input type="password" id="pwd" name="pwd" placeholder="password" value="">
                                    </div>
                                    <label for="membername" class="am-form-label">确认密码</label>
                                    <div class="am-form-content">
                                        <input type="password" id="pwd1" name="pwd1" placeholder="password" value="">
                                    </div>
                                </div>
                                <div class="info-btn">
                                    <div id="a" class="am-btn am-btn-danger">保存</div>
                                </div>
                            </form>
                        </div>
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">收件人资料</strong> / <small>Recipient&nbsp;information</small></div>
                        </div>
                        <hr/>
                        <!--收货信息 -->
                        <table style="margin-left: 20%">
                        <input type="button" name="addaddr" value="新增收货地址"/>
                            <tr>
                                <td width="120px">收件人</td>
                                <td width="120px">手机号</td>
                                <td width="200px">收件地址</td>
                                <td width="100px">操作</td>
                            </tr>
                            <c:forEach items="${requestScope.addr}" var="addr">
                                <tr>
                                    <td>${addr.name}</td>
                                    <td>${addr.tel}</td>
                                    <td>${addr.addr}</td>
                                    <td>
                                        <a href="${ctx}/member/edit?id=${addr.id}">编辑</a>|<a href="#" id="a2">删除</a><input type="hidden" name="rid" value="${addr.id}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--底部-->
        <%@include file="common/foot.jsp"%>
    </body>
</html>