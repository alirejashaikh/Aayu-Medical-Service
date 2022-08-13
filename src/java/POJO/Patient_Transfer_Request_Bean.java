package POJO;

public class Patient_Transfer_Request_Bean {
   private String ward_no;
   private String bed_no;
   private String patient_id;
   private String status;
   private String reason;

    public String getWard_no() {
        return ward_no;
    }

    public void setWard_no(String ward_no) {
        this.ward_no = ward_no;
    }

    public String getBed_no() {
        return bed_no;
    }

    public void setBed_no(String bed_no) {
        this.bed_no = bed_no;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "Patient_Transfer_Request_Bean{" + "ward_no=" + ward_no + ", bed_no=" + bed_no + ", patient_id=" + patient_id + ", status=" + status + ", reason=" + reason + '}';
    }
   
}
