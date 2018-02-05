package com.hwua.front.service;

import com.hwua.common.po.Favorites;
import com.hwua.common.po.MemberCart;
import com.hwua.common.po.Orders;
import com.hwua.common.po.RecipientInfo;

import java.util.List;
import java.util.Map;

public interface PayService {

    public int addFavorites(Favorites favorites);

    public List<Favorites> getFavoritesById(Integer mid);

    public int changeFavorites(Integer id);

    public int addCart(MemberCart memberCart);

    public int changeCartQuantity(MemberCart memberCart);

    public List<MemberCart> getCart(Integer mid);

    public MemberCart getCartById(Integer id);

    public int changeCart(MemberCart memberCart);

    public int addOrder(Orders orders);

    public int addRecipient(RecipientInfo recipientInfo);

    public List<RecipientInfo> getAddr(Integer mid);

    public int changeAddr(RecipientInfo recipientInfo);

    public int addOrderInfo(Orders orders);

    public List<Map<String,Object>> getOrders(Integer mid);

    public List<Map<String,Object>> getOrder(Integer mid);

    public int delOrder(Integer id);

    public List<Orders> getOrderByOid(Integer oid);

    public List<Map<String,Object>> getOrderdetailByOid(Integer oid);

    public int changeOrderAddr(Orders orders);

    public RecipientInfo queryRecipientInfo(Integer id);

    public int doDeleteRecipientInfo(Integer id);

    public int doUpdateRecipientInfo(RecipientInfo recipientInfo);

}
