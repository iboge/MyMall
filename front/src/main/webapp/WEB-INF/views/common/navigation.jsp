<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="shopNav">
    <div class="slideall">
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="${ctx}/searchProduct/home">首页</a></li>
                <c:forEach items="${applicationScope.categorys}" var="category">
                    <li class="qc"><a href="${ctx}/searchProduct/query?cid=${category.id}">${category.name}</a></li>
                </c:forEach>
                <li class="qc last"><a href="${ctx}/searchProduct/query?id=">全部商品</a></li>
            </ul>
        </div>
        <!--轮播-->
        <script type="text/javascript">
            (function() {
                $('.am-slider').flexslider();
            });
            $(document).ready(function() {
                $("li").hover(function() {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function() {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }
            $(function() {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
