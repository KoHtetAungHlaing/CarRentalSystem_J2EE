package hah.impls;

import hah.daos.BrandDao;
import hah.models.Brand;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class BrandImpl implements BrandDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //get all brands
    public List<Brand> getAllBrand() {
        Query query = session().createQuery("from Brand b where b.enabled=true");
        List<Brand> brands = query.list();
        session().flush();
        return brands;
    }

    //add new brand
    public void addBrand(Brand brand) {
        session().save(brand);
        session().flush();
    }

    //get brand by id
    public Brand getBrandById(int id) {
        Brand brand = session().get(Brand.class,id);
        session().flush();
        return brand;
    }

    //update brand
    public void updateBrand(Brand brand) {
        System.out.println("BRAND D " + brand.toString());
        session().saveOrUpdate(brand);
        session().flush();
    }

    //delete brand
    public void deleteBrand(int id) {
        session().delete(getBrandById(id));
        session().flush();
    }

    @Override
    public void editBrandName(Brand brand) {
        Query query = session().createQuery("UPDATE Brand set brand_name = :brand_name,enabled = :flag WHERE brand_id = :brand_id");
        query.setParameter("brand_name",brand.getBrand_name());
        query.setParameter("brand_id",brand.getBrand_id());
        query.setParameter("flag",brand.isEnabled());
        query.executeUpdate();
        session().flush();
    }
}
