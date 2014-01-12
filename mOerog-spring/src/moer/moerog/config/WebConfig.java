package moer.moerog.config;

import org.springframework.context.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages="moer.moerog",
		useDefaultFilters=false,
		includeFilters=@ComponentScan.Filter(Controller.class))
public class WebConfig extends WebMvcConfigurationSupport {
	
	@Override
	protected void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
//	@Bean
//	public ServletContextTemplateResolver templateResolver() {
//		ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver();
//		templateResolver.setPrefix("/templates/");
//		templateResolver.setSuffix(".html");
//		templateResolver.setCharacterEncoding("UTF-8");
//		templateResolver.setTemplateMode("HTML5");
//		return templateResolver;
//	}
//	
//	@Bean
//	public SpringTemplateEngine templateEngine() {
//		SpringTemplateEngine templateEngine = new SpringTemplateEngine();
//		templateEngine.setTemplateResolver(templateResolver());
//		return templateEngine;
//	}
//	
//	@Bean
//	public ThymeleafViewResolver thymeleafViewResolver() {
//		ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
//		viewResolver.setTemplateEngine(templateEngine());
//		viewResolver.setContentType("text/html; charset=UTF-8");
//		return viewResolver;
//	}
}
