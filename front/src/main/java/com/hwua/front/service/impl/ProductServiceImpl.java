package com.hwua.front.service.impl;

import com.hwua.common.mapper.PayMapper;
import com.hwua.common.mapper.ProductMapper;
import com.hwua.common.po.Evaluate;
import com.hwua.common.po.Product;
import com.hwua.front.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private PayMapper payMapper;

    @Override
    public List<Map<String, Object>> getImg() {
        return productMapper.queryImg();
    }

    @Override
    public List<Product> getProductByBid(Integer id) {
        return productMapper.queryProductByBid(id);
    }

    @Override
    public List<Map<String, Object>> getBrand() {
        return productMapper.queryBrand();
    }

    @Override
    public List<Product> getProductByCid(Integer id) {
        return productMapper.queryProductByCid(id);
    }

    @Override
    public List<Map<String, Object>> getCategory() {
        return productMapper.queryCategory();
    }

    @Override
    public Product getProductById(Integer id) {
        return productMapper.queryProductById(id);
    }

    @Override
    public List<Product> getProductByName(String name) {
        return productMapper.queryProductByName(name);
    }

    @Override
    public List<Product> queryProductBySales() {
        return productMapper.queryProductBySales();
    }

    @Override
    public List<Product> getProduct() {
        return productMapper.queryProduct();
    }

    @Override
    public List<Product> getProduct1() {
        return productMapper.queryProductByCid(1);
    }

    @Override
    public List<Product> getProductSales1() {
        return productMapper.queryProductSales(1);
    }

    @Override
    public List<Product> getProduct2() {
        return productMapper.queryProductByCid(2);
    }

    @Override
    public List<Product> getProductSales2() {
        return productMapper.queryProductSales(2);
    }

    @Override
    public List<Product> getProduct3() {
        return productMapper.queryProductByCid(5);
    }

    @Override
    public List<Product> getProductSales3() {
        return productMapper.queryProductSales(5);
    }

    @Override
    public int changeInventory(Integer id, Integer inventory) {
        return payMapper.doUpdateInventory(id,inventory);
    }

    @Override
    public int changeSales(Integer id, Integer sales) {
        return payMapper.doUpdateSales(id,sales);
    }

    @Override
    public List<Product> get(Map<String, Object> map) {
        return productMapper.query(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return productMapper.queryCount(map);
    }

    @Override
    public int addEvaluate(Evaluate evaluate) {
        return productMapper.doInsertEvaluate(evaluate);
    }

    @Override
    public List<Evaluate> getEvaluate(Evaluate evaluate) {
        return productMapper.queryEvaluate(evaluate);
    }

    @Override
    public List<Evaluate> getEvaluateByPid(Integer pid) {
        return productMapper.queryEvaluateByPid(pid);
    }

    @Override
    public List<Product> getName(Map<String,Object> map) {
        return productMapper.queryName(map);
    }

    @Override
    public int getNameCount(Map<String,Object> map) {
        return productMapper.queryNameCount(map);
    }

}
