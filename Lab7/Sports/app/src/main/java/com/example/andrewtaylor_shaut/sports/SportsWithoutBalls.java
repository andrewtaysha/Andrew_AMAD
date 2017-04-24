package com.example.andrewtaylor_shaut.sports;

/**
 * Created by andrewtaylor-shaut on 4/18/17.
 */

public class SportsWithoutBalls {
    private String name;
    private int imageResourceID;

    //constructor
    private SportsWithoutBalls(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final SportsWithoutBalls [] sportswithoutballs = {
            new SportsWithoutBalls("Biking", R.drawable.biking),
            new SportsWithoutBalls("Running", R.drawable.running),
            new SportsWithoutBalls("Swimming", R.drawable.swimming),
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
