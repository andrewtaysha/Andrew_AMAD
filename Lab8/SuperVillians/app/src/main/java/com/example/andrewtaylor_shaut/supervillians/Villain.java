package com.example.andrewtaylor_shaut.supervillians;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by andrewtaylor-shaut on 4/27/17.
 */

public class Villain {
    private String universe;
    private ArrayList<String> supervillains = new ArrayList<>();
    //constructor
    private Villain(String univ, ArrayList<String> villains){ this.universe = univ;
        this.supervillains = new ArrayList<String>(villains);
    }
    public static final Villain [] villains = {
            new Villain("DC", new ArrayList<String>(Arrays.asList("Superman", "Batman", "Wonder Woman", "The Flash", "Green Arrow", "Catwoman"))),
            new Villain("Marvel", new ArrayList<String>(Arrays.asList("Iron Man", "Black Widow", "Captain America", "Jean Grey", "Thor", "Hulk"))) };
    public String getUniverse(){ return universe;
    }
    public ArrayList<String> getSupervillains(){ return supervillains;
    }
    public String toString(){ return this.universe;
    }
}
