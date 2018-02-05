package com.hwua.common.mapper;

import com.hwua.common.po.Evaluate;
import com.hwua.common.po.Product;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

    public List<Map<String,Object>> queryImg();

    public List<Product> queryProductByBid(Integer bid);

    public List<Map<String,Object>> queryBrand();

    public List<Product> queryProductByCid(Integer cid);

    public List<Map<String,Object>> queryCategory();

    public Product queryProductById(Integer id);

    public List<Product> queryProductByName(String name);

    public List<Product> queryProductBySales();

    public List<Product> queryProduct();

    public List<Product> queryProductSales(Integer cid);

    public int doInsertEvaluate(Evaluate evaluate);

    public List<Evaluate> queryEvaluate(Evaluate evaluate);

    public List<Evaluate> queryEvaluateByPid(Integer pid);

    public List<Product> query(Map<String,Object> map);

    public int queryCount(Map<String,Object> map);

    public List<Product> queryName(Map<String,Object> map);

    public int queryNameCount(Map<String,Object> map);

    public List<Map<String,Object>> queryBA();

    public List<Map<String,Object>> queryBCA();

    public Map<String,Object> queryBById(Integer id);

    public Map<String,Object> queryCById(Integer id);

    public List<Map<String,Object>> queryCByBid(Integer bid);

    public List<Map<String,Object>> queryCA();

    public int doUpdateBS(Map<String,Object> map);

    public int doUpdateCS(Map<String,Object> map);

    public List<Map<String,Object>> queryCnameByBid(Integer id);

    public int doInsertB(String name);

    public Map<String,Object> queryByBname(String name);

    public int doInsertC(String name);

    public Map<String,Object> queryByCname(String name);

    public int doDelteCBTable(Integer bid);

    public int doInsertCBTable(Integer bid, Integer cid);

    public int doDelteCBTable1(Integer cid);

    public int doInsertCBTable1(Integer cid, Integer bid);

    public List<Map<String,Object>> queryBnameByCid(Integer id);

    public List<Map<String,Object>> queryAllProduct();

    public int doUpdatePS(Map<String,Object> map);

    public int doInsertProduct(Product product);

    public Map<String,Object> queryProductById1(Integer id);

    public int doUpdateProduct(Product product);

    public int doUpdatePimg(Map<Object, Object> map);
}
