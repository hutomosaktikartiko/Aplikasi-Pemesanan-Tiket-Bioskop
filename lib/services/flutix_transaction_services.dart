part of 'services.dart';

class FlutixTransactionServices {
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transactions');

  // Save transaction
  static Future<void> saveTransaction(
      FlutixTransaction flutixTransaction) async {
    await transactionCollection.document().setData({
      'userID': flutixTransaction.userID,
      'title': flutixTransaction.title,
      'subtitle': flutixTransaction.subtitle,
      'time': flutixTransaction.time.millisecondsSinceEpoch,
      'amount': flutixTransaction.amount,
      'picture': flutixTransaction.picture
    });
  }

  static Future<List<FlutixTransaction>> getTransaction(String userID) async {
    // query document
    QuerySnapshot snapshot = await transactionCollection.getDocuments();
    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    return documents
        .map((e) => FlutixTransaction(
            userID: e.data['userID'],
            title: e.data['title'],
            subtitle: e.data['subtitle'],
            time: DateTime.fromMillisecondsSinceEpoch(e.data['time']),
            amount: e.data['amount'],
            picture: e.data['picture']))
        .toList();
  }
}
