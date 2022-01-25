package com.devpro.shop16.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

// Cấu hình MVC
@Configuration // 1 BEAN cho cấu hình
public class MVCConf implements WebMvcConfigurer {
	/*
	 * Thực hiện định nghĩa các static resources
	 * classpath: tương ứng với folder: src/main/resources*/
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		registry.addResourceHandler("/plugins/**").addResourceLocations("classpath:/plugins/");
		registry.addResourceHandler("/upload/**").addResourceLocations("classpath:/upload/");
}
	
	
	@Bean // ->
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		// thiết lập view engine
		bean.setViewClass(JstlView.class);

		// đường dẫn folder chứa Views.
		bean.setPrefix("/WEB-INF/views/");

		// Tên đuôi của View
		bean.setSuffix(".jsp");

		return bean;
	}
}
