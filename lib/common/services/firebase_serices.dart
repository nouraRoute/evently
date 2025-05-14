import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSerices {
  static Future<UserModel?> loginUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.uid != null) {
      var userModel = await getUserInfo(userCredential.user!.uid);
      return userModel;
    }
    return null;
  }

  static Future<UserModel> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel userModel =
        UserModel(email: email, name: name, uid: userCredential.user!.uid);

    await _addNewUser(userModel);
    return userModel;
  }

  static CollectionReference<UserModel> getUserCollection() {
    CollectionReference<UserModel> userCollection =
        FirebaseFirestore.instance.collection('Users').withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data() ?? {}),
              toFirestore: (value, _) => value.toJson(),
            );
    return userCollection;
  }

  static Future<void> _addNewUser(UserModel user) async {
    CollectionReference<UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> doc = userCollection.doc(user.uid);
    await doc.set(user);
  }

  static Future<UserModel?> getUserInfo(String uid) async {
    CollectionReference<UserModel> userCollection = getUserCollection();
    var doc = await userCollection.doc(uid).get();
    return doc.data();
  }

  static CollectionReference<EventDataModel> getEventsCollection() {
    CollectionReference<EventDataModel> eventsCollection = getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Events')
        .withConverter<EventDataModel>(
          fromFirestore: (snapshot, _) =>
              EventDataModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addNewEvent(EventDataModel eventDataModel) async {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    DocumentReference<EventDataModel> doc = eventsCollection.doc();
    eventDataModel.id = doc.id;
    await doc.set(eventDataModel);
  }

  static Future<List<EventDataModel>> getAllEvents(
      {CategoryValues? categoryValue}) async {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    QuerySnapshot<EventDataModel> querySnapshot = await eventsCollection
        .where(
          'categoryValues',
          isEqualTo: categoryValue?.toJson(),
        )
        .orderBy('dateTime')
        .get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  static Stream<List<EventDataModel>> getAllEventsStream(
      {CategoryValues? categoryValue}) {
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    Stream<QuerySnapshot<EventDataModel>> querySnapshot = eventsCollection
        .where(
          'categoryValues',
          isEqualTo: categoryValue?.toJson(),
        )
        .orderBy('dateTime')
        .snapshots();
    Stream<List<EventDataModel>> streamDate = querySnapshot.map(
      (event) => event.docs
          .map(
            (e) => e.data(),
          )
          .toList(),
    );
    return streamDate;
  }

  static Stream<List<EventDataModel>> getFavEvents() {
    print('XXXX##');
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    Stream<QuerySnapshot<EventDataModel>> querySnapshot = eventsCollection
        .where(
          'isFav',
          isEqualTo: true,
        )
        .snapshots();
    Stream<List<EventDataModel>> streamDate = querySnapshot.map(
      (event) => event.docs
          .map(
            (e) => e.data(),
          )
          .toList(),
    );
    return streamDate;
  }

  static Future changeEventFav(
      EventDataModel eventDataModel, bool favValue) async {
    print('###${eventDataModel.toJson()}');
    CollectionReference<EventDataModel> eventsCollection =
        getEventsCollection();
    await eventsCollection.doc(eventDataModel.id).update({'isFav': favValue});
    return;
  }
}
