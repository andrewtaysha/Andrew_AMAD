package com.example.andrewtaylor_shaut.sports;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class SportActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sport);

        //get bulb data from the intent
        int sportnum = (Integer)getIntent().getExtras().get("sportid");
        String type = (String)getIntent().getExtras().get("sporttype");
        SportsWithBalls sportswithballs = SportsWithBalls.sportswithballs[sportnum];
        //SportsWithoutBalls sportswitouthballs = sportswithoutballs[sportnum];

        //populate image
        ImageView sportImage = (ImageView)findViewById(R.id.sportImageView);
        sportImage.setImageResource(sportswithballs.getImageResourceID());
        //sportImage.setImageResource(sportswithoutballs.getImageResourceID());

        //populate name
        TextView sportName = (TextView)findViewById(R.id.sport_name);
        sportName.setText(sportswithballs.getName());
        //sportName.setText(sportswithoutballs.getName());
    }
}
