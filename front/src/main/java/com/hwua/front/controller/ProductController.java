package com.hwua.front.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.common.po.Evaluate;
import com.hwua.common.po.Product;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/searchProduct")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/home")
    public String queryHomeData(Map<String,Object> map){
        List<Map<String, Object>> img = productService.getImg();
        List<Product> product1 = productService.getProduct1();
        List<Product> product2 = productService.getProduct2();
        List<Product> product3 = productService.getProduct3();
        List<Product> productSales1 = productService.getProductSales1();
        List<Product> productSales2 = productService.getProductSales2();
        List<Product> productSales3 = productService.getProductSales3();
        map.put("imgs", img);
        map.put("product1", product1);
        map.put("product2", product2);
        map.put("product3", product3);
        map.put("productSales1", productSales1);
        map.put("productSales2", productSales2);
        map.put("productSales3", productSales3);
        return "home";
    }

    @RequestMapping(value = "/searchBCid")
    public String queryProductBCid(Integer bid,Integer cid, Map<String,Object> map){
        if(bid!=null) {
            List<Product> product = productService.getProductByBid(bid);
            map.put("size",product.size());
            map.put("products", product);
        }else if(cid!=null){
            List<Product> product = productService.getProductByCid(cid);
            map.put("size",product.size());
            map.put("products", product);
        }else{
            List<Product> product = productService.getProduct();
            map.put("size",product.size());
            map.put("products", product);
        }
        List<Product> productSales = productService.queryProductBySales();
        map.put("productSales",productSales);
        return "search";
    }

    @RequestMapping(value = "/searchId")
    public String queryProductId(Integer id, Map<String,Object> map){
        Product product = productService.getProductById(id);
        List<Evaluate> evaluate = productService.getEvaluateByPid(id);
        map.put("evaluate",evaluate);
        map.put("product",product);
        System.out.println("evaluate = " + evaluate);
        System.out.println("product = " + product);
        return "introduction";
    }

    @RequestMapping(value = "/search")
    public String queryProductName(String s, Map<String,Object> map){
        List<Product> product = productService.getProductByName(s);
        map.put("size",product.size());
        if(product!=null){
            map.put("products",product);
        }
        List<Product> productSales = productService.queryProductBySales();
        map.put("productSales",productSales);
        return "search";
    }

    @RequestMapping(value = "/addEvaluate",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addEvaluate(Evaluate evaluate, HttpSession session){
        Integer id = (Integer) session.getAttribute("id");
        evaluate.setMid(id);
        int i = productService.addEvaluate(evaluate);
        JSONObject json= new JSONObject();
        if(i==1){
            json.put("msg","success");
        }else{
            json.put("msg","error");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/query")
    public String query(String s,Integer bid,Integer cid,Integer start,Map<String,Object> map){
        System.out.println("s = " + s);
        System.out.println("bid = " + bid);
        System.out.println("cid = " + cid);
        System.out.println("start = " + start);
        if (start == null) {
            start = 1;
        }
        int count = 0;
        if(s==null) {
            Map<String, Object> hashMap = new HashMap<>();
            hashMap.put("bid", bid);
            hashMap.put("cid", cid);
            hashMap.put("start",(start-1)*8);
            hashMap.put("rows", 8);
            count = productService.getCount(hashMap);
            map.put("start", start);
            List<Product> products = productService.get(hashMap);
            map.put("products", products);
        }else if(s!=null){
            Map<String,Object> hashMap = new HashMap<>();
            hashMap.put("name",s);
            hashMap.put("start",(start-1)*8);
            hashMap.put("rows",8);
            count = productService.getNameCount(hashMap);
            map.put("start",start);
            List<Product> products = productService.getName(hashMap);
            map.put("products",products);
        }
        map.put("count", count);
        if (count % 8 != 0) {
            int page = count / 8 + 1;
            System.out.println("page = " + page);
            map.put("page", page);
        } else {
            int page = count / 8;
            map.put("page", page);
        }
        map.put("s",s);
        map.put("bid",bid);
        map.put("cid",cid);
        List<Product> productSales = productService.queryProductBySales();
        map.put("productSales",productSales);
        return "search";
    }

    /*@RequestMapping(value = "/queryName")
    public String queryName(String s,Integer start,Map<String,Object> map){
        System.out.println("s = " + s);
        System.out.println("start = " + start);
        if(start==null){
            start = 1;
        }
        Map<String,Object> hashMap = new HashMap<>();
        hashMap.put("name",s);
        hashMap.put("start",start-1);
        hashMap.put("rows",8);
        int count = productService.getNameCount(s);
        map.put("count",count);
        if(count%8!=0){
            int page = count/8+1;
            System.out.println("page = " + page);
            map.put("page",page);
        }else{
            int page = count/8;
            map.put("page",page);
        }
        map.put("start",start);
        List<Product> products = productService.getName(hashMap);
        map.put("products",products);
        List<Product> productSales = productService.queryProductBySales();
        map.put("productSales",productSales);
        return "search";
    }*/

}

