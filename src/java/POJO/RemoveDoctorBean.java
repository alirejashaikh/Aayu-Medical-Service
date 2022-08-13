package POJO;

public class RemoveDoctorBean {
    private String doctor_employee_id;

    public String getDoctor_employee_id() {
        return doctor_employee_id;
    }

    public void setDoctor_employee_id(String doctor_employee_id) {
        this.doctor_employee_id = doctor_employee_id;
    }

    @Override
    public String toString() {
        return "RemoveDoctorBean{" + "doctor_employee_id=" + doctor_employee_id + '}';
    }
    
}
