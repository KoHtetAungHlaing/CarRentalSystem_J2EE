package hah.impls;

import hah.daos.ReceivedCarDao;
import hah.models.ReceivedCar;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class ReceivedCarImpl implements ReceivedCarDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //add new received car
    @Override
    public void addReceivedCar(ReceivedCar receivedCar) {
        session().save(receivedCar);
        session().flush();
    }

    //get all received car
    @Override
    public List<ReceivedCar> getAllReceivedCar() {
        Query query = session().createQuery("from ReceivedCar");
        List<ReceivedCar> receivedCars = query.list();
        session().flush();
        return receivedCars;
    }
}
