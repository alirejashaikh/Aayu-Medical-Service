package POJO;

public class NurseTransferReqBean {
    private String hospital_id;
    private String hospital_name;
    private String urgent;
    private String problem;
    private String reason;
    private String username;

    public String getHospital_id() {
        return hospital_id;
    }

    public void setHospital_id(String hospital_id) {
        this.hospital_id = hospital_id;
    }

    public String getHospital_name() {
        return hospital_name;
    }

    public void setHospital_name(String hospital_name) {
        this.hospital_name = hospital_name;
    }

    public String getUrgent() {
        return urgent;
    }

    public void setUrgent(String urgent) {
        this.urgent = urgent;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
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
        return "NurseTransferReqBean{" + "hospital_id=" + hospital_id + ", hospital_name=" + hospital_name + ", urgent=" + urgent + ", problem=" + problem + ", reason=" + reason + ", username=" + username + '}';
    }
    
}
