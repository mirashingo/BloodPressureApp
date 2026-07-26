# CODING_RULES.md

# BloodPressureApp AI開発コンテキスト

Version: 1.0

------------------------------------------------------------------------

# CODING_RULES

## ドキュメントID

AI-CONTEXT-CODING-RULES-001

------------------------------------------------------------------------

## 名称

BloodPressureApp Flutterコーディング共通ルール

------------------------------------------------------------------------

## 目的

BloodPressureAppのFlutter・Dart実装において、

コード構造、命名、型設計、

責務分離、状態管理、Database、

非同期処理、Error Handling、

Logging、Test、Generated Code、

Git運用、Code Review、

AIコード生成の基準を統一する。

本書は、

Flutter開発者、Reviewer、QA、

AI開発エージェントが共通で参照する。

AIは本書に従い、

動作するだけのコードではなく、

安全、正確、Test可能、

保守可能なコードを生成する。

------------------------------------------------------------------------

## 適用範囲

-   Dart
-   Flutter
-   Riverpod
-   GoRouter
-   Drift
-   Freezed
-   JSON Serialization
-   Notification
-   File
-   PDF
-   Backup
-   AI Feature
-   Unit Test
-   Widget Test
-   Integration Test
-   CI
-   Git
-   Pull Request
-   Code Review
-   Refactoring
-   Bug Fix

------------------------------------------------------------------------

## 基本方針

-   仕様を確認してから実装する
-   正確性を短さより優先する
-   Readabilityを技巧より優先する
-   型で不正状態を減らす
-   UIとBusiness Logicを分離する
-   DomainをFlutter非依存にする
-   Side Effectを境界へ閉じ込める
-   Health DataをLogへ出さない
-   Test可能な依存構造にする
-   不要な抽象化を作らない
-   重複を放置しない
-   早すぎる共通化をしない
-   Generated Codeを手動編集しない
-   Deprecated APIを避ける
-   Analyzer Warningを放置しない
-   Bug FixにはRegression Testを追加する
-   完了前にFormat、Analyze、Testを実行する

------------------------------------------------------------------------

# 指示の優先順位

------------------------------------------------------------------------

Coding判断は

次の順序で行う。


1. 安全性・Privacy・Data Integrity

2. Feature Requirements

3. AGENTS.md

4. CODING_RULES.md

5. Architecture.md

6. FolderStructure.md

7. Packages.md

8. Existing Code Convention

9. Dart・Flutter公式Style


下位ルールが

上位ルールと矛盾する場合は、

上位を優先する。

------------------------------------------------------------------------

# Target Environment

------------------------------------------------------------------------

## Flutter

Flutter Stable Channelを使用する。

------------------------------------------------------------------------

## Dart

Projectで固定された

Dart SDK Constraintに従う。

------------------------------------------------------------------------

## Null Safety

必須。

Sound Null Safetyを前提とする。

------------------------------------------------------------------------

## Platform

-   Android
-   iOS

将来のTablet対応を妨げない。

------------------------------------------------------------------------

# Formatter・Analyzer

------------------------------------------------------------------------

## Format


dart format .


または


flutter format


Project標準Commandを使用する。

------------------------------------------------------------------------

## Analyze


flutter analyze


必須。

Errorだけでなく

Warning、InfoもReviewする。

------------------------------------------------------------------------

## CI

Format違反、

Analyze Error、

Test Failureを

Merge Block条件とする。

------------------------------------------------------------------------

# File Rules

------------------------------------------------------------------------

## 1 File 1 Primary Responsibility

1つのFileへ

無関係なClassを大量に置かない。

------------------------------------------------------------------------

## File Length

行数だけで機械的に分割しない。

ただし

複数責務、

巨大Build Method、

多数のprivate classがある場合は

分割を検討する。

------------------------------------------------------------------------

## Part File

Generated Code以外で

`part`の乱用を避ける。

------------------------------------------------------------------------

## Barrel File

`index.dart`等の

Barrel Exportを乱用しない。

Import元が不明確になる場合は

直接Importを優先する。

------------------------------------------------------------------------

# Folder Rules

------------------------------------------------------------------------

参照


06_Flutter/FolderStructure.md


標準


lib/
├─ app/
├─ core/
├─ features/
├─ shared/
└─ main_*.dart


Feature


features/{feature}/
├─ presentation/
├─ application/
├─ domain/
└─ data/


------------------------------------------------------------------------

## 禁止配置

-   Business Logicをwidgetsへ置く
-   SQLをpresentationへ置く
-   PromptをScreenへ置く
-   File IOをControllerへ直書きする
-   Feature固有Codeをcoreへ置く
-   何でもsharedへ置く
-   巨大utils.dartへ集約する

------------------------------------------------------------------------

# Dependency Direction

------------------------------------------------------------------------

許可


Presentation → Application → Domain

Data → Domain


禁止


Domain → Flutter

Domain → Riverpod

Domain → Drift

Domain → Plugin

Data → Presentation

Core → Feature

Feature A → Feature B Data


------------------------------------------------------------------------

# Import Rules

------------------------------------------------------------------------

## Import順序

推奨


1. Dart SDK

2. Flutter SDK

3. External Package

4. Project Package Import


Group間を空行で区切る。

------------------------------------------------------------------------

## Package Import

Project内は

原則としてPackage Importを使用する。

例

dart
import 'package:blood_pressure_app/features/record/domain/entities/blood_pressure_record.dart';


同一File近傍で

Project ConventionがRelative Importの場合は

既存規則へ合わせる。

混在を避ける。

------------------------------------------------------------------------

## Unused Import

残さない。

------------------------------------------------------------------------

## Internal Package API

Packageのinternal pathへ

依存しない。

------------------------------------------------------------------------

# Naming Rules

------------------------------------------------------------------------

## File・Folder


snake_case


例


blood_pressure_record.dart

save_record_use_case.dart


------------------------------------------------------------------------

## Class・Enum・Extension・Typedef


UpperCamelCase


------------------------------------------------------------------------

## Variable・Function・Parameter


lowerCamelCase


------------------------------------------------------------------------

## Constant

Dart標準に従い


lowerCamelCase


を基本とする。

------------------------------------------------------------------------

## Private


_leadingUnderscore


------------------------------------------------------------------------

## Boolean

状態が分かる名前を使用する。

良い例


isLoading

hasRecords

canSave

shouldNotify


悪い例


flag

check

status


------------------------------------------------------------------------

## Collection

複数形を使用する。


records

measurements

selectedTags


------------------------------------------------------------------------

## Callback


onSave

onDelete

onChanged

onRetry


------------------------------------------------------------------------

## Provider


{target}Provider


例


recordRepositoryProvider

saveRecordUseCaseProvider

recordInputControllerProvider


------------------------------------------------------------------------

## UseCase

Class


SaveBloodPressureRecordUseCase


File


save_blood_pressure_record_use_case.dart


------------------------------------------------------------------------

## Repository

Interface


BloodPressureRecordRepository


Implementation


DriftBloodPressureRecordRepository


------------------------------------------------------------------------

## DTO・Data Model


BloodPressureRecordDto

BloodPressureRecordRow


Domain Entityと

区別する。

------------------------------------------------------------------------

## Error


RecordValidationError

DatabaseFailure

AppError


------------------------------------------------------------------------

## 禁止曖昧名

-   data
-   item
-   temp
-   value
-   info
-   result
-   manager
-   helper
-   common
-   misc

Context上明確な

局所変数を除く。

------------------------------------------------------------------------

# Type Rules

------------------------------------------------------------------------

## 型推論

明確なLocal Variableでは

型推論を使用してよい。

Public API、

Field、

曖昧なCollectionでは

明示型を優先する。

------------------------------------------------------------------------

## dynamic

原則禁止。

External JSON境界など

避けられない場合は

即座にValidation・変換する。

------------------------------------------------------------------------

## Object?

意味が曖昧になるため

汎用Storageとして使わない。

------------------------------------------------------------------------

## Map<String, dynamic>

Data境界以外で

Domain Model代わりに使わない。

------------------------------------------------------------------------

## Primitive Obsession

重要なDomain概念は

Value Object化を検討する。

例

-   SystolicPressure
-   DiastolicPressure
-   PulseRate
-   MeasurementTime
-   AggregationMethod

------------------------------------------------------------------------

## Nullable

`null`の意味を明確にする。

例

Pulse null


未入力


であり、

0ではない。

------------------------------------------------------------------------

## late

初期化保証が明確な場合だけ使用する。

安易なNull回避に使わない。

------------------------------------------------------------------------

## required

必須Parameterへ使用する。

------------------------------------------------------------------------

# Class Design

------------------------------------------------------------------------

## Single Responsibility

Classは

変更理由を一つにする。

------------------------------------------------------------------------

## Immutability

Domain Entity、

UI State、

DTOは

可能な限りImmutableにする。

------------------------------------------------------------------------

## Constructor

不正な状態を作れない

Constructorを目指す。

------------------------------------------------------------------------

## Factory

Validationや変換を伴う場合に使用する。

------------------------------------------------------------------------

## Static Utility

状態を持たない

純粋変換に限定する。

Business Ruleを

Utilityへ隠さない。

------------------------------------------------------------------------

## Inheritance

継承より

Compositionを優先する。

------------------------------------------------------------------------

## Abstract Class

実装差し替えが必要な境界に使用する。

将来使うかもしれない理由だけで

作らない。

------------------------------------------------------------------------

# Domain Rules

------------------------------------------------------------------------

Domainは

Flutter、Riverpod、Drift、

BuildContext、Pluginを知らない。

------------------------------------------------------------------------

## Entity

Identityを持つ。

------------------------------------------------------------------------

## Value Object

値の正当性と

等価性を持つ。

------------------------------------------------------------------------

## Domain Service

複数Entity・Value Objectにまたがる

Business Ruleを扱う。

------------------------------------------------------------------------

## Policy

利用者設定で変化するRuleを扱う。

例

-   Time Period Classification
-   Aggregation Method

------------------------------------------------------------------------

## Repository Interface

DomainまたはApplicationが必要とする

操作だけを定義する。

Database用語を露出しない。

------------------------------------------------------------------------

# F001 Coding Rules

------------------------------------------------------------------------

F001は

記録Domainの基準である。

------------------------------------------------------------------------

## Source of Truth

-   SYS
-   DIA
-   Pulse
-   Measured At
-   Time Period
-   Memo
-   Tags
-   Measurement Session
-   Representative Value

はDomain Modelを基準にする。

------------------------------------------------------------------------

## Validation

UI Validationと

Domain Validationの役割を分ける。

UI

-   即時Feedback
-   入力形式

Domain

-   Business Rule
-   保存可能性
-   不変条件

最終判定はDomainで行う。

------------------------------------------------------------------------

## Multiple Measurement

計算を

WidgetやControllerへ書かない。

Domain Serviceへ置く。

対応

-   Single
-   Average
-   Last
-   Lowest
-   User Selected

------------------------------------------------------------------------

## Floating Point

血圧値の平均で

丸めRuleを明示する。

暗黙のDouble表示をしない。

------------------------------------------------------------------------

## Transaction

Session、

Individual Measurements、

Representative Record、

Tagsを

1Transactionで保存する。

------------------------------------------------------------------------

# Function Rules

------------------------------------------------------------------------

## Small・Focused

Functionは

1つの目的を持つ。

------------------------------------------------------------------------

## Parameter

Parameterが多い場合は

Command Object、

Value Object、

Named Parameterを検討する。

------------------------------------------------------------------------

## Named Parameter

可読性が必要なPublic APIで使用する。

------------------------------------------------------------------------

## Return

副作用だけのFunctionでも

失敗可能性がある場合は

結果型を検討する。

------------------------------------------------------------------------

## Pure Function

計算、Validation、

Mappingは

可能な限りPureにする。

------------------------------------------------------------------------

## Early Return

Nestを減らすために使用する。

------------------------------------------------------------------------

## Side Effect

Function名から

副作用が推測できるようにする。

------------------------------------------------------------------------

# Control Flow Rules

------------------------------------------------------------------------

## If

深いNestを避ける。

Guard Clauseを使用する。

------------------------------------------------------------------------

## Switch

Enum・Sealed Classに対し

Exhaustiveに扱う。

------------------------------------------------------------------------

## Pattern Matching

Project Dart Versionで

利用可能な場合は

可読性向上に使用する。

------------------------------------------------------------------------

## Loop

Collection Methodが

明確な場合は使用する。

ただしChainを長くしすぎない。

------------------------------------------------------------------------

## Ternary

単純な分岐に限定する。

Nested Ternaryは禁止。

------------------------------------------------------------------------

# Async Rules

------------------------------------------------------------------------

## async・await

Callback Chainより

async・awaitを優先する。

------------------------------------------------------------------------

## Unawaited

意図的に待たない場合は

理由を明確にし、

利用可能なら`unawaited`を使う。

------------------------------------------------------------------------

## Future Error

未処理Errorを残さない。

------------------------------------------------------------------------

## Timeout

Network、AI、File等は

適切なTimeoutを持つ。

------------------------------------------------------------------------

## Cancel

AI生成、

大容量Export、

Restore等は

Cancel可能性を検討する。

------------------------------------------------------------------------

## Parallel

依存しない処理のみ

`Future.wait`を使用する。

------------------------------------------------------------------------

## mounted

StatefulWidgetで

await後にContextを使う場合は

mountedを確認する。

ただし

Navigation等はController Side Effect設計を優先する。

------------------------------------------------------------------------

# Riverpod Rules

------------------------------------------------------------------------

## Provider役割

-   Dependency Provider
-   Repository Provider
-   UseCase Provider
-   Query Provider
-   Controller Provider
-   Derived Provider

------------------------------------------------------------------------

## watch

表示に必要なStateを購読する。

------------------------------------------------------------------------

## read

Event Handlerで

処理を実行する。

------------------------------------------------------------------------

## listen

Navigation、

Snackbar、

Dialog等の

一時的Side Effectへ使用する。

------------------------------------------------------------------------

## select

必要なPropertyだけを購読し、

不要なRebuildを減らす。

------------------------------------------------------------------------

## Provider Scope

必要以上にGlobalへしない。

------------------------------------------------------------------------

## autoDispose

短命画面で検討する。

Data保持要件を確認する。

------------------------------------------------------------------------

## keepAlive

理由を持って使用する。

------------------------------------------------------------------------

## Controller

Controllerは

-   UseCase呼び出し
-   UI State更新
-   重複処理防止
-   Retry
-   Cancel

を担当する。

SQL、File IO、Prompt詳細を

直接持たない。

------------------------------------------------------------------------

## BuildContext

Provider・Controllerへ保持しない。

------------------------------------------------------------------------

# UI Coding Rules

------------------------------------------------------------------------

## Widget

表示責務に集中する。

------------------------------------------------------------------------

## Build Method

巨大化した場合は

意味のあるprivate Widgetや

Componentへ分割する。

単に行数を減らすだけの

private method乱用を避ける。

------------------------------------------------------------------------

## StatefulWidget

Local UI Stateが必要な場合に使用する。

Business Stateを持たせない。

------------------------------------------------------------------------

## const

可能なConstructorへ付与する。

------------------------------------------------------------------------

## Key

List、Animation、

State保持に必要な場合に使用する。

無意味にGlobalKeyを使わない。

------------------------------------------------------------------------

## Build内禁止

-   Database Access
-   Network Request
-   AI Request
-   File IO
-   重い計算
-   Navigation
-   Provider更新

------------------------------------------------------------------------

## Text

Hardcodeせず

Localization Resourceを使用する。

開発中の一時文言を

Productionへ残さない。

------------------------------------------------------------------------

## Style

Theme・Design Tokenを使用する。

Color、TextStyle、Spacingを

Screenへ直書きしない。

------------------------------------------------------------------------

# GoRouter Rules

------------------------------------------------------------------------

-   Route Nameを定義する
-   Pathを一元管理する
-   WidgetへPath Literalを書かない
-   IDをParameterとして渡す
-   Entity全体をRouteへ渡さない
-   Invalid ParameterをValidationする
-   Deep LinkをValidationする
-   RedirectにBusiness Logicを詰め込まない
-   ShellRouteでMain Navigationを管理する

------------------------------------------------------------------------

# Drift Rules

------------------------------------------------------------------------

## Table

明確なColumn名を使用する。

------------------------------------------------------------------------

## DateTime

保存形式を統一する。

Timezone方針をDocument化する。

------------------------------------------------------------------------

## Nullable

Domain意味と一致させる。

------------------------------------------------------------------------

## Query

Parameter Bindingを使用する。

String連結SQLを避ける。

------------------------------------------------------------------------

## Index

Filter、Sort、

Joinの利用実態に基づいて追加する。

------------------------------------------------------------------------

## Transaction

複数Tableの一貫保存で必須。

------------------------------------------------------------------------

## DAO

Feature単位で責務を分ける。

巨大DAOを作らない。

------------------------------------------------------------------------

## Repository

Drift Rowを

Presentationへ返さない。

Domain EntityへMappingする。

------------------------------------------------------------------------

## Migration

Schema変更時に必須。

Migration Testを追加する。

------------------------------------------------------------------------

# Mapping Rules

------------------------------------------------------------------------

明示的Mapperを使用する。


Drift Row
    ↓
DTO
    ↓
Domain Entity


必要に応じて

簡略化してよいが、

境界を曖昧にしない。

------------------------------------------------------------------------

## 禁止

-   UIでRowを直接使用
-   Domain EntityへDatabase Annotation
-   JSON MapをDomainとして流通
-   Mapping時の暗黙Default乱用

------------------------------------------------------------------------

# Freezed Rules

------------------------------------------------------------------------

対象候補

-   Immutable State
-   Union State
-   DTO
-   Domain Value

------------------------------------------------------------------------

## copyWith

State更新に利用する。

------------------------------------------------------------------------

## Union

Loading、Data、Error等の

状態差が明確な場合に使用する。

過剰なUnionを避ける。

------------------------------------------------------------------------

## Generated Code

手動編集しない。

------------------------------------------------------------------------

# Error Handling Rules

------------------------------------------------------------------------

## Layer変換


Plugin・Database Exception

Data Failure

Application Error

UI Message


------------------------------------------------------------------------

## Exception表示

`exception.toString()`を

利用者へ表示しない。

------------------------------------------------------------------------

## Typed Error

可能な限り

意味のあるError型を使用する。

例

-   ValidationError
-   RecordNotFoundError
-   DatabaseWriteError
-   BackupFormatError
-   AiTimeoutError
-   AiSafetyError

------------------------------------------------------------------------

## Catch

広すぎるCatchで

Errorを隠さない。

------------------------------------------------------------------------

## Rethrow

Context追加がない場合は

無意味にCatchして投げ直さない。

------------------------------------------------------------------------

## Retry

再試行可能なErrorだけに提供する。

無制限Retryは禁止。

------------------------------------------------------------------------

# Result Type Rules

------------------------------------------------------------------------

Projectで採用する

Result・Either表現を統一する。

同じProject内で

複数方式を混在させない。

例


Result<T, AppError>


または

Exception Strategy。

Architecture文書へ従う。

------------------------------------------------------------------------

# Logging Rules

------------------------------------------------------------------------

## Log可能

-   Operation Name
-   Feature ID
-   Error Code
-   Duration
-   Record Count
-   App Version
-   Build Number

------------------------------------------------------------------------

## Log禁止

-   SYS
-   DIA
-   Pulse
-   Memo
-   Full Record
-   Personal Identifier
-   Full Prompt
-   Full AI Response
-   Token
-   API Key
-   Encryption Key
-   Backup Content

------------------------------------------------------------------------

## Level

-   debug
-   info
-   warning
-   error

用途を統一する。

------------------------------------------------------------------------

## Production

Debug Logを

必要最小限にする。

------------------------------------------------------------------------

# Security Coding Rules

------------------------------------------------------------------------

-   SecretをSourceへ書かない
-   API KeyをClient Bundleへ含めない
-   TokenをSecure Storageへ保存する
-   File PathをValidationする
-   Import File Sizeを制限する
-   Zip Slipを防ぐ
-   Path Traversalを防ぐ
-   Deep LinkをValidationする
-   SQL Parameter Bindingを使用する
-   Temporary Fileを削除する
-   Sensitive DataをClipboardへ残さない
-   Cryptographyを自作しない

------------------------------------------------------------------------

# Privacy Coding Rules

------------------------------------------------------------------------

-   Local First
-   Data Minimization
-   Explicit Consent
-   External送信前の確認
-   AnalyticsへHealth Dataを送らない
-   Crash LogへMemoを送らない
-   Test Fixtureへ実データを使わない
-   Screenshotへ実データを使わない
-   Delete Allを実装する
-   Backup FileのRiskを説明する

------------------------------------------------------------------------

# AI Coding Rules

------------------------------------------------------------------------

## Client

AI Provider SDKを

Clientへ直接組み込まないことを基本とする。

Backend Adapterを使用する。

------------------------------------------------------------------------

## Prompt

Promptを

Widgetへ直書きしない。

Version管理されたAsset・Repositoryから取得する。

------------------------------------------------------------------------

## Workflow


Consent

Data Selection

Local Aggregation

Prompt Build

Request

Parse

Schema Validation

Safety Validation

Grounding Validation

Display


------------------------------------------------------------------------

## AI State

-   idle
-   preparing
-   requesting
-   validating
-   success
-   failure
-   cancelled

を明確にする。

------------------------------------------------------------------------

## Timeout・Retry

-   Timeoutあり
-   Retry上限あり
-   Backoff検討
-   Cancel可能
-   Duplicate Request防止

------------------------------------------------------------------------

## Safety

Unsafe Responseを

UIへそのまま表示しない。

------------------------------------------------------------------------

## Grounding

AIが返した数値を

Local Sourceと照合する。

------------------------------------------------------------------------

## Fallback

AIなしでも

Local Summaryまたは通常画面を表示する。

------------------------------------------------------------------------

# Notification Coding Rules

------------------------------------------------------------------------

-   Permission状態をRepository経由で扱う
-   OS PluginをUIから直接呼ばない
-   Timezoneを考慮する
-   Notification IDを一元管理する
-   Update・CancelをTest可能にする
-   Deep Link PayloadをValidationする
-   Platform差をAdapterへ閉じ込める

------------------------------------------------------------------------

# File・Export Rules

------------------------------------------------------------------------

-   File操作をRepository・Service境界へ置く
-   Temporary Directoryを使用する
-   成功・失敗時にCleanupする
-   File NameをSanitizeする
-   Encodingを明示する
-   CSV Escapeを正しく行う
-   PDF Fontを確認する
-   Large ExportでMemoryを考慮する
-   Share CancelをError扱いしない

------------------------------------------------------------------------

# Backup・Restore Coding Rules

------------------------------------------------------------------------

## Backup

-   Versionを含める
-   Schemaを明示する
-   Hashを含める
-   Encryptionを検討する
-   Atomic Writeを使用する
-   Partial Fileを残さない

------------------------------------------------------------------------

## Restore

-   Extension Validation
-   Size Validation
-   Version Validation
-   Hash Validation
-   Content Validation
-   Preview
-   Transaction
-   Integrity Check
-   Failure時Rollback

------------------------------------------------------------------------

# Performance Rules

------------------------------------------------------------------------

-   Build内で重い処理をしない
-   Large ListはLazy Buildする
-   Provider selectを使用する
-   Database Indexを使用する
-   Graph Dataを必要期間だけ取得する
-   Image Decode Sizeを適切にする
-   Unnecessary Object Allocationを減らす
-   Isolate利用は計測後に判断する
-   Premature Optimizationを避ける
-   Performance変更は計測する

------------------------------------------------------------------------

# Memory Rules

------------------------------------------------------------------------

-   Stream Subscriptionを解放する
-   ControllerをDisposeする
-   Large Byte Listを保持し続けない
-   Image Cache影響を確認する
-   Provider Life Cycleを確認する
-   BuildContextを長期保持しない

------------------------------------------------------------------------

# Localization Coding Rules

------------------------------------------------------------------------

-   StringをHardcodeしない
-   Sentenceを文字列連結しない
-   PlaceholderをLocalizationへ定義する
-   Date・NumberをintlでFormatする
-   LocaleごとのPluralを考慮する
-   Error MessageをLocalizationする
-   AI DisclaimerをLocalizationする
-   PDF文言もLocalizationする

------------------------------------------------------------------------

# Accessibility Coding Rules

------------------------------------------------------------------------

-   Semantics Labelを設定する
-   Icon ButtonへTooltip・Labelを付ける
-   Focus Orderを確認する
-   Errorを読み上げる
-   Text ScaleでClipしない
-   Fixed Heightを避ける
-   Touch Targetを確保する
-   Colorだけで状態を示さない
-   GraphにText Alternativeを用意する
-   Reduce Motion Preferenceを尊重する

------------------------------------------------------------------------

# Comment Rules

------------------------------------------------------------------------

## コメントする内容

-   Why
-   制約
-   非自明なBusiness Rule
-   Platform Workaround
-   Security理由
-   Migration理由

------------------------------------------------------------------------

## コメントしない内容

Codeを読めば分かる

Whatの繰り返し。

------------------------------------------------------------------------

## TODO

必ず

Issue・担当・理由のいずれかを含める。

例

dart
// TODO(#123): Android 16対応後に削除する。


------------------------------------------------------------------------

# Documentation Comment

------------------------------------------------------------------------

Public APIで

利用方法や制約が

自明でない場合に記述する。

`///`を使用する。

------------------------------------------------------------------------

# Generated Code Rules

------------------------------------------------------------------------

対象例


*.g.dart

*.freezed.dart

*.mocks.dart

drift schema files


------------------------------------------------------------------------

## 必須

-   生成元を変更する
-   build_runnerを実行する
-   Generated DiffをReviewする
-   CIで生成漏れを検知する

------------------------------------------------------------------------

## 禁止

-   手動編集
-   Generated Fileだけ修正
-   一部Copy
-   `.gitignore`へ無計画に追加

------------------------------------------------------------------------

# Test Coding Rules

------------------------------------------------------------------------

## Structure

Given・When・Thenを意識する。

------------------------------------------------------------------------

## Test Name

条件と期待結果を

日本語またはProject標準言語で明確にする。

例


SYSが未入力のとき、保存できず必須エラーを返す


------------------------------------------------------------------------

## Arrange

必要Dataだけを準備する。

------------------------------------------------------------------------

## Act

1つの主要操作を行う。

------------------------------------------------------------------------

## Assert

期待結果を具体的に確認する。

------------------------------------------------------------------------

## Fake・Mock

-   Fakeを優先
-   Interaction確認が必要な場合にMock
-   External Boundaryを差し替える
-   Domain Objectを過度にMockしない

------------------------------------------------------------------------

## Time

Clockを注入する。

現在時刻へ直接依存しない。

------------------------------------------------------------------------

## Random

Seedを固定する。

------------------------------------------------------------------------

## Database

In Memory Driftを使用する。

------------------------------------------------------------------------

## Golden

無確認更新を禁止する。

------------------------------------------------------------------------

## Regression

Bug Fixごとに追加する。

------------------------------------------------------------------------

# Test Directory

------------------------------------------------------------------------

Production構成と

対応させる。


test/
├─ app/
├─ core/
├─ features/
├─ shared/
├─ fixtures/
├─ fakes/
├─ helpers/
└─ golden/

integration_test/


------------------------------------------------------------------------

# Fixture Rules

------------------------------------------------------------------------

-   架空Dataのみ
-   Health Dataを個人へ結び付けない
-   Boundary Valueを含める
-   Pulse nullを含める
-   Multiple Measurementを含める
-   Timezoneを含める
-   Large Datasetを用意する
-   Fixture名から目的を分かるようにする

------------------------------------------------------------------------

# Dependency Injection Rules

------------------------------------------------------------------------

-   Riverpod Providerで注入する
-   Repository Interfaceを境界にする
-   Clockを注入する
-   UUID Generatorを注入する
-   File System Adapterを注入する
-   Notification Adapterを注入する
-   AI Clientを注入する
-   TestでOverride可能にする

------------------------------------------------------------------------

# Package Rules

------------------------------------------------------------------------

参照


06_Flutter/Packages.md


追加時

-   必要性
-   代替
-   Maintenance
-   License
-   Platform
-   Privacy
-   App Size
-   Test
-   Native設定

を確認する。

------------------------------------------------------------------------

# Git Rules

------------------------------------------------------------------------

## Branch


feature/f001-recording

fix/record-validation

refactor/history-query

docs/coding-rules


------------------------------------------------------------------------

## Commit

-   1 Commit 1目的
-   Build可能
-   Test可能
-   Secretなし
-   Generated Code同期
-   Messageで変更内容が分かる

------------------------------------------------------------------------

## Commit Message例


feat(record): 複数回測定の平均保存を追加

fix(history): 日付境界の並び順を修正

test(backup): 復元失敗時のrollback testを追加


------------------------------------------------------------------------

# Pull Request Rules

------------------------------------------------------------------------

必須

-   Purpose
-   Related Feature ID
-   Changes
-   Test
-   Screenshot
-   Database・Migration
-   Privacy
-   Security
-   AI Impact
-   Risk
-   Rollback

------------------------------------------------------------------------

## PR Size

Review可能な

小さな単位を優先する。

大規模変更は

段階的に分割する。

------------------------------------------------------------------------

# Code Review Rules

------------------------------------------------------------------------

Reviewerは

次を確認する。

-   Specification
-   Architecture
-   Dependency Direction
-   Naming
-   Type Safety
-   State Management
-   Async
-   Error Handling
-   Data Integrity
-   Database
-   Privacy
-   Security
-   Accessibility
-   Performance
-   Test
-   Documentation
-   AI Safety

------------------------------------------------------------------------

## Review Comment

-   問題
-   理由
-   修正案
-   Severity

を明確にする。

好みだけで

Blockしない。

------------------------------------------------------------------------

# Refactoring Rules

------------------------------------------------------------------------

-   外部挙動を変えない
-   Testを先に確認する
-   小さく進める
-   Mechanical ChangeとBehavior Changeを分ける
-   Renameを明確にする
-   Migrationを不要に発生させない
-   Performanceを計測する
-   Documentation影響を確認する

------------------------------------------------------------------------

# Bug Fix Rules

------------------------------------------------------------------------


1. 再現する

2. 仕様を確認する

3. Root Causeを特定する

4. Regression Testを追加する

5. 最小修正する

6. 周辺Testを実行する

7. Documentation影響を確認する


------------------------------------------------------------------------

# Deprecated API Rules

------------------------------------------------------------------------

Deprecated Warningを

放置しない。

Package・SDK更新時に

移行計画を作る。

一時的に残す場合は

Issueと期限を記録する。

------------------------------------------------------------------------

# Platform Code Rules

------------------------------------------------------------------------

Platform Channelは

Pluginで代替できない場合に限定する。

------------------------------------------------------------------------

## Method Channel

-   APIを型化する
-   Error Codeを定義する
-   Timeoutを考慮する
-   Platform Testを行う
-   Android・iOSで名称を揃える

------------------------------------------------------------------------

## Native Code

Flutter側と同じ

Privacy・Logging Ruleを適用する。

------------------------------------------------------------------------

# Configuration Rules

------------------------------------------------------------------------

-   dev
-   staging
-   production

を分離する。

------------------------------------------------------------------------

## 禁止

-   Production URLの散在
-   Boolean FlagのHardcode
-   SecretのCompile Constant
-   Staging CredentialのProduction混入

------------------------------------------------------------------------

# Feature Flag Rules

------------------------------------------------------------------------

-   Flag名を明確にする
-   Defaultを安全側にする
-   AIはOff可能にする
-   古いFlagを削除する
-   Flag組み合わせをTestする
-   FlagでSchema差を作りすぎない

------------------------------------------------------------------------

# AI開発エージェント向け実装手順

------------------------------------------------------------------------


1. PROJECT.mdを読む

2. AGENTS.mdを読む

3. 対象Featureを読む

4. CODING_RULES.mdを読む

5. Architecture・FolderStructureを読む

6. Existing Code・Testを確認する

7. 変更影響を分析する

8. 実装する

9. Testを追加する

10. Format・Analyze・Testを実行する

11. Documentationを更新する


------------------------------------------------------------------------

# AI生成コードの確認項目

------------------------------------------------------------------------

-   Importが正しい
-   Null Safetyへ対応する
-   APIが現行Versionに合う
-   Deprecated APIがない
-   Architectureへ従う
-   Design Tokenを使う
-   Error Stateがある
-   Testがある
-   Secretがない
-   Health DataをLogしない
-   AIを必須依存にしない
-   Generated Codeを編集しない

------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   仕様未確認でCodingする
-   DomainへFlutterをimportする
-   WidgetからDatabaseを直接呼ぶ
-   ControllerへBuildContextを保持する
-   Build内でSide Effectを行う
-   dynamicをDomainで使う
-   MapをDomain Model代わりに使う
-   Pulse nullを0へ変換する
-   Multiple MeasurementをWidgetで計算する
-   Transactionなしで複数Table保存する
-   MigrationなしでSchema変更する
-   Exception文字列を直接表示する
-   Errorを握り潰す
-   無制限Retryを行う
-   Route Pathを直書きする
-   Color・Spacingを直書きする
-   StringをHardcodeする
-   SecretをSourceへ書く
-   Health DataをLogする
-   AI KeyをClientへ含める
-   PromptをWidgetへ直書きする
-   AI結果を自動適用する
-   Generated Codeを手動編集する
-   TestなしでBug Fixする
-   Analyzer Warningを放置する
-   Goldenを無確認更新する
-   Packageを無検証で追加する
-   巨大utils.dartを作る
-   早すぎる抽象化を行う

------------------------------------------------------------------------

# 作業完了チェック

------------------------------------------------------------------------

## Code

-   Namingが明確
-   型が明確
-   dynamicを避けた
-   Nullの意味が明確
-   Responsibilityが分離されている
-   Dependency Directionが正しい
-   Generated Codeが最新

## Flutter

-   Riverpod Ruleを守った
-   GoRouter Ruleを守った
-   Build内Side Effectがない
-   Design Tokenを使用した
-   Localizationを使用した
-   Accessibilityへ対応した

## Data

-   Domain Modelへ変換した
-   Transactionを使用した
-   Migration影響を確認した
-   Backup影響を確認した
-   Export値を確認した

## Error・Async

-   Typed Errorを使用した
-   Timeoutを設定した
-   Retry上限がある
-   Cancelを検討した
-   Errorを握り潰していない

## Privacy・Security

-   Secretがない
-   Health DataをLogしない
-   External送信を確認した
-   FileをValidationした
-   Temporary FileをCleanupした

## Test

-   Unit Testを追加した
-   Widget Testを追加した
-   Regression Testを追加した
-   Boundaryを確認した
-   Test Fixtureが架空Data

## Quality

-   dart formatを実行した
-   flutter analyzeが成功した
-   flutter testが成功した
-   Documentationを更新した
-   Release影響を確認した

------------------------------------------------------------------------

# Definition of Done

------------------------------------------------------------------------

コード変更は

次をすべて満たした場合に完了とする。

□ Feature仕様と一致する

□ Acceptance Criteriaを満たす

□ Architecture Ruleを守る

□ Naming Ruleを守る

□ Type Safetyを確保する

□ Nullの意味が明確である

□ UIとBusiness Logicを分離する

□ DomainをFlutter非依存にする

□ Errorを適切に扱う

□ AsyncのTimeout・Retryを扱う

□ Health DataをLogへ出さない

□ Privacy・Securityを確認する

□ Accessibilityへ対応する

□ Unit Testがある

□ 必要なWidget Testがある

□ Regression Testがある

□ Formatが成功する

□ Analyzeが成功する

□ Testが成功する

□ Generated Codeが最新である

□ Documentationが更新されている

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Style

-   Formatできる
-   Analyzeできる
-   Import順序を維持できる
-   Naming Ruleを適用できる
-   File責務を分けられる

## Architecture

-   Layerを分離できる
-   Dependency Directionを守れる
-   Repository境界を作れる
-   DomainをFlutter非依存にできる
-   Feature Firstへ配置できる

## Type

-   dynamicを避けられる
-   Nullableの意味を保持できる
-   Value Objectを利用できる
-   不正状態を型で防げる
-   Exhaustiveな状態処理ができる

## Flutter

-   Riverpodを正しく使用できる
-   GoRouterを正しく使用できる
-   Build内Side Effectを避けられる
-   Theme・Localizationを使用できる
-   Accessibilityへ対応できる

## Data

-   Drift RowをDomainへ変換できる
-   Transactionを使用できる
-   Indexを適切に設定できる
-   Migrationを実装できる
-   In Memory Testを作成できる

## Error・Async

-   ErrorをLayer変換できる
-   Exceptionを直接表示しない
-   Timeoutを設定できる
-   Retry上限を設定できる
-   Cancelへ対応できる

## Privacy・Security

-   Secretを保護できる
-   Health DataをLogしない
-   File ImportをValidationできる
-   Path Traversalを防げる
-   AI KeyをBackendで管理できる

## Test

-   Given・When・Thenで記述できる
-   Fake・Mockを使い分けられる
-   Clockを注入できる
-   Regression Testを追加できる
-   Goldenを安全に更新できる

------------------------------------------------------------------------

## Acceptance Criteria

□ Dart・Flutterの共通Coding Ruleを適用できる

□ Format・Analyzeを必須化できる

□ FileとFolderの責務を分離できる

□ Dependency Directionを守れる

□ Import Ruleを統一できる

□ Naming Ruleを統一できる

□ Boolean・Collectionを明確に命名できる

□ dynamicの使用を境界へ限定できる

□ Nullableの意味を保持できる

□ Value Objectを適切に使用できる

□ ImmutableなModelを作成できる

□ DomainをFlutter非依存にできる

□ F001のValidationをDomainへ配置できる

□ Multiple MeasurementをDomainで計算できる

□ 複数TableをTransactionで保存できる

□ Functionを小さな責務へ分けられる

□ Async・Awaitを安全に使用できる

□ Timeout・Retry・Cancelへ対応できる

□ Riverpodのwatch・read・listenを使い分けられる

□ ControllerへBuildContextを保持しない

□ Build内でSide Effectを行わない

□ GoRouterのPathを一元管理できる

□ Drift RowをPresentationへ漏らさない

□ Migration Testを追加できる

□ Freezed Generated Codeを手動編集しない

□ Typed Errorを使用できる

□ Exception Messageを直接表示しない

□ Health DataをLogへ出さない

□ SecretをSourceへ含めない

□ AI PromptをWidgetへ直書きしない

□ AI Safety・GroundingをWorkflowで検証できる

□ Notification PluginをAdapterへ分離できる

□ Export・BackupのFileを安全に扱える

□ Localizationを使用できる

□ Accessibility Coding Ruleを適用できる

□ 有用なCommentだけを記述できる

□ Unit・Widget・Integration Testを作成できる

□ Bug Fix時にRegression Testを追加できる

□ Git・Pull Request Ruleを適用できる

□ Code Review観点を統一できる

□ AI生成コードを検証してから採用できる

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

F204 AI Memo Assistance

------------------------------------------------------------------------

## 優先度

★★★★★（すべてのFlutter・Dart実装で必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/Features/F001_BloodPressureRecording.md
-   02_UX/Navigation.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Colors.md
-   04_DesignSystem/Typography.md
-   04_DesignSystem/Components.md
-   05_AI/Prompt.md
-   05_AI/AIWorkflow.md
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/Packages.md
-   07_Test/TestPlan.md
-   08_Release/ReleaseChecklist.md
-   09_AI_Context/AGENTS.md
-   09_AI_Context/PROJECT.md
-   09_AI_Context/DESIGN_RULES.md

------------------------------------------------------------------------

## 将来拡張

-   analysis_options.yaml詳細仕様
-   Custom Lint
-   Architecture Import Lint
-   Forbidden API Check
-   Sensitive Logging Lint
-   Generated Code CI Check
-   Dependency Update Policy
-   Performance Budget
-   Memory Profiling Guide
-   Platform Channel Rules
-   API Client Rules
-   Database Query Guide
-   Migration Cookbook
-   Testing Cookbook
-   Golden Test Guide
-   Accessibility Coding Examples
-   AI Workflow Code Template
-   Pull Request Automation
-   Code Quality Dashboard
-   Mutation Testing
-   Property Based Testing
