package com.yc.education.service.impl.customer;


import com.github.pagehelper.PageHelper;
import com.yc.education.mapper.customer.TrainMainMapper;
import com.yc.education.model.customer.TrainMain;
import com.yc.education.model.sale.SaleGoods;
import com.yc.education.service.customer.ITrainMainService;
import com.yc.education.service.impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TrainMainServiceImpl extends BaseService<TrainMain> implements ITrainMainService {

    @Autowired
    private TrainMainMapper mapper;

    @Override
    public List<TrainMain> selectTrainMain(int pageNum, int pageSize) {
        try {
            PageHelper.startPage(pageNum,pageSize);
            return mapper.selectTrainMain();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public TrainMain getTrainMainById(String id) {
        try{
            return mapper.getTrainMainById(id);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public List<TrainMain> listTrainMainAll() {
        try {
            return  mapper.listTrainMainAll();
        }catch (Exception e){
            return null;
        }
    }
}
