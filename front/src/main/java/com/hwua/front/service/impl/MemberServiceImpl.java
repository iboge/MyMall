package com.hwua.front.service.impl;

import com.hwua.common.mapper.MemberMapper;
import com.hwua.common.po.Member;
import com.hwua.front.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public Map<String, Object> getMember(Member member) {
        Map<String, Object> map = new HashMap<String, Object>();
        Member memberByName = memberMapper.queryMemberByName(member.getMembername());
        if(memberByName!=null){
            Member queryMember = memberMapper.queryMember(member);
            if(queryMember!=null){
                if(queryMember.getValid().equals("1")){
                    map.put("success","登录成功！");
                    map.put("id",queryMember.getId());
                    map.put("name",queryMember.getMembername());
                }else{
                    map.put("error","账号已被冻结！");
                }
            }else{
                map.put("error","密码错误！");
            }
        }else{
            map.put("error","用户名不存在！");
        }
        return map;
    }

    @Override
    public int addMember(Member member) {
        Member member1 = memberMapper.queryMemberByName(member.getMembername());
        if(member1==null) {
            Member member2 = memberMapper.queryMemberByEmail(member.getEmail());
            if(member2==null) {
                int i = memberMapper.doInsertMember(member);
                if (i == 1) {
                    return 1;
                } else {
                    return 2;
                }
            }else{
                return 4;
            }
        }else{
            return 3;
        }
    }

    @Override
    public int changePWD(Member member) {
        Member member1 = memberMapper.queryMemberByName(member.getMembername());
        if(member1!=null) {
            if(member1.getEmail().equals(member.getEmail())){
                member.setId(member1.getId());
                return memberMapper.doUpdateMemberPassword(member);
            }else{
                return 2;
            }
        }
        return 3;
    }

    @Override
    public Member getMemberById(Integer id) {
        return memberMapper.queryMemberById(id);
    }

    @Override
    public int changeMember(Member member) {
        return memberMapper.doUpdateMemberPassword(member);
    }

    @Override
    public List<Map<String, Object>> queryEvaluateByMid(Integer mid) {
        return memberMapper.queryEvaluateByMid(mid);
    }

    @Override
    public int doUpdateEvaluate(Integer id) {
        return memberMapper.doUpdateEvaluate(id);
    }
}
