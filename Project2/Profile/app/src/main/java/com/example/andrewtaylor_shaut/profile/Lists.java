package com.example.andrewtaylor_shaut.profile;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class Lists extends Activity {

    private String listname;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lists);

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {
                String listname = (String) listView.getItemAtPosition(position);
                //create new intent
                Intent intent = new Intent(Lists.this, ListsChild.class);

                //add listname to intent
                intent.putExtra("listname", listname);

                //start intent
                startActivity(intent);
            }
        };
        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView);

        //add listener to the list view
        listview.setOnItemClickListener(itemClickListener);
    }
}
