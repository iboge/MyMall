<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>购物车页面</title>
        <%@include file="common/common.jsp"%>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/css/cartstyle.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/css/optstyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
        <script type="application/javascript" src="${ctx}/static/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $("input[name='quantity']").click(function () {
                    var ss = this;
                    var quantity = $(this).val();
                    var id = $(this).nextAll("input[name='id']").val();
                    var formdata = {
                        quantity:quantity,
                        id:id
                    }
                    $.ajax({
                        url:"${ctx}/memberPay/changeQuantity",
                        type:"POST",
                        data:formdata,
                        success:function (result) {
                            var quantity = $(ss).val();
                            var price = $(ss).prev().val();
                            $(ss).parent().parent().parent().parent().next("li").children("div").children("em").text("￥"+quantity*price+".0")
                        },
                        error:function () {},
                    });
                });
            })
            $(function () {
                $("input[name='items[]']").click(function () {
                    var prices = 0;
                    var counts = 0;
                    $("#J_SelectAllCbx2").prop("checked", true);
                    $("input[name='items[]']").each(function () {
                        if (!$(this)[0].checked) {
                            $("#J_SelectAllCbx2").prop("checked", false);
                        }
                        if ($(this)[0].checked) {
                            var price = $(this).prev().val();
                            var count = $(this).next().next().val();
                            price = parseFloat(price);
                            prices = prices + price;
                            count = parseInt(count);
                            counts = counts + count;
                            console.log("price:"+price);
                        }
                        console.log("prices:"+prices);
                    });
                    $("#J_SelectedItemsCount").text(counts);
                    $(".totle").text("￥" + prices);
                });
                $("#J_SelectAllCbx2").click(function () {
                    $("input[name='items[]']").prop("checked",$(this).prop("checked"));
                    var prices = 0;
                    var counts = 0;
                    $("input[name='items[]']:checked").each(function () {
                        if($(this)[0].checked){
                            var price = $(this).prev().val();
                            var count = $(this).next().next().val();
                            price = parseFloat(price);
                            prices = prices+price;
                            count = parseInt(count);
                            counts = counts+count;
                        }
                    });
                    $("#J_SelectedItemsCount").text(counts);
                    $(".totle").text("￥" + prices);
                });
                $(function () {
                    $("#J_Go").click(function () {
                        if (!$("input[name = 'items[]']:checked").length) {
                            alert("请选择商品！");
                        } else {
                            var carIds = [];
                            var prices = [];
                            $("input[name = 'items[]']:checked").each(function () {
                                carIds.push($(this).next().val());
                            });
                            console.log("carIds:" + carIds);

                            console.log("prices:" + prices);
                            $.ajax({
                                url: "${ctx}/memberPay/addOrderInfo",
                                type: 'post',
                                data: {
                                    carIds: carIds
                                },
                                traditional: true,//解决传递数组时出现的问题
                                success: function (result) {
                                    if (result.msg) {
                                        window.location = "${ctx}/memberPay/getAddr?oid=" + result.oid;
                                    } else {
                                        alert("操作失败！");
                                    }
                                },
                                error: function () {

                                }
                            });
                        }
                    })
                })
            });
            /*function onclick() {
                var carId = $(this).prev().val();
                alert(carId);
            }*/
            $(function () {
                $("a[name='buy']").click(function () {
                    var carId = $(this).prev().val();
                    $.ajax({
                        url: "${ctx}/memberPay/addOrderInfo",
                        type: 'post',
                        data: {
                            carId: carId
                        },
                        success: function (result) {
                            if (result.msg) {
                                window.location = "${ctx}/memberPay/getAddr?oid=" + result.oid;
                            } else {
                                alert("操作失败！");
                            }
                        },
                        error: function () {

                        }
                    });
                })
            })
        </script>
    </head>
    <body>
        <%@include file="common/head.jsp"%>
        <b style="margin-top: -50px" class="line"></b>
        <div style="margin-top: 20px" class="clear"></div>
        <!--购物车 -->
        <form action="${ctx}/order" method="post">
        <div class="concent">
            <div id="cartTable">
                <div class="cart-table-th">
                    <div class="wp">
                        <div class="th th-chk">
                            <div id="J_SelectAll1" class="select-all J_SelectAll">
                            </div>
                        </div>
                        <div class="th th-item">
                            <div class="td-inner">商品信息</div>
                        </div>
                        <div class="th th-price">
                            <div class="td-inner">单价</div>
                        </div>
                        <div class="th th-amount">
                            <div class="td-inner">数量</div>
                        </div>
                        <div class="th th-sum">
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-op">
                            <div class="td-inner">操作</div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <tr class="item-list">
                    <div class="bundle  bundle-last ">
                        <div class="clear"></div>
                        <div class="bundle-main">
                            <c:forEach items="${requestScope.memberCart}" var="memberCart">
                                <ul class="item-content clearfix">
                                    <li class="td td-chk">
                                        <div class="cart-checkbox ">
                                            <c:set var="cp" value="${memberCart.price * memberCart.quantity}"></c:set>
                                            <input type="hidden" name="cp" value="${cp}">
                                            <%--<input type="hidden" name="price" value="${memberCart.price}"/>--%>
                                            <input class="check" id="J_CheckBox_170769542747" name="items[]" value="170769542747" type="checkbox">
                                            <input type="hidden" name="id" value="${memberCart.id}"/>
                                            <input type="hidden" name="quantity" value="${memberCart.quantity}"/>
                                            <label for="J_CheckBox_170769542747"></label>
                                        </div>
                                    </li>
                                    <input type="hidden" name="fid" value="${memberCart.pid}"/>
                                    <li class="td td-item">
                                        <div class="item-pic">
                                            <a href="${ctx}/searchProduct/searchId?id=${memberCart.pid}" target="_blank" data-title="${memberCart.name}" class="J_MakePoint" data-point="tbcart.8.12">
                                                <img style="width: 80px;height: 80px" src="${memberCart.image}" class="itempic J_ItemImg" width="90px" height="90px"></a>
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="${ctx}/searchProduct/searchId?id=${memberCart.pid}" target="_blank" title="" class="item-title J_MakePoint" data-point="tbcart.8.11">${memberCart.name}</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-info">
                                        <div style="height: 10px"></div>
                                    </li>
                                    <li class="td td-price">
                                        <div class="item-price price-promo-promo">
                                            <div class="price-content">
                                                <div class="price-line">
                                                    <em class="J_price price-now" tabindex="0">￥${memberCart.price}</em>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-amount">
                                        <div class="amount-wrapper ">
                                            <div class="item-amount ">
                                                <div class="sl">
                                                    <input type="hidden" name="price" value="${memberCart.price}"/>
                                                    <%--<input class="min" name="btn" type="button" value="-" />
                                                    <input class="text_box" name="quantity" type="text" value="${memberCart.quantity}" style="width:30px;" />
                                                    <input class="add" name="btn" type="button" value="+" />--%>
                                                    <input id="count" style="line-height: 18px;width: 40px" min="1" type="number" name="quantity" value="${memberCart.quantity}"/>
                                                    <input type="hidden" name="id" value="${memberCart.id}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-sum">
                                        <div class="td-inner">
                                            <em tabindex="0" class="number">￥${memberCart.price * memberCart.quantity}</em>
                                            <%--<c:set var="cp" value="${memberCart.price * memberCart.quantity}"></c:set>
                                            <input type="hidden" name="cp" value="${cp}">--%>
                                        </div>
                                    </li>
                                    <li class="td td-op">
                                        <div class="td-inner">
                                            <input type="hidden" name="carId" value="${memberCart.id}"/>
                                            <a name="buy" <%--onclick="onclick1()"--%> <%--href="${ctx}/memberPay/addOrderInfo?carId=${memberCart.id}"--%> data-point-url="#" class="delete">购买</a>
                                            <a href="${ctx}/memberPay/delCart?id=${memberCart.id}" data-point-url="#" class="delete">删除</a>
                                        </div>
                                    </li>
                                </ul>
                                <%--<c:set var="sum" value="${sum + memberCart.price * memberCart.quantity}"></c:set>
                                <c:set var="cou" value="${cou + memberCart.quantity}"></c:set>--%>
                            </c:forEach>
                        </div>
                    </div>
                </tr>
            </div>
            <div class="clear"></div>
            <div class="float-bar-wrapper">
                <div id="J_SelectAll2" class="select-all J_SelectAll">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
                        <label for="J_SelectAllCbx2"></label>
                    </div>
                    <span>全选</span>
                </div>
                <div style="margin-left: 20px" class="operations">
                    <a href="${ctx}/memberPay/delCart?id=" hidefocus="true" class="deleteAll">清空购物车</a>
                </div>
                <div class="float-bar-right">
                    <div class="amount-sum">
                        <span class="txt">已选商品</span>
                        <em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
                        <div class="arrow-box">
                            <span class="selected-items-arrow"></span>
                            <span class="arrow"></span>
                        </div>
                    </div>
                    <div class="price-sum">
                        <span class="txt">合计:</span>
                        <strong id="tot" class="price"><em class="totle" id="J_Total">0.0</em></strong>
                        <input type="hidden" name="total" value=""/>
                    </div>
                    <div class="btn-area">
                        <a id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">结算</a>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <%@include file="common/foot.jsp"%>
        <div class="theme-popover-mask"></div>
    </body>
</html>