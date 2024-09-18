//package com.suja.hims;
//
//import android.app.NotificationChannel;
//import android.app.NotificationManager;
//import android.app.PendingIntent;
//import android.content.Intent;
//import android.os.Build;
//import androidx.annotation.NonNull;
//import androidx.core.app.NotificationCompat;
//import androidx.core.app.NotificationManagerCompat;
//import android.util.Log;
//import android.app.Service;
//
//import com.google.firebase.messaging.FirebaseMessagingService;
//import com.google.firebase.messaging.RemoteMessage;
//
//public class MyFirebaseMessagingService extends FirebaseMessagingService {
//
//    private static final String TAG = "MyFirebaseMessagingService";
//    private static final String CHANNEL_ID = "high_importance_channel";
//
//    @Override
//    public void onMessageReceived(@NonNull RemoteMessage remoteMessage) {
//        super.onMessageReceived(remoteMessage);
//
//        // Log received message
//        logRemoteMessage(remoteMessage);
//
//        // Check if the message is a call notification
//        if (remoteMessage.getData().get("type").equals("call")) {
//            // Start the foreground service to handle the call
//            startCallForegroundService();
//        } else {
//            // Create notification channel if it doesn't exist (For Android O and above)
//            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//                createNotificationChannel();
//            }
//
//            // Create and display the notification
//            sendNotification(remoteMessage);
//        }
//    }
//
//    private void startCallForegroundService() {
//        Intent serviceIntent = new Intent(this, CallService.class);
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//            startForegroundService(serviceIntent);
//        } else {
//            startService(serviceIntent);
//        }
//    }
//
//    private void createNotificationChannel() {
//        CharSequence name = "High Importance Channel";
//        String description = "Channel for high importance notifications";
//        int importance = NotificationManager.IMPORTANCE_HIGH;
//        NotificationChannel channel = new NotificationChannel(CHANNEL_ID, name, importance);
//        channel.setDescription(description);
//
//        // Register the channel with the system
//        NotificationManager notificationManager = getSystemService(NotificationManager.class);
//        notificationManager.createNotificationChannel(channel);
//    }
//
//    private void sendNotification(RemoteMessage remoteMessage) {
//        // Create an explicit intent for an Activity in your app
//        Intent intent = new Intent(this, MainActivity.class);
//        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
//        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_ONE_SHOT | PendingIntent.FLAG_IMMUTABLE);
//
//        // Build the notification
//        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, CHANNEL_ID)
//                .setSmallIcon(R.mipmap.launcher_icon) // Change to your app icon
//                .setContentTitle(remoteMessage.getData().get("message"))
//                .setContentText("")
//                .setPriority(NotificationCompat.PRIORITY_HIGH)
//                .setContentIntent(pendingIntent)
//                .setAutoCancel(true);
//
//        // Show the notification
//        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(this);
//        notificationManager.notify(0, notificationBuilder.build());
//    }
//
//    private void logRemoteMessage(RemoteMessage remoteMessage) {
//        if (remoteMessage.getData() != null) {
//            Log.d(TAG, "Data payload: in java class" + remoteMessage.getData());
//        }
//
//        if (remoteMessage.getNotification() != null) {
//            Log.d(TAG, "Notification title: " + remoteMessage.getNotification().getTitle());
//            Log.d(TAG, "Notification body: " + remoteMessage.getNotification().getBody());
//        } else {
//            Log.d(TAG, "No notification payload");
//        }
//    }
//}
