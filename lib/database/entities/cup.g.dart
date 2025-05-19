// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cup.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCupCollection on Isar {
  IsarCollection<Cup> get cups => this.collection();
}

const CupSchema = CollectionSchema(
  name: r'Cup',
  id: 7866454282606101393,
  properties: {
    r'beverageColor': PropertySchema(
      id: 0,
      name: r'beverageColor',
      type: IsarType.string,
    ),
    r'beverageHydration': PropertySchema(
      id: 1,
      name: r'beverageHydration',
      type: IsarType.double,
    ),
    r'beverageIcon': PropertySchema(
      id: 2,
      name: r'beverageIcon',
      type: IsarType.string,
    ),
    r'beverageIsActive': PropertySchema(
      id: 3,
      name: r'beverageIsActive',
      type: IsarType.bool,
    ),
    r'beverageIsBuiltIn': PropertySchema(
      id: 4,
      name: r'beverageIsBuiltIn',
      type: IsarType.bool,
    ),
    r'beverageName': PropertySchema(
      id: 5,
      name: r'beverageName',
      type: IsarType.string,
    ),
    r'beverageOrder': PropertySchema(
      id: 6,
      name: r'beverageOrder',
      type: IsarType.long,
    ),
    r'capacityML': PropertySchema(
      id: 7,
      name: r'capacityML',
      type: IsarType.long,
    ),
    r'createAt': PropertySchema(
      id: 8,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 10,
      name: r'order',
      type: IsarType.long,
    ),
    r'updateAt': PropertySchema(
      id: 11,
      name: r'updateAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cupEstimateSize,
  serialize: _cupSerialize,
  deserialize: _cupDeserialize,
  deserializeProp: _cupDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cupGetId,
  getLinks: _cupGetLinks,
  attach: _cupAttach,
  version: '3.1.0+1',
);

int _cupEstimateSize(
  Cup object,
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
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cupSerialize(
  Cup object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.beverageColor);
  writer.writeDouble(offsets[1], object.beverageHydration);
  writer.writeString(offsets[2], object.beverageIcon);
  writer.writeBool(offsets[3], object.beverageIsActive);
  writer.writeBool(offsets[4], object.beverageIsBuiltIn);
  writer.writeString(offsets[5], object.beverageName);
  writer.writeLong(offsets[6], object.beverageOrder);
  writer.writeLong(offsets[7], object.capacityML);
  writer.writeDateTime(offsets[8], object.createAt);
  writer.writeString(offsets[9], object.name);
  writer.writeLong(offsets[10], object.order);
  writer.writeDateTime(offsets[11], object.updateAt);
}

Cup _cupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Cup();
  object.beverageColor = reader.readStringOrNull(offsets[0]);
  object.beverageHydration = reader.readDoubleOrNull(offsets[1]);
  object.beverageIcon = reader.readStringOrNull(offsets[2]);
  object.beverageIsActive = reader.readBoolOrNull(offsets[3]);
  object.beverageIsBuiltIn = reader.readBoolOrNull(offsets[4]);
  object.beverageName = reader.readStringOrNull(offsets[5]);
  object.beverageOrder = reader.readLongOrNull(offsets[6]);
  object.capacityML = reader.readLongOrNull(offsets[7]);
  object.createAt = reader.readDateTimeOrNull(offsets[8]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[9]);
  object.order = reader.readLongOrNull(offsets[10]);
  object.updateAt = reader.readDateTimeOrNull(offsets[11]);
  return object;
}

P _cupDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cupGetId(Cup object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cupGetLinks(Cup object) {
  return [];
}

void _cupAttach(IsarCollection<dynamic> col, Id id, Cup object) {
  object.id = id;
}

extension CupQueryWhereSort on QueryBuilder<Cup, Cup, QWhere> {
  QueryBuilder<Cup, Cup, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CupQueryWhere on QueryBuilder<Cup, Cup, QWhereClause> {
  QueryBuilder<Cup, Cup, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Cup, Cup, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Cup, Cup, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Cup, Cup, QAfterWhereClause> idBetween(
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

extension CupQueryFilter on QueryBuilder<Cup, Cup, QFilterCondition> {
  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageColor',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageColor',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorEqualTo(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorBetween(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorStartsWith(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorEndsWith(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorContains(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorMatches(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beverageColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageHydrationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageHydration',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageHydrationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageHydration',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageHydrationEqualTo(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageHydrationGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageHydrationLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageHydrationBetween(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageIcon',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageIcon',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconEqualTo(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconBetween(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconStartsWith(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconEndsWith(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconContains(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconMatches(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beverageIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIsActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageIsActive',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIsActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageIsActive',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIsActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageIsActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIsBuiltInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageIsBuiltIn',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIsBuiltInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageIsBuiltIn',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageIsBuiltInEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageIsBuiltIn',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageName',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageName',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameEqualTo(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameBetween(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameStartsWith(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameEndsWith(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameContains(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameMatches(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageName',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beverageName',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'beverageOrder',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'beverageOrder',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageOrderEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beverageOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageOrderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beverageOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageOrderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beverageOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> beverageOrderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beverageOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> capacityMLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'capacityML',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> capacityMLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'capacityML',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> capacityMLEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacityML',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> capacityMLGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacityML',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> capacityMLLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacityML',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> capacityMLBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacityML',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> createAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createAt',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> createAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createAt',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> createAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> createAtGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> createAtLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> createAtBetween(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> orderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> orderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> orderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> updateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateAt',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> updateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateAt',
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> updateAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Cup, Cup, QAfterFilterCondition> updateAtGreaterThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> updateAtLessThan(
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

  QueryBuilder<Cup, Cup, QAfterFilterCondition> updateAtBetween(
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

extension CupQueryObject on QueryBuilder<Cup, Cup, QFilterCondition> {}

extension CupQueryLinks on QueryBuilder<Cup, Cup, QFilterCondition> {}

extension CupQuerySortBy on QueryBuilder<Cup, Cup, QSortBy> {
  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageHydration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageHydrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsActive', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsActive', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageIsBuiltIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsBuiltIn', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageIsBuiltInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsBuiltIn', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageOrder', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByBeverageOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageOrder', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByCapacityML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityML', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByCapacityMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityML', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> sortByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }
}

extension CupQuerySortThenBy on QueryBuilder<Cup, Cup, QSortThenBy> {
  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageColor', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageHydration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageHydrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageHydration', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIcon', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsActive', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsActive', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageIsBuiltIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsBuiltIn', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageIsBuiltInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageIsBuiltIn', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageName', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageOrder', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByBeverageOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beverageOrder', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByCapacityML() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityML', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByCapacityMLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacityML', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.asc);
    });
  }

  QueryBuilder<Cup, Cup, QAfterSortBy> thenByUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateAt', Sort.desc);
    });
  }
}

extension CupQueryWhereDistinct on QueryBuilder<Cup, Cup, QDistinct> {
  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageHydration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageHydration');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageIsActive');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageIsBuiltIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageIsBuiltIn');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByBeverageOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beverageOrder');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByCapacityML() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacityML');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<Cup, Cup, QDistinct> distinctByUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateAt');
    });
  }
}

extension CupQueryProperty on QueryBuilder<Cup, Cup, QQueryProperty> {
  QueryBuilder<Cup, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Cup, String?, QQueryOperations> beverageColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageColor');
    });
  }

  QueryBuilder<Cup, double?, QQueryOperations> beverageHydrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageHydration');
    });
  }

  QueryBuilder<Cup, String?, QQueryOperations> beverageIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageIcon');
    });
  }

  QueryBuilder<Cup, bool?, QQueryOperations> beverageIsActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageIsActive');
    });
  }

  QueryBuilder<Cup, bool?, QQueryOperations> beverageIsBuiltInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageIsBuiltIn');
    });
  }

  QueryBuilder<Cup, String?, QQueryOperations> beverageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageName');
    });
  }

  QueryBuilder<Cup, int?, QQueryOperations> beverageOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beverageOrder');
    });
  }

  QueryBuilder<Cup, int?, QQueryOperations> capacityMLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacityML');
    });
  }

  QueryBuilder<Cup, DateTime?, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<Cup, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Cup, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<Cup, DateTime?, QQueryOperations> updateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateAt');
    });
  }
}
