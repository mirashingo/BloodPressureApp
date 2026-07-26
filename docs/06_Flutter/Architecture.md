# Architecture.md

# BloodPressureApp Flutter設計

Version: 1.0

------------------------------------------------------------------------

# Architecture

## ドキュメントID

FLUTTER-ARCH-001

------------------------------------------------------------------------

## 名称

Flutterアプリケーションアーキテクチャ設計仕様

------------------------------------------------------------------------

## 目的

BloodPressureAppのFlutter実装における

ディレクトリ構成、責務分離、依存方向、

状態管理、画面遷移、データ保存、

エラー処理、テスト、AI連携を統一し、

機能追加や仕様変更に強い構造を実現する。

本アプリは、

血圧記録、履歴、グラフ、統計、

リマインダー、出力、バックアップ、設定、

将来のAI機能など、

複数のFeatureを段階的に拡張する。

そのため、

画面へ処理を集中させず、

Feature単位で独立性を保ち、

AIを活用した開発でも

仕様と実装の対応関係を追跡しやすい

アーキテクチャを設計目標とする。

------------------------------------------------------------------------

## 適用範囲

-   Flutter Application
-   Android
-   iOS
-   Tablet
-   将来のWeb・Desktop
-   Presentation Layer
-   Application Layer
-   Domain Layer
-   Data Layer
-   Riverpod
-   GoRouter
-   Drift
-   SharedPreferences
-   Secure Storage
-   Notification
-   Export
-   Backup
-   AI Workflow
-   Testing
-   CI/CD

------------------------------------------------------------------------

## 基本方針

-   Feature First構成を採用する
-   Feature内部でLayerを分離する
-   UIへBusiness Logicを置かない
-   DomainはFlutter Frameworkへ依存しない
-   Data LayerはDomain Contractを実装する
-   Repositoryを依存境界とする
-   状態管理はRiverpodへ統一する
-   画面遷移はGoRouterへ統一する
-   Local DatabaseはDriftを使用する
-   設定は用途別Storageへ分離する
-   依存は外側から内側へ向ける
-   Singletonの直接参照を避ける
-   Provider経由で依存注入する
-   Errorを型として扱う
-   非同期状態を明示する
-   Feature間の直接依存を最小化する
-   共有WidgetとDomain Widgetを分離する
-   AI機能は通常機能から切り離す
-   AI停止時も主要機能を利用可能にする
-   Test可能なInterfaceを優先する
-   Generated Codeを手動編集しない

------------------------------------------------------------------------

## アーキテクチャ概要


Presentation
    ↓
Application
    ↓
Domain
    ↑
Data


依存方向


Presentation → Application → Domain

Data → Domain


禁止


Domain → Flutter

Domain → Drift

Domain → Riverpod

Data → Presentation

Feature A Presentation → Feature B Data


------------------------------------------------------------------------

## レイヤー構成


Feature
├─ presentation
│  ├─ screen
│  ├─ widget
│  ├─ controller
│  ├─ state
│  └─ provider
│
├─ application
│  ├─ usecase
│  ├─ service
│  ├─ command
│  └─ query
│
├─ domain
│  ├─ entity
│  ├─ value_object
│  ├─ repository
│  ├─ policy
│  └─ exception
│
└─ data
   ├─ datasource
   ├─ dto
   ├─ mapper
   ├─ repository
   └─ database


------------------------------------------------------------------------

# Presentation Layer

------------------------------------------------------------------------

## 目的

利用者へ情報を表示し、

操作を受け取り、

Application Layerへ伝える。

責務

-   Widget表示
-   入力受付
-   Loading表示
-   Error表示
-   Navigation要求
-   Accessibility
-   Theme
-   Localization
-   UI State

責務外

-   Database操作
-   複雑な集計
-   Business Rule
-   API直接呼び出し
-   Repository実装
-   AI Prompt構築

------------------------------------------------------------------------

## Screen

Screenは

画面レイアウトのCompositionを担当する。

Screen内で許可

-   Providerのwatch
-   StateごとのWidget切替
-   Layout
-   Navigation Callback
-   Dialog・Bottom Sheet起動

Screen内で禁止

-   SQL
-   JSON Parse
-   Date Range集計
-   Backup処理
-   Export処理
-   AI Request
-   Validation Ruleの直書き

------------------------------------------------------------------------

## Widget

Widget分類


Core Widget

Feature Widget

Domain Widget


Core Widget

-   AppPrimaryButton
-   AppTextField
-   AppDialog
-   AppEmptyState

Feature Widget

-   HistoryFilterBar
-   GraphPeriodSelector
-   SettingsSection

Domain Widget

-   BloodPressureValuePair
-   BloodPressureInputGroup
-   MeasurementSessionCard

------------------------------------------------------------------------

## Controller

Controllerは

画面操作とApplication処理の調整を担当する。

例


BloodPressureInputController

HistoryController

GraphController

SettingsController

AiSummaryController


責務

-   UseCase呼び出し
-   Form State管理
-   Loading・Success・Failure管理
-   一時的UI State
-   Navigation結果の準備
-   Event重複防止

禁止

-   Drift Table直接操作
-   BuildContext保持
-   Widget生成
-   Error Messageのハードコード
-   Platform Channel直接操作

------------------------------------------------------------------------

# Application Layer

------------------------------------------------------------------------

## 目的

利用者操作を

Domain ObjectとRepositoryを使って実行する。

責務

-   UseCase
-   Command
-   Query
-   Transaction調整
-   複数Repository連携
-   Permission・Service調整
-   Domain Error変換
-   Workflow制御

------------------------------------------------------------------------

## UseCase

命名規則


Verb + Object + UseCase


例


CreateBloodPressureRecordUseCase

UpdateBloodPressureRecordUseCase

DeleteBloodPressureRecordUseCase

GetBloodPressureHistoryUseCase

CalculateStatisticsUseCase

ExportRecordsUseCase


1 UseCase

1主要目的を原則とする。

------------------------------------------------------------------------

## Command・Query

必要に応じて

CommandとQueryを分離する。

Command

状態を変更する。

例


CreateRecordCommand

UpdateSettingsCommand

DeleteAllRecordsCommand


Query

状態を変更しない。

例


GetHistoryQuery

GetGraphDataQuery

GetStatisticsQuery


MVPでは

過度にClassを増やさず、

UseCase中心でもよい。

------------------------------------------------------------------------

# Domain Layer

------------------------------------------------------------------------

## 目的

血圧記録アプリの

中核Business Ruleを表現する。

Domainは

Flutter、Database、API、UIへ依存しない。

------------------------------------------------------------------------

## Entity

主要Entity


BloodPressureRecord

MeasurementSession

Measurement

ReminderSchedule

AppSettings

BackupMetadata

ExportRequest


------------------------------------------------------------------------

## BloodPressureRecord

例

dart
class BloodPressureRecord {
  const BloodPressureRecord({
    required this.id,
    required this.measuredAt,
    required this.systolic,
    required this.diastolic,
    this.pulse,
    required this.timePeriod,
    required this.measurementSession,
    this.memo,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final DateTime measuredAt;
  final int systolic;
  final int diastolic;
  final int? pulse;
  final TimePeriod timePeriod;
  final MeasurementSession measurementSession;
  final String? memo;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;
}


------------------------------------------------------------------------

## Value Object

例


SystolicValue

DiastolicValue

PulseValue

MeasurementDateTime

DateRange

RecordId

TimePeriod

AggregationMethod


Value Objectは

生成時にValidationする。

------------------------------------------------------------------------

## Repository Interface

Domain Layerに定義する。

例

dart
abstract interface class BloodPressureRepository {
  Stream<List<BloodPressureRecord>> watchRecords(
    BloodPressureFilter filter,
  );

  Future<BloodPressureRecord?> findById(String id);

  Future<void> create(BloodPressureRecord record);

  Future<void> update(BloodPressureRecord record);

  Future<void> delete(String id);

  Future<void> deleteAll();
}


------------------------------------------------------------------------

## Domain Service

Entity単体へ置きにくいRuleを扱う。

例


MeasurementAggregationService

TimePeriodClassificationService

StatisticsCalculationService

RecordValidationService


------------------------------------------------------------------------

## Domain Policy

設定可能なRuleを表現する。

例


MeasurementAggregationPolicy

TimePeriodPolicy

RecordValidationPolicy

ExportPolicy

BackupRetentionPolicy


------------------------------------------------------------------------

# Data Layer

------------------------------------------------------------------------

## 目的

Database、Storage、API、

Platform Serviceとの具体的な通信を担当する。

責務

-   Drift
-   SharedPreferences
-   Secure Storage
-   File System
-   Notification Plugin
-   Backup Storage
-   AI Backend
-   DTO
-   Mapper
-   Repository実装

------------------------------------------------------------------------

## DataSource

分類


LocalDataSource

RemoteDataSource

PlatformDataSource


例


BloodPressureLocalDataSource

SettingsLocalDataSource

BackupFileDataSource

NotificationPlatformDataSource

AiRemoteDataSource


------------------------------------------------------------------------

## DTO

Database・API形式を表現する。

Domain Entityと分離する。

例


BloodPressureRecordDto

ReminderScheduleDto

AiSummaryResponseDto


DTOへ

Business Ruleを置かない。

------------------------------------------------------------------------

## Mapper


DTO ↔ Domain Entity


例

dart
extension BloodPressureRecordRowMapper
    on BloodPressureRecordRow {
  BloodPressureRecord toDomain() {
    // mapping
  }
}


Mapping Errorは

明示的に扱う。

------------------------------------------------------------------------

# Feature First構成

------------------------------------------------------------------------

## 推奨ディレクトリ


lib/
├─ app/
│  ├─ app.dart
│  ├─ bootstrap.dart
│  ├─ router/
│  ├─ theme/
│  └─ localization/
│
├─ core/
│  ├─ error/
│  ├─ result/
│  ├─ database/
│  ├─ storage/
│  ├─ notification/
│  ├─ export/
│  ├─ backup/
│  ├─ ai/
│  ├─ analytics/
│  ├─ logging/
│  ├─ security/
│  ├─ widgets/
│  ├─ extensions/
│  ├─ utils/
│  └─ constants/
│
├─ features/
│  ├─ recording/
│  ├─ home/
│  ├─ history/
│  ├─ graph/
│  ├─ statistics/
│  ├─ reminder/
│  ├─ export/
│  ├─ backup/
│  ├─ settings/
│  └─ ai_summary/
│
├─ shared/
│  ├─ domain/
│  └─ presentation/
│
└─ main.dart


------------------------------------------------------------------------

## Feature例


features/
└─ recording/
   ├─ presentation/
   │  ├─ screens/
   │  │  ├─ blood_pressure_input_screen.dart
   │  │  └─ record_confirmation_screen.dart
   │  ├─ widgets/
   │  ├─ controllers/
   │  ├─ states/
   │  └─ providers/
   │
   ├─ application/
   │  └─ usecases/
   │     ├─ create_record_use_case.dart
   │     └─ update_record_use_case.dart
   │
   ├─ domain/
   │  ├─ entities/
   │  ├─ value_objects/
   │  ├─ repositories/
   │  └─ services/
   │
   └─ data/
      ├─ datasources/
      ├─ dtos/
      ├─ mappers/
      └─ repositories/


------------------------------------------------------------------------

# Feature依存ルール

------------------------------------------------------------------------

許可


Feature Presentation → Same Feature Application

Feature Application → Same Feature Domain

Feature Data → Same Feature Domain

Feature → Core

Feature → Shared Domain


慎重に許可


Feature A Application → Feature B Domain Contract


禁止


Feature A Screen → Feature B DataSource

Feature A RepositoryImpl → Feature B Screen

Core → Feature

Domain → Presentation


Feature間連携は

UseCase、Shared Domain、Event、

またはRepository Contractを利用する。

------------------------------------------------------------------------

# Shared

------------------------------------------------------------------------

sharedは

複数Featureで意味が共通する

Domain ObjectまたはPresentation部品に限定する。

例


shared/domain/value_objects/date_range.dart

shared/domain/value_objects/record_id.dart

shared/presentation/widgets/section_header.dart


何でもsharedへ入れない。

2回使用しただけで

即座に共通化しない。

------------------------------------------------------------------------

# State Management

------------------------------------------------------------------------

## 採用

Riverpod。

推奨

-   riverpod
-   flutter_riverpod
-   riverpod_annotation
-   riverpod_generator

------------------------------------------------------------------------

## Provider分類


Dependency Provider

Repository Provider

UseCase Provider

Query Provider

Controller Provider

Derived Provider


------------------------------------------------------------------------

## Dependency Provider

例

dart
@riverpod
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
}


------------------------------------------------------------------------

## Repository Provider

dart
@riverpod
BloodPressureRepository bloodPressureRepository(Ref ref) {
  return DriftBloodPressureRepository(
    ref.watch(appDatabaseProvider),
  );
}


------------------------------------------------------------------------

## UseCase Provider

dart
@riverpod
CreateBloodPressureRecordUseCase createRecordUseCase(Ref ref) {
  return CreateBloodPressureRecordUseCase(
    ref.watch(bloodPressureRepositoryProvider),
  );
}


------------------------------------------------------------------------

## Controller Provider

AsyncNotifierまたはNotifierを使用する。

例

dart
@riverpod
class BloodPressureInputController
    extends _$BloodPressureInputController {
  @override
  BloodPressureInputState build() {
    return BloodPressureInputState.initial();
  }

  Future<void> save() async {
    if (state.isSaving) {
      return;
    }

    state = state.copyWith(isSaving: true, error: null);

    final result = await ref
        .read(createRecordUseCaseProvider)
        .execute(state.toCommand());

    result.when(
      success: (_) {
        state = state.copyWith(
          isSaving: false,
          isSaved: true,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isSaving: false,
          error: error,
        );
      },
    );
  }
}


------------------------------------------------------------------------

## watch・read

watch

表示に必要な状態。

read

Event処理。

listen

Navigation、SnackBarなどの

一度だけの副作用。

Build中に

Navigationを直接実行しない。

------------------------------------------------------------------------

## Provider Scope

App全体

-   Database
-   Repository
-   Settings
-   Theme
-   Router

Feature単位

-   Controller
-   Filter
-   Form State
-   Selected Period

Screen単位の一時Stateは

StatefulWidgetまたはHookを許可する。

------------------------------------------------------------------------

## AutoDispose

検索条件、Preview、

一時的な編集画面では

AutoDisposeを使用する。

入力中データを失うと困る場合は

keepAliveまたはDraft保存を検討する。

------------------------------------------------------------------------

# UI State

------------------------------------------------------------------------

## 共通状態


initial

loading

data

empty

failure


Command系


idle

submitting

success

failure


複雑な画面では

sealed classを使用する。

------------------------------------------------------------------------

## AsyncValue

Query系では

AsyncValueを利用可能とする。

ただし

複雑なError Recoveryや

複数処理状態がある場合は

専用State Modelを使用する。

------------------------------------------------------------------------

# Result・Error

------------------------------------------------------------------------

## Result型

Exceptionを

UIまで投げ続けない。

例

dart
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;
}

class Failure<T> extends Result<T> {
  const Failure(this.error);

  final AppError error;
}


------------------------------------------------------------------------

## AppError


validation

notFound

database

storage

permission

network

timeout

authentication

export

backup

ai

unknown


例

dart
sealed class AppError {
  const AppError({
    required this.code,
    this.cause,
  });

  final String code;
  final Object? cause;
}


------------------------------------------------------------------------

## Error Mapping


Low Level Exception
    ↓
Data Layer Error
    ↓
Domain / App Error
    ↓
Localized UI Message


UIへ

Exception Messageを直接表示しない。

------------------------------------------------------------------------

# Navigation

------------------------------------------------------------------------

## 採用

GoRouter。

## ルーター構成


Root Router
├─ Splash
├─ Onboarding
├─ Initial Settings
├─ ShellRoute
│  ├─ Home
│  ├─ History
│  ├─ Graph
│  ├─ Statistics
│  └─ Settings
├─ Record Input
├─ Record Detail
├─ Record Edit
├─ Reminder
├─ Export
├─ Backup
└─ AI Result


------------------------------------------------------------------------

## Route Name


splash

onboarding

home

history

graph

statistics

settings

recordInput

recordDetail

recordEdit


Path文字列を

Widget内へ直接記述しない。

------------------------------------------------------------------------

## Route Parameter

Primitive値またはIDを渡す。

Entity全体を

extraで渡すことへ依存しない。

例


/records/:recordId


画面側で

Repositoryから最新Entityを取得する。

------------------------------------------------------------------------

## Redirect

使用例

-   Onboarding未完了
-   Initial Settings未完了
-   App Lock
-   Restore中
-   Deep Link Validation

Redirect内で

重い非同期処理を行わない。

------------------------------------------------------------------------

## Navigation Side Effect

Provider Listenerまたは

Controller Resultを利用する。

dart
ref.listen(
  bloodPressureInputControllerProvider,
  (previous, next) {
    if (next.isSaved && previous?.isSaved != true) {
      context.goNamed('home');
    }
  },
);


------------------------------------------------------------------------

# Database

------------------------------------------------------------------------

## 採用

Drift。

目的

-   型安全SQL
-   Migration
-   Stream Query
-   Transaction
-   Test
-   SQLite利用

------------------------------------------------------------------------

## Database構成


core/database/
├─ app_database.dart
├─ tables/
├─ daos/
├─ migrations/
└─ converters/


Feature固有DAOを

Feature Data Layerへ置く構成も許可する。

------------------------------------------------------------------------

## 主要Table


blood_pressure_records

measurement_sessions

measurements

record_tags

reminder_schedules

app_settings

backup_history

ai_generated_contents


------------------------------------------------------------------------

## Transaction

複数回測定保存時


Measurement Session

Individual Measurements

Representative Record

Tags


を1Transactionで保存する。

一部だけ保存された状態を作らない。

------------------------------------------------------------------------

## Migration

Schema Versionを管理する。

必須

-   Migration Test
-   Backup
-   Roll Forward方針
-   Data Integrity Check

Productionで

破壊的Migrationを安易に行わない。

------------------------------------------------------------------------

# Storage

------------------------------------------------------------------------

## Drift

構造化された永続データ。

-   Blood Pressure Records
-   Reminder
-   Backup History
-   AI Metadata

## SharedPreferences

機密性の低い設定。

-   Theme
-   Text Size
-   Button Size
-   Onboarding Complete
-   Recording Preference

## Secure Storage

機密性の高い値。

-   Authentication Token
-   Encryption Key Reference
-   App Lock関連
-   Backup Credential Reference

## File System

-   Export PDF
-   CSV
-   Backup File
-   Temporary Preview

------------------------------------------------------------------------

# Domain Rule

------------------------------------------------------------------------

## Validation

Domain Value Objectまたは

Domain Serviceへ置く。

UI Validationは

利用者向け表示タイミングを担当する。

同じRuleを

UIとDomainで別々に定義しない。

------------------------------------------------------------------------

## Time Period

TimePeriodClassificationServiceで

Morning、Daytime、Eveningを分類する。

設定変更可能な境界は

Policyとして注入する。

------------------------------------------------------------------------

## Multiple Measurement

MeasurementAggregationServiceで

-   Average
-   Last
-   Lowest
-   User Selected

を処理する。

表示Widgetで計算しない。

------------------------------------------------------------------------

## Statistics

StatisticsCalculationServiceまたは

Query Serviceで集計する。

大量データでは

SQL集計を利用する。

------------------------------------------------------------------------

# Notification

------------------------------------------------------------------------

通知機能は

Platform Pluginを直接Featureから呼ばない。


Reminder UseCase
    ↓
NotificationScheduler Interface
    ↓
LocalNotificationScheduler


Interfaceは

ApplicationまたはDomain境界へ置く。

------------------------------------------------------------------------

## Notification ID

安定したID生成Ruleを持つ。

Reminder Entity IDと

Platform Notification IDの対応を管理する。

------------------------------------------------------------------------

# Export

------------------------------------------------------------------------


Export Screen
    ↓
Export Controller
    ↓
CreateExportUseCase
    ↓
Export Repository
    ↓
PDF / CSV Generator
    ↓
File Storage


PDF生成と

Share起動を分離する。

------------------------------------------------------------------------

# Backup

------------------------------------------------------------------------


Backup Controller
    ↓
CreateBackupUseCase
    ↓
Backup Repository
    ↓
Database Export
    ↓
Encryption
    ↓
File / Cloud Storage


Restore


Select File
    ↓
Validate
    ↓
Preview
    ↓
User Confirm
    ↓
Transaction Restore
    ↓
Integrity Check


------------------------------------------------------------------------

# AI Architecture

------------------------------------------------------------------------

AI機能は

core/aiとFeatureで分離する。


AI Feature Screen
    ↓
AI Feature Controller
    ↓
AI Workflow
    ↓
Prompt Builder
    ↓
AI Repository
    ↓
Backend API


AI Featureから

BloodPressure Databaseへ直接アクセスしない。

通常Repository経由で

必要最小限のデータを取得する。

------------------------------------------------------------------------

## AI停止時

-   Record機能は利用可能
-   Historyは利用可能
-   Graphは利用可能
-   Statisticsは利用可能
-   ExportはAIなしで利用可能
-   Backupは利用可能

AI Layerは

Core Domainの必須依存にしない。

------------------------------------------------------------------------

# Dependency Injection

------------------------------------------------------------------------

Riverpod Providerで行う。

Constructor Injectionを基本とする。

禁止

-   Global Service Locator乱用
-   static Singleton直接参照
-   Repository内部で別Repositoryを生成
-   Widget内でDatabase生成
-   API Clientの直接new

------------------------------------------------------------------------

## Provider Override

Test・Flavorで

Dependencyを差し替える。

例

dart
ProviderScope(
  overrides: [
    bloodPressureRepositoryProvider.overrideWithValue(
      FakeBloodPressureRepository(),
    ),
  ],
  child: const App(),
);


------------------------------------------------------------------------

# Configuration

------------------------------------------------------------------------

Flavor


development

staging

production


設定


API Base URL

Logging Level

AI Enabled

Analytics Enabled

Crash Reporting Enabled

Database Name


秘密情報を

Dart Sourceへ直接記述しない。

------------------------------------------------------------------------

# Bootstrap

------------------------------------------------------------------------

起動順


WidgetsFlutterBinding

Environment Load

Logging Initialize

Database Initialize

Storage Initialize

Notification Initialize

Crash Reporting Initialize

ProviderScope

runApp


一部初期化失敗で

アプリ全体が起動不能にならない設計を検討する。

------------------------------------------------------------------------

## bootstrap例

dart
Future<void> bootstrap(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  final overrides = await buildProviderOverrides(environment);

  runApp(
    ProviderScope(
      overrides: overrides,
      child: const BloodPressureApp(),
    ),
  );
}


------------------------------------------------------------------------

# Localization

------------------------------------------------------------------------

Flutter gen_l10nまたは

ARBを使用する。


app_ja.arb

app_en.arb


文字列を

Widget、UseCase、Repositoryへ直接記述しない。

Domain Errorは

Codeを返し、

PresentationでLocalized Messageへ変換する。

------------------------------------------------------------------------

# Theme

------------------------------------------------------------------------

ThemeDataとThemeExtensionを使用する。

参照

-   Colors.md
-   Typography.md
-   Components.md
-   Animation.md
-   Emotion.md

Widgetへ

固定色、固定文字サイズ、

任意Durationを直接記述しない。

------------------------------------------------------------------------

# Logging

------------------------------------------------------------------------

Log Level


debug

info

warning

error


記録可能

-   Feature
-   Operation
-   Error Code
-   Duration
-   Record Count
-   App Version

記録禁止

-   Raw SYS・DIA
-   Memo本文
-   Personal Data
-   Full Backup Path
-   AI Full Prompt
-   AI Full Response

------------------------------------------------------------------------

# Analytics

------------------------------------------------------------------------

Event例


record_create_completed

history_filter_applied

graph_period_changed

export_completed

backup_completed

ai_summary_requested


Health Dataを

Analytics Parameterへ含めない。

------------------------------------------------------------------------

# Security

------------------------------------------------------------------------

-   API KeyをClientへ埋め込まない
-   TokenをSecure Storageへ保存する
-   Backup暗号化を検討する
-   Temporary Fileを削除する
-   Screenshot保護は設定可能性を検討する
-   Root・Jailbreak検知へ過度に依存しない
-   Logへ健康データを残さない
-   Deep Link入力をValidationする
-   File ImportをValidationする
-   SQL InjectionはParameter Queryで防ぐ

------------------------------------------------------------------------

# Performance

------------------------------------------------------------------------

-   大量履歴はPagingまたはVirtualized List
-   Graph用データを事前集計
-   Build内で重い計算をしない
-   Providerを細かくselectする
-   const Widgetを使用する
-   RepaintBoundaryを必要箇所へ使用する
-   Database Indexを設定する
-   Export処理をUI Threadへ集中させない
-   JSON・PDF生成のIsolate利用を検討する
-   不要なProvider再計算を防ぐ

------------------------------------------------------------------------

## Database Index例

-   measuredAt
-   timePeriod
-   sessionId
-   createdAt
-   tagId

------------------------------------------------------------------------

# Accessibility

------------------------------------------------------------------------

Architectureとして

Accessibilityを後付けにしない。

共通対応

-   Semantics Widget
-   Text Scale
-   High Contrast
-   Reduce Motion
-   Focus Order
-   Keyboard Navigation
-   Accessible Error
-   Screen Reader Announcement

Core Widgetへ

共通Accessibility処理を集約する。

------------------------------------------------------------------------

# Code Generation

------------------------------------------------------------------------

使用候補

-   riverpod_generator
-   freezed
-   json_serializable
-   drift_dev
-   build_runner

Generated File


*.g.dart

*.freezed.dart


手動編集しない。

CIで

生成差分を確認する。

------------------------------------------------------------------------

# Lint

------------------------------------------------------------------------

flutter_lintsを基準に

custom_lintを追加する。

推奨

-   riverpod_lint
-   非同期Future未処理検出
-   BuildContext跨ぎ検出
-   公開API型明示
-   relative import方針
-   generated file除外

------------------------------------------------------------------------

# Testing Architecture

------------------------------------------------------------------------

## Unit Test

対象

-   Value Object
-   Domain Service
-   UseCase
-   Mapper
-   Validator
-   Repository Fake

## Widget Test

対象

-   Screen State
-   Form
-   Component
-   Accessibility
-   Error
-   Loading

## Integration Test

対象

-   Record Create
-   Edit
-   Delete
-   History
-   Export
-   Backup・Restore
-   Notification
-   AI Fallback

## Golden Test

対象

-   Major Screen
-   Core Component
-   Light・Dark
-   Text Scale
-   High Contrast

------------------------------------------------------------------------

## Test Directory


test/
├─ unit/
├─ widget/
├─ golden/
├─ fixtures/
├─ fakes/
└─ helpers/

integration_test/


Feature構造へ合わせる方法も許可する。

------------------------------------------------------------------------

## Fake・Mock

Repository Interfaceに対して

Fakeを優先する。

Pluginや外部APIは

MockまたはAdapter Fakeを使用する。

Databaseは

In Memory Driftを使用する。

------------------------------------------------------------------------

# CI/CD

------------------------------------------------------------------------

必須Check


flutter pub get

dart format --set-exit-if-changed

flutter analyze

flutter test

build_runner check

migration test

golden test


Release前

-   Android Build
-   iOS Build
-   Integration Test
-   Backup Restore Test
-   Privacy確認
-   AI Safety Test

------------------------------------------------------------------------

# Architecture Decision Record

------------------------------------------------------------------------

重要な設計判断は

ADRとして保存する。

例


ADR-001 Riverpod採用

ADR-002 GoRouter採用

ADR-003 Drift採用

ADR-004 Feature First採用

ADR-005 AI Backend Proxy採用


保存先


docs/06_Flutter/ADR/


------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   ScreenからDatabaseを直接呼ぶ
-   WidgetへBusiness Logicを書く
-   DomainからFlutterをimportする
-   Repository InterfaceをData Layerだけに置く
-   Feature間でDataSourceを直接共有する
-   BuildContextをControllerへ保存する
-   static Singletonを乱用する
-   ErrorをStringだけで扱う
-   Exception Messageをそのまま表示する
-   Route Pathを各Widgetへ直書きする
-   固定色・文字サイズ・Durationを直書きする
-   API Keyをアプリへ埋め込む
-   Raw Health DataをLogへ出す
-   AIを主要機能の必須依存にする
-   Generated Codeを編集する
-   MigrationなしでSchemaを変更する
-   すべてをsharedへ置く
-   1ファイルへ多数の責務を集約する

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Layer

-   PresentationからDataへ直接依存していない
-   DomainがFlutterへ依存していない
-   DataがDomain Contractを実装している
-   Repository境界が存在する
-   UseCaseが1主要目的である

## Feature

-   Feature First構成である
-   Feature間の直接依存が少ない
-   CoreからFeatureへ依存していない
-   Sharedが肥大化していない
-   Feature削除時の影響範囲が限定される

## Riverpod

-   DependencyをProviderで注入できる
-   Controllerが重複処理を防ぐ
-   watch・read・listenを使い分けている
-   AutoDisposeが適切である
-   TestでOverrideできる

## Navigation

-   Route Nameを使用する
-   IDで遷移できる
-   Entity全体へ依存しない
-   Deep LinkをValidationできる
-   ShellRouteでTab Stateを保持できる

## Database

-   Driftを使用する
-   Transactionがある
-   Migration Testがある
-   Indexがある
-   In Memory Testができる
-   一部保存を防止できる

## Error

-   AppError型がある
-   Error Mappingがある
-   Localized Messageへ変換できる
-   Raw Exceptionを表示しない
-   Recovery Actionがある

## Storage

-   構造化データをDriftへ保存する
-   設定をSharedPreferencesへ保存する
-   機密情報をSecure Storageへ保存する
-   Temporary Fileを削除できる

## AI

-   AIが通常機能から分離されている
-   AI停止時も主要機能を使用できる
-   AI Workflow経由で実行する
-   PromptをUIへ記述していない
-   Raw Health DataをLogへ保存しない

## Test

-   Domain Unit Testがある
-   UseCase Testがある
-   Repository Testがある
-   Widget Testがある
-   Integration Testがある
-   Golden Testがある
-   Accessibility Testがある

------------------------------------------------------------------------

## Acceptance Criteria

□ Feature First構成を採用できる

□ Presentation、Application、Domain、Dataを分離できる

□ 依存方向を定義できる

□ DomainをFlutter非依存にできる

□ EntityとDTOを分離できる

□ Repository InterfaceをDomainへ定義できる

□ Repository実装をDataへ定義できる

□ UseCaseをApplicationへ定義できる

□ Riverpodで状態管理できる

□ Provider経由で依存注入できる

□ Controllerで画面操作を管理できる

□ GoRouterで画面遷移を管理できる

□ ShellRouteで主要Tabを管理できる

□ DriftでLocal Databaseを実装できる

□ Transactionで複数回測定を保存できる

□ Database Migrationを管理できる

□ SharedPreferencesとSecure Storageを使い分けられる

□ NotificationをInterface経由で実装できる

□ Export処理をPresentationから分離できる

□ Backup・Restore処理を分離できる

□ AIを通常機能から分離できる

□ AI停止時も主要機能を利用できる

□ Errorを型として扱える

□ Raw ExceptionをUIへ表示しない

□ Localization Resourceで文言を管理できる

□ Design TokenをThemeへ反映できる

□ Raw Health DataをLogへ保存しない

□ Unit、Widget、Integration、Golden Testを実施できる

□ Provider OverrideでTest Dependencyへ差し替えられる

□ CIでFormat、Analyze、Testを実行できる

□ ADRで重要な設計判断を記録できる

------------------------------------------------------------------------

## 依存機能

F001 Blood Pressure Recording

F002 Home Dashboard

F003 History

F004 Graph

F005 Statistics

F006 Reminder

F007 Export

F008 Backup

F009 Settings

F011 Time Period Classification

F107 Multiple Measurement Aggregation

F201 AI Summary

F202 AI Advice

F203 Natural Language Search

------------------------------------------------------------------------

## 優先度

★★★★★（Flutter実装前に必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap_日本語版.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/Features/F001_BloodPressureRecording.md
-   02_UX/UserFlow.md
-   02_UX/Navigation.md
-   02_UX/ScreenList.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Colors.md
-   04_DesignSystem/Typography.md
-   04_DesignSystem/Components.md
-   04_DesignSystem/Animation.md
-   04_DesignSystem/Emotion.md
-   05_AI/Prompt.md
-   05_AI/AIWorkflow.md
-   06_Flutter/ProjectStructure.md
-   06_Flutter/DataModel.md
-   06_Flutter/StateManagement.md
-   07_Test/

------------------------------------------------------------------------

## 将来拡張

-   Web対応
-   Desktop対応
-   Tablet Adaptive Navigation
-   Multi Package構成
-   Melos
-   Modular Monorepo
-   Health Connect
-   Apple Health
-   Bluetooth血圧計
-   Cloud Sync
-   Multi Profile
-   Family Account
-   End to End Encryption
-   On Device AI
-   Feature Flag Platform
-   Remote Configuration
-   Advanced Observability
-   Modular Navigation
-   Offline First Sync Engine
-   Server Driven UI
