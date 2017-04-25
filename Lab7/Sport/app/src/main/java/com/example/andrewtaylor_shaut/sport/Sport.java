package com.example.andrewtaylor_shaut.sport;

/**
 * Created by andrewtaylor-shaut on 4/25/17.
 */

public class Sport {
    private String name;
    private int imageResourceID;
    //constructor
    private Sport(String newname, int newID){ this.name = newname; this.imageResourceID = newID;
    }
    public static final Sport[] sportswithballs = {
            new Sport("Baseball", R.drawable.baseball),
            new Sport("Basketball", R.drawable.basketball),
            new Sport("Art Royal", R.drawable.soccer)
    };
    public static final Sport[] sportswithoutballs = {
            new Sport("Biking", R.drawable.biking),
            new Sport("Running", R.drawable.running),
            new Sport("Swimming", R.drawable.swimming)
    };
    public String getName(){ return name;
    }
    public int getImageResourceID(){ return imageResourceID;
    }
    //the string representation of a tulip is its name
    public String toString(){ return this.name;
    }
}
