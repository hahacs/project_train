package com.yc.education.service.customer;


import com.yc.education.model.customer.TrainPlan;
import com.yc.education.service.IService;

import java.util.Date;
import java.util.List;


public interface ITrainPlanService extends IService<TrainPlan>{

    /**
     * 主表信息
     * @param id
     * @return
     */
    List<TrainPlan> getTrainPlanById(String id);

    public List<TrainPlan> selectTrainPlan(int pageNum, int pageSize);

    public List<TrainPlan> listTrainPlanAll();

    public List<TrainPlan> getTrainPlanByPlanDay(Date date);

    public List<TrainPlan> getTrainPlanByIdAndPlanDay(Date planTime,String id);

    public List<TrainPlan> getTrainPlanOverdue();

    public List<TrainPlan> getTrainPlanFuture();
}
