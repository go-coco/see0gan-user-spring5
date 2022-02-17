package com.see0gan.member.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.see0gan.member.filter.CustomAuthenticationFilter;
import com.see0gan.member.filter.CustomAuthorizationFilter;
import com.see0gan.member.service.security.CustomUserDetailsService;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;	
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(
				"/webjars/**", "/css/**", "/resources/**");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(encoder()); 
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		CustomAuthenticationFilter customAuthenticationFilter = new CustomAuthenticationFilter(authenticationManagerBean());
		customAuthenticationFilter.setFilterProcessesUrl("/api/login");		
		
		http.csrf().disable();
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		http.authorizeRequests().antMatchers("/api/token/refresh").permitAll();
		http.authorizeRequests().antMatchers(HttpMethod.POST, "/api/spaces/**").hasRole("HOST");
		http.authorizeRequests().antMatchers(HttpMethod.PUT, "/api/spaces/**").hasAuthority("HOST");
		http.authorizeRequests().antMatchers(HttpMethod.DELETE, "/api/spaces/**").hasRole("HOST");
		http.addFilter(customAuthenticationFilter);
		http.addFilterBefore(new CustomAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class);
       	
	}	

	@Bean
	 @Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	    public PasswordEncoder encoder() {
	        return new BCryptPasswordEncoder();
	    }
	
}
