package POJO;

public class AddAnnouncementBean {
  private String announcement;  

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement;
    }

    @Override
    public String toString() {
        return "AddAnnouncementBean{" + "announcement=" + announcement + '}';
    }
  
}
