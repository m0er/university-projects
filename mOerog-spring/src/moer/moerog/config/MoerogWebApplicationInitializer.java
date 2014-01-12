package moer.moerog.config;

import javax.servlet.*;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

public class MoerogWebApplicationInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(AppConfig.class);
		
		servletContext.addListener(new ContextLoaderListener(rootContext));
		
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		encodingFilter.setForceEncoding(true);
		servletContext.addFilter("encodingFilter", encodingFilter).addMappingForUrlPatterns(null, false, "/*");
		
		DelegatingFilterProxy springSecurityFilterChain = new DelegatingFilterProxy();
		servletContext.addFilter("springSecurityFilterChain", springSecurityFilterChain).addMappingForUrlPatterns(null, false, "/*");
		
		AnnotationConfigWebApplicationContext dispatcherServletContext = new AnnotationConfigWebApplicationContext();
		dispatcherServletContext.register(WebConfig.class);
		
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("spring", new DispatcherServlet(dispatcherServletContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
	}
	
}
