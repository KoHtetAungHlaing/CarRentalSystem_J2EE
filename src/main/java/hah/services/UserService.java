package hah.services;

import hah.daos.AuthDao;
import hah.daos.UserDao;
import hah.models.Authority;
import hah.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.web.servlet.oauth2.client.OAuth2ClientSecurityMarker;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao; //create user DAO to get data from impl

    @Autowired
    private AuthDao authDao; //create authorities DAO to get data from impl

    //get all user
    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    //get user by id
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    //delete user
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    //add new user
    public void addUser(User user) {
        userDao.addUser(user);
    }

    //update user
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    //add new authorities
    public void addAuth(Authority authority){
        authDao.addAuth(authority);
    }

    //get user by email
    public User getUserByEmail(String email){
        return userDao.getUserByEmail(email);
    }

    //check Email exist or not
    public Boolean userEmailExistOrNot(String email){
        return userDao.userEmailExistOrNot(email);
    }

    //update authorities
    public void updateAuth(Authority auth) {
        authDao.updateAuth(auth);
    }

    //get authorities by email
    public Authority getAuthByEmail(String email){
        return authDao.getAuthByEmail(email);
    }
}
