package hah.impls;


import hah.daos.DriverDao;
import hah.models.Driver;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class DriverImpl implements DriverDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //get all drivers
    @Override
    public List<Driver> getAllDriver() {
        Query query = session().createQuery("from Driver");
        List<Driver> drivers = query.list();
        session().flush();
        return drivers;
    }

    //get drivers by available
    @Override
    public List<Driver> getAllDriverByAvailable() {
        Query query = session().createQuery("from Driver driver where driver.available=true");
        List<Driver> drivers = query.list();
        session().flush();
        return drivers;
    }

    //get driver by id
    @Override
    public Driver getDriverById(int id) {
        Driver driver = session().get(Driver.class,id);
        session().flush();
        return driver;
    }

    //delete driver
    @Override
    public void deleteDriver(int id) {
        session().delete(getDriverById(id));
        session().flush();
    }

    //add new driver
    @Override
    public void addDriver(Driver driver) {
        session().save(driver);
        session().flush();
    }

    //update driver
    @Override
    public void updateDriver(Driver driver) {
        session().saveOrUpdate(driver);
        session().flush();
    }
}
