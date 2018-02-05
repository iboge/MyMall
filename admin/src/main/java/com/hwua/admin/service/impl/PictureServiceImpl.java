package com.hwua.admin.service.impl;

import com.hwua.admin.service.PictureService;
import com.hwua.common.mapper.PictureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("pictureService")
public class PictureServiceImpl implements PictureService {

    @Autowired
    private PictureMapper pictureMapper;

    @Override
    public List<Map<String, Object>> getPicture() {
        return pictureMapper.queryPicture();
    }

    @Override
    public int changeValid(Map<String, Object> map) {
        return pictureMapper.doUpdateValid(map);
    }

    @Override
    public int addPicture(String image) {
        return pictureMapper.doInsertPicture(image);
    }
}
