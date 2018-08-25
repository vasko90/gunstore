
package model;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
    private static SessionFactory sf;
    
    public static SessionFactory getSessionFactory(){
        Configuration c = new Configuration();
        c.configure("hibernateConfig/hibernate.cfg.xml");
        ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(c.getProperties()).build();
        sf = c.buildSessionFactory(sr);
        
        return sf;
    }
}
