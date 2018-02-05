package com.hwua.common.mapper;

import java.util.List;
import java.util.Map;

public interface EvaluateMapper {

    public List<Map<String,Object>> queryEvaluate();

    public int doDeleteEvaluate(Integer id);

}
