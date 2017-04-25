package com.example.andrewtaylor_shaut.profile;

/**
 * Created by andrewtaylor-shaut on 4/25/17.
 */

public class ListItems {
    private String name;
    private int imageResourceID;

    //constructor
    private ListItems(String newname){
        this.name = newname;
    }

    public static final ListItems[] groceries = {
            new ListItems("Ice Cream"),
            new ListItems("Wine"),
            new ListItems("Chocolate"),
            new ListItems("Tissues"),
            new ListItems("The Notebook DVD")
    };

    public static final ListItems[] chores = {
            new ListItems("Do Homework"),
            new ListItems("Get Sleep"),
            new ListItems("Graduate"),
    };

    public String getName(){
        return name;
    }

    //the string representation of a groceries is its name
    public String toString(){
        return this.name;
    }

}
