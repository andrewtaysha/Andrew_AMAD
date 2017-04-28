package com.example.andrewtaylor_shaut.supervillians;


import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 */
public class VillainDetailFragment extends Fragment {

    private long universeId; //id of the universe chosen

    //set the universe id
    public void setUniverse(long id){ this.universeId = id;
    }

    //create array adapter
    private ArrayAdapter<String> adapter;
    @Override public void onStart(){ super.onStart();
        View view = getView();
        ListView listHeroes = (ListView) view.findViewById(R.id.villainlistView);
        // get hero data
        ArrayList<String> villainlist = new ArrayList<String>(); villainlist = Villain.villains[0].getSupervillains();
        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, villainlist);
        //bind array adapter to the list view
        listHeroes.setAdapter(adapter); }

    public VillainDetailFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_villain_detail, container, false);
    }

}
