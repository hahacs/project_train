package com.yc.education.application;

import com.yc.education.constants.SpringFxmlLoader;
import com.yc.education.util.DragUtil;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import org.apache.ibatis.io.ResolverUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.Observable;
import java.util.Observer;

public class TrainScreenManager implements Observer {

    private static Logger logger = LogManager.getLogger(ScreenManager.class);
    private static SpringFxmlLoader loader = new SpringFxmlLoader();

    private Stage stage;
    private Scene scene;

    public void setPrimaryStage(Stage primaryStage) {
        this.stage = primaryStage;
    }

    public void showStage() {
//        showStageWithLogin();
        showStageWithNoLogin();
    }

    /**
     * 先进登录页面
     */
    public void showStageWithLogin(){
        stage.setTitle("");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/train_login.fxml"));
        scene = new Scene(pane);
        stage.getIcons().add(new Image(
                ResolverUtil.Test.class.getResourceAsStream("/images/timg.jpg")));
        stage.setScene(scene);
//        stage.setResizable(false);
//        stage.initStyle(StageStyle.UNDECORATED);
//        stage.setMaximized(true);
        stage.setHeight(630.0);
        stage.setWidth(1030.0);
        DragUtil.addDragListener(stage, pane); //拖拽监听
        stage.show();
    }

    public void showStageWithNoLogin(){
        Stage stage = new Stage();
        stage.setTitle("训练系统");
        Pane pane = new Pane();
        pane.getChildren().setAll(loader.load("/fxml/container.fxml"));
        stage.getIcons().add(new Image(ResolverUtil.Test.class.getResourceAsStream("/images/timg.jpg")));
        Scene scene = new Scene(pane);
        stage.setScene(scene);

        //根据屏幕大小自适应宽高度
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        System.out.println(screenSize.getHeight());
        System.out.println(screenSize.getWidth());
        stage.setHeight(screenSize.getHeight()-30);
        stage.setWidth(screenSize.getWidth()-170);

        stage.show();
    }

    @Override
    public void update(Observable o, Object arg) {

    }
}
