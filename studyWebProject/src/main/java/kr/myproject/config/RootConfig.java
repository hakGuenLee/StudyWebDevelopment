package kr.myproject.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan(basePackages="kr.myproject.mapper")
@PropertySource({"classpath:/db.properties"})
@ComponentScan(basePackages= {"kr.myproject.service"})
public class RootConfig {
	
	
	@Autowired
	private Environment env;
	
	@Autowired
	ApplicationContext ac;
	
	@Bean
	public DataSource hkSource() {
		HikariConfig hcf = new HikariConfig();

		
		hcf.setDriverClassName(env.getProperty("jdbc-driver"));
		hcf.setJdbcUrl(env.getProperty("jdbc-url"));
		hcf.setUsername(env.getProperty("jdbc-username"));
		hcf.setPassword(env.getProperty("jdbc-password"));
		
		HikariDataSource hkds = new HikariDataSource(hcf);
		
		return hkds;
	}
	
	@Bean
	public SqlSessionFactory sessionFactory() throws Exception {
		SqlSessionFactoryBean sfb = new SqlSessionFactoryBean();
		sfb.setDataSource(hkSource());
		sfb.setConfigLocation(ac.getResource("classpath:/config.xml"));
		 sfb.setMapperLocations(ac.getResources("classpath:/mapper/*.xml")); 
		return (SqlSessionFactory)sfb.getObject();
	}
	
	
	
	

}
