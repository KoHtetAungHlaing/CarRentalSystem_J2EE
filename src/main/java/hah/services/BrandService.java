package hah.services;

import hah.daos.BrandDao;
import hah.models.Brand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandService {

    @Autowired
    private BrandDao brandDao; //create brand DAO to get data from impl

    //get all brand
    public List<Brand> getAllBrand(){
        return brandDao.getAllBrand();
    }

    //add new brand
    public void addBrand(Brand brand){
        brandDao.addBrand(brand);
    }

    //get brand by id
    public Brand getBrandById(int id){
        return brandDao.getBrandById(id);
    }

    //update brand
    public void updateBrand(Brand brand){
         //brandDao.updateBrand(brand);
        brandDao.editBrandName(brand);
    }

    //delete brand
    public void deleteBrand(int id){
        brandDao.deleteBrand(id);
    }
}
