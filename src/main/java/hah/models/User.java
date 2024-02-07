package hah.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//create model for user

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int user_id;
    @NotNull
    @Size(min = 7,max = 20,message = "Username must be fill!")
    private String username;
    @NotNull
    @Size(min = 10,max = 20,message = "Nrc must be fill!")
    private String nrc;
    @NotNull
    @Size(min = 12,max = 50,message = "Email must be fill!")
    private String email;
    @NotNull
    @Size(min = 8,max = 20,message = "Password must be fill!")
    private String password;
    private boolean enabled = true;
    @NotNull
    @Size(min = 3,max = 50,message = "Address must be fill!")
    private String address;
    @NotNull
    @Size(min = 9,max = 9,message = "Phone number must be 9 digits!!")
    private String phone;
    private boolean renting;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private Rent rent;

    public Rent getRent() {
        return rent;
    }

    public void setRent(Rent rent) {
        this.rent = rent;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNrc() {
        return nrc;
    }

    public void setNrc(String nrc) {
        this.nrc = nrc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isRenting() {
        return renting;
    }

    public void setRenting(boolean renting) {
        this.renting = renting;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", nrc='" + nrc + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                ", address='" + address + '\'' +
                ", phone=" + phone +
                ", renting=" + renting +
                '}';
    }
}
