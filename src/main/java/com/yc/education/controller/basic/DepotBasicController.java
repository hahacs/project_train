package com.yc.education.controller.basic;

import com.github.pagehelper.PageInfo;
import com.yc.education.constants.SpringFxmlLoader;
import com.yc.education.controller.BaseController;
import com.yc.education.model.basic.DepartmentBasic;
import com.yc.education.model.basic.DepotBasic;
import com.yc.education.service.basic.DepotBasicService;
import com.yc.education.util.NumberUtil;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.net.URL;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.ResourceBundle;

/**
 * @ClassName DepartmentBasicController
 * @Description TODO 仓库库位设置
 * @Author QuZhangJing
 * @Date 2018-08-14 15:47
 * @Version 1.0
 */
@Controller
public class DepotBasicController extends BaseController implements Initializable {

    @Autowired
    private DepotBasicService depotBasicService;


    @FXML private TreeView treeView;


    @FXML
    Label fxmlStatus; //窗体状态

    @FXML private VBox first; //第一页

    @FXML private VBox prev; //上一页

    @FXML private VBox next; //下一页

    @FXML private VBox last; //最后一页


    @FXML private VBox submitvbox; //提交

    @FXML private VBox clearvbox; //清除

    @FXML private VBox insertvbox; //新增

    @FXML private VBox updatevbox; //修改

    @FXML private VBox deletevbox; //删除




    @FXML
    TextField isNum; //备注

    @FXML TextField depname; //名称

   @FXML TextField depfloor; //楼层

    @FXML ComboBox parentid; //隶属仓库

    @FXML TextArea remarks; //备注

    @FXML TextField addpeople; //建档人

    @FXML TextField adddate; //建档日期

    @FXML TextField updatepeople; //最后修改人

    @FXML TextField updatedate;//最后修改日期

    @FXML private TableView tableViewDepot; //库位查询
    @FXML private TableColumn depid; //id
    @FXML private TableColumn finddepotid; //库位编号
    @FXML private TableColumn finddepotname; //库位名称



    private Stage stage = new Stage();


    private static SpringFxmlLoader loader = new SpringFxmlLoader();


    /**
     * 生成编号
     * @return
     */
    public String createIsnum(){
        String maxIsnum = depotBasicService.selectMaxIdnum();
        if(maxIsnum != null){
            String maxAlphabet = maxIsnum.substring(0,1);
            int currenNumber = Integer.parseInt(maxIsnum.substring(1,maxIsnum.length()));
            for (int i = 0; i< NumberUtil.ALPHABET.length; i++){
                if(currenNumber == NumberUtil.MAXNUMBER){
                    if( maxAlphabet.equals(NumberUtil.ALPHABET[i])  ){
                        return NumberUtil.ALPHABET[i+1]+"001";
                    }
                }
            }
            if(currenNumber>0 && currenNumber < 9){
                return maxAlphabet +"00"+(currenNumber+1);
            }else if(currenNumber >= 9 && currenNumber< 99){
                return maxAlphabet +"0"+(currenNumber+1);
            }else{
                return maxAlphabet +(currenNumber+1);
            }
        }
        return "A001";
    }


    /**
     * 现有库位查询
     */
    public void moreDepotButtonClick(){

        stage.setTitle("现有库位查询");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/basic/depot_find.fxml"));
        Scene scene = new Scene(pane);
        stage.setScene(scene);
        /*stage.setResizable(false);*/
        /*stage.initStyle(StageStyle.UNDECORATED);
        DragUtil.addDragListener(stage, pane); //拖拽监听*/
        stage.show();

        loadMoreDepartment();
    }


    /**
     * 现有库位查询
     */
    public void loadMoreDepartment(){

        List<DepotBasic> departmentBasics = depotBasicService.selectDepotBasic();


        ObservableList<DepotBasic> list = FXCollections.observableArrayList();


        tableViewDepot.setEditable(true);

        /*staffcode.setCellFactory((TableColumn<Object,Object> a ) -> new EditingCell<>());*/

        depid.setCellValueFactory(new PropertyValueFactory("id"));
        finddepotid.setCellValueFactory(new PropertyValueFactory("isnum"));
        finddepotname.setCellValueFactory(new PropertyValueFactory("depname"));

        for (DepotBasic depotBasic:departmentBasics) {

            list.add(depotBasic);

        }

        tableViewDepot.setItems(list); //tableview添加list

        tableViewDepot.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<DepotBasic>() {
            @Override
            public void changed(ObservableValue<? extends DepotBasic> observableValue, DepotBasic oldItem, DepotBasic newItem) {
                if(newItem.getIsnum()!= null && !("".equals(newItem.getIsnum()))){
                    isNum.setUserData(newItem.getId());
                }
            }
        });


        tableViewDepot.setOnMouseClicked((MouseEvent t) -> {
            if (t.getClickCount() == 2) {
                closeSureWin();
            }
        });


    }

    public void closeSureWin(){
        long id =(long)isNum.getUserData();
        DepotBasic depotBasic =  depotBasicService.selectByKey(id);
        loadData(depotBasic);
        coseWin();
    }

    public void coseWin(){
        stage.close();
    }





























    /**
     * 加载数据
     */
    public void  loadData(DepotBasic depotBasic){

        long selectId=0;

        ObservableList<String> list = FXCollections.observableArrayList();

        List<DepotBasic> DepotBasics = depotBasicService.selectDepotBasic();

        for (int i=0;i<DepotBasics.size();i++) {
            list.add(DepotBasics.get(i).getDepname());
            if(DepotBasics.get(i).getId()==depotBasic.getParentid()){
                selectId=i;
            }
        }
        parentid.setItems(list);
        parentid.getSelectionModel().select((int)selectId);



        isNum.setUserData(depotBasic.getId());

        isNum.setText(depotBasic.getIsnum());

        depname.setText(depotBasic.getDepname());

        depfloor.setText(depotBasic.getDepfloor());

        int  cout = depotBasic.getParentid().intValue();
        parentid.getSelectionModel().select(--cout);

        remarks.setText(depotBasic.getRemarks());

        addpeople.setText(depotBasic.getAddpeople());

        adddate.setText(depotBasic.getAdddate());

        updatepeople.setText(depotBasic.getUpdatepeople());

        updatedate.setText(depotBasic.getUpdatedate());
        changeEditable(false);

        submitvbox.setDisable(true);
        insertvbox.setDisable(false);

        updatevbox.setDisable(false);

        deletevbox.setDisable(false);


        departmentTreeValue();

    }


    /**
     * 分页查询供应商查询供应商
     */
    public void findSupplier(int pageNum){
        List<DepotBasic> depotBasic  = depotBasicService.selectDepotBasic(pageNum,1);
        PageInfo<DepotBasic> pageInfo = new PageInfo<>(depotBasic);


        first.setUserData(1); //首页

        prev.setUserData(pageInfo.getPrePage()); //上一页

        next.setUserData(pageInfo.getNextPage());//下一页

        last.setUserData(pageInfo.getPages());//尾页

        depotBasic.forEach(companyBasic1 ->loadData(companyBasic1));

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
        depname.setDisable(!status);
        depfloor.setDisable(!status);
        parentid.setDisable(!status);
        remarks.setDisable(!status);
        addpeople.setDisable(!status);
        adddate.setDisable(!status);
        updatepeople.setDisable(!status);
        updatedate.setDisable(!status);
    }




    /**
     * 清空
     */
    public void clearValue(){


        isNum.setText(NumberUtil.NULLSTRING);

        depname.setText(NumberUtil.NULLSTRING);

        depfloor.setText(NumberUtil.NULLSTRING);

        remarks.setText(NumberUtil.NULLSTRING);

        addpeople.setText(NumberUtil.NULLSTRING);

        updatepeople.setText(NumberUtil.NULLSTRING);

        parentid.getSelectionModel().select(0);

        addpeople.setText(NumberUtil.NULLSTRING);

        LocalDateTime localDateTime = LocalDateTime.now();

        adddate.setText(NumberUtil.NULLSTRING);

        updatepeople.setText(NumberUtil.NULLSTRING);

        updatedate.setText(NumberUtil.NULLSTRING);


    }




    /**
     * 提交
     */
    public  void submit(){

        int  submitStuts = (int)fxmlStatus.getUserData(); //1、新增 2、修改


        /*    SupplierBasic supplierBasic = new SupplierBasic();*/

        String idnums ="";

        if(submitStuts==2){
            idnums=isNum.getText();
        }

      /*  int istopval=0;
        if(isstop.isSelected()){
            istopval=1;
        }else{
            istopval=0;
        }*/

        Object[] values = {
                0L,
                idnums,
                depname.getText(),
                depfloor.getText(),
                parentid.getSelectionModel().getSelectedItem()==null?0:depotBasicService.selectDepotBasicByDepName(parentid.getSelectionModel().getSelectedItem().toString()).getId(),
                remarks.getText(),
                addpeople.getText(),
                adddate.getText(),
                updatepeople.getText(),
                updatedate.getText(),

        };

        DepotBasic depotBasic =(DepotBasic)NumberUtil.arrayToObject(values,DepotBasic.class);

        int rows =0;
        if(submitStuts==1){
            String isNums = this.createIsnum();
            isNum.setText(isNums);
            depotBasic.setIsnum(isNums);
            rows = depotBasicService.save(depotBasic);
        }else if(submitStuts ==2){
            depotBasic.setId((long)isNum.getUserData());
            rows = depotBasicService.updateNotNull(depotBasic);
        }
        depotBasic.setIsnum(isNum.getText());
        this.loadData(depotBasic); //重新加载数据

        NumberUtil.changeStatus(fxmlStatus,0);
        submitvbox.setDisable(true);


    }





    /**
     * 删除
     */
    public void delete(){
        if(f_alert_confirmDialog(" ","是否删除!")) {
            long id = (long)isNum.getUserData();
            int rows = depotBasicService.delete(id);
            if(rows>0){
                findSupplier((int)prev.getUserData()); //初始化第一条数据
            }
            NumberUtil.changeStatus(fxmlStatus,0); //修改为修改状态
            this.changeEditable(false);
        }
    }




    /**
     * 修改
     */
    public void update(){
        NumberUtil.changeStatus(fxmlStatus,NumberUtil.UPDATE);//修改为修改状态

        lastUpdatePeopel(updatepeople,updatedate); //最后修改人 和最后修改日期

        this.changeEditable(true);
        submitvbox.setDisable(false);
        insertvbox.setDisable(true);
        deletevbox.setDisable(true);
        updatevbox.setDisable(true);

    }


    /**
     *  新增按钮
     */
    public void insert(){
        NumberUtil.changeStatus(fxmlStatus,NumberUtil.INSERT);//修改为新增状态
        this.changeEditable(true);
        clearValue();//清空控件

        createPeople(addpeople,adddate);//建档人、建档日期
        submitvbox.setDisable(false);
        insertvbox.setDisable(true);
        deletevbox.setDisable(true);
        updatevbox.setDisable(true);
    }


    /**
     * 回车查询
     * @param event
     */
    public void isNumKey(KeyEvent event){


        if(event.getCode()== KeyCode.ENTER){

            String value = isNum.getText();

            if(!"".equals(value)){

                DepotBasic depotBasic = depotBasicService.selectDepotBasicByIsnum(value);

                if(depotBasic != null){
                    this.loadData(depotBasic);
                }

            }

        }

    }







    /**
     * 公司部门设置 树形图
     */
    public  void departmentTreeValue(){

        TreeItem<String> rootItem = new TreeItem<String> ();
        rootItem.setExpanded(true);

        String companyName ="上海三禄贸易有限公司";
        long   companyId  =1L;

        List<DepotBasic> depotBasics = depotBasicService.selectDepotBasicByParentId(0);

        if(depotBasics.size()>0){
            for (DepotBasic depotBasic:depotBasics) {
                companyName = depotBasic.getDepname();
                companyId = depotBasic.getId();
            }
        }

        TreeItem<String> items = new TreeItem<>(companyName);

        items.setExpanded(true);

        List<DepotBasic> depotBasicTow = depotBasicService.selectDepotBasicByParentId(companyId);

        setItems(items,depotBasicTow);

        rootItem.getChildren().add(items);

        treeView.setShowRoot(false);

        treeView.setRoot(rootItem);
    }

    /**
     * 设置 树值
     * @param item
     * @param depotBasics
     */
    public void setItems(TreeItem<String> item,List<DepotBasic> depotBasics){
        for (DepotBasic depotBasic:depotBasics) {
            TreeItem<String> items = new TreeItem<> ("("+depotBasic.getIsnum()+")"+depotBasic.getDepname());
            List<DepotBasic> depotBasicList = depotBasicService.selectDepotBasicByParentId(depotBasic.getId());
            if(depotBasicList.size()>0){
                setItems(items,depotBasicList);
            }
            item.getChildren().add(items);
            items.setExpanded(true);
        }
    }








    @Override
    public void initialize(URL location, ResourceBundle resources) {

        treeView.addEventFilter(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>()
        {
            public void handle(MouseEvent event)
            {
                Node node = event.getPickResult().getIntersectedNode();
                if (node instanceof Text || (node instanceof TreeCell && ((TreeCell) node).getText() != null)) {
                    String newName = (String) ((TreeItem)treeView.getSelectionModel().getSelectedItem()).getValue();
                    //(A001)销售部
                    /**
                     * 根据名称查询部门
                     */
                    loadData(depotBasicService.selectDepotBasicByDepName(newName.substring(newName.indexOf(")")+1,newName.length())));
                }
            }
        });

        /*   departmentTreeValue();*/



        String newStr = location.toString();

        int index = newStr.indexOf("depot_basic");

        if(index != -1){

            findSupplier(1); //加载数据
            NumberUtil.changeStatus(fxmlStatus,0); //查看

        }



    }


}
