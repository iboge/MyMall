package com.hwua.admin.service;

import java.util.List;
import java.util.Map;

public interface PictureService {

    public List<Map<String,Object>> getPicture();

    public int changeValid(Map<String,Object> map);

    public int addPicture(String image);

}
