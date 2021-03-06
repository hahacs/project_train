package com.yc.education.service.impl.sale;

import com.github.pagehelper.PageHelper;
import com.yc.education.mapper.sale.SalePurchaseOrderMapper;
import com.yc.education.mapper.sale.SaleReturnGoodsMapper;
import com.yc.education.model.sale.SalePurchaseOrder;
import com.yc.education.model.sale.SaleReturnGoods;
import com.yc.education.service.impl.BaseService;
import com.yc.education.service.sale.ISalePurchaseOrderService;
import com.yc.education.service.sale.ISaleReturnGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: BlueSky
 * @Date: 2018/9/26 15:24
 */
@Service
public class SaleReturnGoodsServiceImpl extends BaseService<SaleReturnGoods> implements ISaleReturnGoodsService {

    @Autowired
    private SaleReturnGoodsMapper mapper;

    @Override
    public List<SaleReturnGoods> listSaleReturnGoodsAll() {
        try {
            return  mapper.listSaleReturnGoodsAll();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public List<SaleReturnGoods> listSaleReturnGoodsByPage(int page, int rows) {
        try {
            PageHelper.startPage(page,rows);
            return  mapper.listSaleReturnGoodsAll();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public SaleReturnGoods getSaleReturnGoods(String orderno) {
        try {
            return  mapper.getSaleReturnGoods(orderno);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public SaleReturnGoods getLastSaleReturnGoods() {
        try {
            return  mapper.getLastSaleReturnGoods();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public SaleReturnGoods getFirstSaleReturnGoods() {
        try {
            return  mapper.getFirstSaleReturnGoods();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public SaleReturnGoods getSaleReturnGoodsByPage(int page, int rows) {
        try {
            return  mapper.getSaleReturnGoodsByPage(page,rows);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public int getSaleReturnGoodsCount() {
        try {
            return  mapper.selectCount(new SaleReturnGoods());
        }catch (Exception e){
            return 0;
        }
    }



}
