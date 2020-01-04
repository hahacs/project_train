package com.yc.education.controller.basic;

import com.github.pagehelper.PageInfo;
import com.yc.education.constants.SpringFxmlLoader;
import com.yc.education.controller.BaseController;
import com.yc.education.model.basic.EmployeeBasic;
import com.yc.education.model.basic.RegionBasic;
import com.yc.education.model.basic.RegionEmployee;
import com.yc.education.model.basic.RegionProperty;
import com.yc.education.model.basic.TrainMainProperty;
import com.yc.education.model.customer.TrainMain;
import com.yc.education.model.customer.TrainPlan;
import com.yc.education.model.sale.SaleGoods;
import com.yc.education.service.basic.EmployeeBasicService;
import com.yc.education.service.basic.RegionBasicService;
import com.yc.education.service.basic.RegionEmployeeService;
import com.yc.education.service.customer.ITrainMainService;
import com.yc.education.service.customer.ITrainPlanService;
import com.yc.education.util.DateUtils;
import com.yc.education.util.NumberUtil;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.SingleSelectionModel;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.util.Callback;
import javafx.util.Duration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;

import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

/**
 * @ClassName RegionBasicController
 * @Description TODO 业务区域设定
 * @Author QuZhangJing
 * @Date 2018-08-14 13:47
 * @Version 1.0
 */
@Controller
public class AllTrainBasicController extends BaseController implements Initializable {

    public static final String[] trainPlanDayList={"0","1","2","4","9","10","17","18","32","33"};

    @Autowired
    private RegionBasicService regionBasicService;  //业务区域设定

    @Autowired
    private RegionEmployeeService regionEmployeeService; //业务区域员工

    @Autowired
    private ITrainMainService iTrainMainService; //训练主表

    @Autowired
    private ITrainPlanService iTrainPlanService; //训练计划表


    @Autowired
    private EmployeeBasicService employeeBasicService;//员工

    @FXML private Tab trainListType ;

    @FXML private Tab planDetail;

    @FXML private TabPane tabPane;

    @FXML private TableColumn col_operate;

    @FXML private javafx.scene.control.Label fxmlStatus; //状态

    @FXML private javafx.scene.control.Label uuid; //状态

    @FXML private VBox first; //第一页

    @FXML private VBox prev; //上一页

    @FXML private VBox next; //下一页

    @FXML private VBox last; //最后一页


    @FXML private VBox clearvbox; //清除

    @FXML private VBox submitvbox; //提交

    @FXML private VBox insertvbox; //新增

    @FXML private VBox updatevbox; //修改

    @FXML private VBox deletevbox; //删除


    @FXML private TextField isnum; //编号

    @FXML private TextField area;//地区


    @FXML TableView region_employee; //区域-员工
    @FXML TableColumn empid; //员工编号
    @FXML TableColumn empisnum; //员工编号
    @FXML TableColumn empname; //姓名
    @FXML TableColumn remarks; //备注

    //单个训练详情页面
    @FXML TextField trainTitleDetail; //标题
    @FXML ComboBox trainTypeDetail; //类别
    @FXML TextArea trainContentDetail; //内容
    @FXML TextArea remarkDetail; //备注
    @FXML Label trainTimesDetail;//训练次数
    @FXML Label fxmlTrainTime;


    //训练列表
    @FXML TableView train_list; //训练列表
    @FXML TableColumn id; //id
    @FXML TableColumn trainTitle; //训练标题
    @FXML TableColumn trainType; //训练类别
    @FXML TableColumn trainTimes; //训练次数
    @FXML TableColumn trainAllTime; //训练总时长
    @FXML TableColumn trainAllTimeStr; //训练总时长
    @FXML TableColumn lastTrainTime;//最后一次训练时间
    @FXML TableColumn date_created;//创建时间

    @FXML
    CheckBox fxmlErrorFlag;


    @FXML private TableView tableViewRegion; //区域查询查询
    @FXML private TableColumn regid; //id
    @FXML private TableColumn findregionid; //区域编号
    @FXML private TableColumn findregionname; //区域名称


    @FXML private TableView tableViewEmployee; //员工TableView
    @FXML private TableColumn findempid; //id
    @FXML private TableColumn findemployeeid; //员工编号
    @FXML private TableColumn findemployeename; //员工姓名

    private long regNum=0;

    private Stage stage = new Stage();

    private Timeline timeline;
    private Date currentTrainTime;
    private Date startTraintime;


    private static SpringFxmlLoader loader = new SpringFxmlLoader();

    /**
     * 业务区域设定-TabelView数据绑定
     */
    private ObservableList<RegionProperty> regionPropertys = FXCollections.observableArrayList();
    private ObservableList<TrainMainProperty> trainMainPropertyPropertys = FXCollections.observableArrayList();

    @Override
    public void initialize(URL location, ResourceBundle resources) {
//        String newStr = location.toString();
//        int index = newStr.indexOf("train_basic");
//        if(index != -1){
//            findSupplier(1);
//        }
        loadData();
    }

    public void moreRegionButtonClick(){

        stage.setTitle("现有区域查询");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/basic/region_find.fxml"));
        Scene scene = new Scene(pane);
        stage.setScene(scene);
        /*stage.setResizable(false);*/
        /*stage.initStyle(StageStyle.UNDECORATED);
        DragUtil.addDragListener(stage, pane); //拖拽监听*/
        stage.show();
        loadMoreRegion();
    }

    /**
     * 现有区域查询
     */
    public void loadMoreRegion(){

        List<RegionBasic> regionBasics = regionBasicService.selectProductBasic();

        ObservableList<RegionBasic> list = FXCollections.observableArrayList();

        tableViewRegion.setEditable(true);

        /*staffcode.setCellFactory((TableColumn<Object,Object> a ) -> new EditingCell<>());*/

        regid.setCellValueFactory(new PropertyValueFactory("id"));
        findregionid.setCellValueFactory(new PropertyValueFactory("isnum"));
        findregionname.setCellValueFactory(new PropertyValueFactory("area"));

        for (RegionBasic regionBasic:regionBasics) {
            list.add(regionBasic);
        }

        tableViewRegion.setItems(list); //tableview添加list

        tableViewRegion.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<RegionBasic>() {
            @Override
            public void changed(ObservableValue<? extends RegionBasic> observableValue, RegionBasic oldItem, RegionBasic newItem) {
                if(newItem.getIsnum()!= null && !("".equals(newItem.getIsnum()))){
                    isnum.setUserData(newItem.getId());
                }
            }
        });

        tableViewRegion.setOnMouseClicked((MouseEvent t) -> {
            if (t.getClickCount() == 2) {
                closeSureWin();
            }
        });

    }

    public void closeSureWin(){
        long id =(long)isnum.getUserData();
        RegionBasic regionBasic = regionBasicService.selectByKey(id);
        loadData(regionBasic);
        coseWin();
    }

    public void coseWin(){
        stage.close();
    }

    public void loadDataTrain(int pageNum, int pageSize){

//        id.setCellFactory(TextFieldTableCell.forTableColumn());
        trainTitle.setCellFactory(TextFieldTableCell.forTableColumn());
        trainType.setCellFactory(TextFieldTableCell.forTableColumn());
        trainTimes.setCellFactory(TextFieldTableCell.forTableColumn());
        trainAllTime.setCellFactory(TextFieldTableCell.forTableColumn());
//        trainAllTimeStr.setCellFactory(TextFieldTableCell.forTableColumn());
        lastTrainTime.setCellFactory(TextFieldTableCell.forTableColumn());
        date_created.setCellFactory(TextFieldTableCell.forTableColumn());

        id.setCellValueFactory(new PropertyValueFactory("id"));
        trainTitle.setCellValueFactory(new PropertyValueFactory("trainTitle"));
        trainType.setCellValueFactory(new PropertyValueFactory("trainType"));
        trainTimes.setCellValueFactory(new PropertyValueFactory("trainTimes"));
        trainAllTime.setCellValueFactory(new PropertyValueFactory("trainAllTime"));
//        trainAllTimeStr.setCellValueFactory(new PropertyValueFactory("trainAllTime"));
        lastTrainTime.setCellValueFactory(new PropertyValueFactory("lastTrainTime"));
        date_created.setCellValueFactory(new PropertyValueFactory("date_created"));

        trainMainPropertyPropertys.clear();
        List<TrainMain> trainMains = iTrainMainService.selectTrainMain(pageNum,1);

        if(trainMains.size()>0) {
            for (TrainMain trainMain1 : trainMains) {
                TrainMainProperty TrainMainProperty = new TrainMainProperty(new Long(trainMain1.getId()),trainMain1.getTrainTitle(),
                        String.valueOf(trainMain1.getTrainType()), String.valueOf(trainMain1.getTrainTimes()),
                        String.valueOf(trainMain1.getTrainAllTime()),String.valueOf(trainMain1.getLastTrainTime()),
                        String.valueOf(trainMain1.getDate_created()));
                trainMainPropertyPropertys.add(TrainMainProperty);
            }
        }
        train_list.setItems(trainMainPropertyPropertys);

        train_list.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<TrainMainProperty>() {
            @Override
            public void changed(ObservableValue<? extends TrainMainProperty> observableValue, TrainMainProperty oldItem, TrainMainProperty newItem) {
                if(newItem.getId() >0){
                    regNum=newItem.getId();
                }else{
                    regNum=0;
                }
            }
        });

//        changeEditable(false);

//        submitvbox.setDisable(true);
//
//        insertvbox.setDisable(false);
//
//        updatevbox.setDisable(false);
//
//        deletevbox.setDisable(false);
    }

    /**
     * 加载数据
     * @param regionBasic
     */
    public void  loadData(RegionBasic regionBasic){



        isnum.setUserData(regionBasic.getId());
        isnum.setText(regionBasic.getIsnum());
        area.setText(regionBasic.getArea());

        List<RegionEmployee> regionEmployees = regionEmployeeService.selectRegionEmployeeByRegionid(regionBasic.getId());

        empisnum.setCellFactory(TextFieldTableCell.forTableColumn());
        empname.setCellFactory(TextFieldTableCell.forTableColumn());
        remarks.setCellFactory(TextFieldTableCell.forTableColumn());

        empid.setCellValueFactory(new PropertyValueFactory("id"));
        empisnum.setCellValueFactory(new PropertyValueFactory("empisnum"));
        empname.setCellValueFactory(new PropertyValueFactory("empname"));
        remarks.setCellValueFactory(new PropertyValueFactory("remarks"));

        regionPropertys.clear();

        if(regionEmployees.size()>0) {
            for (RegionEmployee regionEmployee : regionEmployees) {
                RegionProperty regionProperty = new RegionProperty(regionEmployee.getId(),regionEmployee.getEmpisnum(),regionEmployee.getEmpname(),regionEmployee.getRemarks());
                regionPropertys.add(regionProperty);
            }
        }
        region_employee.setItems(regionPropertys);

        region_employee.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<RegionProperty>() {
            @Override
            public void changed(ObservableValue<? extends RegionProperty> observableValue, RegionProperty oldItem, RegionProperty newItem) {
                if(newItem.getId() >0){
                    regNum=newItem.getId();
                }else{
                    regNum=0;
                }
            }
        });

        changeEditable(false);

        submitvbox.setDisable(true);

        insertvbox.setDisable(false);

        updatevbox.setDisable(false);

        deletevbox.setDisable(false);

    }


    public void saveRegion(long regionid){
        for (RegionProperty regionProperty :regionPropertys) {
            if(regionProperty.getEmpisnum()!=null){
                if(regionProperty.getId()>0){
                    //修改业务区域负责人
                    RegionEmployee regionEmployee = new RegionEmployee(regionProperty.getId(),regionProperty.getEmpisnum(),regionProperty.getEmpname(),regionProperty.getRemarks());
                    regionEmployeeService.updateNotNull(regionEmployee);
                }else{
                    //新增业务区域负责人
                    RegionEmployee regionEmployee = new RegionEmployee(regionProperty.getId(),regionid,regionProperty.getEmpisnum(),regionProperty.getEmpname(),regionProperty.getRemarks());
                    regionEmployeeService.save(regionEmployee);
                }
            }
        }
    }

    /**
     * 业务区域负责人空白行
     */
    public void blankRegion(){
        RegionProperty regionProperty = new RegionProperty();
        regionPropertys.add(regionProperty);
    }


    public void moreRegionEmployeeButtonClick(){

        stage.setTitle("现有员工查询");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/basic/region_employee_find.fxml"));
        Scene scene = new Scene(pane);
        stage.setScene(scene);
        /*stage.setResizable(false);*/
        /*stage.initStyle(StageStyle.UNDECORATED);
        DragUtil.addDragListener(stage, pane); //拖拽监听*/
        stage.show();

        loadMoreRegionEmployee();
    }


    /**
     * 现有员工查询
     */
    public void loadMoreRegionEmployee(){

        List<EmployeeBasic> employeeBasics = employeeBasicService.selectEmployeeBasic();


        ObservableList<EmployeeBasic> list =FXCollections.observableArrayList();


        /*staffcode.setCellFactory((TableColumn<Object,Object> a ) -> new EditingCell<>());*/
        empid.setCellValueFactory(new PropertyValueFactory("id"));
        findemployeeid.setCellValueFactory(new PropertyValueFactory("idnum"));
        findemployeename.setCellValueFactory(new PropertyValueFactory("empname"));

        for (EmployeeBasic employeeBasic:employeeBasics) {

            list.add(employeeBasic);

        }

        tableViewEmployee.setItems(list); //tableview添加list

        tableViewEmployee.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<EmployeeBasic>() {
            @Override
            public void changed(ObservableValue<? extends EmployeeBasic> observableValue, EmployeeBasic oldItem, EmployeeBasic newItem) {
                if(newItem.getIdnum() != null && !("".equals(newItem.getIdnum()))){
                    tableViewEmployee.setUserData(newItem.getId());
                }
            }
        });


        tableViewEmployee.setOnMouseClicked((MouseEvent t) -> {
            if (t.getClickCount() == 2) {
                closePurchaseWin();
            }
        });


    }

    public void closePurchaseWin(){
        long id =(long)tableViewEmployee.getUserData();
        EmployeeBasic employeeBasic =  employeeBasicService.selectByKey(id);

        for(int i=0,len=regionPropertys.size();i<len;i++){
            RegionProperty regionPropertys1 = regionPropertys.get(i);
            if(regionPropertys1.getId()==regNum){
                regionPropertys1.setEmpisnum(employeeBasic.getIdnum());
                regionPropertys1.setEmpname(employeeBasic.getEmpname());
                regionPropertys1.setRemarks(employeeBasic.getRemarks());
            }
        }

        coseWin();
    }





    /**
     * region_employee 键盘按下触发
     * @param event
     */
    public void region_employeeKey(KeyEvent event){

        if (event.getCode() == KeyCode.DELETE) {

            regionEmployeeService.delete(regNum);
            ObservableList<RegionProperty> regionPropertiesNew = FXCollections.observableArrayList();

            for (RegionProperty regionProperty : regionPropertys){
                if(regionProperty.getId() != regNum){
                    regionPropertiesNew .add(regionProperty);
                }
            }
            regionPropertys.clear();
            regionPropertys.setAll(regionPropertiesNew);
        }
        if (event.getCode() == KeyCode.INSERT) {
            //空白行
            blankRegion();
        }

        if(event.getCode() == KeyCode.F4){
            moreRegionEmployeeButtonClick();
        }

    }




    /**
     * 分页查询供应商查询供应商
     */
    public void findSupplier(int pageNum){
        System.out.println("kkkkkkkkkkkkkkkkkk");

//        List<RegionBasic> regionBasics = regionBasicService.selectProductBasic(pageNum,1);
//        PageInfo<RegionBasic> pageInfo = new PageInfo<>(regionBasics);

        List<TrainMain> trainMains = iTrainMainService.selectTrainMain(pageNum, 1);
        PageInfo<TrainMain> pageInfo = new PageInfo<>(trainMains);

//        first.setUserData(1); //首页
//
//        prev.setUserData(pageInfo.getPrePage()); //上一页
//
//        next.setUserData(pageInfo.getNextPage());//下一页
//
//        last.setUserData(pageInfo.getPages());//尾页

//        regionBasics.forEach(companyBasic1 ->loadData(companyBasic1));
//        trainMains.forEach(companyBasic1 ->loadData(companyBasic1));

        loadDataTrain(pageNum,20);

    }



    /**
     * 上下首尾跳页
     * @param event
     */
    public void pages(MouseEvent event){
        Node node =(Node)event.getSource();
        int pageNum =Integer.parseInt(String.valueOf(node.getUserData()));
        findSupplier(pageNum);
        NumberUtil.changeStatus(fxmlStatus,0);
    }




    /**
     * 不可编辑
     * @param status
     */
    public void changeEditable(boolean status){

        trainTitleDetail.setDisable(!status);
        trainTypeDetail.setDisable(!status);
        trainContentDetail.setEditable(status);
        remarkDetail.setEditable(status);
    }



    /**
     * 提交
     */
    public  void submit(){

        int  submitStuts = (int)fxmlStatus.getUserData(); //1、新增 2、修改

        if(trainTitleDetail.getText() =="" || "".equals(trainTitleDetail.getText()) ){
            alert_informationDialog("标题不能为空!");
            return;
        }

        if(trainContentDetail.getText() =="" || "".equals(trainContentDetail.getText()) ){
            alert_informationDialog("内容不能为空!");
            return;
        }

//        if(remarkDetail.getText() =="" || "".equals(remarkDetail.getText()) ){
//            alert_informationDialog("备注不能为空!");
//            return;
//        }

//        Object[] values = {
//                0L,
//                trainTitleDetail.getText(),
//                trainContentDetail.getText(),
//                remarkDetail.getText()
//        };
//        RegionBasic regionBasic =(RegionBasic)NumberUtil.arrayToObject(values,RegionBasic.class);

        int rows =0;
        if(submitStuts==1){
            //新增
            TrainMain trainMain = new TrainMain();
            trainMain.setTrainTitle(trainTitleDetail.getText());
            trainMain.setTrainContent(trainContentDetail.getText());
            trainMain.setTrainType(Integer.valueOf(trainTypeDetail.getSelectionModel().getSelectedIndex())+1);
            String createid = UUID.randomUUID().toString().replaceAll("-", "");
            trainMain.setId(createid);
            trainMain.setRemark(remarkDetail.getText());
            trainMain.setTrainTimes(0);
            trainMain.setDate_created(new Date());
            trainMain.setPlanFlag("1");
            trainMain.setTrainAllTime(new Long(0));

            trainTimesDetail.setText("0");
            trainTimesDetail.setUserData("0");

            rows = iTrainMainService.save(trainMain);
            createTrainPlan(createid);


            uuid.setText(createid);
            uuid.setUserData(createid);
        }else if(submitStuts == 2){
            TrainMain trainMain = iTrainMainService.getTrainMainById((String)uuid.getUserData());

            trainMain.setTrainType(Integer.valueOf(trainTypeDetail.getSelectionModel().getSelectedIndex())+1);
            trainMain.setTrainTitle(trainTitleDetail.getText());
            trainMain.setTrainContent(trainContentDetail.getText());
            trainMain.setRemark(remarkDetail.getText());

            rows = iTrainMainService.updateNotNull(trainMain);
        }

        this.loadData(); //重新加载数据
        NumberUtil.changeStatus(fxmlStatus,0);
        submitvbox.setDisable(true);

    }

    /**
     * 删除
     */
    public void delete(){
        if(f_alert_confirmDialog(uuid.getUserData()+" "+trainTitleDetail.getText(),"是否删除!")) {

            int rows = iTrainMainService.delete(uuid.getUserData());
            if (rows > 0) {
//                findSupplier((int) prev.getUserData()); //初始化第一条数据
            }
            NumberUtil.changeStatus(fxmlStatus, 0); //修改为修改状态
            this.changeEditable(false);

            //删除对应的训练计划列表
            List<TrainPlan> trainPlanById = iTrainPlanService.getTrainPlanById(String.valueOf(uuid.getUserData()));
            for (TrainPlan trainPlan1 : trainPlanById) {
                iTrainPlanService.delete(trainPlan1);
            }
        }
    }

    /**
     * 修改
     */
    public void update(){
        NumberUtil.changeStatus(fxmlStatus,NumberUtil.UPDATE);//修改为修改状态
        this.changeEditable(true);
        submitvbox.setDisable(false);
        insertvbox.setDisable(true);
        deletevbox.setDisable(true);
        updatevbox.setDisable(true);
//        blankRegion();
    }


    /**
     *  新增按钮
     */
    public void insert(){
        NumberUtil.changeStatus(fxmlStatus,NumberUtil.INSERT);//修改为新增状态
        this.changeEditable(true);
        clearValue();//清空控件
        submitvbox.setDisable(false);
        insertvbox.setDisable(true);
        deletevbox.setDisable(true);
        updatevbox.setDisable(true);
//        blankRegion();
    }

    /**
     * 训练开始
     */
    public void trainbegin() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        currentTrainTime = calendar.getTime();
        startTraintime = calendar.getTime();

        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        fxmlTrainTime.setText("本次训练时间："+df.format(currentTrainTime));

        timeline.setAutoReverse(true);
        timeline.play();
    }

    /**
     * 训练结束
     */
    public void trainend() {
        System.out.println(timeline.getCurrentTime().toString());
        System.out.println(currentTrainTime.getTime() - startTraintime.getTime()/1000);

        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        fxmlTrainTime.setText("本次训练时间："+df.format(currentTrainTime)+" 训练已结束！");

        TrainMain trainMainById = iTrainMainService.getTrainMainById((String.valueOf(uuid.getUserData())));
        trainMainById.setLastTrainTime(new Date());
        trainMainById.setTrainTimes(trainMainById.getTrainTimes()+1);
        //页面更新训练次数
        trainTimesDetail.setText(String.valueOf(trainMainById.getTrainTimes()));
        trainTimesDetail.setUserData(String.valueOf(trainMainById.getTrainTimes()));

        //训练总时间
        Long preTrainAllTime = trainMainById.getTrainAllTime()==null?0L:trainMainById.getTrainAllTime();
        Long updateTrainTime = new BigDecimal(preTrainAllTime).add(new BigDecimal((currentTrainTime.getTime() - startTraintime.getTime())/1000)).longValue();
        trainMainById.setTrainAllTime(updateTrainTime);

        //是否训练错误，是的话训练错误次数加1
        if (fxmlErrorFlag.isSelected()) {
            int errorTime = trainMainById.getErrorTimes()+1;
            trainMainById.setErrorTimes(errorTime);
        }

        iTrainMainService.updateNotNull(trainMainById);

        //训练计划表更新 当天训练计划
        if ("2".equals(String.valueOf(trainListType.getUserData()))) {
            List<TrainPlan> trainPlans = iTrainPlanService.getTrainPlanByIdAndPlanDay(new Date(),(String.valueOf(uuid.getUserData())));
            for (TrainPlan trainPlan1:trainPlans){
                trainPlan1.setTrainTime(new Date());
                trainPlan1.setTrainFlag("1");
                iTrainPlanService.updateNotNull(trainPlan1);
            }
        }else{
            List<TrainPlan> trainPlanById = iTrainPlanService.getTrainPlanById(String.valueOf(uuid.getUserData()));
            for (TrainPlan trainPlan1 : trainPlanById) {
                if("0".equals(trainPlan1.getTrainFlag())){
                    trainPlan1.setTrainFlag("1");
                    trainPlan1.setTrainTime(new Date());
                    iTrainPlanService.updateNotNull(trainPlan1);
                    timeline.stop();
                    return;
                }
            }
        }

        //常规训练，就更新计划表最新的那次
//        if ("1".equals(String.valueOf(trainListType.getUserData()))) {
//            List<TrainPlan> trainPlanById = iTrainPlanService.getTrainPlanById(String.valueOf(uuid.getUserData()));
//            for (TrainPlan trainPlan1 : trainPlanById) {
//                if("0".equals(trainPlan1.getTrainFlag())){
//                    trainPlan1.setTrainFlag("1");
//                    trainPlan1.setTrainTime(new Date());
//                    iTrainPlanService.updateNotNull(trainPlan1);
//                    timeline.stop();
//                    return;
//                }
//            }
//        }

        timeline.stop();
    }


    /**
     * 回车查询
     * @param event
     */
    public void isNumKey(KeyEvent event){

        if(event.getCode()== KeyCode.ENTER){

            String value = isnum.getText();

            if(!"".equals(value)){

                RegionBasic regionBasic= regionBasicService.selectProductBasicByIsnum(value);

                if(regionBasic != null){
                    this.loadData(regionBasic);
                }

            }

        }

    }







    /**
     * 初始化加载数据
     */
    private void loadData(){

        String type = (String)trainListType.getUserData();

        List<TrainMain> list = new ArrayList<>();

        //1：全部训练列表 2：当天训练计划 3:未来10天训练计划 4：逾期训练
        if("1".equals(type)){
            list = iTrainMainService.listTrainMainAll();
        } else if ("2".equals(type)) {
            List<TrainPlan> trainPlanByPlanDay = iTrainPlanService.getTrainPlanByPlanDay(new Date());
            if (trainPlanByPlanDay != null && trainPlanByPlanDay.size() > 0) {
                for (TrainPlan trainPlan1 : trainPlanByPlanDay) {
                    list.add(iTrainMainService.getTrainMainById(trainPlan1.getId()));
                }
            }
        } else if ("3".equals(type)) {
            Map inclueMap = new HashMap();

            List<TrainPlan> trainPlanByPlanDay = iTrainPlanService.getTrainPlanFuture();
            if (trainPlanByPlanDay != null && trainPlanByPlanDay.size() > 0) {
                for (TrainPlan trainPlan1 : trainPlanByPlanDay) {
                    if(!inclueMap.containsKey(trainPlan1.getId())){
                        inclueMap.put(trainPlan1.getId(),trainPlan1.getId());
                        list.add(iTrainMainService.getTrainMainById(trainPlan1.getId()));
                    }
                }
            }
        } else if ("4".equals(type)) {
            List<TrainPlan> trainPlanByPlanDay = iTrainPlanService.getTrainPlanOverdue();
            if (trainPlanByPlanDay != null && trainPlanByPlanDay.size() > 0) {
                for (TrainPlan trainPlan1 : trainPlanByPlanDay) {
                    list.add(iTrainMainService.getTrainMainById(trainPlan1.getId()));
                }
            }
        }

        if(list != null){
            list.forEach(p->{
                p.setCreateDateStr(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(p.getDate_created()));
                if(p.getLastTrainTime()!=null){
                    p.setLastTrainTimeStr(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(p.getLastTrainTime()));
                }
                p.setTrainAllTimeStr(DateUtils.getDateStringBySec((p.getTrainAllTime()==null?0L:p.getTrainAllTime())));
                p.setTrainTypeStr(getComboTrans(33,p.getTrainType()));
            });
        }

        final ObservableList<TrainMain> trainMainPropertys = FXCollections.observableArrayList(list);

        id.setCellValueFactory(new PropertyValueFactory("id"));
        trainTitle.setCellValueFactory(new PropertyValueFactory("trainTitle"));
        trainType.setCellValueFactory(new PropertyValueFactory("trainTypeStr"));
        trainTimes.setCellValueFactory(new PropertyValueFactory("trainTimes"));
        trainAllTime.setCellValueFactory(new PropertyValueFactory("trainAllTimeStr"));
        lastTrainTime.setCellValueFactory(new PropertyValueFactory("lastTrainTimeStr"));
        date_created.setCellValueFactory(new PropertyValueFactory("createDateStr"));

        // 单元格工厂，绑定事件
        Callback<TableColumn<TrainMain, String>, TableCell<TrainMain, String>> buttonFactory
                = new Callback<TableColumn<TrainMain, String>, TableCell<TrainMain, String>>() {

            @Override
            public TableCell<TrainMain, String> call(TableColumn<TrainMain, String> param) {
                final TableCell<TrainMain, String> cell = new TableCell<TrainMain, String>() {
                    final Button btn1 = new Button("查看");

                    @Override
                    public void updateItem(String ite, boolean empty) {
                        super.updateItem(ite, empty);
                        if (empty) {
                            setGraphic(null);
                            setText(null);
                        } else {
                            btn1.setOnAction((ActionEvent t)
                                    -> {
                                int selectdIndex = getTableRow().getIndex();
                                System.out.println(selectdIndex);
                                // 参数
                            });
                            btn1.setMaxWidth(50);
                            btn1.setTextFill(Color.WHITE);
                            btn1.setOnMouseClicked(new EventHandler<MouseEvent>() {
                                @Override
                                public void handle(MouseEvent event) {
                                    SingleSelectionModel<Tab> selectionModel = tabPane.getSelectionModel();
                                    selectionModel.select(planDetail);
                                }
                            });
                            setGraphic(btn1);
                            setText(null);
                        }
                    }
                };
                //单元格双击事件
//                cell.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
//                    @Override
//                    public void handle(MouseEvent event) {
//                        if (event.getClickCount() > 1) {
//                            System.out.println("double click on "+cell.getItem());
//                            SingleSelectionModel<Tab> selectionModel = tabPane.getSelectionModel();
//                            selectionModel.select(1);
//                        }
//                    }
//                });
                return cell;
            }
        };


        //列表-单元格绑定事件
        col_operate.setCellFactory(buttonFactory);

        //列表-行绑定事件
        train_list.setRowFactory(tv -> {
            TableRow<TrainMain> row = new TableRow<TrainMain>();
                row.setOnMouseClicked(event -> {
                    if (event.getClickCount() == 2 && (!row.isEmpty())) {
                        TrainMain item = row.getItem();
                        System.out.println(item.getId());
                        SingleSelectionModel<Tab> selectionModel = tabPane.getSelectionModel();
                        selectionModel.select(1);
                        TrainMain trainMainById = iTrainMainService.getTrainMainById(item.getId());
                        if (trainMainById != null) {
                            trainTitleDetail.setText(trainMainById.getTrainTitle());
                            trainContentDetail.setText(trainMainById.getTrainContent());
                            remarkDetail.setText(trainMainById.getRemark());
                            //训练类型
                            int  cout = trainMainById.getTrainType();
//                                trainTypeDetail.getSelectionModel().select(cout-1);
                            setComboBox(33L,trainTypeDetail,trainMainById.getTrainType()-1);//训练类型
                            uuid.setUserData(trainMainById.getId());
                            uuid.setText(String.valueOf(trainMainById.getId()));

                            trainTimesDetail.setText(String.valueOf(trainMainById.getTrainTimes()));
                            trainTimesDetail.setUserData(String.valueOf(trainMainById.getTrainTimes()));
                        }
                    }
                });
                return row;
                }
        );

        train_list.setItems(trainMainPropertys);

        //tableview 行变事件
        train_list.getSelectionModel().selectedItemProperty().addListener(
                new ChangeListener<TrainMain>() {
                    @Override
                    public void changed(ObservableValue<? extends TrainMain> observable, TrainMain oldValue, TrainMain newValue) {
//                        SingleSelectionModel<Tab> selectionModel = tabPane.getSelectionModel();
//                        selectionModel.select(1);
                    }
                }
        );

        submitvbox.setDisable(true);
        insertvbox.setDisable(false);
        updatevbox.setDisable(false);
        deletevbox.setDisable(false);

        changeEditable(false);

        startClock();
    }

    public void startClock() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        currentTrainTime = calendar.getTime();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //创建一个handler
        EventHandler<ActionEvent> eventHandler = e -> {

            currentTrainTime.setTime(currentTrainTime.getTime()+1000);
            SimpleDateFormat df2 = new SimpleDateFormat("HH:mm:ss");
            fxmlTrainTime.setText("本次训练时间："+df2.format(currentTrainTime.getTime()));

            String format = df.format(currentTrainTime);
            System.out.println(format);
        };

        timeline = new Timeline(new KeyFrame(Duration.millis(1000), eventHandler));
        timeline.setCycleCount(Timeline.INDEFINITE);
        timeline.setAutoReverse(true);
//        timeline.play();
    }

    /**
     * 清空
     */
    public void clearValue(){

        trainTitleDetail.setText(NumberUtil.NULLSTRING);
        trainContentDetail.setText(NumberUtil.NULLSTRING);
        remarkDetail.setText(NumberUtil.NULLSTRING);
        trainTypeDetail.getSelectionModel().select(0);

        LocalDateTime localDateTime = LocalDateTime.now();

//        adddate.setText(NumberUtil.NULLSTRING);
//        updatepeople.setText(NumberUtil.NULLSTRING);
//        updatedate.setText(NumberUtil.NULLSTRING);


    }

    public void createTrainPlan(String createId) {

        AtomicInteger index=new AtomicInteger(1);

        Arrays.stream(trainPlanDayList).forEach(p ->{
            iTrainPlanService.save(new TrainPlan(createId, new Long(index.getAndIncrement()), DateUtils.getPreviousOrNextDaysOfNow(Integer.valueOf(p)), null, "0"));
        });





//        TrainPlan trainPlan = new TrainPlan();
//        iTrainPlanService.save(trainPlan);
    }


}
