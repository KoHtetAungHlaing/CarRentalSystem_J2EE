package hah.daos;

import hah.models.Authority;
import org.springframework.stereotype.Component;

@Component
public interface AuthDao {

    void addAuth(Authority auth); //add authorities
    void updateAuth(Authority auth);  //update authorities
    Authority getAuthByEmail(String email); //get authorities by email
}
