package POJO;

public class RemoveNurseBean {
   private String nurse_employee_id;

    public String getNurse_employee_id() {
        return nurse_employee_id;
    }

    public void setNurse_employee_id(String nurse_employee_id) {
        this.nurse_employee_id = nurse_employee_id;
    }

    @Override
    public String toString() {
        return "RemoveNurseBean{" + "nurse_employee_id=" + nurse_employee_id + '}';
    }
   
}
