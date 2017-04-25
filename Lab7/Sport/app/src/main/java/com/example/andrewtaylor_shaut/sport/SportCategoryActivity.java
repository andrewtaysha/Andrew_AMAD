package com.example.andrewtaylor_shaut.sport;

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

        Intent i = getIntent();
        sporttype = i.getStringExtra("sporttype");
//get the list view
        ListView listSports = getListView();
//define an array adapter
        ArrayAdapter<Sport> listAdapter;
//initialize the array adapter with the right list of sports
        switch (sporttype){ case "Sports With Balls":
            listAdapter = new ArrayAdapter<Sport>(this, android.R.layout.simple_list_item_1, Sport.sportswithballs);
            break;
            default: listAdapter = new ArrayAdapter<Sport>(this, android.R.layout.simple_list_item_1,
                    Sport.sportswithballs); }
        switch (sporttype){ case "Sports Without Balls":
            listAdapter = new ArrayAdapter<Sport>(this, android.R.layout.simple_list_item_1, Sport.sportswithoutballs);
            break;
            default: listAdapter = new ArrayAdapter<Sport>(this, android.R.layout.simple_list_item_1,
                    Sport.sportswithoutballs); }
//set the array adapter on the list view
        listSports.setAdapter(listAdapter); }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(SportCategoryActivity.this, SportActivity.class);
        intent.putExtra("sportid", (int) id);
        intent.putExtra("sporttype", sporttype);
        startActivity(intent); }
    }
