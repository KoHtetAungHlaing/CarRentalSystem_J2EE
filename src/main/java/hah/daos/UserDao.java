package hah.daos;

import hah.models.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UserDao {

    List<User> getAllUser(); //get all user
    User getUserById(int id); //get user by user_id
    void deleteUser(int id); //delete user
    void addUser(User user); //add new user
    void updateUser(User user); //update user
    User getUserByEmail(String email); //get user by email
    Boolean userEmailExistOrNot(String email); //check email exist or not
}
