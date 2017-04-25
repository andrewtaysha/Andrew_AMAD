package com.example.andrewtaylor_shaut.profile;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

public class MainActivity extends Activity {

    ImageButton listImageButton;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listImageButton = (ImageButton) findViewById(R.id.listButton);

        listImageButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v){
            Intent intent = new Intent(MainActivity.this, Lists.class);
            startActivity(intent);
        }
    });
    }
}
