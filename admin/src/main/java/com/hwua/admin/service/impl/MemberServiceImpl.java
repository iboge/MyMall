package com.hwua.admin.service.impl;

import com.hwua.admin.service.MemberService;
import com.hwua.common.mapper.MemberMapper;
import com.hwua.common.po.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Member> getAllMember() {
        return memberMapper.queryAllMember();
    }

    @Override
    public List<Member> getMemberByValid() {
        return memberMapper.queryMemberByValid();
    }

    @Override
    public int changeValidById(Map<String, Object> map) {
        return memberMapper.doUpdateValid(map);
    }

}
