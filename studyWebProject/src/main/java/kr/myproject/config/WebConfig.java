package kr.myproject.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[] {RootConfig.class, MailConfig.class};
	}
	
	@Override
	protected Class<?>[] getServletConfigClasses() {

		return new Class[] {ServletConfig.class};
	}
	
	@Override
	protected String[] getServletMappings() {

		return new String[] {"/"};
	}
	
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter chEncoder = new CharacterEncodingFilter();
		chEncoder.setEncoding("UTF-8");
		chEncoder.setForceEncoding(true);
		
		return new Filter[] {chEncoder};
	}
	
	
	
}
