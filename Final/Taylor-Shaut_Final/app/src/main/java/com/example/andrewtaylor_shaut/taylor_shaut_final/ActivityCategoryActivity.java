package com.example.andrewtaylor_shaut.taylor_shaut_final;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ActivityCategoryActivity extends ListActivity {
//add implements View.OnClickListener above, but can't with extends ListActivity
//I added a new .xml for this java, but I need to rewrite the code to reflect that
//Since this java does not communicate with that .xml

    private String activitytype;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //create new intent
        Intent i = getIntent();
        activitytype = i.getStringExtra("activitytype");

        //get the list view
        ListView listActivities = getListView();

        //define an array adapter
        ArrayAdapter<MyActivity> listAdapter;

        //initialize the array adapter with the right list of activities
        switch (activitytype){
            case "Indoors":
                listAdapter = new ArrayAdapter<MyActivity>(this, android.R.layout.simple_list_item_1, MyActivity.indoors);
                break;
            case "Outdoors":
                listAdapter = new ArrayAdapter<MyActivity>(this, android.R.layout.simple_list_item_1, MyActivity.outdoors);
                break;
            default: listAdapter = new ArrayAdapter<MyActivity>(this, android.R.layout.simple_list_item_1, MyActivity.indoors);
        }

        //set the array adapter on the list view
        listActivities.setAdapter(listAdapter);

//        Button addButton = (Button) view.findViewById(addButton);
//        addButton.setOnClickListener(this);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(ActivityCategoryActivity.this, ActivityActivity.class);
        intent.putExtra("activityid", (int) id);
        intent.putExtra("activitytype", activitytype);
        startActivity(intent);
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

//    //create interface
//    interface ButtonClickListener{ void addheroclicked(View view);
//    }
//
//    //create listener
//    private ButtonClickListener listener;
//
//    @Override public void onAttach(Context context){
//        super.onAttach(context);
//        //attaches the context to the listener
//        listener = (ButtonClickListener)context;
//    }

//    public void addactivity(){
//        final Dialog dialog = new Dialog(getActivity()); dialog.setContentView(R.layout.dialog);
//        dialog.setTitle("Add Activity");
//        dialog.setCancelable(true);
//        final EditText editText = (EditText) dialog.findViewById(R.id.editTextActivity);
//        Button button = (Button) dialog.findViewById(R.id.addButton);
//        button.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                String activityName = editText.getText().toString();
//                // add activity
//                Activty.indoors[(int) activityId].getActivities().add(activityName);
//                //refresh the list view
//                ActivityCategoryActivity.this.adapter.notifyDataSetChanged();
//                dialog.dismiss();
//            } });
//            dialog.show(); }

//    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
//        super.onCreateContextMenu(menu, view, menuInfo);
////cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
//        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
////get activity name that was pressed
//        String activityname = adapter.getItem(adapterContextMenuInfo.position); //set the menu title
//        menu.setHeaderTitle("Delete " + activityname);
////add the choices to the menu
//        menu.add(1, 1, 1, "Yes");
//        menu.add(2, 2, 2, "No"); }

}
