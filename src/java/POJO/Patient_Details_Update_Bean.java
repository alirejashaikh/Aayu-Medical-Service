package POJO;

public class Patient_Details_Update_Bean {
   
   private String patient_id;
   private String admit_date;
   private String discharge_date;
   private String ward_no;
   private String bed_no;
   private String doctor_id1;
   private String doctor_name1;
   private String doctor_id2;
   private String doctor_name2;

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getAdmit_date() {
        return admit_date;
    }

    public void setAdmit_date(String admit_date) {
        this.admit_date = admit_date;
    }

    public String getDischarge_date() {
        return discharge_date;
    }

    public void setDischarge_date(String discharge_date) {
        this.discharge_date = discharge_date;
    }

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

    public String getDoctor_id1() {
        return doctor_id1;
    }

    public void setDoctor_id1(String doctor_id1) {
        this.doctor_id1 = doctor_id1;
    }

    public String getDoctor_name1() {
        return doctor_name1;
    }

    public void setDoctor_name1(String doctor_name1) {
        this.doctor_name1 = doctor_name1;
    }

    public String getDoctor_id2() {
        return doctor_id2;
    }

    public void setDoctor_id2(String doctor_id2) {
        this.doctor_id2 = doctor_id2;
    }

    public String getDoctor_name2() {
        return doctor_name2;
    }

    public void setDoctor_name2(String doctor_name2) {
        this.doctor_name2 = doctor_name2;
    }

    @Override
    public String toString() {
        return "Patient_Details_Update_Bean{" + "patient_id=" + patient_id + ", admit_date=" + admit_date + ", discharge_date=" + discharge_date + ", ward_no=" + ward_no + ", bed_no=" + bed_no + ", doctor_id1=" + doctor_id1 + ", doctor_name1=" + doctor_name1 + ", doctor_id2=" + doctor_id2 + ", doctor_name2=" + doctor_name2 + '}';
    }

    

    
   
}
