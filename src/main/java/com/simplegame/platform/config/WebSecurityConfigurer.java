package com.simplegame.platform.config;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.alibaba.fastjson.JSONObject;
import com.simplegame.platform.bus.user.entity.Roles;
import com.simplegame.platform.bus.user.service.IUserService;

/**
 * 
 * @Author zeusgooogle@gmail.com
 * @sine 2015年9月24日 上午11:02:49
 * 
 */
@Configuration
@EnableWebMvcSecurity
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    @Autowired
    private IUserService userService;

    @Resource
    private PasswordEncoder passwordEncoder;
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable() //取消页面token
        
            .authorizeRequests()
                .antMatchers("/", "/game", "/about", "/user/register", "/register" ).permitAll()
            
                .anyRequest().authenticated()
                
                .antMatchers("/admin/**").hasRole(Roles.ADMIN.name)
                
            .and()
            
        .formLogin()
            .loginPage("/login")
            //.loginProcessingUrl("/user/login")
            
            .successHandler(new LoginSuccessHandler())
            .failureHandler(new LoginFailureHandler())
            .permitAll()
            .and()
        .logout().permitAll();

    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }

    private class LoginSuccessHandler implements AuthenticationSuccessHandler {
        
        @Override
        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
            JSONObject json = new JSONObject();
            json.put("ret", 0);
            
            response.getWriter().print(json.toJSONString());
        }
    }
    
    private class LoginFailureHandler implements AuthenticationFailureHandler {
        @Override
        public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
            JSONObject json = new JSONObject();
            json.put("ret", -1);
            json.put("msg", exception.getMessage());
            
            response.getWriter().print(json.toJSONString());
        }
    }
    
    
}
