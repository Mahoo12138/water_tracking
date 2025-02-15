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
    r'beverageColor': PropertySchema(
      id: 1,
      name: r'beverageColor',
      type: IsarType.string,
    ),
    r'beverageHydration': PropertySchema(
      id: 2,
      name: r'beverageHydration',
      type: IsarType.double,
    ),
    r'beverageIcon': PropertySchema(
      id: 3,
      name: r'beverageIcon',
      type: IsarType.string,
    ),
    r'beverageName': PropertySchema(
      id: 4,
      name: r'beverageName',
      type: IsarType.string,
    ),
    r'createAt': PropertySchema(
      id: 5,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'dailyGoalML': PropertySchema(
      id: 6,
      name: r'dailyGoalML',
      type: IsarType.long,
    ),
    r'updateAt': PropertySchema(
      id: 7,
      name: r'updateAt',
      type: IsarType.dateTime,
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
    final value = object.beverageColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.beverageIcon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.beverageName;
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
  writer.writeString(offsets[1], object.beverageColor);
  writer.writeDouble(offsets[2], object.beverageHydration);
  writer.writeString(offsets[3], object.beverageIcon);
  writer.writeString(offsets[4], object.beverageName);
  writer.writeDateTime(offsets[5], object.createAt);
  writer.writeLong(offsets[6], object.dailyGoalML);
  writer.writeDateTime(offsets[7], object.updateAt);
}

Record _recordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Record();
  object.amountML = reader.readLongOrNull(offsets[0]);
  object.beverageColor = reader.readStringOrNull(offsets[1]);
  object.beverageHydration = reader.readDoubleOrNull(offsets[2]);
  object.beverageIcon = reader.readStringOrNull(offsets[3]);
  object.beverageName = reader.readStringOrNull(offsets[4]);
  object.createAt = reader.readDateTimeOrNull(offsets[5]);
  object.dailyGoalML = reader.readLongOrNull(offsets[6]);
  object.id = id;
  object.updateAt = reader.readDateTimeOrNull(offsets[7]);
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
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
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

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageColor',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageColor',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beverageColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beverageColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beverageColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'beverageColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'beverageColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'beverageColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'beverageColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      beverageColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beverageColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      beverageHydrationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageHydration',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      beverageHydrationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageHydration',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageHydrationEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageHydration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      beverageHydrationGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beverageHydration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageHydrationLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beverageHydration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageHydrationBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beverageHydration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageIcon',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageIcon',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beverageIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beverageIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beverageIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'beverageIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'beverageIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'beverageIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'beverageIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beverageIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageName',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageName',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beverageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beverageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beverageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'beverageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'beverageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'beverageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'beverageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageName',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> beverageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beverageName',
        value: '',
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

  QueryBuilder<Record, Record, QAfterFilterCondition> dailyGoalMLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyGoalML',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dailyGoalMLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyGoalML',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dailyGoalMLEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyGoalML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dailyGoalMLGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyGoalML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dailyGoalMLLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyGoalML',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dailyGoalMLBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyGoalML',
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

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageHydration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageHydrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBeverageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.desc);
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

  QueryBuilder<Record, Record, QAfterSortBy> sortByDailyGoalML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoalML', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDailyGoalMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoalML', Sort.desc);
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

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageHydration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageHydrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBeverageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.desc);
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

  QueryBuilder<Record, Record, QAfterSortBy> thenByDailyGoalML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoalML', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDailyGoalMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoalML', Sort.desc);
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
}

extension RecordQueryWhereDistinct on QueryBuilder<Record, Record, QDistinct> {
  QueryBuilder<Record, Record, QDistinct> distinctByAmountML() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountML');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByBeverageColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByBeverageHydration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageHydration');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByBeverageIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByBeverageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByDailyGoalML() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyGoalML');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateAt');
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

  QueryBuilder<Record, String?, QQueryOperations> beverageColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageColor');
    });
  }

  QueryBuilder<Record, double?, QQueryOperations> beverageHydrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageHydration');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> beverageIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageIcon');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> beverageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageName');
    });
  }

  QueryBuilder<Record, DateTime?, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<Record, int?, QQueryOperations> dailyGoalMLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyGoalML');
    });
  }

  QueryBuilder<Record, DateTime?, QQueryOperations> updateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateAt');
    });
  }
}
