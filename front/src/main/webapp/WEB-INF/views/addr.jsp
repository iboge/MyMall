<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>下单地址</title>
        <%@include file="common/common.jsp"%>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/css/cartstyle.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/css/optstyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
        <style>
            table,th,tr,td{border:1px solid #000000;font-size: 16px;text-align: center}
        </style>
        <script type="text/javascript">
            $(function () {
                $("input[name='check']").click(function () {
                    var id = $(this).val();
                    console.log(id);
                    $("input[name='rid']").val(id);
                });
            })
        </script>
    </head>
    <body>
        <%@include file="common/head.jsp"%>
        <b style="margin-top: -50px" class="line"></b>
        <div style="margin-top: 30px;margin-left: 30%">
            <table>
                <tr>
                    <td></td>
                    <td width="120px">收件人</td>
                    <td width="120px">手机号</td>
                    <td width="200px">收件地址</td>
                </tr>
                <c:forEach items="${requestScope.addr}" var="addr">
                    <tr>
                        <td><input name="check" type="radio" value="${addr.id}"/></td>
                        <td>${addr.name}</td>
                        <td>${addr.tel}</td>
                        <td>${addr.addr}</td>
                    </tr>
                </c:forEach>
            </table>
            <form action="${ctx}/memberPay/addOrderInfo2" method="post">
                <input type="hidden" name="oid" value="${requestScope.oid}"/>
                <input type="hidden" name="rid" value=""/>
                <input style="margin-left: 195px;background-color: #FF0000;color: white" type="submit" value="提 交"/>
            </form>
        </div>
        <hr/>
        <div style="margin-top: 30px;margin-left: 40%;width: 160px">
            <p style="font-size: 16px;text-align: center">新建地址:</p>
            <form action="${ctx}/memberPay/addOrderInfo2" method="post">
                <input type="hidden" name="oid" value="${requestScope.oid}"/>
                收 货 人：<input type="text" name="name"/><br/>
                手 机 号：<input type="text" name="tel"/><br/>
                收货地址：<input type="text" name="addr"/><br/>
                <input style="margin-left: 60px;background-color: #FF0000;color: white" type="submit" value="提 交"/>
            </form>
        </div>
        <%@include file="common/foot.jsp"%>
    </body>
</html>
