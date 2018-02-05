package com.hwua.common.mapper;

import com.hwua.common.po.User;

public interface UserMapper {

    public int doInsertUser(User user);

    public User queryByUsername(String username);

    public User queryUser(User user);

    public int doUpdatePassword(User user);

}
