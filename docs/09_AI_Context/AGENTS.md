# AGENTS.md

# BloodPressureApp AI開発コンテキスト

Version: 1.0

------------------------------------------------------------------------

# AGENTS

## ドキュメントID

AI-CONTEXT-AGENTS-001

------------------------------------------------------------------------

## 名称

AI開発エージェント共通指示書

------------------------------------------------------------------------

## 目的

BloodPressureAppの設計、実装、テスト、

レビュー、ドキュメント更新を行う

AI開発エージェントに対して、

参照すべき仕様、判断順序、

Flutter実装規則、禁止事項、

変更手順、品質基準、安全性、

出力形式を統一して伝える。

本書は、

ChatGPT、Codex、Claude Code、

Gemini、GitHub Copilot、

IDE Agent、CLI Agent、

MCP Clientなど、

複数のAI開発環境で共通利用する。

AIは本書を

補助資料ではなく、

プロジェクト実装時の最上位ルールの一つとして扱う。

ただし、

本書と個別Feature仕様が矛盾する場合は、

優先順位ルールに従って判断し、

推測で勝手に仕様を作らない。

------------------------------------------------------------------------

## 適用範囲

-   Requirements作成
-   UX設計
-   Screen設計
-   Design System
-   Figma
-   Flutter実装
-   Riverpod
-   GoRouter
-   Drift
-   Notification
-   Export
-   Backup
-   AI機能
-   Test
-   Release
-   Code Review
-   Refactoring
-   Bug Fix
-   Package追加
-   Documentation更新
-   CI/CD
-   GitHub Issue・Pull Request

------------------------------------------------------------------------

## AIエージェントの基本姿勢

-   仕様を確認してから実装する
-   不明点を推測で埋めない
-   既存構造を理解してから変更する
-   最小変更で目的を達成する
-   既存機能を壊さない
-   健康データの正確性を最優先する
-   利用者の不安を煽らない
-   医療判断を実装へ持ち込まない
-   Privacyを初期設計から考慮する
-   Testを実装と同時に追加する
-   Generated Codeを編集しない
-   不要なPackageを追加しない
-   変更理由を説明できる状態にする
-   AIが生成した内容も必ず検証する
-   Analyzer、Test、MCP、公式文書を利用する
-   完了を主張する前にAcceptance Criteriaを確認する

------------------------------------------------------------------------

# 最上位原則

------------------------------------------------------------------------

## 1. 仕様優先

実装の都合で

Requirementsを変更しない。

実装困難がある場合は

仕様変更候補として明示し、

勝手に簡略化しない。

------------------------------------------------------------------------

## 2. 利用者価値優先

BloodPressureAppの中心価値は


血圧を記録する人が、

毎日気持ちよく、

安心して、

迷わず使えること


である。

技術的に高度でも、

操作を複雑化する実装は避ける。

------------------------------------------------------------------------

## 3. 正確性優先

血圧値、日時、平均、代表値、

統計、グラフ、PDF、CSV、

Backupは必ず同じSource of Truthに基づく。

表示用に別計算しない。

------------------------------------------------------------------------

## 4. Privacy by Design

健康データは

機微性の高い情報として扱う。

必要最小限の保存、送信、Logに限定する。

------------------------------------------------------------------------

## 5. AI非依存

AI機能が停止しても、

記録、履歴、グラフ、統計、

出力、バックアップを利用可能にする。

------------------------------------------------------------------------

## 6. Testable Design

Repository、Clock、Notification、

File、AI、Database等を

差し替え可能にする。

------------------------------------------------------------------------

# 指示の優先順位

------------------------------------------------------------------------

AIは次の順序で指示を解釈する。


1. 法令・安全・Platform制約

2. ユーザーの明示指示

3. 本書 AGENTS.md

4. Feature Requirements

5. Screen Specification

6. UX・Navigation

7. Design System

8. Flutter Architecture

9. Test Plan

10. Existing Code


ただし

下位資料がより具体的で、

上位資料と矛盾しない場合は、

具体的な内容を採用する。

------------------------------------------------------------------------

## 矛盾時

次を行う。


1. 矛盾箇所を特定する

2. 優先順位を確認する

3. 影響範囲を確認する

4. 最小限の安全な案を選ぶ

5. 判断を記録する


推測による大規模変更を行わない。

------------------------------------------------------------------------

# 作業開始前の必須確認

------------------------------------------------------------------------

AIは実装前に

次を確認する。

-   対象Feature ID
-   対象Screen ID
-   Acceptance Criteria
-   関連User Flow
-   Navigation
-   Design System
-   Architecture
-   Folder Structure
-   Packages
-   Test Plan
-   Existing Code
-   Existing Tests
-   Database Schema
-   Migration影響
-   AI・Privacy影響

------------------------------------------------------------------------

# ドキュメント参照順序

------------------------------------------------------------------------

## 全作業共通


00_Project/Vision.md

00_Project/Roadmap_日本語版.md

09_AI_Context/AGENTS.md


------------------------------------------------------------------------

## Feature実装


01_Requirements/FeatureIndex.md

01_Requirements/Fxxx_*.md

02_UX/UserFlow.md

02_UX/Navigation.md

02_UX/ScreenList.md

03_Screens/{Screen}.md

04_DesignSystem/*.md

06_Flutter/Architecture.md

06_Flutter/FolderStructure.md

06_Flutter/Packages.md

07_Test/TestPlan.md


------------------------------------------------------------------------

## AI Feature実装

追加で参照する。


05_AI/Prompt.md

05_AI/AIWorkflow.md


------------------------------------------------------------------------

## Release作業

追加で参照する。


07_Test/TestPlan.md

08_Release/ReleaseChecklist.md


------------------------------------------------------------------------

# 作業タイプ別ルール

------------------------------------------------------------------------

## Requirements作成

-   F001の構成を標準テンプレートとする
-   日本語で作成する
-   Document IDを付ける
-   目的を明確にする
-   Scopeを定義する
-   Functional Requirementを定義する
-   Error、Empty、Loadingを定義する
-   Test項目を定義する
-   Acceptance Criteriaを定義する
-   Dependencyを定義する
-   Priorityを定義する
-   Related Documentsを定義する
-   Future Extensionを定義する

------------------------------------------------------------------------

## Screen仕様作成

-   Screen IDを付ける
-   Entry・Exitを定義する
-   Layoutを定義する
-   Componentを定義する
-   Stateを定義する
-   User Actionを定義する
-   Validationを定義する
-   Accessibilityを定義する
-   Flutter Widget候補を定義する
-   Figma Componentとの対応を定義する
-   Testを定義する

------------------------------------------------------------------------

## Flutter実装

-   Feature Firstに従う
-   Layerを分離する
-   DomainをFlutter非依存にする
-   Riverpodで依存注入する
-   GoRouterで遷移する
-   Driftで永続化する
-   Repository ContractをDomainへ置く
-   UseCaseをApplicationへ置く
-   UIへBusiness Logicを置かない
-   Errorを型で扱う
-   Testを追加する
-   Design Tokenを使用する

------------------------------------------------------------------------

## Bug Fix


1. 再現条件を確認する

2. 関連仕様を確認する

3. Root Causeを特定する

4. 最小修正を行う

5. Regression Testを追加する

6. 影響範囲を確認する

7. Documentation影響を確認する


症状だけを隠す修正を避ける。

------------------------------------------------------------------------

## Refactoring

Refactoringでは

外部仕様を変更しない。

必須

-   既存Testを維持する
-   変更前後で挙動を比較する
-   Responsibilityを明確にする
-   Import Ruleを守る
-   Performanceを悪化させない
-   Migrationを不要に発生させない

------------------------------------------------------------------------

## Package追加

Packages.mdに従う。

追加前に

-   標準機能で代替できないか
-   既存Packageと重複しないか
-   License
-   Maintenance
-   Platform
-   Privacy
-   Native設定
-   App Size
-   Test

を確認する。

AIがPackage名を提案しただけで

追加しない。

------------------------------------------------------------------------

# Flutter Architecture Rules

------------------------------------------------------------------------

## 依存方向


Presentation → Application → Domain

Data → Domain


禁止


Domain → Flutter

Domain → Riverpod

Domain → Drift

Data → Presentation

Core → Feature

Feature A → Feature B Data


------------------------------------------------------------------------

## Presentation

責務

-   Layout
-   Input
-   Display State
-   Navigation Request
-   Accessibility

禁止

-   SQL
-   Repository Implementation
-   Prompt Construction
-   Complex Aggregation
-   File Direct Access

------------------------------------------------------------------------

## Application

責務

-   UseCase
-   Workflow
-   Transaction Coordination
-   Repository Coordination
-   Permission Coordination
-   Error Conversion

------------------------------------------------------------------------

## Domain

責務

-   Entity
-   Value Object
-   Repository Interface
-   Domain Service
-   Policy
-   Business Rule

Domainは

Flutter、Database、Pluginへ依存しない。

------------------------------------------------------------------------

## Data

責務

-   Drift
-   DTO
-   Mapper
-   Repository Implementation
-   File
-   API
-   Platform Plugin Adapter

------------------------------------------------------------------------

# Folder Rules

------------------------------------------------------------------------

標準構成


lib/
├─ app/
├─ core/
├─ design_system/
├─ features/
├─ shared/
└─ main_*.dart


design_system

Color、Typography、Spacing、Theme、Design Token、

再利用可能なUI Component。


shared

複数Featureで共有するWidget、Extension、Formatter、

Validator、Utility、

デザインシステムに属さない共通処理。


Feature


features/{feature}/
├─ presentation/
├─ application/
├─ domain/
└─ data/


空フォルダを

大量に事前作成しない。

------------------------------------------------------------------------

## 配置判断


Feature固有か

Business Ruleか

UIか

技術基盤か

複数Featureで意味が共通か

Platform固有か


曖昧な場合に

`utils.dart`へ置かない。

------------------------------------------------------------------------

# Naming Rules

------------------------------------------------------------------------

Folder・File


snake_case


Class


UpperCamelCase


Variable・Function


lowerCamelCase


Provider


{target}Provider


UseCase


{verb}_{object}_use_case.dart


Repository Implementation


{technology}_{target}_repository.dart


曖昧名禁止


common

custom

misc

helper

manager

service


Serviceは

責務が明確な場合のみ使用する。

------------------------------------------------------------------------

# State Management Rules

------------------------------------------------------------------------

## 採用

Riverpod。

## Provider種別

-   Dependency Provider
-   Repository Provider
-   UseCase Provider
-   Query Provider
-   Controller Provider
-   Derived Provider

## watch

表示状態。

## read

Event実行。

## listen

Navigation、SnackBar等の副作用。

Build中に

Navigationを直接実行しない。

------------------------------------------------------------------------

## Controller

Controllerは

-   UseCase呼び出し
-   UI State更新
-   重複送信防止
-   Cancel
-   Retry

を担当する。

BuildContextを保持しない。

------------------------------------------------------------------------

# Navigation Rules

------------------------------------------------------------------------

-   GoRouterを使用する
-   Named Routeを使用する
-   PathをWidgetへ直書きしない
-   Entity全体ではなくIDを渡す
-   Deep LinkをValidationする
-   Notification LinkをValidationする
-   Invalid IDをError Stateで扱う
-   ShellRouteでTabを管理する

------------------------------------------------------------------------

# Database Rules

------------------------------------------------------------------------

## 採用

Drift。

## 必須

-   Schema Version
-   Migration
-   Transaction
-   Index
-   Repository
-   In Memory Test
-   Migration Test

------------------------------------------------------------------------

## 血圧記録

複数回測定は

次を1Transactionで保存する。


Measurement Session

Individual Measurements

Representative Record

Tags


一部保存を許可しない。

------------------------------------------------------------------------

## Schema変更

Schema変更時は

必ず

-   Migration
-   Migration Test
-   Backup影響
-   Restore影響
-   Export影響
-   AI Data Snapshot影響

を確認する。

------------------------------------------------------------------------

# F001実装ルール

------------------------------------------------------------------------

F001は

血圧記録のSource of Truthである。

必須対応

-   SYS
-   DIA
-   Pulse
-   Measurement Date
-   Measurement Time
-   Time Period
-   Multiple Measurement
-   Representative Value
-   Memo
-   Tags
-   Create
-   Edit
-   Delete

------------------------------------------------------------------------

## 数値Rule

数値範囲、

必須条件、

SYS・DIA関係は

F001の仕様を参照する。

UIとDomainへ

異なるRuleを定義しない。

------------------------------------------------------------------------

## 複数回測定

対応方式

-   Average
-   Last
-   Lowest
-   User Selected

計算は

Domain Serviceで行う。

Widgetで計算しない。

------------------------------------------------------------------------

## 日時

-   Device Local Timeを正しく扱う
-   保存形式を統一する
-   Timezoneを考慮する
-   Time Period RuleをPolicy化する
-   表示と保存を混同しない

------------------------------------------------------------------------

# Design System Rules

------------------------------------------------------------------------

参照


04_DesignSystem/Colors.md

04_DesignSystem/Typography.md

04_DesignSystem/Components.md

04_DesignSystem/Animation.md

04_DesignSystem/Emotion.md


禁止

-   固定色の直書き
-   固定文字サイズの乱用
-   任意Spacingの乱用
-   任意Radiusの乱用
-   任意Durationの乱用
-   Screenごとの独自Button

ThemeData、

ThemeExtension、

Core Componentを使用する。

------------------------------------------------------------------------

# Figma Rules

------------------------------------------------------------------------

Figmaを参照する場合

-   Component名を確認する
-   Variantを確認する
-   Auto Layoutを確認する
-   Spacing Tokenを確認する
-   Text Styleを確認する
-   Color Styleを確認する
-   Responsive意図を確認する
-   Flutter Componentへ対応付ける

Screenshotだけを見て

Pixel単位で模倣しない。

Figma仕様と

Design System文書が矛盾する場合は

確認対象として扱う。

------------------------------------------------------------------------

# MCP利用ルール

------------------------------------------------------------------------

利用可能な場合は

次を活用する。

## Dart・Flutter MCP

-   Flutter SDK API確認
-   Package API確認
-   Analyzer
-   Test
-   Project理解
-   Symbol Search
-   Refactoring

## Figma MCP

-   Component
-   Frame
-   Style
-   Token
-   Layout
-   Screenshot
-   Dev Mode情報

## GitHub MCP

-   Repository
-   Issue
-   Pull Request
-   Review Comment
-   CI Status

MCPの取得結果を

無検証で実装へ反映しない。

------------------------------------------------------------------------

# Package Rules

------------------------------------------------------------------------

標準候補

-   flutter_riverpod
-   riverpod_annotation
-   go_router
-   drift
-   shared_preferences
-   flutter_secure_storage
-   fl_chart
-   flutter_local_notifications
-   permission_handler
-   pdf
-   printing
-   share_plus
-   file_picker
-   dio
-   freezed
-   json_serializable

Packages.mdを

必ず確認する。

同用途Packageを

重複導入しない。

------------------------------------------------------------------------

# Error Handling Rules

------------------------------------------------------------------------

Exceptionを

UIまで投げ続けない。


Low Level Exception
    ↓
Data Error
    ↓
AppError
    ↓
Localized Message


UIへ

Exception Messageを直接表示しない。

------------------------------------------------------------------------

## Error State

各主要画面は

-   Loading
-   Data
-   Empty
-   Failure
-   Retry

を考慮する。

------------------------------------------------------------------------

# Logging Rules

------------------------------------------------------------------------

Log可能

-   Feature Name
-   Operation
-   Error Code
-   Duration
-   Record Count
-   App Version

Log禁止

-   SYS
-   DIA
-   Pulse
-   Memo本文
-   Personal Identifier
-   Full Prompt
-   Full AI Response
-   Encryption Key
-   Token
-   Backup内容

------------------------------------------------------------------------

# Privacy Rules

------------------------------------------------------------------------

-   Local保存を基本とする
-   外部送信前に同意を得る
-   AI送信内容を最小化する
-   Analyticsへ健康データを送らない
-   Crash Reportへ健康データを送らない
-   Testへ実データを使わない
-   Screenshotへ実データを使わない
-   Backup Fileの扱いを明示する
-   Delete Allを実装する
-   Temporary Fileを削除する

------------------------------------------------------------------------

# Security Rules

------------------------------------------------------------------------

-   API KeyをClientへ埋め込まない
-   AI KeyをBackendで管理する
-   TokenをSecure Storageへ保存する
-   File ImportをValidationする
-   Deep LinkをValidationする
-   Path Traversalを防ぐ
-   Zip Slipを防ぐ
-   SQL Parameter Queryを使用する
-   Backup暗号化を検討する
-   SecretをGit管理しない

------------------------------------------------------------------------

# AI Feature Rules

------------------------------------------------------------------------

## 構成


AI Feature
    ↓
AI Controller
    ↓
AI UseCase
    ↓
AI Workflow
    ↓
AI Repository
    ↓
Backend


AI Featureから

Driftへ直接アクセスしない。

------------------------------------------------------------------------

## 必須

-   Consent
-   Data Minimization
-   Local Aggregation
-   Prompt Version
-   Timeout
-   Cancel
-   Retry Limit
-   Parse
-   Schema Validation
-   Safety Validation
-   Grounding Validation
-   Disclaimer
-   Fallback
-   Feature Flag

------------------------------------------------------------------------

## 医療安全

AIは

-   診断しない
-   薬変更を指示しない
-   治療方針を断定しない
-   根拠なく安心させない
-   緊急性を断定しない
-   医療者の代替にならない

------------------------------------------------------------------------

## AI出力

AI出力は

生成結果であることを明示する。

利用者の確認なしに

記録、設定、Reminderを変更しない。

------------------------------------------------------------------------

# Test Rules

------------------------------------------------------------------------

実装完了条件に

Testを含める。

## Unit

-   Value Object
-   Domain Service
-   UseCase
-   Mapper
-   Validator
-   AI Safety

## Widget

-   Loading
-   Data
-   Empty
-   Error
-   Accessibility
-   Large Text

## Integration

-   Create
-   Edit
-   Delete
-   History
-   Graph
-   Export
-   Backup Restore
-   AI Fallback

------------------------------------------------------------------------

## Bug Fix Test

不具合修正時は

再現するTestを先に追加できる場合は追加する。

修正後、

そのTestがPassすることを確認する。

------------------------------------------------------------------------

# Accessibility Rules

------------------------------------------------------------------------

-   Semanticsを設定する
-   Input Labelを設定する
-   Button Labelを設定する
-   Screen Reader順序を確認する
-   Text Scale 200%を考慮する
-   Touch Targetを確保する
-   Contrastを確認する
-   Graph代替情報を提供する
-   Reduce Motionを考慮する
-   Colorだけで状態を伝えない

------------------------------------------------------------------------

# Performance Rules

------------------------------------------------------------------------

-   Build内で重い計算をしない
-   大量履歴はPagingを検討する
-   Graph Dataを事前集計する
-   Provider selectを利用する
-   constを利用する
-   Database Indexを設定する
-   Export処理をUI Threadへ集中させない
-   AI Loadingを即時表示する
-   無制限Retryを行わない

------------------------------------------------------------------------

# Generated Code Rules

------------------------------------------------------------------------

対象


*.g.dart

*.freezed.dart

*.mocks.dart


禁止

-   手動編集
-   一部だけCopy
-   Generated Sourceの直接修正
-   Source未更新でGeneratedだけ変更

生成元を修正し、

build_runnerを実行する。

------------------------------------------------------------------------

# Git Rules

------------------------------------------------------------------------

## Commit

-   1 Commit 1目的
-   Generated Fileを含める
-   Testを含める
-   Secretを含めない
-   大容量一時Fileを含めない

## Branch

例


feature/f001-recording

fix/history-filter

refactor/database-repository

docs/agents


## Pull Request

必須記載

-   Purpose
-   Changes
-   Related Feature ID
-   Test
-   Screenshot
-   Migration
-   Privacy
-   AI Impact
-   Risk
-   Rollback

------------------------------------------------------------------------

# Code Review Rules

------------------------------------------------------------------------

Review観点

-   Requirement一致
-   Architecture
-   Dependency Direction
-   State Management
-   Error Handling
-   Data Integrity
-   Privacy
-   Security
-   Accessibility
-   Performance
-   Test
-   Documentation
-   AI Safety

見た目だけで

Approveしない。

------------------------------------------------------------------------

# 変更影響分析

------------------------------------------------------------------------

変更前に

次を確認する。


Feature

Screen

Navigation

Database

Migration

Export

Backup

Notification

AI

Privacy

Test

Release


------------------------------------------------------------------------

## F001変更時

最低限確認

-   Home
-   History
-   Graph
-   Statistics
-   Export
-   Backup
-   AI Summary
-   Migration
-   Regression

------------------------------------------------------------------------

# 出力規則

------------------------------------------------------------------------

## Code生成

-   完成コードを出力する
-   省略記号を使わない
-   Importを含める
-   Null Safetyへ対応する
-   Deprecated APIを避ける
-   コメントは必要箇所だけ
-   Existing Styleへ合わせる
-   Test Codeを含める

------------------------------------------------------------------------

## Markdown生成

-   日本語で作成する
-   F001テンプレートへ合わせる
-   見出し構成を統一する
-   `------------------------------------------------------------------------`を使用する
-   Code Blockを適切に使う
-   Acceptance Criteriaを含める
-   Related Documentsを含める
-   Future Extensionを含める

------------------------------------------------------------------------

## File生成

ユーザーがFileを求めた場合

-   内容を画面へ全文表示しない
-   完成Fileを生成する
-   指定File名を使用する
-   UTF-8で保存する
-   ダウンロードLinkを返す

------------------------------------------------------------------------

# 不明点への対応

------------------------------------------------------------------------

明確な仕様がない場合

優先順


1. Existing Requirements

2. Existing Code

3. Related Screen

4. Design System

5. Architecture Convention

6. Safe Default


重大な仕様判断は

推測で確定しない。

ただし作業継続が必要な場合は

最も安全で変更しやすいDefaultを採用し、

Assumptionを明示する。

------------------------------------------------------------------------

# 安全なDefault

------------------------------------------------------------------------

-   Local First
-   Offline利用可能
-   AI無効
-   Analytics無効
-   Health Data非送信
-   Confirmationあり
-   Delete前確認
-   Retry上限あり
-   Timeoutあり
-   Error時Data保持
-   Accessibility有効
-   Dark・Light対応
-   Test追加

------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   仕様未確認で実装を始める
-   F001と異なる形式で文書を作る
-   ScreenへBusiness Logicを書く
-   WidgetからDatabaseを直接呼ぶ
-   DomainへFlutterをimportする
-   Feature間でDataSourceを直接参照する
-   巨大なutils.dartを作る
-   何でもsharedへ置く
-   BuildContextをControllerへ保持する
-   Exception Messageをそのまま表示する
-   Route Pathを直書きする
-   固定Design値を乱用する
-   Packageを無検証で追加する
-   Generated Codeを編集する
-   MigrationなしでSchema変更する
-   TestなしでBug Fixを完了扱いにする
-   実利用者データをFixtureへ使う
-   Health DataをLogへ出す
-   AI KeyをClientへ埋め込む
-   AI出力を自動適用する
-   AIを通常機能の必須依存にする
-   医療診断を生成する
-   薬変更を指示する
-   Release Checklist未完了でProductionへ出す

------------------------------------------------------------------------

# 作業完了チェック

------------------------------------------------------------------------

AIは完了前に

次を確認する。

## Specification

-   対象Feature IDが明確
-   Acceptance Criteriaを満たす
-   Related Documentsと一致する
-   不要な仕様変更がない

## Architecture

-   Layer分離されている
-   Dependency Directionが正しい
-   Feature Firstへ従う
-   Repository境界がある
-   Providerで依存注入できる

## UI

-   Screen仕様と一致する
-   Design Systemを使用する
-   Loading・Empty・Errorがある
-   Accessibilityへ対応する
-   Large Textで操作できる

## Data

-   保存値が正しい
-   Transactionが必要箇所にある
-   Migration影響を確認した
-   Backup影響を確認した
-   Export値と一致する

## AI

-   Consentがある
-   Dataを最小化する
-   Safety Validationがある
-   Grounding Validationがある
-   Fallbackがある
-   AI停止時も主要機能が動く

## Test

-   Unit Testを追加した
-   Widget Testを追加した
-   Integration影響を確認した
-   Regressionを追加した
-   Analyzeが成功する
-   Testが成功する

## Security・Privacy

-   Secretを含まない
-   Health DataをLogへ出さない
-   External送信を確認した
-   File入力をValidationする
-   Temporary Fileを削除する

## Documentation

-   必要な文書を更新した
-   Package変更を記録した
-   Migration変更を記録した
-   AI Prompt Versionを記録した
-   Release影響を記録した

------------------------------------------------------------------------

# Definition of Done

------------------------------------------------------------------------

次をすべて満たした場合に

作業完了とする。

□ 仕様と実装が一致している

□ Acceptance Criteriaを満たしている

□ Architecture Ruleを守っている

□ Folder Ruleを守っている

□ Existing Featureを壊していない

□ Health Dataを正確に扱っている

□ Error・Empty・Loadingを扱っている

□ Accessibilityへ対応している

□ Privacy・Securityを確認している

□ AI Safetyを確認している

□ Unit Testがある

□ 必要なWidget Testがある

□ Regression Testがある

□ Analyzerが成功する

□ Testが成功する

□ Generated Codeが最新である

□ Documentationを更新している

□ Release影響を確認している

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Context

-   AIがAGENTS.mdを参照できる
-   優先順位を理解できる
-   必要文書を参照できる
-   不明点を推測で固定しない
-   F001テンプレートを使用できる

## Flutter

-   Feature Firstに従う
-   Layerを分離する
-   Riverpodを使用する
-   GoRouterを使用する
-   Driftを使用する
-   Repositoryを使用する
-   DomainをFlutter非依存にする

## Data

-   F001をSource of Truthとする
-   複数回測定を正しく扱う
-   Transactionを使用する
-   Migrationを検証する
-   Backup・Export影響を確認する

## UI

-   Design Systemを使用する
-   Figmaとの対応を確認する
-   Accessibilityへ対応する
-   Large Textへ対応する
-   Error Stateを実装する

## AI

-   AI Workflowへ従う
-   Consentを確認する
-   Safetyを確認する
-   Groundingを確認する
-   Fallbackを実装する
-   AI非依存を維持する

## Quality

-   Packageを無検証で追加しない
-   Generated Codeを編集しない
-   Testを追加する
-   Analyzeを実行する
-   Documentationを更新する
-   Release Checklistを確認する

------------------------------------------------------------------------

## Acceptance Criteria

□ AIエージェントがプロジェクトの目的を理解できる

□ 指示の優先順位を判断できる

□ 作業開始前の参照文書を判断できる

□ F001を標準テンプレートとして文書を作成できる

□ Feature IDとScreen IDを確認できる

□ Acceptance Criteriaを実装基準にできる

□ Feature First構成を維持できる

□ Presentation、Application、Domain、Dataを分離できる

□ DomainをFlutter非依存にできる

□ Riverpodで状態管理と依存注入ができる

□ GoRouterでNavigationを管理できる

□ DriftでDatabaseを管理できる

□ Schema変更時にMigrationを追加できる

□ F001をSource of Truthとして扱える

□ 複数回測定をDomainで処理できる

□ Design Systemを使用できる

□ FigmaとFlutterを対応付けられる

□ MCPを安全に活用できる

□ Package追加前に評価できる

□ Errorを型として扱える

□ Health DataをLogへ出さない

□ Privacy by Designを実践できる

□ AI機能を通常機能から分離できる

□ AI同意を確認できる

□ AI SafetyとGroundingを検証できる

□ AI停止時も主要機能を利用可能にできる

□ Unit、Widget、Integration Testを追加できる

□ Bug Fix時にRegression Testを追加できる

□ Accessibilityへ対応できる

□ Generated Codeを手動編集しない

□ Git・PRの品質情報を記録できる

□ 変更影響を分析できる

□ 完了前チェックを実行できる

□ Definition of Doneを満たせる

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

★★★★★（すべてのAI開発作業で必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap.md
-   00_Project/Roadmap_日本語版.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/F001_BloodPressureRecording.md
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
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/Packages.md
-   07_Test/TestPlan.md
-   08_Release/ReleaseChecklist.md

------------------------------------------------------------------------

## 将来拡張

-   CodingRules.md
-   CurrentArchitecture.md
-   CurrentFeatureMap.md
-   PromptExamples.md
-   PullRequestTemplate.md
-   IssueTemplate.md
-   AI Review Checklist
-   Architecture Lint
-   Forbidden Import Check
-   Prompt Validation Tool
-   AI Context自動生成
-   Figma Component Map
-   Requirement Traceability Map
-   MCP Operation Guide
-   Multi Agent Workflow
-   Agent Role Definition
-   Automated Documentation Sync
-   Release Agent
-   Test Generation Agent
-   Privacy Review Agent
-   AI Safety Review Agent
