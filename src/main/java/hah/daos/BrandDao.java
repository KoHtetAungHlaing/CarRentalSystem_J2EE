package hah.daos;

import hah.models.Brand;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface BrandDao {

    List<Brand> getAllBrand(); //get all brand
    void addBrand(Brand brand); //add new brand
    Brand getBrandById(int id); //get brand by brand_id
    void updateBrand(Brand brand); //update brand
    void deleteBrand(int id); //delete brand
    void editBrandName(Brand brand);
}
