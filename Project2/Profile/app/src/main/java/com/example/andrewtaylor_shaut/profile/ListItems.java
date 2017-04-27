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
            new ListItems("ice cream"),
            new ListItems("wine"),
            new ListItems("chocolate"),
            new ListItems("tissues"),
            new ListItems("The Notebook DVD")
    };

    public static final ListItems[] chores = {
            new ListItems("do homework"),
            new ListItems("yell at the moon"),
            new ListItems("get sleep"),
            new ListItems("graduate"),
    };

    public String getName(){
        return name;
    }

    //the string representation of a groceries is its name
    public String toString(){
        return this.name;
    }

}
