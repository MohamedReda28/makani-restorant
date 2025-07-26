abstract class DataBaseServeces {
  //خلي بالك هنا انت بتعمل خدمه لاي حاجه بيتعملها ارسال ل قاعده البيانات
  //المتغير الا اسمو path دلدا بياخد اما لنك api او اسم collection من firebase
  //بينما data دي الحاجه الا هتبعتها
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  //دي method بتجيب بانات المستخدم
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  Stream<dynamic> getDataStream({required String path,  Map<String, dynamic>? query, String? documentId});


  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      bool merge = false,
      String? documentId});

  Future<bool> chackIfDataExist(
      {required String path, required String documentId});
}
