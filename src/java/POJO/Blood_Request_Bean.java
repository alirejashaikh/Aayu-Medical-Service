package POJO;

public class Blood_Request_Bean {
   private String patient_id;
   private String blood_group;
   private String unit;

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getBlood_group() {
        return blood_group;
    }

    public void setBlood_group(String blood_group) {
        this.blood_group = blood_group;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Override
    public String toString() {
        return "Blood_Request_Bean{" + "patient_id=" + patient_id + ", blood_group=" + blood_group + ", unit=" + unit + '}';
    }
   
   
}
