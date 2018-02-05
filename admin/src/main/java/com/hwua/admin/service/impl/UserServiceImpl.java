package com.hwua.admin.service.impl;

import com.hwua.admin.service.UserService;
import com.hwua.common.mapper.UserMapper;
import com.hwua.common.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public int addUser(User user) {
        return userMapper.doInsertUser(user);
    }

    @Override
    public Map<String,Object> getUser(User user) {
        Map<String, Object> map = new HashMap<>();
        User user1 = userMapper.queryByUsername(user.getUsername());
        if(user1!=null){
            User user2 = userMapper.queryUser(user);
            if(user2!=null){
                if(user2.getValid().equals("1")){
                    map.put("id",user2.getId());
                    map.put("username",user2.getUsername());
                    return map;
                }else {
                    map.put("error","此账号无效！");
                    return map;
                }
            }else{
                map.put("error","用户名和密码不匹配！");
                return map;
            }
        }else{
            map.put("error","用户名不存在！");
            return map;
        }
    }

    @Override
    public int changePassword(User user) {
        return userMapper.doUpdatePassword(user);
    }
}
