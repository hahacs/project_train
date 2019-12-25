package com.yc.education.model.basic;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleLongProperty;
import javafx.beans.property.SimpleStringProperty;

import java.util.Date;

/**
 * @ClassName RegionProperty
 * @Description TODO 业务区域设定-TabelView数据绑定
 * @Author QuZhangJing
 * @Date 2018/9/21 13:51
 * @Version 1.0
 */
public class TrainMainProperty {

    private final SimpleLongProperty id = new SimpleLongProperty();
    private  final SimpleStringProperty trainTitle = new SimpleStringProperty();
    private  final SimpleStringProperty trainType = new SimpleStringProperty();
    private  final SimpleStringProperty trainTimes = new SimpleStringProperty();
    private  final SimpleStringProperty trainAllTime = new SimpleStringProperty();
    private  final SimpleStringProperty lastTrainTime = new SimpleStringProperty();
    private  final SimpleStringProperty date_created = new SimpleStringProperty();


    public TrainMainProperty() {

    }

    public TrainMainProperty(Long id, String trainTitle, String trainType, String trainTimes, String trainAllTime, String lastTrainTime, String date_created) {
        setId(id);
        setTrainTitle(trainTitle);
        setTrainType(trainType);
        setTrainTimes(trainTimes);
        setTrainAllTime(trainAllTime);
        setLastTrainTime(lastTrainTime);
        setDate_created(date_created);
    }

    public long getId() {
        return id.get();
    }

    public SimpleLongProperty idProperty() {
        return id;
    }

    public void setId(long id) {
        this.id.set(id);
    }

    public String getTrainTitle() {
        return trainTitle.get();
    }

    public SimpleStringProperty trainTitleProperty() {
        return trainTitle;
    }

    public void setTrainTitle(String trainTitle) {
        this.trainTitle.set(trainTitle);
    }

    public String getTrainType() {
        return trainType.get();
    }

    public SimpleStringProperty trainTypeProperty() {
        return trainType;
    }

    public void setTrainType(String trainType) {
        this.trainType.set(trainType);
    }

    public String getTrainTimes() {
        return trainTimes.get();
    }

    public SimpleStringProperty trainTimesProperty() {
        return trainTimes;
    }

    public void setTrainTimes(String trainTimes) {
        this.trainTimes.set(trainTimes);
    }

    public String getTrainAllTime() {
        return trainAllTime.get();
    }

    public SimpleStringProperty trainAllTimeProperty() {
        return trainAllTime;
    }

    public void setTrainAllTime(String trainAllTime) {
        this.trainAllTime.set(trainAllTime);
    }

    public String getLastTrainTime() {
        return lastTrainTime.get();
    }

    public SimpleStringProperty lastTrainTimeProperty() {
        return lastTrainTime;
    }

    public void setLastTrainTime(String lastTrainTime) {
        this.lastTrainTime.set(lastTrainTime);
    }

    public String getDate_created() {
        return date_created.get();
    }

    public SimpleStringProperty date_createdProperty() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created.set(date_created);
    }
}
