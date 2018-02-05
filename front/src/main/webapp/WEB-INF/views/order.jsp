<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
        <title>订单管理</title>
        <%@include file="common/common.jsp" %>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/personal.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/orstyle.css" rel="stylesheet" type="text/css">
        <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
        <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.min.js"></script>
        <script src="${ctx}/static/layer/layer.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".item-operation").click(function () {
                    var pid = $(this).prev().val();
                    console.log(pid);
                    layer.open({
                        title:'评价',
                        type: 1,
                        skin: 'layui-layer-rim', //加上边框
                        area: ['420px', '240px'], //宽高
                        content: '<textarea style="height: 162px;width: 407px"></textarea><input name="evaluate" style="margin-left: 40%" type="submit" value=" 提 交 " />'
                    });
                    $("input[name='evaluate']").click(function () {
                        var text = $(this).prev().val();
                        formdata={
                            evaluates:text,
                            pid:pid
                        };
                        $.ajax({
                            url:"${ctx}/searchProduct/addEvaluate",
                            type:"post",
                            data:formdata,
                            success:function (res) {
                                layer.alert(res.msg);
                            },
                            error:function () {

                            }
                        })
                    })
                });

            });
        </script>
    </head>
    <body>
    <!--头 -->
        <%@include file="common/head.jsp"%>
        <b class="line"></b>
        <div style="margin-right:150px;" class="center">
            <div class="col-main">
                <div class="main-wrap">
                    <div class="user-order">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small> | <a style="color: #EA6021" href="${ctx}/member/queryEvaluate">我的商品评价</a></div>
                        </div>
                        <hr/>
                        <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
                            <div class="am-tabs-bd">
                                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                                    <div class="order-top">
                                        <div class="th th-item">
                                            <td class="td-inner">商品</td>
                                        </div>
                                        <div class="th th-price">
                                            <td class="td-inner">单价</td>
                                        </div>
                                        <div class="th th-number">
                                            <td class="td-inner">数量</td>
                                        </div>
                                    </div>
                                    <div class="order-main">
                                        <div class="order-list">
                                        <c:forEach items="${requestScope.order}" var="order">
                                            <!--交易成功-->
                                            <div class="order-status5">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：${order.id}</div>
                                                    <span style="margin-left: -50px">交易时间：${order.createtime}</span>
                                                    <c:if test="${order.addr!=null}">
                                                        <span title="${order.addr} ${order.rname}" style="margin-left: 30px">收货人信息：${fn:substring(order.addr, 0, 12)} ${order.rname}</span>
                                                    </c:if>
                                                    <c:if test="${order.addr==null}">
                                                        <span style="margin-left: 100px;color: red"><em>下单失败</em></span>
                                                    </c:if>
                                                    <div style="float: right" class="am-btn am-btn-danger anniu">
                                                        <a href="${ctx}/memberPay/delOrder?id=${order.id}" data-point-url="#" class="delete">删除订单</a>
                                                    </div>
                                                    <div style="float: right" class="am-btn am-btn-danger anniu">
                                                        <a href="${ctx}/memberPay/getOrderInfo?id=${order.id}" data-point-url="#" class="delete">订单详情</a>
                                                    </div>
                                                </div>
                                                <c:forEach items="${requestScope.orders}" var="orders">
                                                    <div class="order-content">
                                                        <c:if test="${order.id==orders.id}">
                                                            <div class="order-left">
                                                                <ul class="item-list">
                                                                    <li class="td td-item">
                                                                        <div class="item-pic">
                                                                            <a href="${ctx}/searchProduct/searchId?id=${orders.pid}" class="J_MakePoint">
                                                                                <img src="${orders.image}" class="itempic J_ItemImg">
                                                                            </a>
                                                                        </div>
                                                                        <div class="item-info">
                                                                            <div class="item-basic-info">
                                                                                <a href="${ctx}/searchProduct/searchId?id=${orders.pid}">
                                                                                    <p>${orders.pname}</p>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-price">
                                                                        <div class="item-price">
                                                                            ￥${orders.price}
                                                                        </div>
                                                                    </li>
                                                                    <li class="td td-number">
                                                                        <div class="item-number">
                                                                            <span>×</span>${orders.quantity}
                                                                        </div>
                                                                    </li>
                                                                    <c:if test="${order.addr!=null}">
                                                                        <li class="td td-operation">
                                                                            <%--<c:if test="${requestScope.evaluate.evaluates!=null}">
                                                                                <div style="width: 50px;float: right;background-color: #EA6021;color: white" class="item-operation" >已评价，查看评价</div>
                                                                            </c:if>
                                                                            <c:if test="${requestScope.evaluate.evaluates==null}">--%>
                                                                                <input type="hidden" name="pid" value="${orders.pid}"/>
                                                                                <div style="width: 50px;float: right;background-color: #EA6021;color: white" class="item-operation" >评 价</div>
                                                                            <%--</c:if>--%>
                                                                        </li>
                                                                    </c:if>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                        <div class="order-right">
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="common/foot.jsp"%>
    </body>
</html>