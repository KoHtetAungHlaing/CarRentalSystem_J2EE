package hah.impls;

import hah.daos.RentDao;
import hah.models.Rent;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class RentImpl implements RentDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //add new rent
    @Override
    public void addRent(Rent rent) {
        session().save(rent);
        session().flush();
    }

    //get all rent car by received car
    @Override
    public List<Rent> getAllRentByReceivedCar() {
        Query query = session().createQuery("from Rent rent where rent.received_car = false");
        List<Rent> rents = query.list();
        session().flush();
        return rents;
    }

    //get rent by id
    @Override
    public Rent getRentById(int id) {
        Rent rent = session().get(Rent.class,id);
        session().flush();
        return rent;
    }

    //update rent
    @Override
    public void updateRent(Rent rent) {
        session().saveOrUpdate(rent);
        session().flush();
    }

    //get rent by driver_id
    @Override
    public List<Rent> getRentByDriverId(int driver_id) {
        Query query = session().createQuery("from Rent rent where rent.driver_id=:driver_id");
        query.setParameter("driver_id",driver_id);
        List<Rent> rents = query.list();
        session().flush();
        return rents;
    }
}
