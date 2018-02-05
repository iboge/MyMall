package com.hwua.common.mapper;

import java.util.List;
import java.util.Map;

public interface PictureMapper {

    public List<Map<String,Object>> queryPicture();

    public int doUpdateValid(Map<String,Object> map);

    public int doInsertPicture(String image);

}
