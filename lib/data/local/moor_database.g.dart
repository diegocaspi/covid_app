// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CovidData extends DataClass implements Insertable<CovidData> {
  final int id;
  final String denominazione_regione;
  final DateTime data;
  final int totale_positivi;
  final int deceduti;
  final int dimessi_guariti;
  final int terapia_intensiva;
  final int nuovi_positivi;
  CovidData(
      {@required this.id,
      @required this.denominazione_regione,
      @required this.data,
      @required this.totale_positivi,
      @required this.deceduti,
      @required this.dimessi_guariti,
      @required this.terapia_intensiva,
      @required this.nuovi_positivi});
  factory CovidData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return CovidData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      denominazione_regione: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}denominazione_regione']),
      data:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}data']),
      totale_positivi: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}totale_positivi']),
      deceduti:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}deceduti']),
      dimessi_guariti: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}dimessi_guariti']),
      terapia_intensiva: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}terapia_intensiva']),
      nuovi_positivi: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}nuovi_positivi']),
    );
  }
  factory CovidData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CovidData(
      id: serializer.fromJson<int>(json['id']),
      denominazione_regione:
          serializer.fromJson<String>(json['denominazione_regione']),
      data: serializer.fromJson<DateTime>(json['data']),
      totale_positivi: serializer.fromJson<int>(json['totale_positivi']),
      deceduti: serializer.fromJson<int>(json['deceduti']),
      dimessi_guariti: serializer.fromJson<int>(json['dimessi_guariti']),
      terapia_intensiva: serializer.fromJson<int>(json['terapia_intensiva']),
      nuovi_positivi: serializer.fromJson<int>(json['nuovi_positivi']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'denominazione_regione': serializer.toJson<String>(denominazione_regione),
      'data': serializer.toJson<DateTime>(data),
      'totale_positivi': serializer.toJson<int>(totale_positivi),
      'deceduti': serializer.toJson<int>(deceduti),
      'dimessi_guariti': serializer.toJson<int>(dimessi_guariti),
      'terapia_intensiva': serializer.toJson<int>(terapia_intensiva),
      'nuovi_positivi': serializer.toJson<int>(nuovi_positivi),
    };
  }

  @override
  CovidDatasCompanion createCompanion(bool nullToAbsent) {
    return CovidDatasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      denominazione_regione: denominazione_regione == null && nullToAbsent
          ? const Value.absent()
          : Value(denominazione_regione),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      totale_positivi: totale_positivi == null && nullToAbsent
          ? const Value.absent()
          : Value(totale_positivi),
      deceduti: deceduti == null && nullToAbsent
          ? const Value.absent()
          : Value(deceduti),
      dimessi_guariti: dimessi_guariti == null && nullToAbsent
          ? const Value.absent()
          : Value(dimessi_guariti),
      terapia_intensiva: terapia_intensiva == null && nullToAbsent
          ? const Value.absent()
          : Value(terapia_intensiva),
      nuovi_positivi: nuovi_positivi == null && nullToAbsent
          ? const Value.absent()
          : Value(nuovi_positivi),
    );
  }

  CovidData copyWith(
          {int id,
          String denominazione_regione,
          DateTime data,
          int totale_positivi,
          int deceduti,
          int dimessi_guariti,
          int terapia_intensiva,
          int nuovi_positivi}) =>
      CovidData(
        id: id ?? this.id,
        denominazione_regione:
            denominazione_regione ?? this.denominazione_regione,
        data: data ?? this.data,
        totale_positivi: totale_positivi ?? this.totale_positivi,
        deceduti: deceduti ?? this.deceduti,
        dimessi_guariti: dimessi_guariti ?? this.dimessi_guariti,
        terapia_intensiva: terapia_intensiva ?? this.terapia_intensiva,
        nuovi_positivi: nuovi_positivi ?? this.nuovi_positivi,
      );
  @override
  String toString() {
    return (StringBuffer('CovidData(')
          ..write('id: $id, ')
          ..write('denominazione_regione: $denominazione_regione, ')
          ..write('data: $data, ')
          ..write('totale_positivi: $totale_positivi, ')
          ..write('deceduti: $deceduti, ')
          ..write('dimessi_guariti: $dimessi_guariti, ')
          ..write('terapia_intensiva: $terapia_intensiva, ')
          ..write('nuovi_positivi: $nuovi_positivi')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          denominazione_regione.hashCode,
          $mrjc(
              data.hashCode,
              $mrjc(
                  totale_positivi.hashCode,
                  $mrjc(
                      deceduti.hashCode,
                      $mrjc(
                          dimessi_guariti.hashCode,
                          $mrjc(terapia_intensiva.hashCode,
                              nuovi_positivi.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CovidData &&
          other.id == this.id &&
          other.denominazione_regione == this.denominazione_regione &&
          other.data == this.data &&
          other.totale_positivi == this.totale_positivi &&
          other.deceduti == this.deceduti &&
          other.dimessi_guariti == this.dimessi_guariti &&
          other.terapia_intensiva == this.terapia_intensiva &&
          other.nuovi_positivi == this.nuovi_positivi);
}

class CovidDatasCompanion extends UpdateCompanion<CovidData> {
  final Value<int> id;
  final Value<String> denominazione_regione;
  final Value<DateTime> data;
  final Value<int> totale_positivi;
  final Value<int> deceduti;
  final Value<int> dimessi_guariti;
  final Value<int> terapia_intensiva;
  final Value<int> nuovi_positivi;
  const CovidDatasCompanion({
    this.id = const Value.absent(),
    this.denominazione_regione = const Value.absent(),
    this.data = const Value.absent(),
    this.totale_positivi = const Value.absent(),
    this.deceduti = const Value.absent(),
    this.dimessi_guariti = const Value.absent(),
    this.terapia_intensiva = const Value.absent(),
    this.nuovi_positivi = const Value.absent(),
  });
  CovidDatasCompanion.insert({
    this.id = const Value.absent(),
    @required String denominazione_regione,
    @required DateTime data,
    @required int totale_positivi,
    @required int deceduti,
    @required int dimessi_guariti,
    @required int terapia_intensiva,
    @required int nuovi_positivi,
  })  : denominazione_regione = Value(denominazione_regione),
        data = Value(data),
        totale_positivi = Value(totale_positivi),
        deceduti = Value(deceduti),
        dimessi_guariti = Value(dimessi_guariti),
        terapia_intensiva = Value(terapia_intensiva),
        nuovi_positivi = Value(nuovi_positivi);
  CovidDatasCompanion copyWith(
      {Value<int> id,
      Value<String> denominazione_regione,
      Value<DateTime> data,
      Value<int> totale_positivi,
      Value<int> deceduti,
      Value<int> dimessi_guariti,
      Value<int> terapia_intensiva,
      Value<int> nuovi_positivi}) {
    return CovidDatasCompanion(
      id: id ?? this.id,
      denominazione_regione:
          denominazione_regione ?? this.denominazione_regione,
      data: data ?? this.data,
      totale_positivi: totale_positivi ?? this.totale_positivi,
      deceduti: deceduti ?? this.deceduti,
      dimessi_guariti: dimessi_guariti ?? this.dimessi_guariti,
      terapia_intensiva: terapia_intensiva ?? this.terapia_intensiva,
      nuovi_positivi: nuovi_positivi ?? this.nuovi_positivi,
    );
  }
}

class $CovidDatasTable extends CovidDatas
    with TableInfo<$CovidDatasTable, CovidData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CovidDatasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _denominazione_regioneMeta =
      const VerificationMeta('denominazione_regione');
  GeneratedTextColumn _denominazione_regione;
  @override
  GeneratedTextColumn get denominazione_regione =>
      _denominazione_regione ??= _constructDenominazioneRegione();
  GeneratedTextColumn _constructDenominazioneRegione() {
    return GeneratedTextColumn(
      'denominazione_regione',
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

  final VerificationMeta _totale_positiviMeta =
      const VerificationMeta('totale_positivi');
  GeneratedIntColumn _totale_positivi;
  @override
  GeneratedIntColumn get totale_positivi =>
      _totale_positivi ??= _constructTotalePositivi();
  GeneratedIntColumn _constructTotalePositivi() {
    return GeneratedIntColumn(
      'totale_positivi',
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

  final VerificationMeta _dimessi_guaritiMeta =
      const VerificationMeta('dimessi_guariti');
  GeneratedIntColumn _dimessi_guariti;
  @override
  GeneratedIntColumn get dimessi_guariti =>
      _dimessi_guariti ??= _constructDimessiGuariti();
  GeneratedIntColumn _constructDimessiGuariti() {
    return GeneratedIntColumn(
      'dimessi_guariti',
      $tableName,
      false,
    );
  }

  final VerificationMeta _terapia_intensivaMeta =
      const VerificationMeta('terapia_intensiva');
  GeneratedIntColumn _terapia_intensiva;
  @override
  GeneratedIntColumn get terapia_intensiva =>
      _terapia_intensiva ??= _constructTerapiaIntensiva();
  GeneratedIntColumn _constructTerapiaIntensiva() {
    return GeneratedIntColumn(
      'terapia_intensiva',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nuovi_positiviMeta =
      const VerificationMeta('nuovi_positivi');
  GeneratedIntColumn _nuovi_positivi;
  @override
  GeneratedIntColumn get nuovi_positivi =>
      _nuovi_positivi ??= _constructNuoviPositivi();
  GeneratedIntColumn _constructNuoviPositivi() {
    return GeneratedIntColumn(
      'nuovi_positivi',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        denominazione_regione,
        data,
        totale_positivi,
        deceduti,
        dimessi_guariti,
        terapia_intensiva,
        nuovi_positivi
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
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.denominazione_regione.present) {
      context.handle(
          _denominazione_regioneMeta,
          denominazione_regione.isAcceptableValue(
              d.denominazione_regione.value, _denominazione_regioneMeta));
    } else if (isInserting) {
      context.missing(_denominazione_regioneMeta);
    }
    if (d.data.present) {
      context.handle(
          _dataMeta, data.isAcceptableValue(d.data.value, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (d.totale_positivi.present) {
      context.handle(
          _totale_positiviMeta,
          totale_positivi.isAcceptableValue(
              d.totale_positivi.value, _totale_positiviMeta));
    } else if (isInserting) {
      context.missing(_totale_positiviMeta);
    }
    if (d.deceduti.present) {
      context.handle(_decedutiMeta,
          deceduti.isAcceptableValue(d.deceduti.value, _decedutiMeta));
    } else if (isInserting) {
      context.missing(_decedutiMeta);
    }
    if (d.dimessi_guariti.present) {
      context.handle(
          _dimessi_guaritiMeta,
          dimessi_guariti.isAcceptableValue(
              d.dimessi_guariti.value, _dimessi_guaritiMeta));
    } else if (isInserting) {
      context.missing(_dimessi_guaritiMeta);
    }
    if (d.terapia_intensiva.present) {
      context.handle(
          _terapia_intensivaMeta,
          terapia_intensiva.isAcceptableValue(
              d.terapia_intensiva.value, _terapia_intensivaMeta));
    } else if (isInserting) {
      context.missing(_terapia_intensivaMeta);
    }
    if (d.nuovi_positivi.present) {
      context.handle(
          _nuovi_positiviMeta,
          nuovi_positivi.isAcceptableValue(
              d.nuovi_positivi.value, _nuovi_positiviMeta));
    } else if (isInserting) {
      context.missing(_nuovi_positiviMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CovidData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CovidData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CovidDatasCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.denominazione_regione.present) {
      map['denominazione_regione'] =
          Variable<String, StringType>(d.denominazione_regione.value);
    }
    if (d.data.present) {
      map['data'] = Variable<DateTime, DateTimeType>(d.data.value);
    }
    if (d.totale_positivi.present) {
      map['totale_positivi'] = Variable<int, IntType>(d.totale_positivi.value);
    }
    if (d.deceduti.present) {
      map['deceduti'] = Variable<int, IntType>(d.deceduti.value);
    }
    if (d.dimessi_guariti.present) {
      map['dimessi_guariti'] = Variable<int, IntType>(d.dimessi_guariti.value);
    }
    if (d.terapia_intensiva.present) {
      map['terapia_intensiva'] =
          Variable<int, IntType>(d.terapia_intensiva.value);
    }
    if (d.nuovi_positivi.present) {
      map['nuovi_positivi'] = Variable<int, IntType>(d.nuovi_positivi.value);
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
