package com.see0gan.member.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;


@Configuration
@ComponentScan(basePackages = {"com.see0gan.member.service", "com.see0gan.member.dao"})
@Import({DBConfig.class})
public class ApplicationConfig {

}
