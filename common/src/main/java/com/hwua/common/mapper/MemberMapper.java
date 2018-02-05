package com.hwua.common.mapper;

import com.hwua.common.po.Member;

import java.util.List;
import java.util.Map;

public interface MemberMapper {

    public Member queryMemberById(Integer id);

    public Member queryMemberByName(String membername);

    public Member queryMemberByEmail(String email);

    public Member queryMember(Member member);

    public int doInsertMember(Member member);

    public int doUpdateMemberPassword(Member member);

    public List<Member> queryAllMember();

    public List<Member> queryMemberByValid();

    public int doUpdateValid(Map<String, Object> map);

    public List<Map<String,Object>> queryEvaluateByMid(Integer mid);

    public int doUpdateEvaluate(Integer id);

}
