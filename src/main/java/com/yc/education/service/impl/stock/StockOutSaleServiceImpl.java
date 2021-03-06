package com.yc.education.service.impl.stock;

import com.yc.education.mapper.stock.StockOutSaleMapper;
import com.yc.education.model.stock.StockOutSale;
import com.yc.education.service.impl.BaseService;
import com.yc.education.service.stock.IStockOutSaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @Author BlueSky
 * @Date 2018-11-06 17:23
 */
@Service
public class StockOutSaleServiceImpl extends BaseService<StockOutSale> implements IStockOutSaleService {

    @Autowired
    private StockOutSaleMapper mapper;

    @Override
    public List<StockOutSale> listStockOutSaleAll() {
        try {
            return mapper.listStockOutSaleAll();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public StockOutSale getStockOutSale(String orderno) {
        try {
            return mapper.getStockOutSale(orderno);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public StockOutSale getLastStockOutSale() {
        try {
            return mapper.getLastStockOutSale();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public StockOutSale getFirstStockOutSale() {
        try {
            return mapper.getFirstStockOutSale();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public StockOutSale getStockOutSaleByPage(int page, int rows) {
        try {
            return mapper.getStockOutSaleByPage(page,rows);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public int getStockOutSaleCount() {
        try {
            return mapper.getStockOutSaleCount();
        } catch (Exception e) {
            return 0;
        }
    }
}
