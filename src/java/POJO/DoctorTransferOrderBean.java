package POJO;

public class DoctorTransferOrderBean {
  private String action;
  private String last_denied_reason;
  private String reason;
  private String username;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getLast_denied_reason() {
        return last_denied_reason;
    }

    public void setLast_denied_reason(String last_denied_reason) {
        this.last_denied_reason = last_denied_reason;
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
        return "DoctorTransferOrderBean{" + "action=" + action + ", last_denied_reason=" + last_denied_reason + ", reason=" + reason + ", username=" + username + '}';
    }

}
