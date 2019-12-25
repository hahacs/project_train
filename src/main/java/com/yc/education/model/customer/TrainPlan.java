package com.yc.education.model.customer;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

@Table(name = "t_train_plan")
public class TrainPlan {
    /**
     * id
     */
    @Id
    private String id;

    @Id
    @Column(name = "serialNo")
    private Long serialNo;

    @Transient
    private String planTimeStr;

    @Transient
    private String trainTimeStr;

    @Column(name = "planTime")
    private Date planTime;

    @Column(name = "trainTime")
    private Date trainTime;

    @Column(name = "trainFlag")
    private String trainFlag;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(Long serialNo) {
        this.serialNo = serialNo;
    }

    public String getPlanTimeStr() {
        return planTimeStr;
    }

    public void setPlanTimeStr(String planTimeStr) {
        this.planTimeStr = planTimeStr;
    }

    public String getTrainTimeStr() {
        return trainTimeStr;
    }

    public void setTrainTimeStr(String trainTimeStr) {
        this.trainTimeStr = trainTimeStr;
    }

    public Date getPlanTime() {
        return planTime;
    }

    public void setPlanTime(Date planTime) {
        this.planTime = planTime;
    }

    public Date getTrainTime() {
        return trainTime;
    }

    public void setTrainTime(Date trainTime) {
        this.trainTime = trainTime;
    }

    public String getTrainFlag() {
        return trainFlag;
    }

    public void setTrainFlag(String trainFlag) {
        this.trainFlag = trainFlag;
    }


    public TrainPlan(String id, Long serialNo, Date planTime, Date trainTime, String trainFlag) {
        this.id = id;
        this.serialNo = serialNo;
        this.planTime = planTime;
        this.trainTime = trainTime;
        this.trainFlag = trainFlag;
    }

    public TrainPlan() {
        super();
    }
}