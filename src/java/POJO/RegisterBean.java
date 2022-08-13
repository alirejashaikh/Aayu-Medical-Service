package POJO;

import java.io.Serializable;


public class RegisterBean implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private String fname;
    private String mname;
    private String lname;
    private String gender;
    private String blood_Group;
    private String mob_Number;
    private String alternative_mob_Number;
    private String email;
    private String pwd;
    private String dob;

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBlood_Group() {
        return blood_Group;
    }

    public void setBlood_Group(String blood_Group) {
        this.blood_Group = blood_Group;
    }

    public String getMob_Number() {
        return mob_Number;
    }

    public void setMob_Number(String mob_Number) {
        this.mob_Number = mob_Number;
    }

    public String getAlternative_mob_Number() {
        return alternative_mob_Number;
    }

    public void setAlternative_mob_Number(String alternative_mob_Number) {
        this.alternative_mob_Number = alternative_mob_Number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "RegisterBean{" + "fname=" + fname + ", mname=" + mname + ", lname=" + lname + ", gender=" + gender + ", blood_Group=" + blood_Group + ", mob_Number=" + mob_Number + ", alternative_mob_Number=" + alternative_mob_Number + ", email=" + email + ", pwd=" + pwd + ", dob=" + dob + '}';
    }

   
   
    
    
}