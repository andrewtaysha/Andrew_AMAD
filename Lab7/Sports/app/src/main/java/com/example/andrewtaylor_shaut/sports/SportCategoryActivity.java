package com.example.andrewtaylor_shaut.sports;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class SportCategoryActivity extends ListActivity {
    private String sporttype;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //create new intent
        Intent i = getIntent();
        sporttype = i.getStringExtra("sporttype");

        //get the list view
        ListView listSportsWithBalls = getListView();
        ListView listSportsWithoutBalls = getListView();

        //define an array adapter
        ArrayAdapter<SportsWithBalls> listAdapter;
        //ArrayAdapter<SportsWithoutBalls> listAdapter2;

        //initialize the array adapter with the right list of bulbs
        switch(sporttype){
            case "Sports With Balls":
                listAdapter = new ArrayAdapter<SportsWithBalls>(this, android.R.layout.simple_list_item_1, SportsWithBalls.sportswithballs);
                break;
            /*case "Sports Without Balls":
                listAdapter2 = new ArrayAdapter<SportsWithoutBalls>(this, android.R.layout.simple_list_item_1, SportsWithoutBalls.sportswithoutballs);
                break;*/
            default: listAdapter = new ArrayAdapter<SportsWithBalls>(this, android.R.layout.simple_list_item_1, SportsWithBalls.sportswithballs);
        }
        //set the array adapter on the list view
        listSportsWithBalls.setAdapter(listAdapter);
        //listSportsWithoutBalls.setAdapter(listAdapter2);

    }
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(SportCategoryActivity.this, SportActivity.class);
        intent.putExtra("sportid", (int) id);
        intent.putExtra("sportype", sporttype);
        startActivity(intent);
    }
}
