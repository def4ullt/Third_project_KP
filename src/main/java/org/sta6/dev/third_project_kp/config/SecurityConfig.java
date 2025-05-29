package org.sta6.dev.third_project_kp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .anyRequest().permitAll()  // дозвіл на всі запити
                )
                .csrf(csrf -> csrf.disable()) // вимикаємо CSRF (не рекомендовано для продакшену без розуміння)
                .formLogin(login -> login.disable()) // вимикаємо форму логіну
                .httpBasic(httpBasic -> httpBasic.disable()); // вимикаємо базову авторизацію
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
