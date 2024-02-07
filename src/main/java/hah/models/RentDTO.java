package hah.models;

//create custom DTO for rent page

public class RentDTO {

    private CarModel carModel;
    private User user;

    public CarModel getCarModel() {
        return carModel;
    }

    public void setCarModel(CarModel carModel) {
        this.carModel = carModel;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
