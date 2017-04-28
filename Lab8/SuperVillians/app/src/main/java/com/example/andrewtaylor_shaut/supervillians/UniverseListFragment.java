package com.example.andrewtaylor_shaut.supervillians;


import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class UniverseListFragment extends Fragment {


    public UniverseListFragment() {
        // Required empty public constructor
    }

    @Override
    public void onStart(){ super.onStart();
        View view = getView(); if (view != null){
            //load data into fragment
            //get the list view
            ListView listUniverse = (ListView) view.findViewById(R.id.listView);
            //define an array adapter
            ArrayAdapter<Villain> listAdapter = new ArrayAdapter<Villain>(getActivity(), android.R.layout.simple_list_item_1, Villain.villains);
            //set the array adapter on the list view
            listUniverse.setAdapter(listAdapter); }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_universe_list, container, false);
    }

}
