package com.hwua.front.service;

import com.hwua.common.po.Member;

import java.util.List;
import java.util.Map;

public interface MemberService {

    public Map<String, Object> getMember(Member member);

    public int addMember(Member member);

    public int changePWD(Member member);

    public Member getMemberById(Integer id);

    public int changeMember(Member member);

    public List<Map<String,Object>> queryEvaluateByMid(Integer mid);

    public int doUpdateEvaluate(Integer id);

}
