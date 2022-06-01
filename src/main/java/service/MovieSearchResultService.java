package service;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import pojo.bean.MovieResultBean;

import java.util.ArrayList;
import java.util.List;

public class MovieSearchResultService {
    public List<MovieResultBean> getMovieResultList(String json){
        List<MovieResultBean> resultBeanList = new ArrayList<MovieResultBean>();
        try {
            JSONArray result = new JSONArray(json);
            for (int i = 0; i < result.length(); i++) {
                MovieResultBean movie = new MovieResultBean();
                JSONObject object = result.getJSONObject(i);
                movie.setMovie(object.getString("movie"));
                movie.setStarring(object.getString("starring"));
                movie.setTime(object.getString("year")+"/"+object.getString("month"));
                resultBeanList.add(movie);
            }
        } catch (JSONException e) {
            System.out.println(e);
        }
        return resultBeanList;
    }
}
