package hah.impls;

import hah.daos.AuthDao;
import hah.models.Authority;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class AuthImpl implements AuthDao {

    @Autowired
    private SessionFactory sessionFactory; //create SessionFactory to get current session

    //to get current session
    public Session session(){
        return sessionFactory.getCurrentSession();
    }

    //add new authorities
    @Override
    public void addAuth(Authority auth) {
        session().save(auth);
        session().flush();
    }

    //update authorities
    @Override
    public void updateAuth(Authority auth) {
        session().saveOrUpdate(auth);
        session().flush();
    }

    //get authorities by email
    @Override
    public Authority getAuthByEmail(String email) {
        Query query = session().createQuery("from Authority where email=:email");
        query.setParameter("email",email);
        Authority authority = (Authority) query.uniqueResult();
        return authority;
    }
}
