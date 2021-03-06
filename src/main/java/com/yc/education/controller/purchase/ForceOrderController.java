package com.yc.education.controller.purchase;

import com.github.pagehelper.PageInfo;
import com.yc.education.constants.SpringFxmlLoader;
import com.yc.education.controller.BaseController;
import com.yc.education.model.purchase.*;
import com.yc.education.service.purchase.ForceOrderService;
import com.yc.education.service.purchase.ForceProductService;
import com.yc.education.service.purchase.PurchaseOrdersService;
import com.yc.education.service.purchase.PurchaseProductService;
import com.yc.education.util.NumberUtil;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

/**
 * @ClassName ForceOrderController
 * @Description TODO 强制结案
 * @Author QuZhangJing
 * @Date 2018/10/15 15:15
 * @Version 1.0
 */
@Controller
public class ForceOrderController extends BaseController implements Initializable {

    @Autowired
    private ForceOrderService forceOrderService; //强制结案

    @Autowired
    private ForceProductService forceProductService;//强制结案--采购产品 Service

    @Autowired
    private PurchaseOrdersService purchaseOrdersService;  //采购订单 Service

    @Autowired
    private PurchaseProductService purchaseProductService;//采购订单产品


    @FXML
    private Label fxmlStatus; //状态

    @FXML private VBox first; //第一页

    @FXML private VBox prev; //上一页

    @FXML private VBox next; //下一页

    @FXML private VBox last; //最后一页

    long changeId=0;

    @FXML private VBox clearvbox; //清除

    @FXML private VBox submitvbox; //提交

    @FXML private VBox insertvbox; //新增

    @FXML private VBox updatevbox; //修改

    @FXML private VBox deletevbox; //删除


    //*******************************单据信息***************************

    @FXML private Button purchaseButton;//采购订单按钮

    @FXML private Button saleButton;//订货单号按钮

    @FXML private TextField purchaseorder; //采购订单

    @FXML private TextField planorder; //订货单号

    @FXML private DatePicker purchasedate; //订单日期

    @FXML private DatePicker comedate; //预计到货日期

    @FXML private TextField suppliernum; //供应商编号

    @FXML private TextField suppliername; //供应商名称

    @FXML private TextField shpeople; //审核人

    @FXML private TextField shdate; //审核日期

    @FXML private TextArea remarks; //备注



    //查询更多采购订单
    @FXML private TableView tableView4; //采购订单
    @FXML private TableColumn purchaseid; //id
    @FXML private TableColumn findpurchaseorder; //采购订单号
    @FXML private TableColumn findpurchasedata; //制单日期
    @FXML private TableColumn findpurchasenum;//供应商编号
    @FXML private TableColumn findpurchasedes;//供应商简称
    @FXML private TableColumn findpurchasepeo;//业务负责
    @FXML private TableColumn findpurchasecontact;//联系人
    @FXML private TableColumn findphone; //电话
    @FXML private TableColumn findfax;//传真


    //强制结案产品
    @FXML private TableView forceProductView;
    @FXML private TableColumn forceorderid; //id
    @FXML private TableColumn pronum; //产品编号
    @FXML private TableColumn proname; //产品名称
    @FXML private TableColumn ordernum; //订单数量
    @FXML private TableColumn forcenum; //强制结案数量
    @FXML private TableColumn forcedate; //强制结案日期
    @FXML private TableColumn forceover; //已强制结案
    @FXML private TableColumn stockover; //已入库数量
    @FXML private TableColumn ontheway; //在途数量

    private Stage stage = new Stage();

    private static SpringFxmlLoader loader = new SpringFxmlLoader();

    //强制结案产品之TabelView数据绑定
    private ObservableList<ForceProductProperty> forceProductProperties = FXCollections.observableArrayList();



    //点击弹出 现有采购订单查询
    public void moreInquiryClick(){

        stage.setTitle("现有采购订单查询");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/purchase/force_purchase_find.fxml"));
        Scene scene = new Scene(pane);
        stage.setScene(scene);
        /*stage.setResizable(false);*/
        /*stage.initStyle(StageStyle.UNDECORATED);
        DragUtil.addDragListener(stage, pane); //拖拽监听*/
        stage.show();

        loadMoreInquiry();
    }


    public void loadMoreInquiry(){

        List<PurchaseOrders> purchaseOrders = purchaseOrdersService.findPurchaseOrders();

        ObservableList<PurchaseOrders> list = FXCollections.observableArrayList();


        /*tableView4.setEditable(true);*/


        purchaseid.setCellValueFactory(new PropertyValueFactory("id"));
        findpurchaseorder.setCellValueFactory(new PropertyValueFactory("orders"));
        findpurchasedata.setCellValueFactory(new PropertyValueFactory("paremdate"));
        findpurchasenum.setCellValueFactory(new PropertyValueFactory("suppliernum"));
        findpurchasedes.setCellValueFactory(new PropertyValueFactory("suppliername"));
        findpurchasepeo.setCellValueFactory(new PropertyValueFactory("purpeople"));
        findpurchasecontact.setCellValueFactory(new PropertyValueFactory("supplierconcat"));
        findphone.setCellValueFactory(new PropertyValueFactory("supplierphone"));
        findfax.setCellValueFactory(new PropertyValueFactory("supplierfax"));


        for (PurchaseOrders purchaseOrders1:purchaseOrders) {

            /*purchaseOrders1.setParemdate(new SimpleDateFormat("yyyy-MM-dd").format(supplierBasics1.getCreatedate()));*/

            list.add(purchaseOrders1);

        }

        tableView4.setItems(list); //tableview添加list

        tableView4.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<PurchaseOrders>() {
            @Override
            public void changed(ObservableValue<? extends PurchaseOrders> observableValue, PurchaseOrders oldItem, PurchaseOrders newItem) {
                if(newItem.getOrders() != null && !("".equals(newItem.getOrders()))){
                    findpurchaseorder.setUserData(newItem.getId());
                }
            }
        });


        tableView4.setOnMouseClicked((MouseEvent t) -> {
            if (t.getClickCount() == 2) {
                closeInquiryWin();
            }
        });


    }


    /**
     * 关闭采购订单窗体数据导入
     *
     * 导入采购订单基本信息、采购产品信息
     * 根据根据采购订单单号查询是否强制结案 以及每个产品结案多少
     * 根据采购订单单号查询产品在途数量
     * 根据采购订单单号查询产品入库数量
     *
     */
    public void closeInquiryWin(){
        long id =(long)findpurchaseorder.getUserData();
        PurchaseOrders purchaseOrders =  purchaseOrdersService.selectByKey(id);

       if(purchaseOrders != null){

                //导入采购订单基本信息
           {
               purchaseorder.setUserData(purchaseOrders.getOrders());

               purchaseorder.setText(purchaseOrders.getOrders());

               purchasedate.setValue(LocalDateTime.ofInstant(purchaseOrders.getCreatedate().toInstant(), ZoneId.systemDefault()).toLocalDate());

               planorder.setText( purchaseOrders.getSeeorders());

               comedate.setValue(LocalDateTime.ofInstant(purchaseOrders.getComedate().toInstant(), ZoneId.systemDefault()).toLocalDate());

               suppliernum.setText(purchaseOrders.getSuppliernum());

               suppliername.setText(purchaseOrders.getSuppliername());

               shpeople.setText( purchaseOrders.getShpeople());

               shdate.setText( purchaseOrders.getShdate());

               remarks.setText("");

           }

           //清除采购订单产品表格
           forceProductProperties.clear();

            //查询采购订单产品
          List<PurchaseProduct> purchaseProducts =  purchaseProductService.findPurchaseProduct(purchaseOrders.getId());

          if(purchaseProducts.size()>0){

              for (PurchaseProduct purchaseProduct:purchaseProducts) {
                  ForceProductProperty forceProductProperty = new ForceProductProperty(0,
                          purchaseProduct.getProorders(),
                          purchaseProduct.getProname(),
                          purchaseProduct.getNum(),
                          0,//强制结案数量
                          purchaseProduct.getForcedate(),
                          purchaseProduct.getForcenum(),//已强制结案
                          purchaseProduct.getStockover(), //已入库数量
                          purchaseProduct.getOntheway());//在途数量

                  forceProductProperties.add(forceProductProperty);
              }
              forceProductView.setItems(forceProductProperties);

          }



       }
        coseInquiryWin();
    }

    public void coseInquiryWin(){
        stage.close();
    }






    //强制结案产品之---TableView
    public void inquiryProduct(){

        List<ForceProduct> forceProducts =  forceProductService.findForceProductByForceId((long)purchaseorder.getUserData());

        pronum.setCellFactory(TextFieldTableCell.forTableColumn());
        proname.setCellFactory(TextFieldTableCell.forTableColumn());
        ordernum.setCellFactory(TextFieldTableCell.forTableColumn());
        forcenum.setCellFactory(TextFieldTableCell.forTableColumn());
        forcedate.setCellFactory(TextFieldTableCell.forTableColumn());
        forceover.setCellFactory(TextFieldTableCell.forTableColumn());
        stockover.setCellFactory(TextFieldTableCell.forTableColumn());
        ontheway.setCellFactory(TextFieldTableCell.forTableColumn());


        forceorderid.setCellValueFactory(new PropertyValueFactory("forceid"));
        pronum.setCellValueFactory(new PropertyValueFactory("pronum"));
        ordernum.setCellValueFactory(new PropertyValueFactory("ordernum"));
        forcenum.setCellValueFactory(new PropertyValueFactory("forcenum"));
        forcedate.setCellValueFactory(new PropertyValueFactory("forcedate"));
        proname.setCellValueFactory(new PropertyValueFactory("proname"));
        forceover.setCellValueFactory(new PropertyValueFactory("forceover"));
        stockover.setCellValueFactory(new PropertyValueFactory("stockover"));
        ontheway.setCellValueFactory(new PropertyValueFactory("ontheway"));


        forceProductProperties.clear();

        if(forceProducts.size()>0){
            for (ForceProduct forceProduct:forceProducts) {

                ForceProductProperty forceProductProperty = new ForceProductProperty(forceProduct.getId(),forceProduct.getPronum(),forceProduct.getProname(),forceProduct.getOrdernum(),forceProduct.getForcenum(),forceProduct.getForcedate(),forceProduct.getForceover(),forceProduct.getStockover(),forceProduct.getOntheway());

                forceProductProperties.add(forceProductProperty);
            }
        }
        forceProductView.setItems(forceProductProperties); //tableview添加list



        forceProductView.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<ForceProductProperty>() {
            @Override
            public void changed(ObservableValue<? extends ForceProductProperty> observableValue, ForceProductProperty oldItem, ForceProductProperty newItem) {
                changeId=newItem.getForceid();
            }
        });


    }
    //
    public void saveInquiryProduct(long forceid){
        for (ForceProductProperty forceProductProperty :forceProductProperties) {
            if(forceProductProperty.getPronum()!=null){
                if(forceProductProperty.getForceid() >0){
                    //修改采购负责人
                    ForceProduct forceProduct = new ForceProduct(forceProductProperty.getForceid(),forceid,forceProductProperty.getPronum(),forceProductProperty.getProname(),forceProductProperty.getOrdernum(),forceProductProperty.getForcenum(),forceProductProperty.getForcedate(),forceProductProperty.getForceover(),forceProductProperty.getStockover(),forceProductProperty.getOntheway());
                        forceProductService.updateNotNull(forceProduct);
                }else{
                    //新增采购负责人
                    ForceProduct forceProduct = new ForceProduct(forceid,forceProductProperty.getPronum(),forceProductProperty.getProname(),forceProductProperty.getOrdernum(),forceProductProperty.getForcenum(),forceProductProperty.getForcedate(),forceProductProperty.getForceover(),forceProductProperty.getStockover(),forceProductProperty.getOntheway());
                        forceProductService.save(forceProduct);
                }
            }
        }
    }

    /**
     *  验证结案数量与采购订单产品数量是否超出
     *  修改订单数量
     *  修改采购订单已结案数量
     *  修改结案时间
     * @param forceProduct
     */
    public boolean validata(ForceProduct forceProduct){



            return false;
    }



    //询价单产品空白
    public void blankInquiryProduct(){
        ForceProductProperty forceProductProperty = new ForceProductProperty();
        forceProductProperties.add(forceProductProperty);
    }










    /**
     * 上下首尾跳页
     * @param event
     */
    public void pages(MouseEvent event){
        Node node =(Node)event.getSource();
        int pageNum =Integer.parseInt(String.valueOf(node.getUserData()));
        findInquiry(pageNum);
        NumberUtil.changeStatus(fxmlStatus,0);//修改为修改状态
    }


    /**
     * 分页查询供应商查询供应商
     */
    public void findInquiry(int pageNum){

        List<ForceOrder> forceOrder = forceOrderService.findForceOrder(pageNum,1);

        PageInfo<ForceOrder> pageInfo = new PageInfo<>(forceOrder);

        first.setUserData(1); //首页

        prev.setUserData(pageInfo.getPrePage()); //上一页

        next.setUserData(pageInfo.getNextPage());//下一页

        last.setUserData(pageInfo.getPages());//尾页

        forceOrder.forEach(forceOrder1 ->loadDate(forceOrder1));

        changeEditable(false);

        submitvbox.setDisable(true);

        insertvbox.setDisable(false);

        updatevbox.setDisable(false);

        deletevbox.setDisable(false);

        //加载表格基本数据
        if(forceOrder.size() <= 0){
            purchaseorder.setUserData(0L);
            inquiryProduct();
        }

    }


    /**
     * 向控件加载数据
     * @param forceOrder
     */
    public void loadDate(ForceOrder forceOrder){

        purchaseorder.setUserData(forceOrder.getId());

        purchaseorder.setText(forceOrder.getPurchaseorder());

        purchasedate.setValue(LocalDateTime.ofInstant(forceOrder.getPurchasedate().toInstant(), ZoneId.systemDefault()).toLocalDate());

        planorder.setText(forceOrder.getPlanorder());

        comedate.setValue(LocalDateTime.ofInstant(forceOrder.getComedate().toInstant(), ZoneId.systemDefault()).toLocalDate());

        suppliernum.setText(forceOrder.getSuppliernum());

        suppliername.setText(forceOrder.getSuppliername());

        shpeople.setText(forceOrder.getShpeople());

        shdate.setText(forceOrder.getShdate());

        remarks.setText(forceOrder.getRemarks());

        inquiryProduct();

    }


    /**
     * 不可编辑
     * @param status
     */
    public void changeEditable(boolean status){

        purchaseorder.setDisable(!status);
        purchaseorder.setEditable(false);
        planorder.setEditable(false);
        purchasedate.setDisable(!status);

        planorder.setDisable(!status);

        comedate.setDisable(!status);

        suppliernum.setDisable(!status);

        suppliername.setDisable(!status);

        shpeople.setDisable(!status);

        shdate.setDisable(!status);

        remarks.setDisable(!status);

        forceProductView.setEditable(status);

        purchaseButton.setDisable(true);

        saleButton.setDisable(true);
    }



    /**
     * 清空
     */
    public void clearValue(){

        purchaseorder.setText(NumberUtil.NULLSTRING);

        planorder.setText(NumberUtil.NULLSTRING);

        suppliernum.setText(NumberUtil.NULLSTRING);

        suppliername.setText(NumberUtil.NULLSTRING);

        shpeople.setText(NumberUtil.NULLSTRING);

        remarks.setText(NumberUtil.NULLSTRING);

    }

    /**
     * 删除
     */
    public void delete(){
        if(f_alert_confirmDialog(" ","是否删除!")) {
            long id = (long) purchaseorder.getUserData();
            int rows = forceOrderService.delete(id);
            if (rows > 0) {
                findInquiry(1); //初始化第一条数据
            }
            NumberUtil.changeStatus(fxmlStatus, 0); //修改为修改状态
            this.changeEditable(false);
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

        //联系人空白行
       /* blankContact();
        blankPurchaser();*/

        blankInquiryProduct();
       /* blankInquiryDescription();
        blankInquiryRemarks();*/


    }


    /**
     *  新增按钮
     */
    public void insert(){
        NumberUtil.changeStatus(fxmlStatus,NumberUtil.INSERT);//修改为新增状态
        this.changeEditable(true);
        clearValue();//清空控件
        submitvbox.setDisable(false);
        updatevbox.setDisable(true);
        deletevbox.setDisable(true);
        insertvbox.setDisable(true);
        purchaseButton.setDisable(false);
        saleButton.setDisable(false);
        /* supplierContactProperties.clear();*/
        //联系人空白行
       /* blankContact();
        blankPurchaser();*/
        blankInquiryProduct();
        /*blankInquiryDescription();
        blankInquiryRemarks();*/
    }


    /**
     * 提交
     */
    public  void submit(){

        int  submitStuts = (int)fxmlStatus.getUserData(); //1、新增 2、修改

        LocalDate orderDate =purchasedate.getValue();

        String supperIsnum =purchaseorder.getText();

        if(supperIsnum == "" || "".equals(supperIsnum)){
            alert_informationDialog("请填写采购订单!");
            return;
        }
        if(orderDate == null){
            alert_informationDialog("请填写订单日期!");
            return;
        }


        ForceOrder forceOrder = new ForceOrder(supperIsnum,
                new Date(java.sql.Date.valueOf(orderDate).getTime()),
                planorder.getText(),
                new Date(java.sql.Date.valueOf(comedate.getValue()).getTime()),
                suppliernum.getText(),
                suppliername.getText(),
                shpeople.getText(),
                shdate.getText(),
                remarks.getText(),0);




        int rows =0;
        if(submitStuts==1){
            //产生订单编号
            rows = forceOrderService.save(forceOrder);
        }else if(submitStuts ==2){
            forceOrder.setId((long)purchaseorder.getUserData());
            rows = forceOrderService.updateNotNull(forceOrder);
        }
        /*saveContact(supplierBasic.getId());//联系人
        savePurchaser(supplierBasic.getId()); //采购负责人*/
       /* saveInquiryProduct(inquiryOrder.getId());
        saveInquiryDescription(inquiryOrder.getId());
        saveInquiryRemarks(inquiryOrder.getId());*/
        saveInquiryProduct(forceOrder.getId());
        NumberUtil.changeStatus(fxmlStatus,0);
        submitvbox.setDisable(true);

        this.loadDate(forceOrder); //重新加载数据

    }


    //询价产品
   /* public void inquiryProduct(){

        List<InquiryProduct> inquiryProducts =  inquiryProductService.findInquiryProductByInquiryid((long)orders.getUserData());

        proisnum.setCellFactory(TextFieldTableCell.forTableColumn());
        proname.setCellFactory(TextFieldTableCell.forTableColumn());
        protype.setCellFactory(TextFieldTableCell.forTableColumn());
        pronum.setCellFactory(TextFieldTableCell.forTableColumn());
        prounit.setCellFactory(TextFieldTableCell.forTableColumn());
        proprice.setCellFactory(TextFieldTableCell.forTableColumn());
        totalprice.setCellFactory(TextFieldTableCell.forTableColumn());
        proremark.setCellFactory(TextFieldTableCell.forTableColumn());



        editId.setCellValueFactory(new PropertyValueFactory("editId"));
        proisnum.setCellValueFactory(new PropertyValueFactory("proisnum"));
        proname.setCellValueFactory(new PropertyValueFactory("proname"));
        protype.setCellValueFactory(new PropertyValueFactory("protype"));
        pronum.setCellValueFactory(new PropertyValueFactory("pronum"));
        prounit.setCellValueFactory(new PropertyValueFactory("prounit"));
        proprice.setCellValueFactory(new PropertyValueFactory("proprice"));
        totalprice.setCellValueFactory(new PropertyValueFactory("totalprice"));
        proremark.setCellValueFactory(new PropertyValueFactory("proremark"));

        inquiryProductProperties.clear();

        totalnum.setText("0");
        totalmoney.setText("0.00");
        if(inquiryProducts.size()>0){
            for (InquiryProduct inquiryProduct:inquiryProducts) {
                totalCost(inquiryProduct.getPronum(),inquiryProduct.getTotalprice());
                InquiryProductProperty inquiryProductProperty = new InquiryProductProperty(inquiryProduct.getId(),inquiryProduct.getProisnum(),inquiryProduct.getProname(),inquiryProduct.getProtype(),inquiryProduct.getPronum().toString(),inquiryProduct.getProunit(),inquiryProduct.getProprice().toString(),inquiryProduct.getTotalprice().toString(),inquiryProduct.getProremark());

                inquiryProductProperties.add(inquiryProductProperty);
            }
        }
        tableView1.setItems(inquiryProductProperties); //tableview添加list



        tableView1.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<InquiryProductProperty>() {
            @Override
            public void changed(ObservableValue<? extends InquiryProductProperty> observableValue, InquiryProductProperty oldItem, InquiryProductProperty newItem) {
                if(newItem.getEditId()>0){
                    changeId = newItem.getEditId();
                }else{
                    changeId = 0;
                }
            }
        });




        //提交单价计算金额  询价订单--询价产品 金额总计
        proprice.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent>(){
            @Override

            public void handle(TableColumn.CellEditEvent event) {


                String newValue =event.getNewValue().toString();

                Double  newPrice = newValue != null && !"".equals(newValue)?newPrice=Double.parseDouble(newValue):0.00;

                totalnum.setText("0");
                totalmoney.setText("0.00");

                for (InquiryProductProperty inquiryProductProperty :inquiryProductProperties) {

                    if(inquiryProductProperty.getEditId()==changeId){

                        inquiryProductProperty.setProprice(String.valueOf(newPrice));
                        //计算金额
                        inquiryProductProperty.setTotalprice(String.valueOf(Integer.parseInt(inquiryProductProperty.getPronum())*newPrice));
                    }

                    if(inquiryProductProperty.getPronum() != null && inquiryProductProperty.getTotalprice() != null){
                        totalCost(Integer.parseInt(inquiryProductProperty.getPronum()),Double.parseDouble(inquiryProductProperty.getTotalprice()));
                    }

                }
            }

        });

    }
    //
    public void saveInquiryProduct(long inquiryid){
        for (InquiryProductProperty inquiryProductProperty :inquiryProductProperties) {
            if(inquiryProductProperty.getProisnum()!=null){
                if(inquiryProductProperty.getEditId()>0){
                    //修改采购负责人
                    InquiryProduct inquiryProduct = new InquiryProduct(inquiryProductProperty.getEditId(),inquiryProductProperty.getProisnum(),inquiryProductProperty.getProname(),inquiryProductProperty.getProtype(),Integer.parseInt(inquiryProductProperty.getPronum()),inquiryProductProperty.getProunit(),Double.parseDouble(inquiryProductProperty.getProprice()),Double.parseDouble(inquiryProductProperty.getTotalprice()),inquiryProductProperty.getProremark(),inquiryid);
                    inquiryProductService.updateNotNull(inquiryProduct);
                }else{
                    //新增采购负责人
                    InquiryProduct inquiryProduct = new InquiryProduct(inquiryProductProperty.getProisnum(),inquiryProductProperty.getProname(),inquiryProductProperty.getProtype(),Integer.parseInt(inquiryProductProperty.getPronum()),inquiryProductProperty.getProunit(),Double.parseDouble(inquiryProductProperty.getProprice()),Double.parseDouble(inquiryProductProperty.getTotalprice()),inquiryProductProperty.getProremark(),inquiryid);
                    inquiryProductService.save(inquiryProduct);
                }
            }
        }
    }


    //询价单产品空白
    public void blankInquiryProduct(){
        InquiryProductProperty inquiryProductProperty = new InquiryProductProperty();
        inquiryProductProperties.add(inquiryProductProperty);
    }


    //核算
    public void totalCost(int pronum,Double price){

        int countNum = Integer.parseInt(totalnum.getText());

        Double countMoney = Double.parseDouble(totalmoney.getText());

        totalnum.setText(String.valueOf((countNum+pronum)));

        totalmoney.setText(String.valueOf((countMoney+price)));
    }
*/





/*

    */
/**
     * tableView1 键盘按下触发
     * @param event
     *//*

    public void tableView1Key(KeyEvent event){

        if (event.getCode() == KeyCode.DELETE) {


            inquiryProductService.delete(changeId);



            ObservableList<InquiryProductProperty> inquiryProductPropertiesNew = FXCollections.observableArrayList();

            for (InquiryProductProperty inquiryProductProperty : inquiryProductProperties){
                if(inquiryProductProperty.getEditId() != changeId){
                    inquiryProductPropertiesNew .add(inquiryProductProperty);
                }
            }

            inquiryProductProperties.clear();
            inquiryProductProperties.setAll(inquiryProductPropertiesNew);

        }


        if (event.getCode() == KeyCode.INSERT) {
            //联系人空白行
            */
/* blankContact();*//*

            blankInquiryProduct();
        }

        if(event.getCode() == KeyCode.F4){
            moreInquiryProductClick();
        }
    }

*/
        //强制结案产品
        public void forceProductViewKey(KeyEvent event){

            if (event.getCode() == KeyCode.DELETE) {
                forceProductService.delete(changeId);
                ObservableList<ForceProductProperty> forceProductPropertiesNew = FXCollections.observableArrayList();

                for (ForceProductProperty forceProductProperty : forceProductProperties){
                    if(forceProductProperty.getForceid()!= changeId){
                        forceProductPropertiesNew .add(forceProductProperty);
                    }
                }
                forceProductProperties.clear();
                forceProductProperties.setAll(forceProductPropertiesNew);
            }
            if (event.getCode() == KeyCode.INSERT) {
                blankInquiryProduct();
            }

        }


    /**
     * 回车查询
     * @param event
     */
    public void isNumKey(KeyEvent event){


        if(event.getCode()==KeyCode.ENTER){

          /*  String value = isNum.getText();
            if(!"".equals(value)){
                SupplierBasic supplierBasic = supplierBasicService.selectSupplierBasicByIsnum(value);

                if(supplierBasic != null){
                    this.loadDate(supplierBasic);
                }
            }*/

        }

    }








    @Override
    public void initialize(URL location, ResourceBundle resources) {
        String newStr = location.toString();

        int index = newStr.indexOf("constraint.fxml");

        if(index != -1){
            findInquiry(1);
        }
    }

}
