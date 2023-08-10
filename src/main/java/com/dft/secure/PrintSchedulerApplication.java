package com.dft.secure;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.ApplicationPidFileWriter;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@Log4j2
@EnableAsync
@EnableScheduling
@SpringBootApplication
public class PrintSchedulerApplication {

    public static void main(String[] args) {

        try {
            SpringApplication springApplication = new SpringApplication(PrintSchedulerApplication.class);
            springApplication.addListeners(new ApplicationPidFileWriter());
            springApplication.run(args);
        } catch (Exception exception) {
            log.error("Exception while starting Product view spring boot app. Error Message: {}", exception.getMessage(), exception);
        }
    }

    @Bean
    ObjectMapper getObjectMapper() {
        return new ObjectMapper();
    }
}