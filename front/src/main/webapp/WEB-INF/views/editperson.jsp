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
    <script type="text/javascript">
        $(function () {
            $("#m").click(function () {
                var id=$("#mid").val();
                var name=$("#name").val();
                var tel=$("#tel").val();
                var addr=$("#addr").val();
                if(name!=""){
                    if(tel!=""){
                        if(addr!=""){
                            $.ajax({
                                url:"${ctx}/member/changeAddr",
                                type:"post",
                                data:{
                                    id:id,
                                    name:name,
                                    tel:tel,
                                    addr:addr
                                },
                                success:function (result) {
                                    location="${ctx}/member/person";
                                }
                            });
                        }else{
                            alert("地址不能为空！");
                        }
                    }else {
                        alert("手机号不能为空！");
                    }
                }else{
                    alert("收货人不能为空！");
                }
            })
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
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">收件人资料</strong> / <small>Recipient&nbsp;information</small></div>
                </div>
                <hr/>
                <!--个人信息 -->
                <div class="info-main">
                    <form action="${ctx}/member/changeAddr" class="am-form am-form-horizontal" method="post">
                        <input id="mid" type="hidden" name="id" value="${requestScope.addr.id}"/>
                        <div class="am-form-group">
                            <label for="name" class="am-form-label">收件人</label>
                            <div class="am-form-content">
                                <input type="text" id="name" name="name" placeholder="name" value="${requestScope.addr.name}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="tel" class="am-form-label">手机号</label>
                            <div class="am-form-content">
                                <input id="tel" placeholder="tel" name="tel" type="text" value="${requestScope.addr.tel}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="addr" class="am-form-label">收件地址</label>
                            <div class="am-form-content">
                                <input id="addr" placeholder="address" name="addr" type="text" value="${requestScope.addr.addr}">
                            </div>
                        </div>
                        <div class="info-btn">
                            <div id="m" class="am-btn am-btn-danger">保存</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部-->
<%@include file="common/foot.jsp"%>
</body>
</html>