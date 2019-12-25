package com.yc.education.controller.customer;


import com.yc.education.constants.SpringFxmlLoader;
import com.yc.education.controller.BaseController;
import com.yc.education.model.DataSetting;
import com.yc.education.model.customer.Area;
import com.yc.education.model.customer.Customer;
import com.yc.education.model.customer.CustomerBasic;
import com.yc.education.model.customer.CustomerBusinessLeader;
import com.yc.education.model.customer.CustomerBusinessLeaderProperty;
import com.yc.education.model.customer.CustomerContacts;
import com.yc.education.model.customer.CustomerContactsProperty;
import com.yc.education.model.customer.CustomerDataMaintenance;
import com.yc.education.model.customer.CustomerDataMaintenanceProperty;
import com.yc.education.model.customer.CustomerDetailInfo;
import com.yc.education.model.customer.CustomerShippingAddress;
import com.yc.education.model.customer.CustomerSource;
import com.yc.education.model.customer.Invoice;
import com.yc.education.model.customer.InvoiceProperty;
import com.yc.education.model.customer.Remark;
import com.yc.education.model.customer.ShippingAddressProperty;
import com.yc.education.property.RemarkProperty;
import com.yc.education.service.DataSettingService;
import com.yc.education.service.UsersService;
import com.yc.education.service.customer.IAreaService;
import com.yc.education.service.customer.ICustomerBasicService;
import com.yc.education.service.customer.ICustomerBusinessLeaderService;
import com.yc.education.service.customer.ICustomerContactsService;
import com.yc.education.service.customer.ICustomerDataMaintenanceService;
import com.yc.education.service.customer.ICustomerDetailInfoService;
import com.yc.education.service.customer.ICustomerService;
import com.yc.education.service.customer.ICustomerShippingAddressService;
import com.yc.education.service.customer.ICustomerSourceService;
import com.yc.education.service.customer.IIndustryService;
import com.yc.education.service.customer.IInvoiceService;
import com.yc.education.service.customer.IRemarkService;
import com.yc.education.util.DateUtils;
import com.yc.education.util.EditCell;
import com.yc.education.util.StageManager;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TablePosition;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.Tooltip;
import javafx.scene.control.cell.ComboBoxTableCell;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.EnumSet;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 * 客户基本资料
 *
 * @Author: BlueSky
 * @Date: 2018/8/15 15:08
 */
@Controller
public class TrainMainInfoController extends BaseController implements Initializable {

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }
}
