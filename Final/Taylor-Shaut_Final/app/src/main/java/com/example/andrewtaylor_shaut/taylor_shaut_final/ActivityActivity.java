package com.example.andrewtaylor_shaut.taylor_shaut_final;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

public class ActivityActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activity);

        //get activity data from the intent
        int activitynum = (Integer)getIntent().getExtras().get("activityid");
        String type = (String)getIntent().getExtras().get("activitytype");
        MyActivity activity = MyActivity.indoors[activitynum];

        //populate image
        ImageView activityImage = (ImageView)findViewById(R.id.activityImageView);
        activityImage.setImageResource(activity.getImageResourceID());

        //populate name
        TextView activityName = (TextView)findViewById(R.id.activity_name);
        activityName.setText(activity.getName());
    }

    public boolean onCreateOptionsMenu(Menu menu){
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()){
            case R.id.sign_up:
                //start order activity
                Intent intent = new Intent(this, OrderActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
