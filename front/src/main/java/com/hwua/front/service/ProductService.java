package com.hwua.front.service;

import com.hwua.common.po.Evaluate;
import com.hwua.common.po.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductService {

    public List<Map<String,Object>> getImg();

    public List<Product> getProductByBid(Integer id);

    public List<Map<String,Object>> getBrand();

    public List<Product> getProductByCid(Integer id);

    public List<Map<String,Object>> getCategory();

    public Product getProductById(Integer id);

    public List<Product> getProductByName(String name);

    public List<Product> queryProductBySales();

    public List<Product> getProduct();

    public List<Product> getProduct1();

    public List<Product> getProductSales1();

    public List<Product> getProduct2();

    public List<Product> getProductSales2();

    public List<Product> getProduct3();

    public List<Product> getProductSales3();

    public int changeInventory(Integer id,Integer inventory);

    public int changeSales(Integer id,Integer sales);

    public List<Product> get(Map<String,Object> map);

    public int getCount(Map<String,Object> map);

    public int addEvaluate(Evaluate evaluate);

    public List<Evaluate> getEvaluate(Evaluate evaluate);

    public List<Evaluate> getEvaluateByPid(Integer pid);

    public List<Product> getName(Map<String,Object> map);

    public int getNameCount(Map<String,Object> map);

}
