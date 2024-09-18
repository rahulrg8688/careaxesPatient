//package com.suja.hims.careaxes_patient;
//
//import android.app.Notification;
//import android.app.Service;
//import android.content.Intent;
//import android.os.IBinder;
//import androidx.core.app.NotificationCompat;
//
//public class CallService extends Service {
//
//    @Override
//    public void onCreate() {
//        super.onCreate();
//        // Start the service in the foreground
//        Notification notification = createNotification();
//        startForeground(1, notification);
//    }
//
//    @Override
//    public int onStartCommand(Intent intent, int flags, int startId) {
//        // Handle the call logic here
//
//        // Return START_STICKY to make the service restart if killed
//        return START_STICKY;
//    }
//
//    @Override
//    public IBinder onBind(Intent intent) {
//        return null;
//    }
//
//    private Notification createNotification() {
//        return new NotificationCompat.Builder(this, "high_importance_channel")
//                .setContentTitle("Call in progress")
//                .setContentText("You are in a call")
//                .setSmallIcon(R.mipmap.launcher_icon) // Use your app's icon here
//                .build();
//    }
//}
