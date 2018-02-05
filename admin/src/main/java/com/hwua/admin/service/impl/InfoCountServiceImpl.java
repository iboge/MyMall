package com.hwua.admin.service.impl;

import com.hwua.admin.service.InfoCountService;
import com.hwua.common.mapper.InfoCountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("infoCountService")
public class InfoCountServiceImpl implements InfoCountService {

    @Autowired
    private InfoCountMapper infoCountMapper;

    @Override
    public List<Map<String,Object>> getCount() {
        Map<String, Object> map = new HashMap<>();
        int i = infoCountMapper.queryPictureCount();
        int i1 = infoCountMapper.queryBrandCount();
        int i2 = infoCountMapper.queryProductCount();
        int i3 = infoCountMapper.queryMemberCount();
        int i4 = infoCountMapper.queryUserCount();
        map.put("PictureCount",i);
        map.put("BrandCount",i1);
        map.put("ProductCount",i2);
        map.put("MemberCount",i3);
        map.put("UserCount",i4);
        List<Map<String, Object>> maps = new ArrayList<>();
        maps.add(map);
        return maps;
    }

    @Override
    public List<Map<String,Object>> getCount1() {
        Map<String, Object> map = new HashMap<>();
        int i = infoCountMapper.queryPictureCount1();
        int i1 = infoCountMapper.queryBrandCount1();
        int i2 = infoCountMapper.queryProductCount1();
        int i3 = infoCountMapper.queryMemberCount1();
        int i4 = infoCountMapper.queryUserCount1();
        map.put("PictureCount1",i);
        map.put("BrandCount1",i1);
        map.put("ProductCount1",i2);
        map.put("MemberCount1",i3);
        map.put("UserCount1",i4);
        List<Map<String, Object>> maps = new ArrayList<>();
        maps.add(map);
        return maps;
    }

    @Override
    public List<Map<String, Object>> getCount2() {
        Map<String, Object> map = new HashMap<>();
        int i = infoCountMapper.queryPictureCount2();
        int i1 = infoCountMapper.queryBrandCount2();
        int i2 = infoCountMapper.queryProductCount2();
        int i3 = infoCountMapper.queryMemberCount2();
        int i4 = infoCountMapper.queryUserCount2();
        map.put("PictureCount2",i);
        map.put("BrandCount2",i1);
        map.put("ProductCount2",i2);
        map.put("MemberCount2",i3);
        map.put("UserCount2",i4);
        List<Map<String, Object>> maps = new ArrayList<>();
        maps.add(map);
        return maps;
    }

    @Override
    public List<Map<String, Object>> getCount7() {
        Map<String, Object> map = new HashMap<>();
        int i = infoCountMapper.queryPictureCount7();
        int i1 = infoCountMapper.queryBrandCount7();
        int i2 = infoCountMapper.queryProductCount7();
        int i3 = infoCountMapper.queryMemberCount7();
        int i4 = infoCountMapper.queryUserCount7();
        map.put("PictureCount7",i);
        map.put("BrandCount7",i1);
        map.put("ProductCount7",i2);
        map.put("MemberCount7",i3);
        map.put("UserCount7",i4);
        List<Map<String, Object>> maps = new ArrayList<>();
        maps.add(map);
        return maps;
    }

    @Override
    public List<Map<String, Object>> getCount30() {
        Map<String, Object> map = new HashMap<>();
        int i = infoCountMapper.queryPictureCount30();
        int i1 = infoCountMapper.queryBrandCount30();
        int i2 = infoCountMapper.queryProductCount30();
        int i3 = infoCountMapper.queryMemberCount30();
        int i4 = infoCountMapper.queryUserCount30();
        map.put("PictureCount30",i);
        map.put("BrandCount30",i1);
        map.put("ProductCount30",i2);
        map.put("MemberCount30",i3);
        map.put("UserCount30",i4);
        List<Map<String, Object>> maps = new ArrayList<>();
        maps.add(map);
        return maps;
    }
}
