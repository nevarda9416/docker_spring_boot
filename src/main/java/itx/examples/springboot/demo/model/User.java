package itx.examples.springboot.demo.model;

public class User {
    private String username;
    private String email;

    // Constructor
    public User(String username, String email) {
        this.username = username;
        this.email = email;
    }

    //  Getters, Setters
    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }
}
