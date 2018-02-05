package com.hwua.admin.service;

import com.hwua.common.po.Member;

import java.util.List;
import java.util.Map;

public interface MemberService {

    public List<Member> getAllMember();

    public List<Member> getMemberByValid();

    public int changeValidById(Map<String, Object> map);
}
