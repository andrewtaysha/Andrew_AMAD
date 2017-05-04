package com.example.andrewtaylor_shaut.sports;

import com.google.firebase.database.Exclude;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by andrewtaylor-shaut on 5/4/17.
 */

public class SportItem {
    private String name;
    private String url;
    public SportItem(){
// Default constructor required for calls to DataSnapshot.getValue(RecipeItem.class)
    }
    public SportItem(String newName, String newURL){
        name = newName;
        url = newURL;
    }
    public String getName(){ return name;
    }
    public String geturl(){ return url;
    }
    //used when writing to the database
    @Exclude
    public Map<String, Object> toMap(){
        HashMap<String, Object> result = new HashMap<>();
        result.put("name", name);
        result.put("url", url);
        return result;
    }
    //the string representation of a recipe name
    public String toString(){ return this.name;
    }
}
