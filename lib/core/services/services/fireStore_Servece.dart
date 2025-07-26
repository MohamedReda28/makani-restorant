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
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      // جلب مستند محدد بالـ ID
      final data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (query != null) {
        data = _applyFiltering(data, query);
        data = _applySearch(data, query);
        data = _applySorting(data, query);
        data = _applyLimit(data, query);
      }

      final result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }



  @override
  Future<bool> chackIfDataExist(
      {required String path, required String documentId}) async {
    final data = await firestore.collection(path).doc(documentId).get();
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

  @override
  Stream<dynamic> getDataStream({
    required String path,
    Map<String, dynamic>? query,
    String? documentId,
  }) async* {
    if (documentId != null) {
      // جلب مستند معين بناءً على ID
      var docRef = firestore.collection(path).doc(documentId);
      await for (var snapshot in docRef.snapshots()) {
        if (snapshot.exists) {
          yield [snapshot.data()]; // رجعه في ليست علشان تتماشى مع باقي الكود
        } else {
          yield []; // لو المستند مش موجود
        }
      }
    } else {
      // جلب كل المستندات مع تطبيق الفلاتر إن وجدت
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (query != null) {
        data = _applyFiltering(data, query);
        data = _applySearch(data, query);
        data = _applySorting(data, query);
        data = _applyLimit(data, query);
      }

      await for (var event in data.snapshots()) {
        yield event.docs.map((e) => e.data()).toList();
      }
    }
  }


  Query<Map<String, dynamic>> _applyFiltering(
      Query<Map<String, dynamic>> query,
      Map<String, dynamic> params,
      ) {
    if (params['categoryField'] != null && params['categoryValue'] != null) {
      return query.where(
        params['categoryField'],
        isEqualTo: params['categoryValue'],
      );
    }
    return query;
  }

  Query<Map<String, dynamic>> _applySearch(
      Query<Map<String, dynamic>> query,
      Map<String, dynamic> params,
      ) {
    if (params['searchField'] != null && params['keyword'] != null) {
      final field = params['searchField'];
      final keyword = params['keyword'];
      return query.orderBy(field).startAt([keyword]).endAt(['$keyword\uf8ff']);
    }
    return query;
  }

  Query<Map<String, dynamic>> _applySorting(
      Query<Map<String, dynamic>> query,
      Map<String, dynamic> params,
      ) {
    if (params['sortOption'] != null) {
      String sortOption = params['sortOption'];
      String orderByField = 'name';
      bool descending = false;

      switch (sortOption) {
        case 'price_desc':
          orderByField = 'price';
          descending = true;
          break;
        case 'price_asc':
          orderByField = 'price';
          descending = false;
          break;
        case 'name_desc':
          orderByField = 'name';
          descending = true;
          break;
        case 'name_asc':
          orderByField = 'name';
          descending = false;
          break;
      }
      return query.orderBy(orderByField, descending: descending);
    }

    if (params['orderBy'] != null) {
      final orderByField = params['orderBy'];
      final descending = params['descending'] ?? false;
      return query.orderBy(orderByField, descending: descending);
    }

    return query;
  }

  Query<Map<String, dynamic>> _applyLimit(
      Query<Map<String, dynamic>> query,
      Map<String, dynamic> params,
      ) {
    if (params['limit'] != null) {
      return query.limit(params['limit']);
    }
    return query;
  }
}
