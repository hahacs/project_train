package com.yc.education.mapper.customer;

import com.yc.education.model.customer.TrainPlan;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

public interface TrainPlanMapper extends Mapper<TrainPlan> {

    List<TrainPlan> getTrainPlanById(@Param("id") String id);

    List<TrainPlan> getTrainPlanByPlanDay(@Param("planTime") Date planTime);

    List<TrainPlan> getTrainPlanOverdue();

    List<TrainPlan> getTrainPlanByIdAndPlanDay(@Param("planTime") Date planTime,@Param("id") String id);

    /**
     * 查询所有训练计划
     * @return
     */
    List<TrainPlan> selectTrainPlan();

    List<TrainPlan> listTrainPlanAll();

    //获取未来10天训练计划
    List<TrainPlan> getTrainPlanFuture();
}