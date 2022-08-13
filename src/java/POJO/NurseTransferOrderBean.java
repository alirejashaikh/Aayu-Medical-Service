package POJO;

public class NurseTransferOrderBean {
  private String action;
  private String reason;
  private String username;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "DoctorTransferOrderBean{" + "action=" + action + ", reason=" + reason + ", username=" + username + '}';
    }

}
