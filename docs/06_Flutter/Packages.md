# Packages.md

# BloodPressureApp Flutter設計

Version: 1.0

------------------------------------------------------------------------

# Packages

## ドキュメントID

FLUTTER-PACKAGES-001

------------------------------------------------------------------------

## 名称

Flutterパッケージ選定・管理仕様

------------------------------------------------------------------------

## 目的

BloodPressureAppで使用するFlutter・Dartパッケージについて、

採用目的、選定基準、利用範囲、導入時期、

依存関係、代替候補、更新方法、

セキュリティ、ライセンス、テスト方法を統一する。

外部パッケージを

画面実装の都合だけで無計画に追加せず、

アーキテクチャ、保守性、プライバシー、

長期運用、AI支援開発との相性を考慮して管理する。

本仕様では特定バージョンを恒久固定せず、

導入時点のFlutter Stableと互換性のある

安定版を確認したうえで、

`pubspec.yaml`と`pubspec.lock`へ記録する。

------------------------------------------------------------------------

## 適用範囲

-   Flutter SDK依存
-   Dart Package
-   Flutter Plugin
-   Runtime Dependency
-   Development Dependency
-   Platform Dependency
-   Code Generation
-   State Management
-   Navigation
-   Database
-   Storage
-   Notification
-   Chart
-   Export
-   Backup
-   Security
-   AI通信
-   Testing
-   Lint
-   CI/CD
-   License Management
-   Package Update

------------------------------------------------------------------------

## 基本方針

-   Flutter・Dart標準機能を優先する
-   必要性が明確なパッケージだけを追加する
-   1つの用途へ複数の類似パッケージを導入しない
-   pub.devの公開情報を確認する
-   Verified Publisherを優先する
-   Flutter Favoriteを参考にする
-   最終更新日だけで採用判断しない
-   Issue、Repository、Release履歴を確認する
-   対応Platformを確認する
-   Licenseを確認する
-   Transitive Dependencyを確認する
-   Native Pluginは権限とPrivacyを確認する
-   API KeyをClientへ埋め込むPackage設計を避ける
-   健康データを外部送信するPackageを無断で追加しない
-   Major Updateは個別に検証する
-   `pubspec.lock`をGit管理する
-   Version Rangeを過度に広くしない
-   廃止Packageへ依存しない
-   AIが提案したPackageを無検証で追加しない
-   Package追加時に本書を更新する

------------------------------------------------------------------------

## パッケージ分類


Packages
├─ SDK
├─ Architecture
│  ├─ State Management
│  ├─ Navigation
│  ├─ Immutable Model
│  └─ Code Generation
│
├─ Data
│  ├─ Database
│  ├─ Preferences
│  ├─ Secure Storage
│  ├─ File
│  └─ Serialization
│
├─ UI
│  ├─ Chart
│  ├─ Icons
│  ├─ Animation
│  └─ Accessibility
│
├─ Platform
│  ├─ Notification
│  ├─ Permission
│  ├─ Share
│  ├─ Biometrics
│  └─ Device Information
│
├─ Export・Backup
├─ Network・AI
├─ Quality
│  ├─ Lint
│  ├─ Test
│  ├─ Mock
│  └─ Golden
│
└─ Optional・Future


------------------------------------------------------------------------

# パッケージ選定基準

------------------------------------------------------------------------

## 必須評価項目

-   目的が明確である
-   Flutter Stableへ対応している
-   Android・iOSへ対応している
-   Null Safety対応
-   継続的なMaintenance
-   公開Repositoryがある
-   Licenseが商用利用可能
-   重大な既知脆弱性がない
-   APIが安定している
-   Testがある
-   Documentationが十分
-   Package Sizeが妥当
-   Native Permissionが妥当
-   Privacy Policyと矛盾しない

------------------------------------------------------------------------

## 推奨評価項目

-   Verified Publisher
-   Flutter Favorite
-   多数の利用実績
-   活発なIssue対応
-   Migration Guide
-   Semantic Versioning
-   Web・Desktop対応
-   Mock可能なInterface
-   Tree Shaking対応
-   AIがAPIを理解しやすい
-   Generated Codeが安定している

------------------------------------------------------------------------

## 採用見送り条件

-   最終更新が長期間停止
-   RepositoryがArchived
-   Licenseが不明
-   Maintainerが不明
-   重大Issueが放置
-   不要なNetwork通信
-   広告SDKを含む
-   健康データを収集する
-   API KeyのClient埋め込みを要求する
-   独自State Managementを強制する
-   巨大な依存Graph
-   Flutter SDK内部APIへ依存する
-   代替が標準機能で十分
-   既存Packageと用途が重複する

------------------------------------------------------------------------

# 採用パッケージ一覧

------------------------------------------------------------------------

## Flutter SDK

### flutter

分類

SDK。

用途

Flutter Application本体。

必須

Yes。

### flutter_localizations

分類

Flutter SDK Package。

用途

日本語・英語などのLocalization。

必須

Yes。

### integration_test

分類

Flutter SDK Development Package。

用途

End to End・Integration Test。

必須

Release前。

------------------------------------------------------------------------

# State Management

------------------------------------------------------------------------

## flutter_riverpod

用途

-   状態管理
-   Dependency Injection
-   Async State
-   Provider Override
-   Feature Controller
-   Repository Provider

採用理由

-   BuildContextへ依存しない
-   Testで差し替えやすい
-   Compile Time支援
-   Async処理と相性がよい
-   Feature First構成へ適合する

利用範囲

Presentation、Application、Dependency Injection。

禁止

Domain EntityやValue Objectからの参照。

------------------------------------------------------------------------

## riverpod_annotation

用途

AnnotationベースのProvider定義。

採用理由

Provider名と型を

Generated Codeで安全に管理できる。

必須

Riverpod Code Generation採用時。

------------------------------------------------------------------------

## riverpod_generator

分類

dev_dependency。

用途

Provider Code Generation。

必須

riverpod_annotation使用時。

------------------------------------------------------------------------

## riverpod_lint

分類

dev_dependency。

用途

Riverpod固有の誤用検出。

推奨

Yes。

------------------------------------------------------------------------

## custom_lint

分類

dev_dependency。

用途

riverpod_lint等のCustom Lint実行。

推奨

Yes。

------------------------------------------------------------------------

# Navigation

------------------------------------------------------------------------

## go_router

用途

-   Declarative Routing
-   ShellRoute
-   Deep Link
-   Redirect
-   Named Route
-   Nested Navigation

採用理由

-   Flutter公式エコシステム
-   Bottom Navigation構成へ対応
-   URL・Deep Linkを管理しやすい
-   Test可能
-   Navigation.mdと対応しやすい

利用範囲

app/router。

禁止

各WidgetでPath文字列を直書きすること。

------------------------------------------------------------------------

# Immutable Model・Code Generation

------------------------------------------------------------------------

## freezed_annotation

用途

-   Immutable State
-   Union Type
-   copyWith
-   Equality
-   Sealed State Model

採用範囲

複雑なUI State、DTO、AI Response。

Domain Entityでは

必要性を判断して使用する。

------------------------------------------------------------------------

## freezed

分類

dev_dependency。

用途

Freezed Code Generation。

------------------------------------------------------------------------

## json_annotation

用途

JSON Serialization Annotation。

対象

-   Backup DTO
-   AI Request・Response DTO
-   Remote API DTO
-   Import・Export Metadata

------------------------------------------------------------------------

## json_serializable

分類

dev_dependency。

用途

JSON Serialize Code Generation。

------------------------------------------------------------------------

## build_runner

分類

dev_dependency。

用途

-   Riverpod Generator
-   Freezed
-   JSON Serializable
-   Drift

Generated Fileを

手動編集しない。

------------------------------------------------------------------------

# Local Database

------------------------------------------------------------------------

## drift

用途

-   血圧記録保存
-   複数回測定保存
-   履歴検索
-   集計
-   Stream Query
-   Transaction
-   Migration

採用理由

-   型安全SQL
-   SQLite
-   Migration
-   Reactive Query
-   Test可能
-   大量履歴へ対応可能

必須

Yes。

------------------------------------------------------------------------

## drift_flutter

用途

Flutter PlatformでのDrift Database初期化。

導入可否

採用するDrift構成と

対象Platformに応じて決定する。

------------------------------------------------------------------------

## sqlite3_flutter_libs

用途

PlatformによってSQLite Binaryを提供する。

導入可否

使用するDrift構成、

Flutter・Pluginの現行要件を確認して決定する。

不要な場合は追加しない。

------------------------------------------------------------------------

## drift_dev

分類

dev_dependency。

用途

Drift Code Generation。

------------------------------------------------------------------------

## path

用途

Cross Platform Path操作。

使用例

-   Database Path
-   Export File Path
-   Backup Path

------------------------------------------------------------------------

## path_provider

用途

Application Documents、

Temporary Directory等の取得。

使用例

-   PDF一時保存
-   CSV保存
-   Backup File
-   Database配置

Native Pluginのため

Platform対応を確認する。

------------------------------------------------------------------------

# Preferences・Secure Storage

------------------------------------------------------------------------

## shared_preferences

用途

機密性の低い設定。

保存例

-   Theme
-   Text Size
-   Button Size
-   Onboarding Complete
-   Display Preference
-   Recording Preference

保存禁止

-   Access Token
-   Encryption Key
-   Raw Blood Pressure Record
-   Password
-   Personal Identifier

------------------------------------------------------------------------

## flutter_secure_storage

用途

機密性の高いKey・Token保存。

保存例

-   Authentication Token
-   Encryption Key Reference
-   App Lock関連情報
-   Backup Credential Reference

注意

-   Android Backup設定
-   iOS Keychain設定
-   Device移行時の挙動
-   Biometricとの組み合わせ

を確認する。

------------------------------------------------------------------------

# Date・Localization

------------------------------------------------------------------------

## intl

用途

-   Date Formatting
-   Number Formatting
-   Locale対応

導入方法

flutter_localizationsとの

互換Versionを使用する。

Business Ruleとしての日時処理を

intlへ依存させすぎない。

------------------------------------------------------------------------

## timezone

用途

-   Reminder
-   Timezone変換
-   夏時間
-   Local Notification時刻

日本国内のみのMVPでも、

将来の海外利用を考慮して採用を検討する。

Reminder実装時に導入する。

------------------------------------------------------------------------

## flutter_timezone

用途

端末Timezone取得。

timezoneと組み合わせて使用する。

導入時期

Reminder・海外対応時。

------------------------------------------------------------------------

# Chart

------------------------------------------------------------------------

## fl_chart

用途

-   SYS折れ線
-   DIA折れ線
-   Pulse表示
-   Tooltip
-   Grid
-   Time Range Chart

採用理由

-   Flutter Native Chart
-   Customization性
-   Line Chart対応
-   外部WebView不要

注意

-   Accessibility
-   Large Dataset Performance
-   Tooltip操作
-   Text Scale
-   Golden Test安定性

を検証する。

------------------------------------------------------------------------

## 代替候補

-   syncfusion_flutter_charts
-   charts_flutter系後継
-   CustomPainter自作

Syncfusion採用時は

License条件を確認する。

MVPでは

fl_chartを第一候補とする。

------------------------------------------------------------------------

# Notification

------------------------------------------------------------------------

## flutter_local_notifications

用途

-   朝・夜Reminder
-   Scheduled Notification
-   Notification Tap
-   Platform Notification設定

採用理由

Android・iOSの

Local Notificationを共通化できる。

注意

-   Android Notification Permission
-   Android Exact Alarm
-   iOS Notification Permission
-   Timezone
-   DST
-   Reboot後
-   Platform Version差

を確認する。

------------------------------------------------------------------------

## permission_handler

用途

Permission状態確認と要求。

使用候補

-   Notification
-   Storage
-   Photo Library
-   必要なPlatform Permission

注意

不要なPermissionを要求しない。

Permission要求前に

アプリ内説明を表示する。

------------------------------------------------------------------------

# Export・PDF・Share

------------------------------------------------------------------------

## pdf

用途

-   医療者向けPDF
-   記録一覧PDF
-   統計PDF
-   AI要約付きPDF

注意

Flutter Widget Treeとは別の

PDF Layout APIであるため、

Design Systemとの差分を管理する。

------------------------------------------------------------------------

## printing

用途

-   PDF Preview
-   Print
-   Share
-   Platform PDF連携

Export Feature導入時に採用する。

------------------------------------------------------------------------

## csv

用途

CSV Encode・Decode。

導入可否

標準Dart実装と比較し、

引用符・改行・文字コード対応が必要な場合に採用する。

------------------------------------------------------------------------

## share_plus

用途

-   PDF共有
-   CSV共有
-   Backup File共有

注意

Share前に

Previewと利用者確認を必須とする。

------------------------------------------------------------------------

## file_picker

用途

-   Backup File選択
-   Restore File選択
-   Import File選択

注意

-   MIME Type
-   File Extension
-   File Size
-   Path取得可否
-   Security Scoped Resource
-   Android URI

を検証する。

------------------------------------------------------------------------

# Backup・Compression・Encryption

------------------------------------------------------------------------

## archive

用途

-   Backup Data圧縮
-   ZIP作成
-   ZIP展開

注意

Zip Slip対策、

File Size上限、

展開先Validationを実装する。

------------------------------------------------------------------------

## cryptography

用途

-   Backup Encryption
-   Hash
-   MAC
-   Key Derivation

採用理由

自作暗号を避ける。

注意

暗号方式、Nonce、Salt、

Key管理、Versionを別仕様で定義する。

------------------------------------------------------------------------

## crypto

用途

Hash計算など。

cryptographyとの

役割重複を避ける。

単純なHashだけ必要な場合に検討する。

------------------------------------------------------------------------

# Device Security

------------------------------------------------------------------------

## local_auth

用途

-   生体認証
-   App Lock解除
-   Sensitive Screen保護

導入時期

Privacy・App Lock Feature実装時。

注意

生体認証のみを

唯一の復旧方法にしない。

------------------------------------------------------------------------

## device_info_plus

用途

-   Platform情報
-   OS Version
-   Compatibility判断
-   Support情報

禁止

不要なDevice Identifier収集。

------------------------------------------------------------------------

## package_info_plus

用途

-   App Version
-   Build Number
-   About画面
-   Support Log

------------------------------------------------------------------------

# Connectivity・Network

------------------------------------------------------------------------

## connectivity_plus

用途

Network Interface状態の参考確認。

注意

接続種別が存在しても

Internet到達可能とは限らない。

実際のRequest結果を

最終判断に使用する。

------------------------------------------------------------------------

## dio

用途候補

-   Backend API
-   AI Backend
-   Timeout
-   Interceptor
-   Cancel
-   Multipart
-   Structured Error

採用理由

AI Workflowで

Timeout、Cancel、Retry、

Header処理が必要なため。

------------------------------------------------------------------------

## http

代替候補

単純なHTTP通信だけであれば使用可能。

dioとhttpを

同時に導入しない。

MVPのAI Backend要件が複雑な場合は

dioを第一候補とする。

------------------------------------------------------------------------

## retry

用途候補

限定的なRetry Policy。

導入可否

独自の短いRetry実装で十分か確認する。

AIWorkflow.mdの上限を超える

自動Retryを行わない。

------------------------------------------------------------------------

# AI関連

------------------------------------------------------------------------

## 原則

AI Provider公式SDKを

Flutter Clientへ直接組み込むことは標準としない。

推奨構成


Flutter
    ↓
Authenticated Backend
    ↓
AI Provider


理由

-   API Key保護
-   Rate Limit
-   Prompt管理
-   Safety Validation
-   Model切替
-   Logging制御
-   Cost Control

------------------------------------------------------------------------

## AI通信候補

-   dio
-   json_serializable
-   freezed
-   cryptography
-   connectivity_plus

Promptは

assets/promptsへ保存する。

AI Workflow共通処理は

core/aiへ配置する。

------------------------------------------------------------------------

# Logging・Crash Reporting

------------------------------------------------------------------------

## logger

用途候補

Development Logの構造化。

採用可否

Dart標準Logと比較して決定する。

禁止

Raw Health Data、

Memo、Full Prompt、Full AI Responseを出力すること。

------------------------------------------------------------------------

## sentry_flutter

候補

Crash・Performance Monitoring。

導入時の確認

-   Health Data Masking
-   Breadcrumb
-   Screenshot
-   PII
-   Region
-   Data Retention
-   User Consent

------------------------------------------------------------------------

## firebase_crashlytics

代替候補

Firebase採用時のCrash Reporting。

Firebaseを使用しない場合は

Crashlyticsだけのために

安易に導入しない。

------------------------------------------------------------------------

## Analytics

Analytics Packageは

MVPでは必須としない。

導入する場合も

血圧値、Memo、健康状態を

Event Parameterへ含めない。

------------------------------------------------------------------------

# UI補助

------------------------------------------------------------------------

## flutter_svg

用途

SVG Icon・Illustration。

採用条件

Figma AssetをSVGで運用する場合。

注意

複雑なSVG、

Filter、Mask、Fontを検証する。

------------------------------------------------------------------------

## cached_network_image

MVPでは原則不要。

理由

主要UI AssetはLocalで保持し、

健康管理アプリの基本画面で

Network Imageを必須にしない。

------------------------------------------------------------------------

## shimmer

MVPでは原則不要。

理由

Loadingは

Progress Indicatorと状態文で十分。

過度なAnimationを避ける。

------------------------------------------------------------------------

# Accessibility

------------------------------------------------------------------------

Accessibility目的だけで

外部Packageへ依存しすぎない。

Flutter標準の

-   Semantics
-   MediaQuery
-   Focus
-   Shortcuts
-   Actions
-   ExcludeSemantics

を優先する。

必要に応じて

Accessibility Test補助Packageを検討する。

------------------------------------------------------------------------

# Testing Packages

------------------------------------------------------------------------

## flutter_test

分類

Flutter SDK dev_dependency。

用途

-   Widget Test
-   Unit Test
-   Golden Test基盤

必須

Yes。

------------------------------------------------------------------------

## test

用途

Pure Dart Unit Test。

Flutter Testへ統一できる場合もあるが、

Domain Package分離時に利用する。

------------------------------------------------------------------------

## mocktail

用途

Mock生成不要のMock Library。

採用理由

-   Simple API
-   Null Safety
-   Code Generation不要

Mockは

Plugin・External Service境界へ限定し、

RepositoryはFakeを優先する。

------------------------------------------------------------------------

## golden_toolkit

導入候補

Golden TestのTheme、Device、

Scenario管理。

採用可否

Flutter標準Golden Testで十分か確認する。

Maintenance状態を確認してから採用する。

------------------------------------------------------------------------

## alchemist

Golden Test代替候補。

golden_toolkitと

同時採用しない。

------------------------------------------------------------------------

## patrol

Integration・Native Interaction候補。

MVPでは

Flutter標準integration_testを優先し、

Native Permission Dialog等の要件が

増えた場合に検討する。

------------------------------------------------------------------------

## fake_async

用途候補

Timer、Reminder、DebounceのUnit Test。

Dart SDK・test依存との関係を確認する。

------------------------------------------------------------------------

## clock

用途

現在時刻のInjection。

採用候補

-   Reminder
-   Date Range
-   Statistics
-   Test固定時刻

Architectureとして

Clock Interfaceを自作する方法もある。

------------------------------------------------------------------------

# Development Packages

------------------------------------------------------------------------

## flutter_lints

用途

Flutter推奨Lint。

必須

Yes。

------------------------------------------------------------------------

## very_good_analysis

代替候補

より厳格なLint Set。

採用する場合は

flutter_lintsとの役割を統一する。

同時に重複設定しない。

------------------------------------------------------------------------

## dart_code_metrics系

候補

-   複雑度
-   File Size
-   Architecture Rule

Licenseと現行提供形態を確認する。

------------------------------------------------------------------------

## dependency_validator

候補

pubspecとimportの不整合確認。

CIでの有効性を確認して採用する。

------------------------------------------------------------------------

# Package Groups

------------------------------------------------------------------------

## MVP必須


flutter

flutter_localizations

intl

flutter_riverpod

riverpod_annotation

go_router

drift

shared_preferences

path

path_provider

fl_chart

flutter_local_notifications

permission_handler

pdf

printing

share_plus


実装Featureに応じて

段階導入する。

------------------------------------------------------------------------

## MVP dev_dependencies


flutter_test

integration_test

flutter_lints

build_runner

riverpod_generator

riverpod_lint

custom_lint

drift_dev

mocktail


Freezed・JSONを採用する場合


freezed

json_serializable


------------------------------------------------------------------------

## Version 2候補


flutter_secure_storage

file_picker

archive

cryptography

local_auth

device_info_plus

package_info_plus

timezone

flutter_timezone

dio

connectivity_plus

flutter_svg


------------------------------------------------------------------------

## AI機能導入時


dio

json_annotation

json_serializable

freezed_annotation

freezed

connectivity_plus

cryptography


Provider公式SDKは

Backend構成を確認してから判断する。

------------------------------------------------------------------------

# pubspec.yaml方針

------------------------------------------------------------------------

## Dependencies

Runtimeで必要なPackage。

yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_localizations:
    sdk: flutter


------------------------------------------------------------------------

## dev_dependencies

Build、Lint、Test、

Code Generationだけに必要なPackage。

yaml
dev_dependencies:
  flutter_test:
    sdk: flutter

  integration_test:
    sdk: flutter


Runtime Packageを

dev_dependenciesへ置かない。

------------------------------------------------------------------------

## Version指定

原則

Compatible Rangeを使用する。

ただし

Major Versionを無制限に許可しない。

`pubspec.lock`により

Application Buildを再現する。

------------------------------------------------------------------------

## any禁止

原則

yaml
package_name: any


を使用しない。

例外

Flutter SDKが互換Versionを固定する

公式手順に従う場合。

------------------------------------------------------------------------

## Git Dependency

原則禁止。

例外

-   修正版Release待ち
-   Internal Package
-   Fork

使用時は

Commit Hashへ固定し、

Issue、理由、解除条件を記録する。

------------------------------------------------------------------------

## Path Dependency

Monorepo・Local Package開発時のみ。

Release前に

意図した構成であることを確認する。

------------------------------------------------------------------------

## Dependency Override

原則禁止。

一時的に使用する場合は

-   理由
-   Issue
-   期限
-   解除条件
-   Test結果

を記録する。

------------------------------------------------------------------------

# Package導入手順

------------------------------------------------------------------------


1. 必要性を説明する

2. 標準機能で代替できないか確認する

3. 候補Packageを比較する

4. Licenseを確認する

5. Platform対応を確認する

6. Privacy・Permissionを確認する

7. Maintenance状態を確認する

8. Sample Branchで検証する

9. pubspec.yamlへ追加する

10. flutter pub getを実行する

11. Unit・Widget・Integration Testを実行する

12. App Sizeを確認する

13. Packages.mdを更新する

14. ADRが必要か判断する


------------------------------------------------------------------------

# Package更新方針

------------------------------------------------------------------------

## Patch Update

定期的にまとめて実施可能。

確認

-   Test
-   Analyze
-   Build
-   Migration

------------------------------------------------------------------------

## Minor Update

Release Noteを確認する。

特に

-   API追加
-   Deprecated
-   Native設定
-   Minimum OS

を確認する。

------------------------------------------------------------------------

## Major Update

個別Pull Requestで実施する。

必須

-   Migration Guide
-   Breaking Change
-   Full Test
-   Android Build
-   iOS Build
-   Backup・Restore
-   Notification
-   Database Migration
-   AI Safety

------------------------------------------------------------------------

## 更新頻度

推奨

-   Security Update：速やかに対応
-   Patch：月次確認
-   Minor：四半期確認
-   Major：計画的に対応
-   Flutter Stable更新：専用Branchで検証

------------------------------------------------------------------------

## 更新コマンド


flutter pub outdated

flutter pub upgrade

flutter pub upgrade --major-versions


Major Updateは

自動的に一括適用せず、

変更内容を確認する。

------------------------------------------------------------------------

# pubspec.lock

------------------------------------------------------------------------

Application Projectでは

Git管理する。

目的

-   Build再現性
-   CI一致
-   Team環境一致
-   Release再現
-   Dependency差分Review

Lock File変更は

Package変更PRでReviewする。

------------------------------------------------------------------------

# Native Dependency

------------------------------------------------------------------------

Flutter Pluginには

Android・iOSのNative Dependencyが含まれる場合がある。

確認項目

-   Minimum Android SDK
-   Compile SDK
-   Kotlin
-   Gradle
-   Minimum iOS
-   Swift
-   Swift Package Manager
-   CocoaPods Fallback
-   Permission
-   Entitlement
-   Background Mode

Flutter Stableの現行Package管理方式に従い、

iOS・macOSでは

Swift Package Manager対応状況も確認する。

------------------------------------------------------------------------

# License

------------------------------------------------------------------------

許可候補

-   BSD
-   MIT
-   Apache-2.0

個別確認

-   GPL
-   AGPL
-   LGPL
-   Proprietary
-   Dual License
-   Commercial License

Release前に

Third Party License表示を確認する。

Flutter標準の

`showLicensePage`または

`LicensePage`を利用可能とする。

------------------------------------------------------------------------

# Security

------------------------------------------------------------------------

確認項目

-   Known Vulnerability
-   Malicious Package
-   Typosquatting
-   Transitive Dependency
-   Native Binary
-   Network通信
-   Data Collection
-   API Key
-   File Access
-   Backup Access
-   Clipboard
-   Analytics
-   Crash Report

Package名を

AI出力からCopyして追加する場合も、

pub.devとRepositoryを必ず確認する。

------------------------------------------------------------------------

# Privacy

------------------------------------------------------------------------

健康データを扱うため

次のPackageは特にReviewする。

-   Network
-   Analytics
-   Crash Reporting
-   Cloud Storage
-   AI SDK
-   File Share
-   Backup
-   Device Info

確認事項

-   何を送信するか
-   送信先
-   保存期間
-   Region
-   Opt Out
-   Consent
-   Logging
-   SDK独自収集

------------------------------------------------------------------------

# App Size

------------------------------------------------------------------------

Package追加前後で

Release Build Sizeを確認する。

特に

-   PDF
-   Font
-   Chart
-   Encryption
-   AI SDK
-   Firebase
-   Native Binary

を確認する。

使用しないAssetやPackageを削除する。

------------------------------------------------------------------------

# Performance

------------------------------------------------------------------------

Package評価

-   Startup Time
-   Memory
-   Build Time
-   Rebuild
-   Database Query
-   Chart Rendering
-   PDF Generation
-   Notification Scheduling
-   AI Network

重い処理があるPackageは

Isolate、Paging、Cacheを検討する。

------------------------------------------------------------------------

# AI支援開発でのルール

------------------------------------------------------------------------

AIへPackage追加を依頼する場合

次をPromptへ含める。


既存Packages.mdを確認する

既存Packageと用途が重複しないこと

公式pub.dev情報を確認する

Licenseを確認する

Architecture.mdへ従う

Package追加理由を説明する

Testを追加する

pubspec.lock差分を確認する


AIが生成した

古いAPI、Deprecated API、

存在しないClassを使用しないよう、

Dart・Flutter MCP Serverや

Analyzerで確認する。

------------------------------------------------------------------------

# Package Inventory

------------------------------------------------------------------------

各Packageについて

次を記録する。


Package Name

Category

Purpose

Owner

Added Version

Current Version

License

Platform

Privacy Risk

Native Setup

Last Reviewed

Replacement

Removal Condition


保存候補


docs/06_Flutter/PackageInventory.md


または本書の付属表。

------------------------------------------------------------------------

# Package削除手順

------------------------------------------------------------------------


1. Importを検索する

2. Provider・Adapterを削除する

3. Native設定を削除する

4. Permissionを削除する

5. pubspec.yamlから削除する

6. flutter pub getを実行する

7. Lock Fileを確認する

8. Android・iOSをBuildする

9. Testを実行する

10. Documentationを更新する


Native設定だけ残さない。

------------------------------------------------------------------------

# 代替Package比較ルール

------------------------------------------------------------------------

比較項目

-   Feature
-   API
-   Maintenance
-   License
-   Platform
-   Performance
-   Accessibility
-   Test
-   Migration
-   Privacy
-   App Size
-   Lock In

感覚だけで決定せず、

短いPrototypeを作成する。

------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   用途不明のPackage追加
-   類似Packageの重複
-   `any`の常用
-   Git Branch依存
-   Commit未固定Git Dependency
-   dependency_overridesの恒久利用
-   License未確認
-   Archived Package採用
-   API KeyのClient埋め込み
-   Raw Health Dataを送信するSDKの無断導入
-   Analyticsへ血圧値送信
-   PackageのGlobal Singleton直接利用
-   PluginをPresentationから直接呼ぶ
-   AI Provider SDKの無検討導入
-   Major Updateの一括自動適用
-   pubspec.lockを無視する
-   Generated Codeを編集する
-   Native Permission設定の削除忘れ
-   Package削除後のAsset残存

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Selection

-   Package追加理由が明確
-   標準機能との比較がある
-   類似Packageと重複しない
-   Licenseを確認している
-   Platform対応を確認している
-   Maintenance状態を確認している

## pubspec

-   Runtimeとdev_dependencyが分離されている
-   `any`を使用していない
-   Git Dependencyを固定している
-   dependency_overridesを常用していない
-   pubspec.lockをGit管理している
-   Asset宣言が正しい

## Architecture

-   Riverpodへ統一されている
-   go_routerへ統一されている
-   Driftへ統一されている
-   HTTP Clientが重複していない
-   PluginがAdapter経由で利用される
-   DomainがPackage実装へ依存しない

## Platform

-   Android Buildが成功する
-   iOS Buildが成功する
-   Minimum OSを確認している
-   Permission文言がある
-   SwiftPM・CocoaPods要件を確認している
-   Native設定がDocument化されている

## Security・Privacy

-   API Keyを含まない
-   Raw Health DataをLogへ出さない
-   Analyticsへ健康情報を送らない
-   Crash ReportのPII設定を確認している
-   File ImportをValidationする
-   Backupを暗号化できる

## Update

-   flutter pub outdatedを確認できる
-   Patch Update後にTestする
-   Major Updateを個別PRにする
-   Migration Guideを確認する
-   Lock File差分をReviewする
-   Rollbackできる

## AI

-   AIが既存Packageを確認する
-   存在しないPackageを追加しない
-   Deprecated APIを使用しない
-   MCP・AnalyzerでAPIを確認する
-   Provider SDKをClientへ直接導入しない
-   AI Package追加後にSafety Testを行う

------------------------------------------------------------------------

## Acceptance Criteria

□ Package選定基準を定義できる

□ 採用見送り条件を定義できる

□ RuntimeとDevelopment Packageを分類できる

□ Riverpod関連Packageを定義できる

□ go_routerを定義できる

□ Drift関連Packageを定義できる

□ SharedPreferencesとSecure Storageを使い分けられる

□ Chart Packageを定義できる

□ Notification Packageを定義できる

□ PDF・Printing・Share Packageを定義できる

□ Backup・Encryption Package候補を定義できる

□ Network Packageを定義できる

□ AI SDKをClientへ直接入れない方針を定義できる

□ Testing Packageを定義できる

□ Lint Packageを定義できる

□ MVP必須Packageを整理できる

□ Version 2 Package候補を整理できる

□ AI導入時Packageを整理できる

□ pubspec.yaml管理方針を定義できる

□ pubspec.lockをGit管理できる

□ `any`を原則禁止できる

□ Git DependencyをCommitへ固定できる

□ dependency_overridesを一時利用に限定できる

□ Package導入手順を定義できる

□ Package更新方針を定義できる

□ Major Updateを個別検証できる

□ Native Dependencyを確認できる

□ Swift Package Manager対応を確認できる

□ Licenseを確認できる

□ SecurityとPrivacyを確認できる

□ App Sizeを確認できる

□ Package Inventoryを管理できる

□ Package削除手順を定義できる

□ AI提案Packageを無検証で追加しない

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

★★★★★（Flutter Project Setup前に必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap_日本語版.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/Features/F001_BloodPressureRecording.md
-   02_UX/Navigation.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Components.md
-   04_DesignSystem/Animation.md
-   05_AI/Prompt.md
-   05_AI/AIWorkflow.md
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/DataModel.md
-   06_Flutter/StateManagement.md
-   07_Test/
-   08_Release/
-   09_AI_Context/AGENTS.md

------------------------------------------------------------------------

## 将来拡張

-   Package Inventory自動生成
-   License一覧自動生成
-   Vulnerability Scan
-   Dependabot
-   Renovate
-   Package Allow List
-   Package Deny List
-   Internal Package Registry
-   Monorepo Package管理
-   Melos
-   Architecture Package分割
-   Design System Package
-   On Device AI Package
-   Health Connect Package
-   Apple Health Package
-   Bluetooth Package
-   Cloud Sync Package
-   Dependency Graph可視化
-   Package Update Dashboard
