package POJO;

public class AddDoctorBean {
    private String role;
    private String doctor_name;
    private String specialization;
    private String qualification;
    private String email_id;
    private String mob_number;
    private String hospital_id;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getMob_number() {
        return mob_number;
    }

    public void setMob_number(String mob_number) {
        this.mob_number = mob_number;
    }

    public String getHospital_id() {
        return hospital_id;
    }

    public void setHospital_id(String hospital_id) {
        this.hospital_id = hospital_id;
    }

    @Override
    public String toString() {
        return "AddDoctorBean{" + "role=" + role + ", doctor_name=" + doctor_name + ", specialization=" + specialization + ", qualification=" + qualification + ", email_id=" + email_id + ", mob_number=" + mob_number + ", hospital_id=" + hospital_id + '}';
    }

    
    
    
}
