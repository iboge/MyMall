package com.hwua.common.mapper;

import com.hwua.common.po.Favorites;
import com.hwua.common.po.MemberCart;
import com.hwua.common.po.Orders;
import com.hwua.common.po.RecipientInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PayMapper {

    public Favorites queryFavorites(Favorites favorites);

    public int doInsertFavorites(Favorites favorites);

    public List<Favorites> queryFavoritesById(Integer mid);

    public int doUpdateFavorites(Integer id);

    public int doInsertCart(MemberCart memberCart);

    public MemberCart queryCartByP(MemberCart memberCart);

    public int doUpdateCartQuantity(MemberCart memberCart);

    public List<MemberCart> quertCart(Integer mid);

    public MemberCart queryCartById(Integer id);

    public int doUpdateCart(MemberCart memberCart);

    public int doInsertOrder(Orders orders);

    public int doInsertOrderDetail(Orders orders);

    public List<Map<String,Object>> queryOrders(Integer mid);

    public List<Map<String,Object>> queryOrder(Integer mid);

    public int doUpdateOrder(Integer id);

    public int doInsertAddress(RecipientInfo recipientInfo);

    public List<RecipientInfo> queryAddress(Integer mid);

    public int doUpdateAddress(RecipientInfo recipientInfo);

    public int doDeleteAddress(Integer mid);

    public int doUpdateInventory(@Param("id") Integer id,@Param("inventory") Integer inventory);

    public int doUpdateSales(@Param("id") Integer id,@Param("sales") Integer sales);

    public int doUpdateStatus(Integer id);

    public List<Orders> queryOrderByOid(Integer oid);

    public List<Map<String,Object>> queryOrderdetailByOid(Integer oid);

    public int doUpdateOrderAddr(Orders orders);

    public RecipientInfo queryRecipientInfo(Integer id);

    public int doDeleteRecipientInfo(Integer id);

    public int doUpdateRecipientInfo(RecipientInfo recipientInfo);

}
