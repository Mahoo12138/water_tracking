// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecordCollection on Isar {
  IsarCollection<Record> get records => this.collection();
}

const RecordSchema = CollectionSchema(
  name: r'Record',
  id: -5560585825827271694,
  properties: {
    r'amountML': PropertySchema(
      id: 0,
      name: r'amountML',
      type: IsarType.long,
    ),
    r'createAt': PropertySchema(
      id: 1,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'updateAt': PropertySchema(
      id: 2,
      name: r'updateAt',
      type: IsarType.dateTime,
    ),
    r'vesselCapacityML': PropertySchema(
      id: 3,
      name: r'vesselCapacityML',
      type: IsarType.long,
    ),
    r'vesselColor': PropertySchema(
      id: 4,
      name: r'vesselColor',
      type: IsarType.string,
    ),
    r'vesselIcon': PropertySchema(
      id: 5,
      name: r'vesselIcon',
      type: IsarType.string,
    ),
    r'vesselName': PropertySchema(
      id: 6,
      name: r'vesselName',
      type: IsarType.string,
    )
  },
  estimateSize: _recordEstimateSize,
  serialize: _recordSerialize,
  deserialize: _recordDeserialize,
  deserializeProp: _recordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recordGetId,
  getLinks: _recordGetLinks,
  attach: _recordAttach,
  version: '3.1.0+1',
);

int _recordEstimateSize(
  Record object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.vesselColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vesselIcon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vesselName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recordSerialize(
  Record object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.amountML);
  writer.writeDateTime(offsets[1], object.createAt);
  writer.writeDateTime(offsets[2], object.updateAt);
  writer.writeLong(offsets[3], object.vesselCapacityML);
  writer.writeString(offsets[4], object.vesselColor);
  writer.writeString(offsets[5], object.vesselIcon);
  writer.writeString(offsets[6], object.vesselName);
}

Record _recordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Record();
  object.amountML = reader.readLongOrNull(offsets[0]);
  object.createAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.updateAt = reader.readDateTimeOrNull(offsets[2]);
  object.vesselCapacityML = reader.readLongOrNull(offsets[3]);
  object.vesselColor = reader.readStringOrNull(offsets[4]);
  object.vesselIcon = reader.readStringOrNull(offsets[5]);
  object.vesselName = reader.readStringOrNull(offsets[6]);
  return object;
}

P _recordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recordGetId(Record object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recordGetLinks(Record object) {
  return [];
}

void _recordAttach(IsarCollection<dynamic> col, Id id, Record object) {
  object.id = id;
}

extension RecordQueryWhereSort on QueryBuilder<Record, Record, QWhere> {
  QueryBuilder<Record, Record, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecordQueryWhere on QueryBuilder<Record, Record, QWhereClause> {
  QueryBuilder<Record, Record, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecordQueryFilter on QueryBuilder<Record, Record, QFilterCondition> {
  QueryBuilder<Record, Record, QAfterFilterCondition> amountMLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amountML',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> amountMLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amountML',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> amountMLEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> amountMLGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> amountMLLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> amountMLBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountML',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createAt',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createAt',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> createAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateAt',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateAt',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updateAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updateAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updateAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> updateAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselCapacityMLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vesselCapacityML',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      vesselCapacityMLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vesselCapacityML',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselCapacityMLEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselCapacityML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      vesselCapacityMLGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vesselCapacityML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselCapacityMLLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vesselCapacityML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselCapacityMLBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vesselCapacityML',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vesselColor',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vesselColor',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vesselColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vesselColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vesselColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vesselColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vesselColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vesselColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vesselColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vesselColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vesselIcon',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vesselIcon',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vesselIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vesselIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vesselIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vesselIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vesselIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vesselIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vesselIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vesselIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vesselName',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vesselName',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vesselName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vesselName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vesselName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vesselName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vesselName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vesselName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vesselName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vesselName',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> vesselNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vesselName',
        value: '',
      ));
    });
  }
}

extension RecordQueryObject on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQueryLinks on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQuerySortBy on QueryBuilder<Record, Record, QSortBy> {
  QueryBuilder<Record, Record, QAfterSortBy> sortByAmountML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountML', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByAmountMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountML', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselCapacityML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselCapacityML', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselCapacityMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselCapacityML', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselColor', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselColor', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselIcon', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselIcon', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselName', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByVesselNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselName', Sort.desc);
    });
  }
}

extension RecordQuerySortThenBy on QueryBuilder<Record, Record, QSortThenBy> {
  QueryBuilder<Record, Record, QAfterSortBy> thenByAmountML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountML', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByAmountMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountML', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselCapacityML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselCapacityML', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselCapacityMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselCapacityML', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselColor', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselColor', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselIcon', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselIcon', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselName', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByVesselNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vesselName', Sort.desc);
    });
  }
}

extension RecordQueryWhereDistinct on QueryBuilder<Record, Record, QDistinct> {
  QueryBuilder<Record, Record, QDistinct> distinctByAmountML() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountML');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateAt');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByVesselCapacityML() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vesselCapacityML');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByVesselColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vesselColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByVesselIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vesselIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByVesselName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vesselName', caseSensitive: caseSensitive);
    });
  }
}

extension RecordQueryProperty on QueryBuilder<Record, Record, QQueryProperty> {
  QueryBuilder<Record, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Record, int?, QQueryOperations> amountMLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountML');
    });
  }

  QueryBuilder<Record, DateTime?, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<Record, DateTime?, QQueryOperations> updateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateAt');
    });
  }

  QueryBuilder<Record, int?, QQueryOperations> vesselCapacityMLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vesselCapacityML');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> vesselColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vesselColor');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> vesselIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vesselIcon');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> vesselNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vesselName');
    });
  }
}
