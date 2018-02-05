package com.hwua.front.service.impl;

import com.hwua.common.mapper.PayMapper;
import com.hwua.common.po.Favorites;
import com.hwua.common.po.MemberCart;
import com.hwua.common.po.Orders;
import com.hwua.common.po.RecipientInfo;
import com.hwua.front.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("payService")
public class PayServiceImpl implements PayService {

    @Autowired
    private PayMapper payMapper;

    @Override
    public int addFavorites(Favorites favorites) {
        Favorites queryFavorites = payMapper.queryFavorites(favorites);
        if(queryFavorites!=null) {
            return 0;
        }else{
            int i = payMapper.doInsertFavorites(favorites);
            if(i==1) {
                return 1;
            }else{
                return 2;
            }
        }
    }

    @Override
    public List<Favorites> getFavoritesById(Integer mid) {
        return payMapper.queryFavoritesById(mid);
    }

    @Override
    public int changeFavorites(Integer id) {
        return payMapper.doUpdateFavorites(id);
    }

    @Override
    public int addCart(MemberCart memberCart) {
        MemberCart memberCart1 = payMapper.queryCartByP(memberCart);
        if(memberCart1!=null){
            Integer quantity = memberCart1.getQuantity();
            memberCart1.setQuantity(quantity+1);
            int i = payMapper.doUpdateCartQuantity(memberCart1);
            return i;
        }else{
            int i = payMapper.doInsertCart(memberCart);
            return i;
        }
    }

    @Override
    public int changeCartQuantity(MemberCart memberCart) {
        return payMapper.doUpdateCartQuantity(memberCart);
    }

    @Override
    public List<MemberCart> getCart(Integer mid) {
        return payMapper.quertCart(mid);
    }

    @Override
    public MemberCart getCartById(Integer id) {
        return payMapper.queryCartById(id);
    }

    @Override
    public int changeCart(MemberCart memberCart) {
        return payMapper.doUpdateCart(memberCart);
    }

    @Override
    public int addOrder(Orders orders) {
        return payMapper.doInsertOrder(orders);
    }

    @Override
    public int addRecipient(RecipientInfo recipientInfo) {
        return payMapper.doInsertAddress(recipientInfo);
    }

    @Override
    public List<RecipientInfo> getAddr(Integer mid) {
        return payMapper.queryAddress(mid);
    }

    @Override
    public int changeAddr(RecipientInfo recipientInfo) {
        return payMapper.doUpdateAddress(recipientInfo);
    }

    @Override
    public int addOrderInfo(Orders orders) {
        return payMapper.doInsertOrderDetail(orders);
    }

    @Override
    public List<Map<String, Object>> getOrders(Integer mid) {
        return payMapper.queryOrders(mid);
    }

    @Override
    public List<Map<String, Object>> getOrder(Integer mid) {
        return payMapper.queryOrder(mid);
    }

    @Override
    public int delOrder(Integer id) {
        return payMapper.doUpdateOrder(id);
    }

    @Override
    public List<Orders> getOrderByOid(Integer oid) {
        return payMapper.queryOrderByOid(oid);
    }

    @Override
    public List<Map<String,Object>> getOrderdetailByOid(Integer oid) {
        return payMapper.queryOrderdetailByOid(oid);
    }

    @Override
    public int changeOrderAddr(Orders orders) {
        return payMapper.doUpdateOrderAddr(orders);
    }

    @Override
    public RecipientInfo queryRecipientInfo(Integer rid) {
        return payMapper.queryRecipientInfo(rid);
    }

    @Override
    public int doDeleteRecipientInfo(Integer id) {
        return payMapper.doDeleteRecipientInfo(id);
    }

    @Override
    public int doUpdateRecipientInfo(RecipientInfo recipientInfo) {
        return payMapper.doUpdateRecipientInfo(recipientInfo);
    }

}
