package com.hwua.admin.service.impl;

import com.hwua.admin.service.ProductService;
import com.hwua.common.mapper.ProductMapper;
import com.hwua.common.po.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Map<String, Object>> queryBA() {
        return productMapper.queryBA();
    }

    @Override
    public List<Map<String, Object>> queryBCA() {
        return productMapper.queryBCA();
    }

    @Override
    public List<Map<String, Object>> queryCByBid(Integer bid) {
        return productMapper.queryCByBid(bid);
    }

    @Override
    public List<Map<String, Object>> queryCA() {
        return productMapper.queryCA();
    }

    @Override
    public Map<String, Object> queryBById(Integer id) {
        return productMapper.queryBById(id);
    }

    @Override
    public Map<String, Object> queryCById(Integer id) {
        return productMapper.queryCById(id);
    }

    @Override
    public int doUpdateBS(Map<String,Object> map) {
        return productMapper.doUpdateBS(map);
    }

    @Override
    public int doUpdateCS(Map<String,Object> map) {
        return productMapper.doUpdateCS(map);
    }

    @Override
    public List<Map<String, Object>> queryCnameByBid(Integer id) {
        return productMapper.queryCnameByBid(id);
    }

    @Override
    public int doDeleteCBTable(Integer id) {
        return productMapper.doDelteCBTable(id);
    }

    @Override
    public int doInsertCBTable(Integer id, Integer cid) {
        return productMapper.doInsertCBTable(id,cid);
    }

    @Override
    public int doDeleteCBTable1(Integer id) {
        return productMapper.doDelteCBTable1(id);
    }

    @Override
    public int doInsertCBTable1(Integer id, Integer bid) {
        return productMapper.doInsertCBTable1(id,bid);
    }

    @Override
    public int doInsertB(String name) {
        return productMapper.doInsertB(name);
    }

    @Override
    public Map<String, Object> queryByBname(String name) {
        return productMapper.queryByBname(name);
    }

    @Override
    public List<Map<String, Object>> queryBnameByCid(Integer id) {
        return productMapper.queryBnameByCid(id);
    }

    @Override
    public int doInsertC(String name) {
        return productMapper.doInsertC(name);
    }

    @Override
    public Map<String, Object> queryByCname(String name) {
        return productMapper.queryByCname(name);
    }

    @Override
    public List<Map<String, Object>> queryAllProduct() {
        return productMapper.queryAllProduct();
    }

    @Override
    public int doUpdatePS(Map<String, Object> map) {
        return productMapper.doUpdatePS(map);
    }

    @Override
    public int doInsertProduct(Product product) {
        return productMapper.doInsertProduct(product);
    }

    @Override
    public Map<String, Object> queryProductByID(Integer id) {
        return productMapper.queryProductById1(id);
    }

    @Override
    public int doUpdateProduct(Product product) {
        return productMapper.doUpdateProduct(product);
    }

    @Override
    public int doUpdatePimg(Map<Object, Object> map) {
        return productMapper.doUpdatePimg(map);
    }
}
