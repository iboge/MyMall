<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div style="margin-top: 20px" id="prof" class="item ">
                <a href="person.jsp">
                    <span class="setting "></span>
                </a>
            </div>
            <div style="margin-top: 20px" id="shopCart " class="item ">
                <a href="shopcart.jsp ">
                    <span class="message "></span>
                </a>
                <p>
                    购物车
                </p>
                <p class="cart_num ">0</p>
            </div>
            <div style="margin-top: 20px" id="brand " class="item ">
                <a href="collection.jsp">
                    <span class="wdsc "><img src="${ctx}/static/images/wdsc.png " /></span>
                </a>
                <div class="mp_tooltip ">
                    我的收藏
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>
            <div class="quick_toggle ">
                <li class="qtitem ">
                    <a href="#top" class="return_top "><span class="top "></span></a>
                </li>
            </div>
        </div>
    </div>
    <script>
        window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
    </script>
</div>
