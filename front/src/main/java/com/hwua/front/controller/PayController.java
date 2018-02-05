package com.hwua.front.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.common.po.*;
import com.hwua.front.service.PayService;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/memberPay")
public class PayController {

    @Autowired
    private PayService payService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/addFavorites",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addFavorites(Integer pid, HttpSession session){
        JSONObject json = new JSONObject();
        Object id1 = session.getAttribute("id");
        Favorites favorites = new Favorites();
        Integer mid = (Integer) id1;
        favorites.setMid(mid);
        favorites.setPid(pid);
        int i = payService.addFavorites(favorites);
        if(i==1){
            json.put("msg","收藏成功！");
        }else if(i==2){
            json.put("msg","收藏失败！请重试");
        }else if(i==0) {
            json.put("msg","此商品已收藏！");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/delFavorites")
    public String delFavorites(Integer id){
        JSONObject json = new JSONObject();
        int i = payService.changeFavorites(id);
        if(i==1){
            json.put("msg","取消收藏成功！");
        }else{
            json.put("msg","取消收藏失败！请重试");
        }
        return "redirect:/memberPay/getFavorites";
    }

    @RequestMapping(value = "/getFavorites")
    public String getFavorites(Map<String,Object> map,HttpSession session){
        Integer id = (Integer) session.getAttribute("id");
        List<Favorites> favorites = payService.getFavoritesById(id);
        map.put("favorites",favorites);
        return "collection";
    }

    @RequestMapping(value = "/addCart",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addCart(Integer pid, HttpSession session){
        JSONObject json = new JSONObject();
        Object id1 = session.getAttribute("id");
        MemberCart memberCart = new MemberCart();
        Integer mid = (Integer) id1;
        memberCart.setMid(mid);
        memberCart.setPid(pid);
        int i = payService.addCart(memberCart);
        if(i==1){
            json.put("msg","加入购物车成功！");
        }else{
            json.put("msg","加入失败！请重试");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/getCart")
    public String getCart(Map<String,Object> map,HttpSession session){
        Integer id = (Integer) session.getAttribute("id");
        List<MemberCart> memberCart = payService.getCart(id);
        map.put("memberCart",memberCart);
        return "shopcart";
    }

    @RequestMapping(value = "/delCart")
    public String delCart(Integer id,HttpSession session){
        MemberCart memberCart = new MemberCart();
        if(id!=null){
            memberCart.setId(id);
        }
        Integer id1 = (Integer) session.getAttribute("id");
        memberCart.setMid(id1);
        int i = payService.changeCart(memberCart);
        return "redirect:/memberPay/getCart";
    }

    @RequestMapping(value = "/changeQuantity",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeQuantity(Integer quantity,Integer id){
        JSONObject json = new JSONObject();
        MemberCart memberCart = new MemberCart();
        memberCart.setId(id);
        memberCart.setQuantity(quantity);
        int i = payService.changeCartQuantity(memberCart);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/getOrder")
    public String getOrder(Map<String,Object> map,HttpSession session){
        Object id = session.getAttribute("id");
        Integer mid = (Integer) id;
        List<Map<String, Object>> order = payService.getOrder(mid);
        List<Map<String, Object>> orders = payService.getOrders(mid);
        map.put("order",order);
        map.put("orders",orders);
        return "order";
    }

    @RequestMapping(value = "/delOrder")
    public String delOrder(Integer id,Map<String,Object> map,HttpSession session){
        int i = payService.delOrder(id);
        Object id1 = session.getAttribute("id");
        Integer mid = (Integer) id1;
        List<Map<String, Object>> order = payService.getOrder(mid);
        List<Map<String, Object>> orders = payService.getOrders(mid);
        map.put("order",order);
        map.put("orders",orders);
        return "order";
    }

    @RequestMapping(value = "/addOrderInfo",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addOrderInfo(Integer pid,Integer carId,Integer carIds[],HttpSession session){
        System.out.println("pid = " + pid);
        System.out.println("carId = " + carId);
        System.out.println("carIds = " + carIds);
        Integer mid = (Integer) session.getAttribute("id");
        Orders orders = new Orders();
        orders.setMid(mid);
        int i1 = payService.addOrder(orders);
        if(pid!=null){
            Product productById = productService.getProductById(pid);
            orders.setPid(pid);
            orders.setPrice(productById.getPrice());
            orders.setQuantity(1);
            payService.addOrderInfo(orders);
        }
        if(carId!=null){
            MemberCart cartById = payService.getCartById(carId);
            Product productById = productService.getProductById(cartById.getPid());
            orders.setPid(cartById.getPid());
            orders.setPrice(productById.getPrice());
            orders.setQuantity(cartById.getQuantity());
            payService.addOrderInfo(orders);
            MemberCart memberCart = new MemberCart();
            memberCart.setId(carId);
            memberCart.setMid(mid);
            payService.changeCart(memberCart);
        }
        if(carIds!=null) {
            for (int i = 0; i < carIds.length; i++) {
                Integer cartid = carIds[i];
                MemberCart cartById = payService.getCartById(cartid);
                Product productById = productService.getProductById(cartById.getPid());
                orders.setPid(cartById.getPid());
                orders.setPrice(productById.getPrice());
                orders.setQuantity(cartById.getQuantity());
                payService.addOrderInfo(orders);
                MemberCart memberCart = new MemberCart();
                memberCart.setId(cartid);
                memberCart.setMid(mid);
                payService.changeCart(memberCart);
            }
        }
        JSONObject json = new JSONObject();
        json.put("oid",orders.getOid());
        json.put("msg",true);
        return json.toJSONString();
    }

    @RequestMapping(value = "/getAddr")
    public String getAddr(Integer oid,HttpSession session,Map<String,Object> map){
        System.out.println("oid = " + oid);
        Integer mid = (Integer) session.getAttribute("id");
        List<RecipientInfo> addr = payService.getAddr(mid);
        map.put("addr",addr);
        map.put("oid",oid);
        return "addr";
    }

    @RequestMapping(value = "/addOrderInfo2")
    public String addOrderInfo2(Integer oid,Integer rid,RecipientInfo recipientInfo,Map<String,Object> map,HttpSession session){
        System.out.println("oid = " + oid);
        System.out.println("rid = " + rid);
        System.out.println("recipientInfo = " + recipientInfo);
        Integer mid = (Integer) session.getAttribute("id");
        Orders orders = new Orders();
        orders.setOid(oid);
        int i = 0;
        if(rid==null && recipientInfo!=null) {
            orders.setName(recipientInfo.getName());
            orders.setTel(recipientInfo.getTel());
            orders.setAddr(recipientInfo.getAddr());
            i=payService.changeOrderAddr(orders);
            recipientInfo.setMid(mid);
            payService.addRecipient(recipientInfo);
        }else if(rid!=null){
            RecipientInfo recipientInfo1 = payService.queryRecipientInfo(rid);
            orders.setName(recipientInfo1.getName());
            orders.setTel(recipientInfo1.getTel());
            orders.setAddr(recipientInfo1.getAddr());
            i=payService.changeOrderAddr(orders);
        }
        if(i!=0) {
            List<Orders> orderByOid = payService.getOrderByOid(oid);
            for (Orders order1 : orderByOid) {
                productService.changeInventory(order1.getPid(), order1.getQuantity());
                productService.changeSales(order1.getPid(), order1.getQuantity());
            }
        }
        List<Map<String, Object>> order1 = payService.getOrder(mid);
        List<Map<String, Object>> orders1 = payService.getOrders(mid);
        map.put("order", order1);
        map.put("orders", orders1);
        return "order";
    }

    @RequestMapping(value = "/getOrderInfo")
    public String getOrderInfo(Integer id,Map<String,Object> map,HttpSession session){
        Integer mid = (Integer) session.getAttribute("id");
        List<Map<String, Object>> order = payService.getOrder(mid);
        List<Map<String, Object>> orderdetailByOid = payService.getOrderdetailByOid(id);
        System.out.println("order = " + order);
        System.out.println("orderdetailByOid = " + orderdetailByOid);
        map.put("order",order);
        map.put("orders",orderdetailByOid);
        /*Evaluate evaluate = new Evaluate();
        evaluate.setMid(mid);
        evaluate.setPid(id);
        List<Evaluate> evaluate1 = productService.getEvaluate(evaluate);
        map.put("evaluate",evaluate1);
        System.out.println("evaluate1 = " + evaluate1);*/
        return "orderinfo";
    }

}
