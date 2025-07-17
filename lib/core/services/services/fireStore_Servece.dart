import 'package:cloud_firestore/cloud_firestore.dart';
import 'DataBase_Serveces.dart';

//دا كلاس خاص بالفير بيز وبيرث من DatabaseServeces
class FirestoerServeces implements DataBaseServeces {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  // Future<dynamic> getData(
  //     {required String path,
  //     String? documentId,
  //     Map<String, dynamic>? query}) async {
  //   if (documentId != null) {
  //     var data = await firestore.collection(path).doc(documentId).get();
  //     return data.data();
  //   } else {
  //     Query<Map<String, dynamic>> data = firestore.collection(path);
  //     if (query != null) {
  //       if (query['orderBy'] != null) {
  //         var orderByFiald = query['orderBy'];
  //         var descending = query['descending'];
  //         data = data.orderBy(orderByFiald, descending: descending);
  //       }
  //       if (query['limit'] != null) {
  //         var limit = query['limit'];
  //         data = data.limit(limit);
  //       }
  //     }
  //     var result = await data.get();
  //     return result.docs.map((e) => e.data()).toList();
  //   }
  // }
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      // جلب مستند محدد بالـ ID
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (query != null) {
        if (query['categoryField'] != null && query['categoryValue'] != null) {
          data = data.where(
            query['categoryField'],
            isEqualTo: query['categoryValue'],
          );
        }
        // ✳ دعم البحث بالكلمة المفتاحية
        if (query['searchField'] != null && query['keyword'] != null) {
          final field = query['searchField'];
          final keyword = query['keyword'];

          data =
              data.orderBy(field).startAt([keyword]).endAt(['$keyword\uf8ff']);
        }

        // ترتيب النتائج
        if (query['sortOption'] != null) {
          String sortOption = query['sortOption'];
          String orderByField = 'name'; // افتراضي
          bool descending = false; // افتراضي

          switch (sortOption) {
            case 'price_desc':
              orderByField = 'price';
              descending = true;
              break;
            case 'price_asc':
              orderByField = 'price';
              descending = false;
              break;
            case 'name_asc':
              orderByField = 'name';
              descending = false;
              break;
            case 'name_desc':
              orderByField = 'name';
              descending = true;
              break;
            default:
              // ممكن تسيبها كده أو تحط فالهاندل حسب اللي تحبه
              break;
          }

          data = data.orderBy(orderByField, descending: descending);
        } else if (query['orderBy'] != null) {
          // لو مفيش sortOption موجود، نرجع للطريقة القديمة
          var orderByField = query['orderBy'];
          var descending = query['descending'] ?? false;
          data = data.orderBy(orderByField, descending: descending);
        }

        // تحديد عدد النتائج
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> chackIfDataExist(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
    bool merge = false,
  }) async {
    final ref = firestore.collection(path);

    if (documentId != null) {
      await ref.doc(documentId).set(data, SetOptions(merge: merge));
    } else {
      await ref.add(data);
    }
  }
}
