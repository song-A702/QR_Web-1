package firebase;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

public class Connector {
	 
	public static void main(String[] args) throws Exception {

		InputStream serviceAccount = new FileInputStream("C:\\Users\\Administrator\\Downloads\\qrscanner-8f4ec-firebase-adminsdk-e79yi-166cd7786f.json");
		GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
		FirebaseOptions options = new FirebaseOptions.Builder()
		    .setCredentials(credentials)
		    .build();
		FirebaseApp.initializeApp(options);

		Firestore db = FirestoreClient.getFirestore();
		DocumentReference docRef = db.collection("qr").document("alovelace");
		// Add document data  with id "alovelace" using a hashmap
		Map<String, Object> data = new HashMap<>();
		data.put("userName", "Ada");
		data.put("userNumber", "Lovelace");
		data.put("userPassword", "제발되라");
		//asynchronously write data
		ApiFuture<WriteResult> result = docRef.set(data);
		System.out.println("ss");
		/*
		 * ApiFuture<QuerySnapshot> future = db.collection("qr").get(); // future.get()
		 * blocks on response List<QueryDocumentSnapshot> documents =
		 * future.get().getDocuments(); for (DocumentSnapshot document : documents) {
		 * System.out.println(document.getId() + " => " +
		 * document.toObject(User.class)); }
		 */
	}
}

class User {
	private String userName;
	private String userNumber;
	private String userPassword;
	
	public User() {
		super();
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
}
