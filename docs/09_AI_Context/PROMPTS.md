# PROMPTS.md

# BloodPressureApp AI開発コンテキスト

Version: 1.0

------------------------------------------------------------------------

# PROMPTS

## ドキュメントID

AI-CONTEXT-PROMPTS-001

------------------------------------------------------------------------

## 名称

BloodPressureApp AI開発プロンプト標準集

------------------------------------------------------------------------

## 目的

BloodPressureAppの企画、要件定義、

UX、Screen設計、Figma、

Flutter実装、Test、Review、

Bug Fix、Refactoring、

AI Safety、Releaseにおいて、

AI開発エージェントへ与える

プロンプトの品質と構造を統一する。

本書は、

ChatGPT、Codex、Claude Code、

Gemini、GitHub Copilot、

IDE Agent、CLI Agent、

MCP Clientで再利用可能な

Prompt Templateを提供する。

AIは本書のPromptを

そのまま機械的に使うのではなく、

対象Feature、Screen、

Current Code、User Instructionへ合わせて

必要なPlaceholderを具体化して使用する。

------------------------------------------------------------------------

## 適用範囲

-   Project Planning
-   Requirements
-   UX
-   Screen Specification
-   Design System
-   Figma
-   Flutter
-   Riverpod
-   GoRouter
-   Drift
-   AI Feature
-   Unit Test
-   Widget Test
-   Integration Test
-   Code Review
-   Bug Fix
-   Refactoring
-   Migration
-   Backup
-   Export
-   Accessibility
-   Security
-   Privacy
-   Release
-   Documentation

------------------------------------------------------------------------

## 基本方針

-   Promptの目的を一つにする
-   対象Feature IDを明示する
-   対象Screen IDを明示する
-   参照文書を明示する
-   制約を明示する
-   期待する出力形式を明示する
-   完了条件を明示する
-   推測禁止事項を明示する
-   Health Dataの安全性を明示する
-   AIが作業前に既存Codeを確認するよう指示する
-   Testを出力へ含める
-   Documentation更新を含める
-   不要なPackage追加を禁止する
-   Generated Code編集を禁止する
-   省略コードを禁止する
-   実行結果の検証を要求する
-   変更影響を要求する
-   F001を中心Domainとして扱う

------------------------------------------------------------------------

# Prompt優先順位

------------------------------------------------------------------------

Prompt作成時は

次の順序で内容を決める。


1. ユーザーの明示依頼

2. PROJECT.md

3. AGENTS.md

4. 対象Feature Requirement

5. 対象Screen仕様

6. SCREEN_CONTEXT.md

7. DESIGN_RULES.md

8. CODING_RULES.md

9. Architecture・Test Plan


------------------------------------------------------------------------

# Prompt基本構造

------------------------------------------------------------------------

標準Promptは

次の順序で構成する。


1. Role

2. Goal

3. Context

4. Reference Documents

5. Scope

6. Requirements

7. Constraints

8. Implementation Rules

9. Test Requirements

10. Output Format

11. Acceptance Criteria


------------------------------------------------------------------------

# Placeholder Rules

------------------------------------------------------------------------

主なPlaceholder


{FEATURE_ID}

{FEATURE_NAME}

{SCREEN_ID}

{SCREEN_NAME}

{TARGET_FILE}

{TARGET_FOLDER}

{RELATED_FILES}

{CURRENT_BEHAVIOR}

{EXPECTED_BEHAVIOR}

{ERROR_MESSAGE}

{FIGMA_URL}

{FIGMA_FRAME}

{ROUTE_NAME}

{PACKAGE_NAME}

{TEST_TARGET}

{OUTPUT_FILENAME}


Placeholderを

未置換のままAIへ渡さない。

------------------------------------------------------------------------

# 共通System Prompt

------------------------------------------------------------------------


あなたは、熟練したFlutter開発エンジニアです。

特に、Flutter、Dart、Riverpod、GoRouter、Drift、
Figma Dev Mode、MCP、AI活用開発、
アクセシビリティ、テスト設計に精通しています。

BloodPressureAppでは、以下を必ず守ってください。

- PROJECT.md、AGENTS.mdを最初に確認する
- 対象FeatureとScreen仕様を確認する
- F001 Blood Pressure Recordingを中心Domainとして扱う
- Health Dataの正確性、Privacy、安全性を最優先する
- DomainをFlutter非依存にする
- Feature FirstとLayered Architectureに従う
- Riverpodで状態管理と依存注入を行う
- GoRouterでNavigationを管理する
- Driftで永続化する
- UIへBusiness Logicを書かない
- Design Systemと共通Componentを使用する
- Loading、Empty、Error、Accessibilityを省略しない
- Generated Codeを手動編集しない
- 不要なPackageを追加しない
- 実装と同時にTestを追加する
- 省略記号を使わず、完成した成果物を出力する
- 完了前にAcceptance Criteriaを確認する


------------------------------------------------------------------------

# 共通作業開始Prompt

------------------------------------------------------------------------


次の作業を開始する前に、
Project Contextと対象範囲を確認してください。

参照順序：

1. 09_AI_Context/PROJECT.md
2. 09_AI_Context/AGENTS.md
3. 09_AI_Context/SCREEN_CONTEXT.md
4. 09_AI_Context/DESIGN_RULES.md
5. 09_AI_Context/CODING_RULES.md
6. 対象Feature Requirement
7. 対象Screen仕様
8. Architecture、FolderStructure、Packages
9. Existing Code、Existing Test

対象：

- Feature ID: {FEATURE_ID}
- Feature Name: {FEATURE_NAME}
- Screen ID: {SCREEN_ID}
- Screen Name: {SCREEN_NAME}
- Target Files: {TARGET_FILE}

最初に、
仕様、既存構造、影響範囲、Test対象を整理してから作業してください。

仕様が明確な場合は質問せず、
安全で最小の変更を実施してください。

重大な仕様矛盾がある場合は、
矛盾箇所と判断根拠を明示してください。


------------------------------------------------------------------------

# Requirements作成Prompt

------------------------------------------------------------------------

## 新規Feature Requirement


F001_BloodPressureRecording.mdを標準テンプレートとして、
次のFeature Requirementを日本語で作成してください。

Feature ID:
{FEATURE_ID}

Feature Name:
{FEATURE_NAME}

目的:
{GOAL}

関連Screen:
{RELATED_SCREENS}

必須条件：

- F001と同じ見出し構成、粒度、品質にする
- ドキュメントIDを付ける
- 目的を定義する
- 対象利用者を定義する
- Scope、Out of Scopeを定義する
- Functional Requirementを詳細化する
- User Flowを定義する
- Input、Validation、Errorを定義する
- Loading、Empty、Offlineを定義する
- Data Model影響を定義する
- Privacy、Securityを定義する
- Accessibilityを定義する
- Test項目を定義する
- Acceptance Criteriaをチェック形式で定義する
- 依存機能を定義する
- 優先度を定義する
- 関連ドキュメントを定義する
- 将来拡張を定義する
- 推測で医療機能を追加しない
- F001と矛盾する血圧Ruleを作らない

出力：

完成したMarkdownファイルのみ。


------------------------------------------------------------------------

## Requirement Review


次のFeature RequirementをReviewしてください。

対象:
{TARGET_FILE}

基準:
- PROJECT.md
- AGENTS.md
- F001_BloodPressureRecording.md
- FeatureIndex.md
- UserFlow.md
- Navigation.md
- TestPlan.md

確認項目：

- 目的が明確か
- Scopeが明確か
- Functional RequirementがTest可能か
- F001との整合性があるか
- Error、Empty、Loadingがあるか
- Accessibilityがあるか
- Privacy、Securityがあるか
- Acceptance Criteriaが十分か
- 依存機能が明確か
- Out of Scopeが不足していないか
- 医療判断を暗黙に追加していないか
- 実装可能な粒度か

出力形式：

1. Critical
2. High
3. Medium
4. Low
5. 修正版提案
6. Acceptance Criteria不足一覧


------------------------------------------------------------------------

# UX作成Prompt

------------------------------------------------------------------------

## User Flow


BloodPressureAppの次のUser Flowを
日本語で作成してください。

対象Feature:
{FEATURE_ID} {FEATURE_NAME}

開始地点:
{ENTRY_POINT}

完了条件:
{SUCCESS_CONDITION}

参照:
- PROJECT.md
- AGENTS.md
- 対象Feature Requirement
- UserFlow.md
- Navigation.md
- SCREEN_CONTEXT.md

必須：

- Happy Path
- Cancel
- Back
- Validation Error
- Save Error
- Empty
- Offline
- Permission
- Retry
- Unsaved Draft
- Accessibility
- AI Fallbackが必要な場合
- Screen IDとRoute
- Data更新タイミング
- Test観点

F001と異なる血圧入力Ruleを作らないでください。


------------------------------------------------------------------------

## Navigation Review


次のNavigation変更をReviewしてください。

変更内容:
{CHANGE_SUMMARY}

対象Route:
{ROUTE_NAME}

確認：

- Main Navigationの一貫性
- Entry・Exit
- Back Stack
- Unsaved Draft
- Deep Link
- Notification Link
- Invalid ID
- Entity全体を渡していないか
- Route Pathを直書きしていないか
- GoRouterの責務
- Accessibility
- Integration Test

問題がある場合は
安全な修正案を提示してください。


------------------------------------------------------------------------

# Screen仕様作成Prompt

------------------------------------------------------------------------


F001_BloodPressureRecording.mdと
03_Screens/Input.mdの品質を基準として、
次のScreen仕様を日本語で作成してください。

Screen ID:
{SCREEN_ID}

Screen Name:
{SCREEN_NAME}

Primary Feature:
{FEATURE_ID}

目的:
{GOAL}

Entry:
{ENTRY}

Exit:
{EXIT}

必須：

- ドキュメントID
- Screen目的
- 対象利用者
- Entry・Exit
- Primary Action
- Layout
- Section
- Component
- State
- Input
- Validation
- Loading
- Empty
- Error
- Offline
- Navigation
- Data Dependency
- Riverpod Provider候補
- Flutter Widget候補
- Figma Component対応
- Responsive
- Light・Dark
- Text Scale 200%
- Screen Reader
- Widget Test
- Golden Test
- Integration Test
- Acceptance Criteria
- Related Documents
- Future Extension

SCREEN_CONTEXT.mdとDESIGN_RULES.mdへ従ってください。


------------------------------------------------------------------------

# Figma設計Prompt

------------------------------------------------------------------------

## Frame設計


次のScreenをFigmaで設計するための
実装可能なDesign Specificationを作成してください。

Screen:
{SCREEN_ID} {SCREEN_NAME}

Feature:
{FEATURE_ID}

参照:
- Screen仕様
- SCREEN_CONTEXT.md
- DESIGN_RULES.md
- Colors.md
- Typography.md
- Components.md

必須出力：

- Frame名
- Device Size候補
- Auto Layout構造
- Section構造
- Component名
- Variant
- Padding
- Gap
- Token名
- Text Style
- Color Variable
- Responsive Rule
- Compact、Medium、Expanded
- Loading、Empty、Error
- Light、Dark
- Text Scale対応
- Semantics意図
- Flutter Widget対応表
- Prototype Link一覧

固定座標だけで構成しないでください。


------------------------------------------------------------------------

## FigmaからFlutter変換


Figma Dev ModeとFigma MCPから取得した情報を元に、
次のScreenをFlutterへ実装してください。

Figma Frame:
{FIGMA_FRAME}

Screen:
{SCREEN_ID} {SCREEN_NAME}

Route:
{ROUTE_NAME}

参照:
- SCREEN_CONTEXT.md
- DESIGN_RULES.md
- CODING_RULES.md
- 対象Screen仕様
- Existing Design Tokens
- Existing Components

実装条件：

- Screenshotの模写ではなくComponent・Variable・Auto Layoutを解釈する
- Figma VariableをFlutter Tokenへ対応する
- Figma Componentを既存Widgetへ対応する
- 既存Componentがある場合は再利用する
- 固定Color、固定TextStyle、任意Spacingを直書きしない
- Responsiveにする
- Light・Darkへ対応する
- Text Scale 200%へ対応する
- Semanticsを実装する
- Loading、Empty、Errorを実装する
- Widget TestとGolden Testを追加する
- 省略なしの完成コードを出力する


------------------------------------------------------------------------

# Flutter Feature実装Prompt

------------------------------------------------------------------------


次のFeatureをFlutterで実装してください。

Feature:
{FEATURE_ID} {FEATURE_NAME}

Screen:
{SCREEN_ID} {SCREEN_NAME}

Target:
{TARGET_FILES}

参照:
- PROJECT.md
- AGENTS.md
- 対象Feature Requirement
- 対象Screen仕様
- SCREEN_CONTEXT.md
- DESIGN_RULES.md
- CODING_RULES.md
- Architecture.md
- FolderStructure.md
- Packages.md
- TestPlan.md
- Existing Code

実装条件：

- Feature First
- Presentation、Application、Domain、Dataを分離する
- DomainをFlutter非依存にする
- Repository InterfaceをDomainへ置く
- UseCaseをApplicationへ置く
- Riverpodで依存注入する
- GoRouterでNavigationする
- Drift RowをPresentationへ返さない
- UIへBusiness Logicを書かない
- Errorを型で扱う
- Loading、Empty、Errorを扱う
- Design Tokenと共通Componentを使用する
- Localizationへ対応する
- Accessibilityへ対応する
- 不要なPackageを追加しない
- Generated Codeを編集しない
- Health DataをLogへ出さない
- Unit、Widget、必要なIntegration Testを追加する
- Existing Featureを壊さない
- 省略記号なしの完成コードを出力する

完了前に：
- dart format
- flutter analyze
- flutter test
- Acceptance Criteria確認

を行ってください。


------------------------------------------------------------------------

# F001実装Prompt

------------------------------------------------------------------------


F001 Blood Pressure Recordingを実装または更新してください。

必須Domain：

- BloodPressureRecord
- MeasurementSession
- Measurement
- RepresentativeValue
- AggregationMethod
- TimePeriod
- Memo
- Tags

必須Rule：

- SYS、DIA、PulseのValidation
- Pulse nullを0扱いしない
- Date・Timeを正しく扱う
- Multiple MeasurementをDomain Serviceで計算する
- Single、Average、Last、Lowest、User Selectedに対応する
- 丸めRuleを明示する
- Session、Measurements、Representative Record、Tagsを1Transactionで保存する
- UIとDomainで異なるValidationを作らない
- Home、History、Graph、Statistics、Exportが同じSource of Truthを使う
- Save Error時にDraftを保持する
- Edit、Deleteへ対応する
- Migration影響を確認する
- Backup、Restore、Export影響を確認する

Test：

- Boundary
- Pulse null
- Multiple Measurement
- Aggregation
- Transaction Rollback
- Edit
- Delete
- Date Boundary
- Timezone
- Regression


------------------------------------------------------------------------

# Riverpod実装Prompt

------------------------------------------------------------------------


次のFeatureのRiverpod構成を設計・実装してください。

Feature:
{FEATURE_ID}

対象State:
{STATE_DESCRIPTION}

必須：

- Dependency Provider
- Repository Provider
- UseCase Provider
- Query Provider
- Controller Provider
- Derived Providerの必要性判断
- watch、read、listenの使い分け
- selectによるRebuild最適化
- autoDisposeの判断
- keepAliveの理由
- BuildContextをProviderへ保持しない
- Navigation、SnackbarはSide Effectとして分離する
- Duplicate Requestを防止する
- Retry、Cancelを定義する
- Provider Override可能なTestを作成する

出力：

- Provider一覧
- Dependency Diagram
- 完成コード
- Unit Test
- Widget Test


------------------------------------------------------------------------

# GoRouter実装Prompt

------------------------------------------------------------------------


次のNavigationをGoRouterで実装してください。

Route:
{ROUTE_NAME}

Path:
{ROUTE_PATH}

Entry:
{ENTRY}

Exit:
{EXIT}

必須：

- Named Route
- Path一元管理
- Entity全体ではなくIDを渡す
- Parameter Validation
- Invalid ID Error State
- Deep Link
- Notification Link
- Back Stack
- Unsaved Draft
- ShellRouteとの関係
- Redirect責務の最小化
- Integration Test

WidgetへPath Literalを書かないでください。


------------------------------------------------------------------------

# Drift実装Prompt

------------------------------------------------------------------------


次のData ModelをDriftで実装してください。

Feature:
{FEATURE_ID}

Tables:
{TABLES}

必須：

- Table定義
- Primary Key
- Foreign Key
- Index
- Nullable方針
- DateTime保存方針
- DAO
- Repository Implementation
- Mapper
- Transaction
- Schema Version
- Migration
- Migration Test
- In Memory Test
- Backup・Restore影響
- Export影響
- AI Snapshot影響

禁止：

- Drift RowをPresentationへ返す
- String連結SQL
- MigrationなしのSchema変更
- Partial Save


------------------------------------------------------------------------

# AI Feature実装Prompt

------------------------------------------------------------------------


次のAI Featureを安全に実装してください。

Feature:
{FEATURE_ID} {FEATURE_NAME}

Purpose:
{GOAL}

参照:
- Prompt.md
- AIWorkflow.md
- AGENTS.md
- PROJECT.md
- 対象Feature Requirement
- Privacy仕様

必須Workflow：

1. Consent
2. Data Selection
3. Local Aggregation
4. Data Minimization
5. Prompt Version
6. Request
7. Timeout
8. Cancel
9. Retry Limit
10. Parse
11. Schema Validation
12. Safety Validation
13. Grounding Validation
14. Display
15. Fallback

禁止：

- 診断
- 薬変更指示
- 治療方針断定
- 緊急性断定
- Full Record送信
- Memo全文送信
- API KeyのClient埋め込み
- AI結果の自動適用
- AIを主要機能の必須依存にする

必須Test：

- Consentなし
- Offline
- Timeout
- Invalid JSON
- Schema Failure
- Safety Block
- Grounding Failure
- Cancel
- Retry Limit
- Fallback


------------------------------------------------------------------------

# Unit Test生成Prompt

------------------------------------------------------------------------


次の対象へUnit Testを追加してください。

Target:
{TEST_TARGET}

参照:
- 対象Feature Requirement
- CODING_RULES.md
- TestPlan.md
- Existing Tests

必須：

- Given・When・Then
- Normal
- Boundary
- Invalid
- Null
- Error
- Retry
- Time
- Timezone
- Transaction
- Regression
- Fakeを優先
- Clockを注入
- Random Seedを固定
- 実利用者Dataを使用しない
- Test名から条件と期待結果が分かる

不足しているTestabilityがある場合は、
Production Codeを最小変更してください。


------------------------------------------------------------------------

# Widget Test生成Prompt

------------------------------------------------------------------------


次のScreenへWidget Testを追加してください。

Screen:
{SCREEN_ID} {SCREEN_NAME}

必須State：

- Initial
- Loading
- Data
- Empty
- Error
- Submitting
- Disabled
- Offline

必須確認：

- Primary Action
- Navigation
- Validation
- Error Message
- Draft保持
- Retry
- Semantics
- Text Scale 200%
- Dark Mode
- Provider Override
- Duplicate Tap防止

Screen仕様とSCREEN_CONTEXT.mdへ従ってください。


------------------------------------------------------------------------

# Golden Test生成Prompt

------------------------------------------------------------------------


次のUIへGolden Testを追加してください。

Target:
{TEST_TARGET}

条件：

- Light
- Dark
- Standard Text
- Large Text
- Compact
- Tablet
- Loading
- Empty
- Error

必須：

- 安定したFixture
- Clock固定
- Animation停止または安定化
- Font差への対策
- Device Size明示
- Golden差分を無確認更新しない
- Semantics Testは別途追加する


------------------------------------------------------------------------

# Integration Test生成Prompt

------------------------------------------------------------------------


次のUser FlowへIntegration Testを追加してください。

Flow:
{FLOW_DESCRIPTION}

開始:
{ENTRY_POINT}

完了:
{SUCCESS_CONDITION}

必須：

- App起動
- Navigation
- Input
- Validation
- Save
- Repository反映
- 画面再表示
- Error Recovery
- Back
- Offline
- Accessibilityに影響する主要操作
- Cleanup

Test Dataは架空Dataを使用してください。


------------------------------------------------------------------------

# Code Review Prompt

------------------------------------------------------------------------


次の変更をCode Reviewしてください。

対象:
{TARGET_FILES}

Feature:
{FEATURE_ID}

Review基準:
- AGENTS.md
- PROJECT.md
- CODING_RULES.md
- DESIGN_RULES.md
- SCREEN_CONTEXT.md
- 対象Feature Requirement
- Architecture.md
- TestPlan.md

確認項目：

- Requirement一致
- Acceptance Criteria
- Architecture
- Dependency Direction
- Naming
- Type Safety
- Null
- Riverpod
- GoRouter
- Drift
- Async
- Error Handling
- Transaction
- Data Integrity
- Privacy
- Security
- Accessibility
- Performance
- Test
- Documentation
- AI Safety

出力形式：

1. Critical
2. High
3. Medium
4. Low
5. Good Points
6. 修正案
7. 追加Test
8. Merge可否


------------------------------------------------------------------------

# Bug調査Prompt

------------------------------------------------------------------------


次の不具合を調査し、修正してください。

Current Behavior:
{CURRENT_BEHAVIOR}

Expected Behavior:
{EXPECTED_BEHAVIOR}

Reproduction:
{REPRO_STEPS}

Error:
{ERROR_MESSAGE}

関連Feature:
{FEATURE_ID}

対象Files:
{TARGET_FILES}

手順：

1. 仕様確認
2. 再現
3. Root Cause特定
4. 影響範囲確認
5. Regression Test追加
6. 最小修正
7. 周辺Test
8. Documentation影響確認

禁止：

- 症状だけを隠す
- Errorを握り潰す
- Testなしで完了扱いにする
- 無関係なRefactoringを混ぜる

出力：

- Root Cause
- 修正内容
- 変更Files
- Test
- Risk
- Remaining Issue


------------------------------------------------------------------------

# Refactoring Prompt

------------------------------------------------------------------------


次の対象を外部挙動を変えずにRefactoringしてください。

Target:
{TARGET_FILES}

目的:
{REFACTOR_GOAL}

必須：

- Existing Testを確認する
- Behavior Changeを含めない
- Responsibilityを明確にする
- Dependency Directionを守る
- Namingを改善する
- Duplicateを減らす
- Testabilityを改善する
- Performanceを悪化させない
- Migrationを発生させない
- Mechanical ChangeとBehavior Changeを分ける
- Format、Analyze、Testを実行する

出力：

- Beforeの問題
- Refactoring方針
- 完成コード
- Test結果
- Risk


------------------------------------------------------------------------

# Performance Review Prompt

------------------------------------------------------------------------


次のFeatureのPerformanceを調査してください。

Feature:
{FEATURE_ID}

Symptom:
{CURRENT_BEHAVIOR}

対象:
{TARGET_FILES}

確認：

- Unnecessary Rebuild
- Provider watch範囲
- select
- Large List
- Database Query
- Index
- Graph Data
- Image
- File
- Memory
- Stream Subscription
- Export
- AI Request

推測だけで最適化せず、
計測方法と根拠を示してください。

出力：

- Bottleneck候補
- 計測方法
- 計測結果
- 修正案
- Regression Risk
- Test


------------------------------------------------------------------------

# Accessibility Review Prompt

------------------------------------------------------------------------


次のScreenをAccessibility Reviewしてください。

Screen:
{SCREEN_ID} {SCREEN_NAME}

確認：

- Screen Title
- Semantics
- Reading Order
- Input Label
- Unit
- Error Announcement
- Focus
- Touch Target
- Contrast
- Color Dependence
- Text Scale 200%
- Large Button
- Screen Reader
- Reduce Motion
- Graph Alternative
- Dark Mode
- High Contrast

出力：

1. Critical Issue
2. Improvement
3. Flutter修正例
4. Figma修正
5. Widget Test
6. Manual Test


------------------------------------------------------------------------

# Privacy Review Prompt

------------------------------------------------------------------------


次のFeatureをPrivacy Reviewしてください。

Feature:
{FEATURE_ID}

Data:
{DATA_DESCRIPTION}

External Services:
{EXTERNAL_SERVICES}

確認：

- Data Minimization
- Local First
- Consent
- External Transmission
- Prompt Data
- Analytics
- Crash Reporting
- Log
- Backup
- Temporary File
- Delete All
- Retention
- Test Data
- Screenshot

出力：

- Data Flow
- Risk
- Required Change
- Consent Text
- Test
- Release Blocker


------------------------------------------------------------------------

# Security Review Prompt

------------------------------------------------------------------------


次の実装をSecurity Reviewしてください。

Target:
{TARGET_FILES}

確認：

- Secret
- API Key
- Token Storage
- File Validation
- Path Traversal
- Zip Slip
- SQL Injection
- Deep Link
- Notification Payload
- Backup Encryption
- Temporary File
- Clipboard
- Logging
- Dependency Risk

出力：

- Critical
- High
- Medium
- Low
- 修正コード
- Test
- Residual Risk


------------------------------------------------------------------------

# Database Migration Prompt

------------------------------------------------------------------------


次のSchema変更に対する
Drift Migrationを実装してください。

Current Version:
{CURRENT_VERSION}

New Version:
{NEW_VERSION}

Change:
{SCHEMA_CHANGE}

必須：

- Forward Migration
- Existing Data保持
- Default方針
- Null方針
- Transaction
- Rollback考慮
- Migration Test
- Old Schema Fixture
- Backup Compatibility
- Restore Compatibility
- Export Compatibility
- Release Note

Data Lossを許可しないでください。


------------------------------------------------------------------------

# Backup・Restore Prompt

------------------------------------------------------------------------


F008 Backup・Restoreを実装またはReviewしてください。

必須Backup：

- Version
- Schema
- Metadata
- Record
- Measurement Session
- Individual Measurements
- Settings
- Reminder
- Hash
- Encryption方針
- Atomic Write
- Cleanup

必須Restore：

- Extension Validation
- Size Validation
- Version Validation
- Hash Validation
- Content Validation
- Preview
- Confirmation
- Transaction
- Integrity Check
- Failure Rollback

必須Test：

- Valid File
- Invalid Extension
- Oversize
- Corrupt File
- Unsupported Version
- Hash Mismatch
- Partial Data
- Restore Failure
- Existing Data保持


------------------------------------------------------------------------

# Export Prompt

------------------------------------------------------------------------


F007 Exportを実装またはReviewしてください。

Format:
- PDF
- CSV

必須：

- Date Range
- Field Selection
- Preview
- Unit
- Locale
- CSV Escape
- PDF Font
- Page Number
- Generated Date
- AI Label Optional
- Disclaimer
- Temporary File Cleanup
- Share Cancel
- Large Data
- Offline

Home、History、Graph、Statisticsと
同じSource of Truthを使用してください。


------------------------------------------------------------------------

# Package評価Prompt

------------------------------------------------------------------------


次のFlutter Package追加を評価してください。

Package:
{PACKAGE_NAME}

目的:
{GOAL}

確認：

- Flutter標準で代替可能か
- 既存Packageと重複しないか
- Maintenance
- Latest Release
- License
- Android
- iOS
- Privacy
- Native設定
- App Size
- Testability
- Lock In
- Migration Cost
- Security Issue

出力：

- 採用
- 条件付き採用
- 不採用
- 代替案
- Packages.md更新案


------------------------------------------------------------------------

# Documentation更新Prompt

------------------------------------------------------------------------


次の実装変更に合わせて
Documentationを更新してください。

変更:
{CHANGE_SUMMARY}

関連Feature:
{FEATURE_ID}

関連Screen:
{SCREEN_ID}

確認対象：

- Feature Requirement
- UserFlow
- Navigation
- Screen仕様
- Design System
- Architecture
- FolderStructure
- Packages
- TestPlan
- ReleaseChecklist
- AGENTS
- PROJECT
- SCREEN_CONTEXT
- DESIGN_RULES
- CODING_RULES
- PROMPTS

F001テンプレートの形式へ合わせ、
矛盾や重複を作らないでください。


------------------------------------------------------------------------

# Release Review Prompt

------------------------------------------------------------------------


次のRelease CandidateをReviewしてください。

Version:
{VERSION}

Build:
{BUILD_NUMBER}

変更:
{CHANGE_SUMMARY}

ReleaseChecklist.mdに基づき、
Go・No-Go判定を行ってください。

確認：

- Requirement
- Critical Defect
- High Defect
- Analyze
- Unit Test
- Widget Test
- Integration Test
- Migration
- Backup Restore
- Export
- Notification
- Accessibility
- Performance
- Security
- Privacy
- AI Safety
- Android Build
- iOS Build
- Store Metadata
- Monitoring
- Rollback

出力：

- Go
- Conditional Go
- No-Go
- Blocker
- Required Action
- Evidence


------------------------------------------------------------------------

# Pull Request作成Prompt

------------------------------------------------------------------------


次の変更に対するPull Request本文を作成してください。

Feature:
{FEATURE_ID}

変更:
{CHANGE_SUMMARY}

Test:
{TEST_SUMMARY}

Migration:
{MIGRATION_SUMMARY}

Privacy:
{PRIVACY_SUMMARY}

AI Impact:
{AI_IMPACT}

Risk:
{RISK}

Rollback:
{ROLLBACK}

必須Section：

- Purpose
- Related Feature
- Changes
- Screenshots
- Test
- Database・Migration
- Accessibility
- Privacy・Security
- AI Impact
- Risk
- Rollback
- Checklist


------------------------------------------------------------------------

# GitHub Issue作成Prompt

------------------------------------------------------------------------


次の課題をGitHub Issueとして整理してください。

Title:
{ISSUE_TITLE}

Problem:
{CURRENT_BEHAVIOR}

Expected:
{EXPECTED_BEHAVIOR}

Feature:
{FEATURE_ID}

Screen:
{SCREEN_ID}

必須：

- Background
- Reproduction
- Expected
- Actual
- Scope
- Out of Scope
- Acceptance Criteria
- Test
- Risk
- Related Documents
- Labels候補


------------------------------------------------------------------------

# AI Prompt Review Prompt

------------------------------------------------------------------------


次のAI PromptをReviewしてください。

Prompt ID:
{PROMPT_ID}

Prompt Version:
{PROMPT_VERSION}

Purpose:
{GOAL}

確認：

- Role
- Goal
- Input
- Output Schema
- Medical Safety
- Diagnosis禁止
- Medication禁止
- Grounding
- Data Minimization
- Personal Data
- Prompt Injection
- Invalid Output
- Fallback
- Localization
- Versioning
- Test Cases

出力：

- Critical
- Safety Risk
- Privacy Risk
- Schema Issue
- 改善版Prompt
- Test Set


------------------------------------------------------------------------

# Prompt Injection対策Prompt

------------------------------------------------------------------------


次のAI Workflowへ
Prompt Injection対策を設計してください。

Feature:
{FEATURE_ID}

User Input:
{USER_INPUT_SOURCE}

External Content:
{EXTERNAL_CONTENT_SOURCE}

必須：

- System Instruction優先
- User DataとInstructionの分離
- External Contentを非信頼扱い
- Tool Permission制限
- Health Data最小化
- Output Schema
- Safety Validation
- Grounding
- Refusal
- Logging制限
- Test

攻撃文字列を
本番Health Dataと混在させないでください。


------------------------------------------------------------------------

# Prompt短縮Template

------------------------------------------------------------------------


対象:
{TARGET}

目的:
{GOAL}

参照:
{REFERENCES}

必須:
{REQUIREMENTS}

禁止:
{PROHIBITIONS}

Test:
{TESTS}

出力:
{OUTPUT_FORMAT}

完了条件:
{ACCEPTANCE_CRITERIA}


------------------------------------------------------------------------

# Prompt品質チェック

------------------------------------------------------------------------

Promptを使用する前に

次を確認する。

## Goal

-   目的が一つ
-   成果物が明確
-   対象範囲が明確

## Context

-   Feature IDがある
-   Screen IDがある
-   Existing Filesがある
-   Reference Documentがある

## Constraint

-   Architectureがある
-   Privacyがある
-   Accessibilityがある
-   禁止事項がある

## Output

-   File名がある
-   Formatがある
-   Code省略禁止がある
-   Test要件がある

## Completion

-   Acceptance Criteriaがある
-   Analyzeがある
-   Testがある
-   Documentation更新がある

------------------------------------------------------------------------

# AI出力のReview Checklist

------------------------------------------------------------------------

AIが出力した内容は

必ず人または別Agentが確認する。

-   Requirement一致
-   F001整合性
-   Architecture
-   Type Safety
-   Null
-   Error
-   Data Integrity
-   Privacy
-   Security
-   Accessibility
-   Performance
-   Test
-   Package
-   Generated Code
-   Documentation
-   AI Safety

------------------------------------------------------------------------

# Prompt Versioning

------------------------------------------------------------------------

各Product AI Promptは

Versionを持つ。

例


ai_summary_v1

ai_summary_v2


記録項目

-   Prompt ID
-   Version
-   Purpose
-   Input Schema
-   Output Schema
-   Safety Rule
-   Model
-   Released At
-   Test Result

------------------------------------------------------------------------

# Prompt保存場所

------------------------------------------------------------------------

開発用Prompt


09_AI_Context/PROMPTS.md


Product AI Prompt


05_AI/Prompt.md


Runtime Prompt候補


assets/prompts/


または

Backend管理。

Widgetへ

Prompt全文を直書きしない。

------------------------------------------------------------------------

# AI Tool利用Prompt

------------------------------------------------------------------------

## Figma MCP


Figma MCPを使用して、
Frame、Component、Variant、
Variable、Auto Layout、Dev Mode情報を取得してください。

取得結果を
DESIGN_RULES.mdと既存Flutter Componentへ照合し、
Screenshotだけで判断しないでください。


------------------------------------------------------------------------

## Dart・Flutter MCP


Dart・Flutter MCPを使用して、
SDK API、Package API、
Analyzer、Test、Symbol、Referenceを確認してください。

内部知識だけで
現行APIを推測しないでください。


------------------------------------------------------------------------

## GitHub


GitHubのIssue、Pull Request、
Review Comment、CI Statusを確認し、
未解決の指摘を整理してください。

Code変更前に
対象Branchと影響範囲を確認してください。


------------------------------------------------------------------------

# 禁止Prompt

------------------------------------------------------------------------

次のようなPromptを使用しない。


いい感じに作って

適当に実装して

全部自動で直して

Testは後で

とりあえず動けばよい

このScreenshotと同じにして

Packageは好きに追加してよい

AIの判断で医療Adviceを出して


------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   Feature IDなしで大規模実装を依頼する
-   Screen仕様なしでUIを生成する
-   Existing Code確認なしで全置換する
-   Acceptance Criteriaなしで完了させる
-   Testなしの実装Promptを使う
-   Health DataをPromptへ直接貼る
-   実利用者DataをAIへ送る
-   SecretをPromptへ含める
-   API KeyをPrompt例へ書く
-   医療診断を依頼する
-   薬変更を依頼する
-   AI結果の自動適用を依頼する
-   Generated Code編集を依頼する
-   MigrationなしのSchema変更を依頼する
-   Error握り潰しを依頼する
-   Packageの無検証追加を依頼する
-   Goldenの無確認更新を依頼する
-   Screenshotだけの固定座標実装を依頼する

------------------------------------------------------------------------

# 作業完了チェック

------------------------------------------------------------------------

## Prompt

-   Roleがある
-   Goalがある
-   Contextがある
-   Feature IDがある
-   Screen IDがある
-   Referenceがある
-   Scopeがある
-   Constraintがある
-   禁止事項がある
-   Output Formatがある
-   Acceptance Criteriaがある

## Flutter

-   Architectureを指定した
-   Riverpodを指定した
-   GoRouterを指定した
-   Drift影響を確認した
-   Design Systemを指定した
-   Accessibilityを指定した
-   Testを指定した

## Safety

-   Health Dataを含めていない
-   Secretを含めていない
-   Privacyを指定した
-   AI Safetyを指定した
-   Groundingを指定した
-   Fallbackを指定した

## Quality

-   省略禁止を指定した
-   Existing Code確認を指定した
-   Analyzeを指定した
-   Testを指定した
-   Documentation更新を指定した
-   Review方法を指定した

------------------------------------------------------------------------

# Definition of Done

------------------------------------------------------------------------

Prompt Templateは

次をすべて満たした場合に完了とする。

□ 目的が明確である

□ 対象範囲が明確である

□ Feature IDを指定できる

□ Screen IDを指定できる

□ 参照文書を指定できる

□ 制約を指定できる

□ 禁止事項を指定できる

□ Test要件を指定できる

□ 出力形式を指定できる

□ Acceptance Criteriaを指定できる

□ Privacyへ配慮している

□ Securityへ配慮している

□ Accessibilityへ配慮している

□ AI Safetyへ配慮している

□ Existing Code確認を要求する

□ 変更影響確認を要求する

□ Documentation更新を要求する

□ 複数AI Agentで再利用できる

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Structure

-   Roleを設定できる
-   Goalを設定できる
-   Contextを設定できる
-   Scopeを設定できる
-   Constraintを設定できる
-   Outputを設定できる

## Requirements

-   F001形式のFeature文書を作成できる
-   Requirement Reviewを実行できる
-   Acceptance Criteriaを生成できる
-   依存機能を定義できる

## UX・Screen

-   User Flowを生成できる
-   NavigationをReviewできる
-   Screen仕様を生成できる
-   Figma設計情報を生成できる
-   FigmaからFlutterへ変換できる

## Flutter

-   Feature実装を依頼できる
-   F001実装を依頼できる
-   Riverpodを設計できる
-   GoRouterを設計できる
-   Driftを設計できる
-   AI Featureを安全に実装できる

## Test

-   Unit Testを生成できる
-   Widget Testを生成できる
-   Golden Testを生成できる
-   Integration Testを生成できる
-   Regression Testを要求できる

## Quality

-   Code Reviewできる
-   Bug調査できる
-   Refactoringできる
-   Performance Reviewできる
-   Accessibility Reviewできる
-   Privacy・Security Reviewできる

## Release

-   Migrationを実装できる
-   Backup・Restoreを実装できる
-   Exportを実装できる
-   Packageを評価できる
-   Documentationを更新できる
-   Release判定できる

------------------------------------------------------------------------

## Acceptance Criteria

□ Promptの基本構造を説明できる

□ Placeholderを正しく置換できる

□ 共通System Promptを使用できる

□ 作業開始Promptを使用できる

□ F001形式のRequirement Promptを使用できる

□ Requirement Review Promptを使用できる

□ User Flow Promptを使用できる

□ Navigation Review Promptを使用できる

□ Screen仕様Promptを使用できる

□ Figma設計Promptを使用できる

□ FigmaからFlutter変換Promptを使用できる

□ Flutter Feature実装Promptを使用できる

□ F001専用実装Promptを使用できる

□ Riverpod実装Promptを使用できる

□ GoRouter実装Promptを使用できる

□ Drift実装Promptを使用できる

□ AI Feature実装Promptを安全に使用できる

□ Unit Test Promptを使用できる

□ Widget Test Promptを使用できる

□ Golden Test Promptを使用できる

□ Integration Test Promptを使用できる

□ Code Review Promptを使用できる

□ Bug調査Promptを使用できる

□ Refactoring Promptを使用できる

□ Performance Review Promptを使用できる

□ Accessibility Review Promptを使用できる

□ Privacy Review Promptを使用できる

□ Security Review Promptを使用できる

□ Migration Promptを使用できる

□ Backup・Restore Promptを使用できる

□ Export Promptを使用できる

□ Package評価Promptを使用できる

□ Documentation更新Promptを使用できる

□ Release Review Promptを使用できる

□ Pull Request Promptを使用できる

□ GitHub Issue Promptを使用できる

□ Product AI PromptをReviewできる

□ Prompt Injection対策を依頼できる

□ Prompt品質を検査できる

□ AI出力を必ずReviewできる

□ Prompt Versionを管理できる

□ Health DataとSecretをPromptへ含めない

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

★★★★★（すべてのAI活用開発で必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap.md
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
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/Packages.md
-   07_Test/TestPlan.md
-   08_Release/ReleaseChecklist.md
-   09_AI_Context/AGENTS.md
-   09_AI_Context/PROJECT.md
-   09_AI_Context/DESIGN_RULES.md
-   09_AI_Context/CODING_RULES.md
-   09_AI_Context/SCREEN_CONTEXT.md

------------------------------------------------------------------------

## 将来拡張

-   PromptCatalog.md
-   PromptVersionRegistry.md
-   AgentRolePrompts.md
-   ArchitectureReviewPrompts.md
-   DatabasePrompts.md
-   AccessibilityPrompts.md
-   SecurityPrompts.md
-   ReleasePrompts.md
-   FigmaMCPPrompts.md
-   FlutterMCPPrompts.md
-   GitHubPrompts.md
-   PRReviewPrompts.md
-   IncidentResponsePrompts.md
-   Prompt Evaluation Dataset
-   Prompt Regression Test
-   Prompt Lint
-   Prompt Injection Test Suite
-   Multi Agent Orchestration
-   Automated Context Builder
-   AI Output Quality Score
-   Prompt自動Version管理
