package com.yc.education.service.customer;


import com.yc.education.model.customer.TrainMain;
import com.yc.education.service.IService;

import java.util.List;


public interface ITrainMainService extends IService<TrainMain>{

    /**
     * 主表信息
     * @param id
     * @return
     */
    TrainMain getTrainMainById(String id);
    public List<TrainMain> selectTrainMain(int pageNum, int pageSize);

    public List<TrainMain> listTrainMainAll();
}
