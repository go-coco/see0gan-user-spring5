package com.see0gan.member.config;

import javax.servlet.Filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { ApplicationConfig.class, 
				SecurityConfig.class};
	}

	@Override	
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] {WebMvcContextConfiguration.class};
	}


	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	

    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");

        return new Filter[]{encodingFilter};
    }
    
  

}
