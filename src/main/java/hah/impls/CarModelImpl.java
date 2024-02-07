package hah.impls;

import hah.daos.CarModelDao;
import hah.models.CarModel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class CarModelImpl implements CarModelDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //add new car model
    @Override
    public void addCarModel(CarModel carModel) {
        session().save(carModel);
        session().flush();
    }

    //get all car model by available
    @Override
    public List<CarModel> getAllCarModelByAvailabe() {
        Query query = session().createQuery("select cm from CarModel as cm inner join Brand b on cm.brand_id=b.brand_id and cm.available=true and b.enabled=true");
        List<CarModel> carModels = query.list();
        session().flush();
        return carModels;
    }

    //get all car model
    @Override
    public List<CarModel> getAllCarModel() {
        Query query = session().createQuery("select cm from CarModel as cm inner join Brand b on cm.brand_id=b.brand_id and b.enabled=true");
        List<CarModel> carModels = query.list();
        session().flush();
        return carModels;
    }

    //get car model by id
    @Override
    public CarModel getCarModelById(int id) {
        CarModel carModel = session().get(CarModel.class,id);
        session().flush();
        return carModel;
    }

    //update car model
    @Override
    public void updateCarModel(CarModel carModel) {
        session().saveOrUpdate(carModel);
        session().flush();
    }

    //delete car model
    @Override
    public void deleteCarModel(int id) {
        session().delete(getCarModelById(id));
        session().flush();
    }

    //get car model by brand_id
    @Override
    public List<CarModel> getCarModelByBrandId(int brand_id) {
        Query query = session().createQuery("from CarModel cm where cm.brand_id=:brand_id and cm.available=true");
        query.setParameter("brand_id",brand_id);
        List<CarModel> carModels = query.list();
        session().flush();
        return carModels;
    }

    @Override
    public List<CarModel> getCarModelBySearch(String search) {
        Query query = session().createQuery("from CarModel c where c.model like ?1");
        query.setParameter(1, "%"+search+"%");
        List<CarModel> carModels = query.list();
        session().flush();
        return carModels;
    }
}
