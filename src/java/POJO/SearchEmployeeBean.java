package POJO;

public class SearchEmployeeBean {
    private String employee_id;

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    @Override
    public String toString() {
        return "SearchEmployeeBean{" + "employee_id=" + employee_id + '}';
    }
}
