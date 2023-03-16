package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class PasswordEncoderConfig {

    @Bean
    public PasswordEncoder getPasswordEncoder() { //Для шифрования
        return new BCryptPasswordEncoder(8); //параметр характеризующий надёжность
//        return new MessageDigestPasswordEncoder("MD5");
    }
}
