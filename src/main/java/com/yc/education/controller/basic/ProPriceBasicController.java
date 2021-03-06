package com.yc.education.controller.basic;

import com.sun.javafx.scene.control.skin.LabeledText;
import com.yc.education.constants.SpringFxmlLoader;
import com.yc.education.controller.BaseController;
import com.yc.education.model.basic.ProductBasic;
import com.yc.education.model.basic.ProductPriceProperty;
import com.yc.education.service.basic.ProductBasicService;
import com.yc.education.util.MyCheckBox;
import com.yc.education.util.NumberUtil;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.CheckBoxTableCell;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.util.converter.DoubleStringConverter;
import javafx.util.converter.LongStringConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;

/**
 * @ClassName ProPriceBasicController
 * @Description TODO 产品价格设定
 * @Author QuZhangJing
 * @Date 2018-08-14 13:47
 * @Version 1.0
 */
@Controller
public class ProPriceBasicController extends BaseController implements Initializable {



    @Autowired
    private ProductBasicService productBasicService;



    @FXML private Label fxmlStatus; //状态

    @FXML private TextField isnum;//产品编号

    @FXML private TextField proname;//产品名称

    @FXML private ComboBox basicunit; //基本单位

    @FXML private ComboBox protype;//产品大类






    @FXML private ComboBox bzcm;

    @FXML private ComboBox zdcm;

    @FXML private  TextField bzprc;
    @FXML private  TextField zdprc;



    @FXML private TableView proTableView;

    @FXML private TableColumn idnum;
    @FXML private TableColumn pname;
    @FXML private TableColumn bigtype;
    @FXML private TableColumn basictype;
    @FXML private TableColumn bzprice;
    @FXML private TableColumn lowprice;
    @FXML private TableColumn remarks;
    @FXML private TableColumn ck;




    @FXML private TableView tableViewProduct; //产品基本查询
    @FXML private TableColumn depid; //id
    @FXML private TableColumn findproductid; //产品基本编号
    @FXML private TableColumn findproductname; //产品基本名称



    private Stage stage = new Stage();


    private static SpringFxmlLoader loader = new SpringFxmlLoader();


    /**
     * 产品价格设定TabelView数据绑定
     */
    private ObservableList<ProductPriceProperty> productPriceProperties = FXCollections.observableArrayList();




    public void moreProductButtonClick(){

        stage.setTitle("现有产品基本查询");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/basic/pro_price_find.fxml"));
        Scene scene = new Scene(pane);
        stage.setScene(scene);
        /*stage.setResizable(false);*/
        /*stage.initStyle(StageStyle.UNDECORATED);
        DragUtil.addDragListener(stage, pane); //拖拽监听*/
        stage.show();
        loadMoreProduct();
    }


    /**
     * 现有库位查询
     */
    public void loadMoreProduct(){

        List<ProductBasic> productBasics = productBasicService.selectProductBasic();

        ObservableList<ProductBasic> list = FXCollections.observableArrayList();

        tableViewProduct.setEditable(true);

        /*staffcode.setCellFactory((TableColumn<Object,Object> a ) -> new EditingCell<>());*/

        depid.setCellValueFactory(new PropertyValueFactory("id"));
        findproductid.setCellValueFactory(new PropertyValueFactory("isnum"));
        findproductname.setCellValueFactory(new PropertyValueFactory("proname"));

        for (ProductBasic productBasic:productBasics) {
            list.add(productBasic);
        }

        tableViewProduct.setItems(list); //tableview添加list

        tableViewProduct.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<ProductBasic>() {
            @Override
            public void changed(ObservableValue<? extends ProductBasic> observableValue, ProductBasic oldItem, ProductBasic newItem) {
                if(newItem.getIsnum()!= null && !("".equals(newItem.getIsnum()))){
                    isnum.setUserData(newItem.getId());
                }
            }
        });


        tableViewProduct.setOnMouseClicked((MouseEvent t) -> {
            if (t.getClickCount() == 2) {
                closeSureWin();
            }
        });


    }

    public void closeSureWin(){
        long id =(long)isnum.getUserData();
        ProductBasic productBasic =  productBasicService.selectByKey(id);
      /*  loadData(productBasic);*/

        isnum.setText(productBasic.getIsnum());

        proname.setText(productBasic.getProname());

        int basicunits = productBasic.getBasicunit().intValue();

        basicunit.getSelectionModel().select(--basicunits);

        int protypes = productBasic.getProtype().intValue();

        protype.getSelectionModel().select(--protypes);

        coseWin();
    }

    public void coseWin(){
        stage.close();
    }
















    /**
     * 搜索产品
     */
    public void search(){

        String isnumValue = isnum.getText();

        String pronameValue = proname.getText();

        long  basicunitValue =  (long)basicunit.getSelectionModel().getSelectedIndex();

        long  protypeValue =  (long)protype.getSelectionModel().getSelectedIndex();


        List<ProductBasic> productBasics = productBasicService.selectProductBasicSearch(isnumValue,pronameValue,++basicunitValue,++protypeValue);

        loadData(productBasics);
    }


    /**
     * 加载数据
     */
    public void loadData(List<ProductBasic> productBasics){



        proTableView.setEditable(false);

        if(productBasics.size()>0) {
            /*ck.setCellFactory(CheckBoxTableCell.forTableColumn(ck));*/
            idnum.setCellFactory(TextFieldTableCell.forTableColumn());
            pname.setCellFactory(TextFieldTableCell.forTableColumn());
            bigtype.setCellFactory(ComboBoxTableCell.forTableColumn(new LongStringConverter()));
            basictype.setCellFactory(ComboBoxTableCell.forTableColumn(new LongStringConverter()));
            bzprice.setCellFactory(TextFieldTableCell.forTableColumn(new DoubleStringConverter()));
            lowprice.setCellFactory(TextFieldTableCell.forTableColumn(new DoubleStringConverter()));
            remarks.setCellFactory(TextFieldTableCell.forTableColumn());

            ck.setCellValueFactory(new PropertyValueFactory("id"));
            idnum.setCellValueFactory(new PropertyValueFactory("isnum"));
            pname.setCellValueFactory(new PropertyValueFactory("proname"));
            bigtype.setCellValueFactory(new PropertyValueFactory<ProductBasic,Long>("protype"));
            basictype.setCellValueFactory(new PropertyValueFactory<ProductBasic,Long>("basicunit"));
            bzprice.setCellValueFactory(new PropertyValueFactory<ProductBasic,Double>("normprice"));
            lowprice.setCellValueFactory(new PropertyValueFactory<ProductBasic,Double>("lowprice"));
            remarks.setCellValueFactory(new PropertyValueFactory("remarks"));

            productPriceProperties.clear();

            for (ProductBasic productBasic : productBasics) {
                ProductPriceProperty productPriceProperty = new ProductPriceProperty(productBasic.getId(),productBasic.getIsnum(),productBasic.getProname(),productBasic.getProtype(),productBasic.getBasicunit(),productBasic.getNormprice(),productBasic.getLowprice(),productBasic.getRemarks());
                productPriceProperties.add(productPriceProperty);
            }
        }
        proTableView.setItems(productPriceProperties);



    }


    /**
     * 确认
     */
    public void okButton(){

         int bzindex = bzcm.getSelectionModel().getSelectedIndex();

         int zdindex = bzcm.getSelectionModel().getSelectedIndex();

        String bz =  bzprc.getText(); //标准价格
        String zd =  zdprc.getText(); //最低价格

        if(!"".equals(bz)&&bz != null){
            productPriceProperties.forEach(productPriceProperty -> {
                productPriceProperty.setNormprice(Double.parseDouble(bz));
                updateProduct(productPriceProperty);
            });
        }

        if(!"".equals(zd)&&zd != null){
            productPriceProperties.forEach(productPriceProperty -> {
                productPriceProperty.setLowprice(Double.parseDouble(zd));
                updateProduct(productPriceProperty);
            });
        }
    }

    public void updateProduct(ProductPriceProperty productPriceProperty){
        ProductBasic productBasic = new ProductBasic(productPriceProperty.getId(),productPriceProperty.getNormprice(),productPriceProperty.getLowprice());
        productBasicService.updateNotNull(productBasic);
    }




    /**
     * 清空搜索列表
     */
    public void clear(){
         isnum.setText(NumberUtil.NULLSTRING);
         proname.setText(NumberUtil.NULLSTRING);
        basicunit.getSelectionModel().select(0);
        protype.getSelectionModel().select(0);
    }


    /**
     * 初始化
     * @param location FXMl文件路径
     * @param resources
     */
    @Override
    public void initialize(URL location, ResourceBundle resources) {

        setComboBox(5L,basicunit,0);//基本单位

        setComboBox(5L,protype,0);//产品类型

        setComboBox(7L,bzcm,0);//货币类型

        setComboBox(7L,zdcm,0);//货币类型
    }



}
