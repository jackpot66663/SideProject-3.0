package pojo.bean;

import java.util.Date;

public class MovieResultBean {
    private String movie;
    private String starring;
    private String time;

    public String getTime() {
        return time;
    }

    public String getMovie() {
        return movie;
    }

    public String getStarring() {
        return starring;
    }

    public void setMovie(String movie) {
        this.movie = movie;
    }

    public void setStarring(String starring) {
        this.starring = starring;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
