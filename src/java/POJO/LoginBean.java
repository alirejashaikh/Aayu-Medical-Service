package POJO;

import java.io.Serializable;
import java.util.Objects;
public class LoginBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "LoginBean{" + "username=" + username + ", password=" + password + '}';
    }

}