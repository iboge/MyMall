<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>商品页面</title>
        <%@include file="common/common.jsp"%>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
        <link type="text/css" href="${ctx}/static/css/optstyle.css" rel="stylesheet" />
        <link type="text/css" href="${ctx}/static/css/style.css" rel="stylesheet" />
        <script type="text/javascript" src="${ctx}/static/basic/js/jquery-1.7.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/basic/js/quick_links.js"></script>
        <script type="text/javascript" src="${ctx}/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jquery.imagezoom.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jquery.flexslider.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/list.js"></script>
        <script type="text/javascript">
            function onclick1() {
                var pid = $("#fav").val();
                var name = $("#name").val();
                if(name!=""){
                    $.ajax({
                       url:"${ctx}/memberPay/addFavorites",
                       type:"post",
                       data:{
                           pid:pid
                       },
                       success:function (result) {
                           alert(result.msg);
                       },
                       error:function () {

                       }
                    });
                }else{
                    location="${ctx}/login.jsp"
                }
            };
            function onclick2() {
                var pid = $("#fav").val();
                var name = $("#name").val();
                if(name!=""){
                    $.ajax({
                       url:"${ctx}/memberPay/addCart",
                       type:"post",
                       data:{
                           pid:pid
                       },
                       success:function (result) {
                           alert(result.msg);
                       },
                       error:function () {

                       }
                    });
                }else{
                    location="${ctx}/login.jsp"
                }
            };
            function onclick3() {
                var pid = $("#pid").val();
                $.ajax({
                    url: "${ctx}/memberPay/addOrderInfo",
                    type: 'post',
                    data: {
                        pid: pid
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
            }
        </script>
    </head>
    <body>
        <%@include file="common/head.jsp"%>
        <div class="clear"></div>
        <b class="line"></b>
        <div style="margin-top: 50px;" class="listMain">
            <script type="text/javascript">
                $(function() {});
                $(window).load(function() {
                    $('.flexslider').flexslider({
                        animation: "slide",
                        start: function(slider) {
                            $('body').removeClass('loading');
                        }
                    });
                });
            </script>
            <div class="scoll">
                <section class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <img src="${requestScope.product.image}" title="pic" />
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
            <!--放大镜-->
            <div class="item-inform">
                <div class="clearfixLeft" id="clearcontent">
                    <div class="box">
                        <script type="text/javascript">
                            $(document).ready(function() {
                                $(".jqzoom").imagezoom();
                                $("#thumblist li a").click(function() {
                                    $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                                    $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                                    $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                                });
                            });
                        </script>
                        <div class="tb-booth tb-pic tb-s310">
                            <a href="${requestScope.product.image}"><img src="${requestScope.product.image}" alt="细节展示放大镜特效" rel="${requestScope.product.image}" class="jqzoom" /></a>
                        </div>
                        <ul class="tb-thumb" id="thumblist">
                            <li class="tb-selected">
                                <div class="tb-pic tb-s40">
                                    <a href="#"><img src="${requestScope.product.image}" mid="${requestScope.product.image}" big="${requestScope.product.image}"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clearfixRight">
                    <!--规格属性-->
                    <!--名称-->
                    <div class="tb-detail-hd">
                        <h1>
                            ${requestScope.product.name}
                        </h1>
                        <span>${requestScope.product.details}</span>
                    </div>
                    <div class="tb-detail-list">
                        <!--价格-->
                        <div class="tb-detail-price">
                            <li class="price iteminfo_price">
                                <dt>价格</dt>
                                <dd><em>¥</em><b class="sys_item_price">${requestScope.product.price}</b>  </dd>
                            </li>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <!--销量-->
                        <ul class="tm-ind-panel">
                            <li class="tm-ind-item tm-ind-sellCount canClick">
                                <div style="text-align: left" class="tm-indcon"><span class="tm-label">&nbsp;&nbsp;&nbsp;销量：</span><span class="tm-count">${requestScope.product.sales}</span></div>
                            </li>
                        </ul>
                        <ul class="tm-ind-panel">
                            <li class="tm-ind-item tm-ind-sellCount canClick">
                                <div style="text-align: left" class="tm-indcon"><span class="tm-label">&nbsp;&nbsp;&nbsp;库存：${requestScope.product.inventory}件</span></div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                    <div class="btn-op">
                    </div>
                    <div class="pay">
                        <div class="pay-opt">
                            <a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
                        </div>
                        <li>
                            <div class="clearfix tb-btn tb-btn-buy theme-login">
                                <input id="pid" type="hidden" name="pid" value="${requestScope.product.id}"/>
                                <a onclick="onclick3()" id="LikBuy" title="点此按钮到下一步确认购买信息" <%--href="${ctx}/memberPay/addOrderInfo?pid=${requestScope.product.id}"--%>>立即购买</a>
                            </div>
                        </li>
                        <li>
                            <div class="clearfix tb-btn tb-btn-basket theme-login">
                                <a onclick="onclick2()" id="LikBasket" title="加入购物车">
                                    加入购物车
                                </a>
                            </div>
                        </li>
                        <li>
                            <div style="margin-left: 10px" class="clearfix tb-btn tb-btn-basket theme-login">
                                <input id="fav" type="hidden" value="${requestScope.product.id}"/>
                                <input id="name" type="hidden" value="${sessionScope.member.name}"/>
                                <a onclick="onclick1()" title="加入收藏夹">
                                    加入收藏夹
                                </a>
                            </div>
                        </li>
                    </div>
                </div>
            </div>
        </div>

        </dd>
        </dl>
        <div class="clear"></div>
        <div class="tb-r-filter-bar">
            <ul class=" tb-taglist am-avg-sm-4">
                <li class="tb-taglist-li tb-taglist-li-current">
                    <div class="comment-info">
                        <span><b style="font-size: 20px;color: #EA6021">全部评价</b></span>
                    </div>
                </li>
            </ul>
        </div>
        <c:forEach items="${requestScope.evaluate}" var="evaluate">
            <ul class="am-comments-list am-comments-list-flip">
                <li class="am-comment">
                    <a href="">
                        <img class="am-comment-avatar" src="${ctx}/static/img/hwbn40x40.jpg" />
                    </a>
                    <div class="am-comment-main">
                        <header class="am-comment-hd">
                            <div class="am-comment-meta">
                                <a href="#link-to-user" class="am-comment-author"></a>
                                评论时间：
                                <time datetime="">${evaluate.createtime}</time>
                            </div>
                        </header>
                        <div class="am-comment-bd">
                            <div class="tb-rev-item " data-id="255776406962">
                                <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                    ${evaluate.evaluates}
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </c:forEach>
        </div>
        </div>
        <div class="clear"></div>
        </div>
        <%@include file="common/foot.jsp"%>
        <div class="clear"></div>
        </div>
    </body>
</html>