package POJO;

public class TransferApprovalBean {
    private String employee_id;
    private String new_hospital_id;
    private String action;
    private String review;

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public String getNew_hospital_id() {
        return new_hospital_id;
    }

    public void setNew_hospital_id(String new_hospital_id) {
        this.new_hospital_id = new_hospital_id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    @Override
    public String toString() {
        return "TransferApprovalBean{" + "employee_id=" + employee_id + ", new_hospital_id=" + new_hospital_id + ", action=" + action + ", review=" + review + '}';
    }

    
}
