package com.hwua.admin.service;

import java.util.List;
import java.util.Map;

public interface EvaluateService {

    public List<Map<String,Object>> getEvaluate();

    public int delEvaluate(Integer id);

}
