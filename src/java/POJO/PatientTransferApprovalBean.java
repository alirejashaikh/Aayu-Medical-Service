package POJO;

public class PatientTransferApprovalBean {
    private String patient_id;
    private String new_hospital_id;
    private String action;
    private String review;

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
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
        return "PatientTransferApprovalBean{" + "patient_id=" + patient_id + ", new_hospital_id=" + new_hospital_id + ", action=" + action + ", review=" + review + '}';
    }
    
    
}
