package com.yc.education.application;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.stage.Stage;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


/**
 *
 */
public class TrainMain extends Application {

    private static Logger logger = LogManager.getLogger(TrainMain.class);

    @Override
    public void start(Stage stage) throws Exception {
        logger.info("Starting application");
        Platform.setImplicitExit(true);
        TrainScreenManager screens = new TrainScreenManager();
        screens.setPrimaryStage(stage);
        screens.showStage();
    }

    public static void main(String[] args) {
        launch(args);
    }

}
