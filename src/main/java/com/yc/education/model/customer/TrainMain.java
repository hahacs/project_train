package com.yc.education.model.customer;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

@Table(name = "t_train_main")
public class TrainMain {
    /**
     * id
     */
    @Id
    private String id;

    @Transient
    private String createDateStr;

    @Transient
    private String lastTrainTimeStr;

    @Transient
    private String trainAllTimeStr;

    @Transient
    private String trainTypeStr;



    /**
     * 训练标题
     */
    @Column(name = "trainTitle")
    private String trainTitle;

    /**
     * 训练内容
     */
    @Column(name = "trainContent")
    private String trainContent;

    /**
     * 训练类型
     */
    @Column(name = "trainType")
    private int trainType;

    /**
     * 训练次数
     */
    @Column(name = "trainTimes")
    private int trainTimes;

    /**
     * 训练总时长
     */
    @Column(name = "trainAllTime")
    private Long trainAllTime;

    /**
     * 上次训练时间
     */
    @Column(name = "lastTrainTime")
    private Date lastTrainTime;

    /**
     * 创建时间
     */
    @Column(name = "date_created")
    private Date date_created;

    /**
     * 备注
     */
    @Column(name = "remark")
    private String remark;

    /**
     * 是否在训练计划内
     */
    @Column(name = "planFlag")
    private String planFlag;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTrainTitle() {
        return trainTitle;
    }

    public void setTrainTitle(String trainTitle) {
        this.trainTitle = trainTitle;
    }

    public String getTrainContent() {
        return trainContent;
    }

    public void setTrainContent(String trainContent) {
        this.trainContent = trainContent;
    }

    public int getTrainType() {
        return trainType;
    }

    public void setTrainType(int trainType) {
        this.trainType = trainType;
    }

    public int getTrainTimes() {
        return trainTimes;
    }

    public void setTrainTimes(int trainTimes) {
        this.trainTimes = trainTimes;
    }

    public Long getTrainAllTime() {
        return trainAllTime;
    }

    public void setTrainAllTime(Long trainAllTime) {
        this.trainAllTime = trainAllTime;
    }

    public Date getLastTrainTime() {
        return lastTrainTime;
    }

    public void setLastTrainTime(Date lastTrainTime) {
        this.lastTrainTime = lastTrainTime;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getPlanFlag() {
        return planFlag;
    }

    public void setPlanFlag(String planFlag) {
        this.planFlag = planFlag;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public String getLastTrainTimeStr() {
        return lastTrainTimeStr;
    }

    public void setLastTrainTimeStr(String lastTrainTimeStr) {
        this.lastTrainTimeStr = lastTrainTimeStr;
    }

    public String getTrainAllTimeStr() {
        return trainAllTimeStr;
    }

    public void setTrainAllTimeStr(String trainAllTimeStr) {
        this.trainAllTimeStr = trainAllTimeStr;
    }

    public String getTrainTypeStr() {
        return trainTypeStr;
    }

    public void setTrainTypeStr(String trainTypeStr) {
        this.trainTypeStr = trainTypeStr;
    }
}