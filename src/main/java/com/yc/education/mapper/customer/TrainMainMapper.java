package com.yc.education.mapper.customer;

import com.yc.education.model.customer.TrainMain;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface TrainMainMapper extends Mapper<TrainMain> {

    TrainMain getTrainMainById(@Param("id") String id);

    /**
     * 查询所有训练计划
     * @return
     */
    List<TrainMain> selectTrainMain();

    List<TrainMain> listTrainMainAll();
}