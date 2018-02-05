package com.hwua.admin.service;

import com.hwua.common.po.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {

    public List<Map<String,Object>> queryBA();

    public List<Map<String,Object>> queryBCA();

    public List<Map<String,Object>> queryCByBid(Integer bid);

    public List<Map<String,Object>> queryCA();

    public Map<String,Object> queryBById(Integer id);

    public Map<String,Object> queryCById(Integer id);

    public int doUpdateBS(Map<String,Object> map);

    public int doUpdateCS(Map<String,Object> map);

    public List<Map<String,Object>> queryCnameByBid(Integer id);

    public int doDeleteCBTable(Integer id);

    public int doInsertCBTable(Integer id,Integer cid);

    public int doDeleteCBTable1(Integer id);

    public int doInsertCBTable1(Integer id,Integer bid);

    public int doInsertB(String name);

    public Map<String,Object> queryByBname(String name);

    public List<Map<String,Object>> queryBnameByCid(Integer id);

    public int doInsertC(String name);

    public Map<String,Object> queryByCname(String name);

    public List<Map<String,Object>> queryAllProduct();

    public int doUpdatePS(Map<String,Object> map);

    public int doInsertProduct(Product product);

    public Map<String,Object> queryProductByID(Integer id);

    public int doUpdateProduct(Product product);

    public int doUpdatePimg(Map<Object, Object> map);
}
