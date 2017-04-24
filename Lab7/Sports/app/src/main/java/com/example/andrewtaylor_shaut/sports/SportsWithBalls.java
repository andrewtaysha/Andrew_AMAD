package com.example.andrewtaylor_shaut.sports;

/**
 * Created by andrewtaylor-shaut on 4/18/17.
 */

public class SportsWithBalls {
    private String name;
    private int imageResourceID;

    //constructor
    private SportsWithBalls(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final SportsWithBalls [] sportswithballs = {
            new SportsWithBalls("Baseball", R.drawable.baseball),
            new SportsWithBalls("Basketball", R.drawable.basketball),
            new SportsWithBalls("Soccer", R.drawable.soccer),
    };

    public String getName(){
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }
}
