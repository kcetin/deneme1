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
  int get id;

  @nullable
  String get idariGorev;

  @nullable
  String get isim;

  @nullable
  String get resimUrl;

  @nullable
  String get telefon;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AydinKadinDogumRecordBuilder builder) =>
      builder
        ..brans = ''
        ..email = ''
        ..id = 0
        ..idariGorev = ''
        ..isim = ''
        ..resimUrl = ''
        ..telefon = '';

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
  int id,
  String idariGorev,
  String isim,
  String resimUrl,
  String telefon,
}) =>
    serializers.serializeWith(
        AydinKadinDogumRecord.serializer,
        AydinKadinDogumRecord((a) => a
          ..brans = brans
          ..email = email
          ..id = id
          ..idariGorev = idariGorev
          ..isim = isim
          ..resimUrl = resimUrl
          ..telefon = telefon));

AydinKadinDogumRecord get dummyAydinKadinDogumRecord {
  final builder = AydinKadinDogumRecordBuilder()
    ..brans = dummyString
    ..email = dummyString
    ..id = dummyInteger
    ..idariGorev = dummyString
    ..isim = dummyString
    ..resimUrl = dummyImagePath
    ..telefon = dummyString;
  return builder.build();
}

List<AydinKadinDogumRecord> createDummyAydinKadinDogumRecord({int count}) =>
    List.generate(count, (_) => dummyAydinKadinDogumRecord);
