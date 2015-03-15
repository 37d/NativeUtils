package org.flybuy.nativeutils;

import org.apache.cordova.*;

import org.json.JSONArray;
import org.json.JSONException;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.location.LocationManager;
import android.util.Log;
import android.widget.Toast;

public class NativeUtils extends CordovaPlugin{
	private static final String TAG = "NativeUtils";
	
	public static final String ACTION_GPS_STATE = "getGPSState";
	public static final String ACTION_NAV_TO_GPS_SETTINGS = "navToGPSSettings";
	public static final String ACTION_REQUIRE_GPS = "requireGPS";
	
	public static final String ENABLED = "enabled";
	public static final String DISABLED = "disabled";
	
	LocationManager locationManager;
	
	public boolean execute(String action, JSONArray data, CallbackContext callbackContext) {
		Log.e(TAG, "Executing Action: " + action + " With Data: " + data);
		
		/*Activity myActivity = this.cordova.getActivity();
		Boolean result = false;
		
		if(ACTION_REQUIRE_GPS.equalsIgnoreCase(action)) {
			locationManager = (LocationManager) myActivity.getSystemService(Context.LOCATION_SERVICE);
			
			if (locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)){
	            Toast.makeText(myActivity, "GPS is Enabled in your devide", Toast.LENGTH_SHORT).show();
	            result = true;
	        }else{
	        	Toast.makeText(myActivity, "GPS is Not Enabled on your device", Toast.LENGTH_SHORT).show();
	            //showGPSDisabledAlertToUser();
	        	result = true;
	        }
		}*/
		
		return result;
	}
	/*private void showGPSDisabledAlertToUser(){
		Activity myActivity = this.cordova.getActivity();
		
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(myActivity);
        alertDialogBuilder.setMessage("GPS is disabled in your device. Would you like to enable it?")
        .setCancelable(false)
        .setPositiveButton("Goto Settings Page To Enable GPS",
                new DialogInterface.OnClickListener(){
            public void onClick(DialogInterface dialog, int id){
                Intent callGPSSettingIntent = new Intent(
                        android.provider.Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                startActivity(callGPSSettingIntent);
            }
        });
        alertDialogBuilder.setNegativeButton("Cancel",
                new DialogInterface.OnClickListener(){
            public void onClick(DialogInterface dialog, int id){
                dialog.cancel();
            }
        });
        AlertDialog alert = alertDialogBuilder.create();
        alert.show();
    }*/
}
