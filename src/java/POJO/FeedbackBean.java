package POJO;

public class FeedbackBean {
    private String name;
    private String email;
    private String mob_no;
    private String rate;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMob_no() {
        return mob_no;
    }

    public void setMob_no(String mob_no) {
        this.mob_no = mob_no;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    @Override
    public String toString() {
        return "FeedbackBean{" + "name=" + name + ", email=" + email + ", mob_no=" + mob_no + ", rate=" + rate + '}';
    }
    
    
}