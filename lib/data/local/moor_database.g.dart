// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CovidData extends DataClass implements Insertable<CovidData> {
  final String name;
  final DateTime data;
  final int totPositivi;
  final int deceduti;
  final int dimessiGuariti;
  final int terapiaIntensiva;
  final int nuoviPositivi;
  CovidData(
      {@required this.name,
      @required this.data,
      @required this.totPositivi,
      @required this.deceduti,
      @required this.dimessiGuariti,
      @required this.terapiaIntensiva,
      @required this.nuoviPositivi});
  factory CovidData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return CovidData(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      data:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}data']),
      totPositivi: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}tot_positivi']),
      deceduti:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}deceduti']),
      dimessiGuariti: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}dimessi_guariti']),
      terapiaIntensiva: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}terapia_intensiva']),
      nuoviPositivi: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}nuovi_positivi']),
    );
  }
  factory CovidData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CovidData(
      name: serializer.fromJson<String>(json['name']),
      data: serializer.fromJson<DateTime>(json['data']),
      totPositivi: serializer.fromJson<int>(json['totPositivi']),
      deceduti: serializer.fromJson<int>(json['deceduti']),
      dimessiGuariti: serializer.fromJson<int>(json['dimessiGuariti']),
      terapiaIntensiva: serializer.fromJson<int>(json['terapiaIntensiva']),
      nuoviPositivi: serializer.fromJson<int>(json['nuoviPositivi']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'data': serializer.toJson<DateTime>(data),
      'totPositivi': serializer.toJson<int>(totPositivi),
      'deceduti': serializer.toJson<int>(deceduti),
      'dimessiGuariti': serializer.toJson<int>(dimessiGuariti),
      'terapiaIntensiva': serializer.toJson<int>(terapiaIntensiva),
      'nuoviPositivi': serializer.toJson<int>(nuoviPositivi),
    };
  }

  @override
  CovidDatasCompanion createCompanion(bool nullToAbsent) {
    return CovidDatasCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      totPositivi: totPositivi == null && nullToAbsent
          ? const Value.absent()
          : Value(totPositivi),
      deceduti: deceduti == null && nullToAbsent
          ? const Value.absent()
          : Value(deceduti),
      dimessiGuariti: dimessiGuariti == null && nullToAbsent
          ? const Value.absent()
          : Value(dimessiGuariti),
      terapiaIntensiva: terapiaIntensiva == null && nullToAbsent
          ? const Value.absent()
          : Value(terapiaIntensiva),
      nuoviPositivi: nuoviPositivi == null && nullToAbsent
          ? const Value.absent()
          : Value(nuoviPositivi),
    );
  }

  CovidData copyWith(
          {String name,
          DateTime data,
          int totPositivi,
          int deceduti,
          int dimessiGuariti,
          int terapiaIntensiva,
          int nuoviPositivi}) =>
      CovidData(
        name: name ?? this.name,
        data: data ?? this.data,
        totPositivi: totPositivi ?? this.totPositivi,
        deceduti: deceduti ?? this.deceduti,
        dimessiGuariti: dimessiGuariti ?? this.dimessiGuariti,
        terapiaIntensiva: terapiaIntensiva ?? this.terapiaIntensiva,
        nuoviPositivi: nuoviPositivi ?? this.nuoviPositivi,
      );
  @override
  String toString() {
    return (StringBuffer('CovidData(')
          ..write('name: $name, ')
          ..write('data: $data, ')
          ..write('totPositivi: $totPositivi, ')
          ..write('deceduti: $deceduti, ')
          ..write('dimessiGuariti: $dimessiGuariti, ')
          ..write('terapiaIntensiva: $terapiaIntensiva, ')
          ..write('nuoviPositivi: $nuoviPositivi')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          data.hashCode,
          $mrjc(
              totPositivi.hashCode,
              $mrjc(
                  deceduti.hashCode,
                  $mrjc(
                      dimessiGuariti.hashCode,
                      $mrjc(terapiaIntensiva.hashCode,
                          nuoviPositivi.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CovidData &&
          other.name == this.name &&
          other.data == this.data &&
          other.totPositivi == this.totPositivi &&
          other.deceduti == this.deceduti &&
          other.dimessiGuariti == this.dimessiGuariti &&
          other.terapiaIntensiva == this.terapiaIntensiva &&
          other.nuoviPositivi == this.nuoviPositivi);
}

class CovidDatasCompanion extends UpdateCompanion<CovidData> {
  final Value<String> name;
  final Value<DateTime> data;
  final Value<int> totPositivi;
  final Value<int> deceduti;
  final Value<int> dimessiGuariti;
  final Value<int> terapiaIntensiva;
  final Value<int> nuoviPositivi;
  const CovidDatasCompanion({
    this.name = const Value.absent(),
    this.data = const Value.absent(),
    this.totPositivi = const Value.absent(),
    this.deceduti = const Value.absent(),
    this.dimessiGuariti = const Value.absent(),
    this.terapiaIntensiva = const Value.absent(),
    this.nuoviPositivi = const Value.absent(),
  });
  CovidDatasCompanion.insert({
    @required String name,
    @required DateTime data,
    @required int totPositivi,
    @required int deceduti,
    @required int dimessiGuariti,
    @required int terapiaIntensiva,
    @required int nuoviPositivi,
  })  : name = Value(name),
        data = Value(data),
        totPositivi = Value(totPositivi),
        deceduti = Value(deceduti),
        dimessiGuariti = Value(dimessiGuariti),
        terapiaIntensiva = Value(terapiaIntensiva),
        nuoviPositivi = Value(nuoviPositivi);
  CovidDatasCompanion copyWith(
      {Value<String> name,
      Value<DateTime> data,
      Value<int> totPositivi,
      Value<int> deceduti,
      Value<int> dimessiGuariti,
      Value<int> terapiaIntensiva,
      Value<int> nuoviPositivi}) {
    return CovidDatasCompanion(
      name: name ?? this.name,
      data: data ?? this.data,
      totPositivi: totPositivi ?? this.totPositivi,
      deceduti: deceduti ?? this.deceduti,
      dimessiGuariti: dimessiGuariti ?? this.dimessiGuariti,
      terapiaIntensiva: terapiaIntensiva ?? this.terapiaIntensiva,
      nuoviPositivi: nuoviPositivi ?? this.nuoviPositivi,
    );
  }
}

class $CovidDatasTable extends CovidDatas
    with TableInfo<$CovidDatasTable, CovidData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CovidDatasTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dataMeta = const VerificationMeta('data');
  GeneratedDateTimeColumn _data;
  @override
  GeneratedDateTimeColumn get data => _data ??= _constructData();
  GeneratedDateTimeColumn _constructData() {
    return GeneratedDateTimeColumn(
      'data',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totPositiviMeta =
      const VerificationMeta('totPositivi');
  GeneratedIntColumn _totPositivi;
  @override
  GeneratedIntColumn get totPositivi =>
      _totPositivi ??= _constructTotPositivi();
  GeneratedIntColumn _constructTotPositivi() {
    return GeneratedIntColumn(
      'tot_positivi',
      $tableName,
      false,
    );
  }

  final VerificationMeta _decedutiMeta = const VerificationMeta('deceduti');
  GeneratedIntColumn _deceduti;
  @override
  GeneratedIntColumn get deceduti => _deceduti ??= _constructDeceduti();
  GeneratedIntColumn _constructDeceduti() {
    return GeneratedIntColumn(
      'deceduti',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dimessiGuaritiMeta =
      const VerificationMeta('dimessiGuariti');
  GeneratedIntColumn _dimessiGuariti;
  @override
  GeneratedIntColumn get dimessiGuariti =>
      _dimessiGuariti ??= _constructDimessiGuariti();
  GeneratedIntColumn _constructDimessiGuariti() {
    return GeneratedIntColumn(
      'dimessi_guariti',
      $tableName,
      false,
    );
  }

  final VerificationMeta _terapiaIntensivaMeta =
      const VerificationMeta('terapiaIntensiva');
  GeneratedIntColumn _terapiaIntensiva;
  @override
  GeneratedIntColumn get terapiaIntensiva =>
      _terapiaIntensiva ??= _constructTerapiaIntensiva();
  GeneratedIntColumn _constructTerapiaIntensiva() {
    return GeneratedIntColumn(
      'terapia_intensiva',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nuoviPositiviMeta =
      const VerificationMeta('nuoviPositivi');
  GeneratedIntColumn _nuoviPositivi;
  @override
  GeneratedIntColumn get nuoviPositivi =>
      _nuoviPositivi ??= _constructNuoviPositivi();
  GeneratedIntColumn _constructNuoviPositivi() {
    return GeneratedIntColumn(
      'nuovi_positivi',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        name,
        data,
        totPositivi,
        deceduti,
        dimessiGuariti,
        terapiaIntensiva,
        nuoviPositivi
      ];
  @override
  $CovidDatasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'covid_datas';
  @override
  final String actualTableName = 'covid_datas';
  @override
  VerificationContext validateIntegrity(CovidDatasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.data.present) {
      context.handle(
          _dataMeta, data.isAcceptableValue(d.data.value, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (d.totPositivi.present) {
      context.handle(_totPositiviMeta,
          totPositivi.isAcceptableValue(d.totPositivi.value, _totPositiviMeta));
    } else if (isInserting) {
      context.missing(_totPositiviMeta);
    }
    if (d.deceduti.present) {
      context.handle(_decedutiMeta,
          deceduti.isAcceptableValue(d.deceduti.value, _decedutiMeta));
    } else if (isInserting) {
      context.missing(_decedutiMeta);
    }
    if (d.dimessiGuariti.present) {
      context.handle(
          _dimessiGuaritiMeta,
          dimessiGuariti.isAcceptableValue(
              d.dimessiGuariti.value, _dimessiGuaritiMeta));
    } else if (isInserting) {
      context.missing(_dimessiGuaritiMeta);
    }
    if (d.terapiaIntensiva.present) {
      context.handle(
          _terapiaIntensivaMeta,
          terapiaIntensiva.isAcceptableValue(
              d.terapiaIntensiva.value, _terapiaIntensivaMeta));
    } else if (isInserting) {
      context.missing(_terapiaIntensivaMeta);
    }
    if (d.nuoviPositivi.present) {
      context.handle(
          _nuoviPositiviMeta,
          nuoviPositivi.isAcceptableValue(
              d.nuoviPositivi.value, _nuoviPositiviMeta));
    } else if (isInserting) {
      context.missing(_nuoviPositiviMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  CovidData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CovidData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CovidDatasCompanion d) {
    final map = <String, Variable>{};
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.data.present) {
      map['data'] = Variable<DateTime, DateTimeType>(d.data.value);
    }
    if (d.totPositivi.present) {
      map['tot_positivi'] = Variable<int, IntType>(d.totPositivi.value);
    }
    if (d.deceduti.present) {
      map['deceduti'] = Variable<int, IntType>(d.deceduti.value);
    }
    if (d.dimessiGuariti.present) {
      map['dimessi_guariti'] = Variable<int, IntType>(d.dimessiGuariti.value);
    }
    if (d.terapiaIntensiva.present) {
      map['terapia_intensiva'] =
          Variable<int, IntType>(d.terapiaIntensiva.value);
    }
    if (d.nuoviPositivi.present) {
      map['nuovi_positivi'] = Variable<int, IntType>(d.nuoviPositivi.value);
    }
    return map;
  }

  @override
  $CovidDatasTable createAlias(String alias) {
    return $CovidDatasTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CovidDatasTable _covidDatas;
  $CovidDatasTable get covidDatas => _covidDatas ??= $CovidDatasTable(this);
  CovidDataDao _covidDataDao;
  CovidDataDao get covidDataDao =>
      _covidDataDao ??= CovidDataDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [covidDatas];
}
