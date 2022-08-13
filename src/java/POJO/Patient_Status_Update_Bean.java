package POJO;

public class Patient_Status_Update_Bean {
    private String ward_no;
    private String bed_no;
    private String patient_id;
    private String full_name;
    private String age;
    private String Blood_Pressure;
    private String Oxygen_Level;
    private String Pulse_Rate;
    private String Remarks;

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

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBlood_Pressure() {
        return Blood_Pressure;
    }

    public void setBlood_Pressure(String Blood_Pressure) {
        this.Blood_Pressure = Blood_Pressure;
    }

    public String getOxygen_Level() {
        return Oxygen_Level;
    }

    public void setOxygen_Level(String Oxygen_Level) {
        this.Oxygen_Level = Oxygen_Level;
    }

    public String getPulse_Rate() {
        return Pulse_Rate;
    }

    public void setPulse_Rate(String Pulse_Rate) {
        this.Pulse_Rate = Pulse_Rate;
    }

    public String getRemarks() {
        return Remarks;
    }

    public void setRemarks(String Remarks) {
        this.Remarks = Remarks;
    }

    @Override
    public String toString() {
        return "Patient_Status_Update_Bean{" + "ward_no=" + ward_no + ", bed_no=" + bed_no + ", patient_id=" + patient_id + ", full_name=" + full_name + ", age=" + age + ", Blood_Pressure=" + Blood_Pressure + ", Oxygen_Level=" + Oxygen_Level + ", Pulse_Rate=" + Pulse_Rate + ", Remarks=" + Remarks + '}';
    }
    
    
}
