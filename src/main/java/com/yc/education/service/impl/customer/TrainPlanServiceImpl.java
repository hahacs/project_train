package com.yc.education.service.impl.customer;


import com.github.pagehelper.PageHelper;
import com.yc.education.mapper.customer.TrainPlanMapper;
import com.yc.education.model.customer.TrainPlan;
import com.yc.education.service.customer.ITrainPlanService;
import com.yc.education.service.impl.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class TrainPlanServiceImpl extends BaseService<TrainPlan> implements ITrainPlanService {

    @Autowired
    private TrainPlanMapper mapper;

    @Override
    public List<TrainPlan> selectTrainPlan(int pageNum, int pageSize) {
        try {
            PageHelper.startPage(pageNum,pageSize);
            return mapper.selectTrainPlan();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<TrainPlan> getTrainPlanById(String id) {
        try{
            return mapper.getTrainPlanById(id);
        }catch (Exception e){
            return null;
        }
    }


    @Override
    public List<TrainPlan> getTrainPlanByPlanDay(Date planTime) {
        try{
            return mapper.getTrainPlanByPlanDay(planTime);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public List<TrainPlan> getTrainPlanByIdAndPlanDay(Date planTime,String id) {
        try{
            return mapper.getTrainPlanByIdAndPlanDay(planTime,id);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public List<TrainPlan> listTrainPlanAll() {
        try {
            return  mapper.listTrainPlanAll();
        }catch (Exception e){
            return null;
        }
    }
}
