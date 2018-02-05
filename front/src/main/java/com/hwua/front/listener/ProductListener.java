package com.hwua.front.listener;

import com.hwua.front.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;
import java.util.Map;

public class ProductListener implements ServletContextListener{

    private static Logger LOGGER = Logger.getLogger(ProductListener.class);

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        try {
            ProductService productService = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext()).getBean(ProductService.class);
            List<Map<String, Object>> brand = productService.getBrand();
            List<Map<String, Object>> category = productService.getCategory();
            ServletContext servletContext = servletContextEvent.getServletContext();
            servletContext.setAttribute("brands", brand);
            servletContext.setAttribute("categorys", category);
        }catch (Exception e){
            e.printStackTrace();
            LOGGER.info(e.toString());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
