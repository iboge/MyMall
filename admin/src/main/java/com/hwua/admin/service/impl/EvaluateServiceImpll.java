package com.hwua.admin.service.impl;

import com.hwua.admin.service.EvaluateService;
import com.hwua.common.mapper.EvaluateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("evaluateService")
public class EvaluateServiceImpll implements EvaluateService {

    @Autowired
    private EvaluateMapper evaluateMapper;

    @Override
    public List<Map<String, Object>> getEvaluate() {
        return evaluateMapper.queryEvaluate();
    }

    @Override
    public int delEvaluate(Integer id) {
        return evaluateMapper.doDeleteEvaluate(id);
    }
}
