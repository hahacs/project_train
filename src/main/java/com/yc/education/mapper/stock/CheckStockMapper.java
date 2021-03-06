package com.yc.education.mapper.stock;

import com.yc.education.model.stock.CheckStock;
import com.yc.education.util.MyMapper;

import java.util.List;

/**
 *@Description TODO 盘库作业
 *@Author QuZhangJing
 *@Date 19:48  2018/11/7
 *@Version 1.0
 */
public interface CheckStockMapper extends MyMapper<CheckStock> {

    /**
     * @param currentDate
     * @return
     */
    String selectMaxIdnum(String currentDate);


    //查询所有盘库作业
    List<CheckStock> findCheckStock();


}