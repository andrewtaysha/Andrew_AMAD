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
            new Villain("DC", new ArrayList<String>(Arrays.asList("Bane", "Brainiac", "Harley Quinn", "Joker", "Poison Ivy", "Lex Luther"))),
            new Villain("Marvel", new ArrayList<String>(Arrays.asList("Ultron", "Loki", "Doctor Doom", "Venom", "Mandarin", "Thanos"))) };
    public String getUniverse(){ return universe;
    }
    public ArrayList<String> getSupervillains(){ return supervillains;
    }
    public String toString(){ return this.universe;
    }
}
