import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'aydin_kadin_dogum_record.g.dart';

abstract class AydinKadinDogumRecord
    implements Built<AydinKadinDogumRecord, AydinKadinDogumRecordBuilder> {
  static Serializer<AydinKadinDogumRecord> get serializer =>
      _$aydinKadinDogumRecordSerializer;

  @nullable
  String get brans;

  @nullable
  String get email;

  @nullable
  String get idariGorev;

  @nullable
  String get isim;

  @nullable
  String get resimUrl;

  @nullable
  String get telefon;

  @nullable
  DocumentReference get user;

  @nullable
  Timestamp get id;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AydinKadinDogumRecordBuilder builder) =>
      builder
        ..brans = ''
        ..email = ''
        ..idariGorev = ''
        ..isim = ''
        ..resimUrl = ''
        ..telefon = ''
        ..displayName = ''
        ..photoUrl = ''
        ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AydinKadinDogum');

  static Stream<AydinKadinDogumRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AydinKadinDogumRecord._();
  factory AydinKadinDogumRecord(
          [void Function(AydinKadinDogumRecordBuilder) updates]) =
      _$AydinKadinDogumRecord;
}

Map<String, dynamic> createAydinKadinDogumRecordData({
  String brans,
  String email,
  String idariGorev,
  String isim,
  String resimUrl,
  String telefon,
  DocumentReference user,
  Timestamp id,
  String displayName,
  String photoUrl,
  String uid,
  Timestamp createdTime,
}) =>
    serializers.serializeWith(
        AydinKadinDogumRecord.serializer,
        AydinKadinDogumRecord((a) => a
          ..brans = brans
          ..email = email
          ..idariGorev = idariGorev
          ..isim = isim
          ..resimUrl = resimUrl
          ..telefon = telefon
          ..user = user
          ..id = id
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime));

AydinKadinDogumRecord get dummyAydinKadinDogumRecord {
  final builder = AydinKadinDogumRecordBuilder()
    ..brans = dummyString
    ..email = dummyString
    ..idariGorev = dummyString
    ..isim = dummyString
    ..resimUrl = dummyImagePath
    ..telefon = dummyString
    ..id = dummyTimestamp
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp;
  return builder.build();
}

List<AydinKadinDogumRecord> createDummyAydinKadinDogumRecord({int count}) =>
    List.generate(count, (_) => dummyAydinKadinDogumRecord);
