<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <%@include file="common/common.jsp"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
        <title>订单详情</title>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/personal.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/orstyle.css" rel="stylesheet" type="text/css">
        <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
        <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    </head>
    <body>
        <%@include file="common/head.jsp"%>
        <div class="nav-table">
        </div>
        <b class="line"></b>
        <div style="margin-right:150px;" class="center">
            <div class="col-main">
                <div class="main-wrap">
                    <div class="user-orderinfo">
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
                        </div>
                        <hr/>
                        <div class="order-infoaside">
                            <div class="order-addresslist">
                                <div class="order-address">
                                    <div class="icon-add">
                                    </div>
                                    <c:forEach items="${requestScope.orders}" var="orders" end="0">
                                        <p class="new-tit new-p-re">
                                            <span style="font-size: 16px" class="new-txt">签收人：${orders.rname}</span>
                                            <br/>
                                            <span style="font-size: 16px" class="new-txt-rd2">手机号：${orders.tel}</span>
                                        </p>
                                        <div class="new-mu_l2a new-p-re">
                                            <p class="new-mu_l2cw">
                                                <span style="font-size: 16px" class="title">收货地址：${orders.addr}</span>
                                                <span class="province"></span>
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="order-infomain">
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
                                <div style="margin-left: 150px" class="th th-amount">
                                    <td class="td-inner">合计</td>
                                </div>
                            </div>
                            <div class="order-main">
                                <div class="order-status3">
                                    <c:forEach items="${requestScope.orders}" var="orders" end="0">
                                        <c:forEach items="${requestScope.order}" var="order">
                                            <c:if test="${orders.oid==order.id}">
                                                <div class="order-title">
                                                    <div class="dd-num">订单编号：<a href="javascript:;">${order.id}</a></div>
                                                    <span>成交时间：${order.createtime}</span>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <div class="order-content">
                                        <div class="order-left">
                                            <c:forEach items="${requestScope.orders}" var="orders">
                                                <ul class="item-list">
                                                    <li class="td td-item">
                                                        <div class="item-pic">
                                                            <a href="#" style="height: 80px;width: 80px" class="J_MakePoint">
                                                                <img src="${orders.image}" class="itempic J_ItemImg">
                                                            </a>
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-basic-info">
                                                                <a href="#">
                                                                    <p>${orders.pname}</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="td td-price">
                                                        <div class="item-price">
                                                            ${orders.price}
                                                        </div>
                                                    </li>
                                                    <li class="td td-number">
                                                        <div class="item-number">
                                                            <span>×</span>${orders.quantity}
                                                        </div>
                                                    </li>
                                                </ul>
                                                <c:set var="sum" value="${sum + orders.price * orders.quantity}"></c:set>
                                            </c:forEach>
                                        </div>
                                        <div class="order-right">
                                            <li class="td td-amount">
                                                <div class="item-amount">
                                                    合计：${sum}
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="common/foot.jsp"%>
            </div>
        </div>
    </body>
</html>