package com.hwua.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.ProductService;
import com.hwua.common.po.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/queryBrand")
    public String queryBrand(Map<String,Object> map){
        List<Map<String, Object>> maps = productService.queryBA();
        map.put("brand",maps);
        map.put("size",maps.size());
        List<Map<String, Object>> maps1 = productService.queryBCA();
        map.put("bca",maps1);
        return "brand";
    }

    @RequestMapping(value = "/changeBS",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeBS(Integer id,String status){
        System.out.println("id = " + id);
        System.out.println("status = " + status);
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("status",status);
        int i = productService.doUpdateBS(map);
        JSONObject json = new JSONObject();
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping("/queryBById")
    public String queryBById(Integer id,Map<String,Object> map){
        Map<String, Object> stringObjectMap = productService.queryBById(id);
        map.put("brand",stringObjectMap);
        List<Map<String, Object>> maps = productService.queryCA();
        List<Map<String, Object>> maps1 = productService.queryCnameByBid(id);
        for(Map<String, Object> category:maps){
            for(Map<String, Object> bca:maps1){
                if(category.get("name").equals(bca.get("name"))){
                    category.put("checked",true);
                    break;
                }else{
                    category.put("checked",false);
                }
            }
        }
        System.out.println("maps = " + maps);
        map.put("category",maps);
        return "brand-edit";
    }

    @RequestMapping("/queryCById")
    public String queryCById(Integer id,Map<String,Object> map){
        Map<String, Object> stringObjectMap = productService.queryCById(id);
        map.put("category",stringObjectMap);
        List<Map<String, Object>> maps = productService.queryBA();
        List<Map<String, Object>> maps1 = productService.queryBnameByCid(id);
        for(Map<String, Object> brand:maps){
            for(Map<String, Object> bca:maps1){
                if(brand.get("name").equals(bca.get("name"))){
                    brand.put("checked",true);
                    break;
                }else{
                    brand.put("checked",false);
                }
            }
        }
        System.out.println("maps = " + maps);

        map.put("brand",maps);
        return "category-edit";
    }

    @RequestMapping("/queryCategory")
    public String queryCategory(Map<String,Object> map){
        List<Map<String, Object>> maps = productService.queryCA();
        map.put("category",maps);
        map.put("size",maps.size());
        List<Map<String, Object>> maps1 = productService.queryBCA();
        map.put("bca",maps1);
        return "category";
    }

    @RequestMapping(value = "/changeCS",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changeCS(Integer id,String status){
        System.out.println("id = " + id);
        System.out.println("status = " + status);
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("status",status);
        int i = productService.doUpdateCS(map);
        JSONObject json = new JSONObject();
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/editBrand",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String editBrand(Integer id,Integer[] ids,Map<String,Object> map){
        System.out.println("id = " + id);
        System.out.println("ids = " + ids);
        int sum = 0;
        productService.doDeleteCBTable(id);
        for(int j=0;j<ids.length;j++) {
            int cid = ids[j];
            sum += productService.doInsertCBTable(id,cid);
        }
        JSONObject json = new JSONObject();
        if(sum!=0){
            json.put("msg","成功！");
        }else{
            json.put("msg","失败！");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/editCategory",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String editCategory(Integer id,Integer[] ids,Map<String,Object> map){
        System.out.println("id = " + id);
        System.out.println("ids = " + ids);
        int sum = 0;
        productService.doDeleteCBTable1(id);
        for(int j=0;j<ids.length;j++) {
            int bid = ids[j];
            sum += productService.doInsertCBTable1(id,bid);
        }
        JSONObject json = new JSONObject();
        if(sum!=0){
            json.put("msg","成功！");
        }else{
            json.put("msg","失败！");
        }
        return json.toJSONString();
    }

    @RequestMapping("/addBrand")
    public String addBrand(Map<String,Object> map){
        List<Map<String, Object>> maps = productService.queryCA();
        map.put("category",maps);
        return "brand-add";
    }

    @RequestMapping(value = "/addBrand1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addBrand1(String name,Integer[] ids,Map<String,Object> map){
        System.out.println("name = " + name);
        System.out.println("ids = " + ids);
        int i = productService.doInsertB(name);
        Map<String, Object> stringObjectMap = productService.queryByBname(name);
        Integer id = (Integer) stringObjectMap.get("id");
        int sum = 0;
        for(int j=0;j<ids.length;j++) {
            int cid = ids[j];
            sum += productService.doInsertCBTable(id,cid);
        }
        JSONObject json = new JSONObject();
        if(sum!=0){
            json.put("msg","成功！");
        }else{
            json.put("msg","失败！");
        }
        return json.toJSONString();
    }

    @RequestMapping(value = "/addCategory1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addCategory1(String name,Integer[] ids,Map<String,Object> map){
        System.out.println("name = " + name);
        System.out.println("ids = " + ids);
        int i = productService.doInsertC(name);
        Map<String, Object> stringObjectMap = productService.queryByCname(name);
        Integer id = (Integer) stringObjectMap.get("id");
        int sum = 0;
        for(int j=0;j<ids.length;j++) {
            int bid = ids[j];
            sum += productService.doInsertCBTable1(id,bid);
        }
        JSONObject json = new JSONObject();
        if(sum!=0){
            json.put("msg","成功！");
        }else{
            json.put("msg","失败！");
        }
        return json.toJSONString();
    }

    @RequestMapping("/addCategory")
    public String addCategory(Map<String,Object> map){
        List<Map<String, Object>> maps = productService.queryBA();
        map.put("brand",maps);
        return "category-add";
    }

    @RequestMapping("/queryProduct")
    public String queryProduct(Map<String,Object> map){
        List<Map<String, Object>> maps = productService.queryAllProduct();
        map.put("product",maps);
        map.put("size",maps.size());
        return "product";
    }

    @RequestMapping(value = "/changePS",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String changePS(Integer id,String status){
        System.out.println("id = " + id);
        System.out.println("status = " + status);
        Map<String, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("status",status);
        int i = productService.doUpdatePS(map);
        JSONObject json = new JSONObject();
        System.out.println("i = " + i);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping("/addProduct")
    public String addProduct(Map<String,Object> map){
        List<Map<String, Object>> maps = productService.queryBA();
        List<Map<String, Object>> maps1 = productService.queryCA();
        map.put("brand",maps);
        map.put("category",maps1);
        return "product-add";
    }

    @RequestMapping(value = "/addProduct1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addProduct1(Product product, HttpSession session){
        JSONObject json = new JSONObject();
        String imgUrl = (String) session.getAttribute("imgUrl");
        product.setImage(imgUrl);
        System.out.println("product = " + product);
        int i = productService.doInsertProduct(product);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping("/editProduct")
    public String editProduct(Integer id,Map<String,Object> map){
        Map<String,Object> product = productService.queryProductByID(id);
        map.put("product",product);
        return "product-edit";
    }

    @RequestMapping(value = "/editProduct1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String editProduct1(Product product){
        JSONObject json = new JSONObject();
        System.out.println("product = " + product);
        int i = productService.doUpdateProduct(product);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

    @RequestMapping("/editpp")
    public String editpp(Integer id,Map<String,Object> map){
        map.put("id",id);
        return "editpp";
    }

    @RequestMapping(value = "/editpp1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String editpp1(Integer id,HttpSession session){
        JSONObject json = new JSONObject();
        String imgUrl = (String) session.getAttribute("imgUrl");
        Map<Object, Object> map = new HashMap<>();
        map.put("id",id);
        map.put("image",imgUrl);
        int i = productService.doUpdatePimg(map);
        if(i==1){
            json.put("msg",true);
        }else{
            json.put("msg",false);
        }
        return json.toJSONString();
    }

}
