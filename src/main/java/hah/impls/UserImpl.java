package hah.impls;

import com.sun.org.apache.xpath.internal.operations.Bool;
import hah.daos.UserDao;
import hah.models.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class UserImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //get all users
    @Override
    public List<User> getAllUser() {
        Query query = session().createQuery("from User");
        List<User> users = query.list();
        session().flush();
        return users;
    }

    //get user by id
    @Override
    public User getUserById(int id) {
        User user = session().get(User.class,id);
        session().flush();
        return user;
    }

    //delete user
    @Override
    public void deleteUser(int id) {
        session().delete(getUserById(id));
        session().flush();
    }

    //add new user
    @Override
    public void addUser(User user) {
        session().save(user);
        session().flush();
    }

    //update user
    @Override
    public void updateUser(User user) {
        session().saveOrUpdate(user);
        session().flush();
    }

    //get user by email
    @Override
    public User getUserByEmail(String email) {
        Query query = session().createQuery("from User where email=:email");
        query.setParameter("email",email);
        User user = (User) query.uniqueResult();
        return user;
    }

    //check Email exist or not
    @Override
    public Boolean userEmailExistOrNot(String email) {
        Query query = session().createQuery("SELECT COUNT(email) FROM User where email =:email");
        query.setParameter("email",email);
        return ((Number) query.uniqueResult()).longValue() > 0;
    }
}
