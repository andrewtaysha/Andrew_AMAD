package com.example.andrewtaylor_shaut.supervillians;


import android.app.Dialog;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;

/**
 * A simple {@link Fragment} subclass.
 */
public class VillainDetailFragment extends Fragment implements View.OnClickListener{

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
        ArrayList<String> villainlist = new ArrayList<String>();
        villainlist = Villain.villains[(int) universeId].getSupervillains();
        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, villainlist);
        //bind array adapter to the list view
        listHeroes.setAdapter(adapter);
        Button addButton = (Button) view.findViewById(R.id.addButton);
        addButton.setOnClickListener(this);
    }

    public void addvillain(){
        final Dialog dialog = new Dialog(getActivity()); dialog.setContentView(R.layout.dialog);
        dialog.setTitle("Add Villain");
        dialog.setCancelable(true);
        final EditText editText = (EditText) dialog.findViewById(R.id.editTextVillain);
        Button button = (Button) dialog.findViewById(R.id.addButton);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String villainName = editText.getText().toString();
                // add villain
                Villain.villains[(int) universeId].getSupervillains().add(villainName);
                //refresh the list view
                VillainDetailFragment.this.adapter.notifyDataSetChanged();
                dialog.dismiss();
            } });
        dialog.show(); }

    public VillainDetailFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_villain_detail, container, false);
//        if (savedInstanceState !=null){
//            universeId = savedInstanceState.getLong("universeId");
//        }
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("universeId", universeId);
    }

    //create interface
    interface ButtonClickListener{
        void addheroclicked(View view);
    }

    //create listener
    private ButtonClickListener listener;
    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (ButtonClickListener)context;
    }

    @Override public void onClick(View view){
        if (listener !=null){
        listener.addheroclicked(view); }
    }

    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get villain name that was pressed
        String villainname = adapter.getItem(adapterContextMenuInfo.position); //set the menu title
        menu.setHeaderTitle("Delete " + villainname);
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) {
            //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //remove the villain
            Villain.villains[(int) universeId].getSupervillains().remove(info.position);
            //refresh the list view
            VillainDetailFragment.this.adapter.notifyDataSetChanged();
        }
        return true; }
}
