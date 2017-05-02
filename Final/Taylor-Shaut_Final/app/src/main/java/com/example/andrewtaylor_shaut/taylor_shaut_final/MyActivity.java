package com.example.andrewtaylor_shaut.taylor_shaut_final;

/**
 * Created by andrewtaylor-shaut on 5/2/17.
 */

public class MyActivity {
    private String name;
    private int imageResourceID;

    //constructor
    private MyActivity(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final MyActivity[] indoors = {
            new MyActivity("Swimming", R.drawable.indoors),
            new MyActivity("Squash", R.drawable.indoors),
            new MyActivity("Climbing", R.drawable.indoors)
    };
    public static final MyActivity[] outdoors = {
            new MyActivity("Hiking", R.drawable.outdoors),
            new MyActivity("Cycling", R.drawable.outdoors),
            new MyActivity("Running", R.drawable.outdoors)
    };

    public String getName(){
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a indoor activity is its name
    public String toString(){
        return this.name;
    }
}
