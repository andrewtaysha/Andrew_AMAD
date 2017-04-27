package com.example.andrewtaylor_shaut.profile;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ListsChild extends ListActivity {

    private String listname;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_lists_child);

        //create new intent
        Intent i = getIntent();
        listname = i.getStringExtra("listname");

        //get the list view
        ListView listofListItems = getListView();

        //define an array adapter
        ArrayAdapter<ListItems> listAdapter;

        //initialize the array adapter with the right list of bulbs
        switch (listname){
            case "Groceries":
                listAdapter = new ArrayAdapter<ListItems>(this, android.R.layout.simple_list_item_1, ListItems.groceries);
                break;
            case "Chores":
                listAdapter = new ArrayAdapter<ListItems>(this, android.R.layout.simple_list_item_1, ListItems.chores);
                break;
            default: listAdapter = new ArrayAdapter<ListItems>(this, android.R.layout.simple_list_item_1, ListItems.chores);
        }

        //set the array adapter on the list view
        listofListItems.setAdapter(listAdapter);
    }

}
