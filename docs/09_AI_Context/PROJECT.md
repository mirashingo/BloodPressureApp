# PROJECT.md

# BloodPressureApp AI開発コンテキスト

Version: 1.0

------------------------------------------------------------------------

# PROJECT

## ドキュメントID

AI-CONTEXT-PROJECT-001

------------------------------------------------------------------------

## 名称

BloodPressureApp プロジェクト共通概要

------------------------------------------------------------------------

## 目的

BloodPressureAppに関与する

開発者、デザイナー、テスター、

プロダクト担当者、AI開発エージェントが、

プロジェクトの目的、対象利用者、

主要機能、設計方針、技術構成、

品質基準、開発順序、制約、

将来像を短時間で正しく理解できるようにする。

本書は、

プロジェクト全体を把握するための

AI Context Entry Pointとして使用する。

個別Featureの詳細仕様、

Screen仕様、Flutter設計、

AI Workflow、Test Plan、

Release Checklistを置き換えるものではない。

実装時は本書に加えて、

対象Featureと関連文書を必ず参照する。

------------------------------------------------------------------------

## 適用範囲

-   Product Planning
-   Requirements
-   UX
-   UI Design
-   Figma
-   Flutter
-   Android
-   iOS
-   Local Database
-   Notification
-   Export
-   Backup
-   AI Feature
-   Accessibility
-   Privacy
-   Security
-   Testing
-   Release
-   Maintenance
-   AI Assisted Development

------------------------------------------------------------------------

# プロジェクト名

------------------------------------------------------------------------

## 正式名称

BloodPressureApp

------------------------------------------------------------------------

## 日本語名称

血圧記録アプリ

------------------------------------------------------------------------

## コンセプト


血圧を記録する人が、

一番気持ちよく、

毎日使えるアプリ


------------------------------------------------------------------------

## 目標

血圧記録に必要な機能を

単に備えるだけではなく、

利用者ごとの測定習慣、

文字サイズ、ボタンサイズ、

記録方法、複数回測定、

振り返り方法に柔軟に対応し、

血圧記録アプリの決定版を目指す。

------------------------------------------------------------------------

# Vision

------------------------------------------------------------------------

BloodPressureAppは、

毎日の血圧測定を

負担ではなく、

安心して続けられる習慣へ変える。

利用者が

記録、確認、振り返り、共有を

迷わず行えることを最優先にする。

------------------------------------------------------------------------

# 解決する課題

------------------------------------------------------------------------

## 記録の負担

既存の血圧記録アプリでは、

入力項目が多い、

操作が複雑、

文字が小さい、

ボタンが押しにくいなどの理由で、

日々の記録が負担になる場合がある。

------------------------------------------------------------------------

## 測定習慣の違い

利用者によって

-   1回だけ測定する
-   2回測定する
-   3回測定する
-   平均を使う
-   最後の値を使う
-   最も低い値を使う
-   自分で値を選ぶ

など、記録方法が異なる。

アプリ側が

一つの方法だけを強制しないことが必要である。

------------------------------------------------------------------------

## 振り返りの難しさ

記録が蓄積しても、

一覧、グラフ、統計が見づらいと、

変化や傾向を把握できない。

------------------------------------------------------------------------

## 医療者との共有

診察時に

必要な期間や項目を

分かりやすく共有できない場合がある。

------------------------------------------------------------------------

## 高齢者への配慮不足

小さい文字、

狭いTouch Target、

複雑なNavigation、

過度なAnimationは、

高齢者や視認性に配慮が必要な利用者にとって

大きな負担になる。

------------------------------------------------------------------------

# 対象利用者

------------------------------------------------------------------------

## Primary User

日常的に

家庭で血圧を測定し、

自分で記録する成人。

------------------------------------------------------------------------

## Secondary User

-   高齢者
-   血圧管理を始めた人
-   複数回測定する人
-   定期的に医療機関へ通院する人
-   家族の血圧記録を支援する人
-   大きな文字やボタンを必要とする人

------------------------------------------------------------------------

## Future User

-   医療者とデータを共有する人
-   Wearableや血圧計と連携する人
-   Apple Healthを利用する人
-   Health Connectを利用する人
-   Cloud Syncを利用する人
-   複数端末で記録する人

------------------------------------------------------------------------

# 利用者価値

------------------------------------------------------------------------

## 毎日使いやすい

最小限の操作で

血圧を記録できる。

------------------------------------------------------------------------

## 自分に合わせられる

文字、ボタン、

記録方法、時間帯、

代表値の選び方を調整できる。

------------------------------------------------------------------------

## 記録を失わない

Local Database、

Backup、Restoreによって

記録を安全に保持する。

------------------------------------------------------------------------

## 変化が分かる

History、Graph、Statisticsで

期間ごとの変化を確認できる。

------------------------------------------------------------------------

## 共有しやすい

PDF、CSVとして

必要な期間を出力できる。

------------------------------------------------------------------------

## AIを安全に使える

AIは補助として利用し、

記録や医療判断の主体にしない。

------------------------------------------------------------------------

# Product Principles

------------------------------------------------------------------------

## 1. 毎日の操作を最短にする

頻度の高い操作を

最も少ない手順で完了できるようにする。

------------------------------------------------------------------------

## 2. 利用者へ方法を強制しない

複数回測定、

代表値、

時間帯、

表示方法を選択可能にする。

------------------------------------------------------------------------

## 3. 数値の正確性を守る

入力値、保存値、一覧、

グラフ、統計、出力の値を一致させる。

------------------------------------------------------------------------

## 4. 不安を煽らない

色、文言、通知、AI表現で

過度な恐怖や安心を与えない。

------------------------------------------------------------------------

## 5. Local First

主要機能は

Internet接続なしで利用可能にする。

------------------------------------------------------------------------

## 6. AI Optional

AIを使用しなくても

アプリの中心価値を得られるようにする。

------------------------------------------------------------------------

## 7. Accessibility First

高齢者や

視認性・操作性への配慮を

追加機能ではなく基本品質として扱う。

------------------------------------------------------------------------

## 8. Privacy by Design

健康データを

最初から保護対象として設計する。

------------------------------------------------------------------------

# MVP Scope

------------------------------------------------------------------------

## F001 Blood Pressure Recording

-   SYS
-   DIA
-   Pulse
-   Date
-   Time
-   Time Period
-   Memo
-   Tags
-   Create
-   Edit
-   Delete
-   Multiple Measurement
-   Representative Value

------------------------------------------------------------------------

## F002 Home Dashboard

-   Latest Record
-   Today Status
-   Quick Summary
-   Record Entry
-   Navigation

------------------------------------------------------------------------

## F003 History

-   Record List
-   Date Group
-   Filter
-   Sort
-   Record Detail
-   Empty State

------------------------------------------------------------------------

## F004 Graph

-   SYS Line
-   DIA Line
-   Pulse
-   Period Selection
-   Tooltip
-   Data Summary

------------------------------------------------------------------------

## F005 Statistics

-   Average
-   Minimum
-   Maximum
-   Count
-   Morning・Evening
-   Period Summary

------------------------------------------------------------------------

## F006 Reminder

-   Morning Reminder
-   Evening Reminder
-   Weekday
-   Permission
-   Edit
-   Delete

------------------------------------------------------------------------

## F007 Export

-   PDF
-   CSV
-   Date Range
-   Preview
-   Share

------------------------------------------------------------------------

## F008 Backup

-   Local Backup
-   Restore
-   Version
-   Validation
-   Encryption
-   Integrity Check

------------------------------------------------------------------------

## F009 Settings

-   Theme
-   Text Size
-   Button Size
-   Reduce Motion
-   Time Period Rule
-   Aggregation Method
-   AI Enable・Disable
-   Privacy

------------------------------------------------------------------------

# Domain Core

------------------------------------------------------------------------

## Blood Pressure Record

代表値として保存・表示する

血圧記録。

主な属性


Record ID

Systolic

Diastolic

Pulse

Measured At

Time Period

Memo

Tags

Measurement Session ID

Aggregation Method

Created At

Updated At


------------------------------------------------------------------------

## Measurement Session

同じ測定機会に行われた

1回から複数回の測定をまとめる単位。

------------------------------------------------------------------------

## Measurement

個別の測定値。

------------------------------------------------------------------------

## Representative Value

Sessionから選択された

保存・表示用の代表値。

------------------------------------------------------------------------

## Aggregation Method

-   Single
-   Average
-   Last
-   Lowest
-   User Selected

------------------------------------------------------------------------

## Time Period

-   Morning
-   Evening
-   Other

分類Ruleは

利用者設定へ対応可能にする。

------------------------------------------------------------------------

# 主要User Flow

------------------------------------------------------------------------

## 初回起動


Launch

Onboarding

Privacy説明

Optional Permission

Home


------------------------------------------------------------------------

## 1回測定


Home

Record Button

Input

Validation

Save

Confirmation

Home


------------------------------------------------------------------------

## 複数回測定


Home

Record Button

Measurement 1

Add Measurement

Measurement 2・3

Select Aggregation Method

Preview Representative Value

Save


------------------------------------------------------------------------

## 履歴確認


Home

History

Filter・Sort

Record Detail

Edit・Delete


------------------------------------------------------------------------

## グラフ確認


Home

Graph

Select Period

Inspect Data Point


------------------------------------------------------------------------

## 医療者向け出力


Settings or Export

Select Period

Select Fields

Preview

Generate PDF・CSV

Share


------------------------------------------------------------------------

## Backup


Settings

Backup

Create

Validate

Save・Share


------------------------------------------------------------------------

# Screen構成

------------------------------------------------------------------------

主要画面

-   Splash
-   Onboarding
-   Home
-   Blood Pressure Input
-   Multiple Measurement
-   Record Confirmation
-   History
-   Record Detail
-   Record Edit
-   Graph
-   Statistics
-   Reminder
-   Export
-   Backup
-   Settings
-   Privacy
-   AI Summary

------------------------------------------------------------------------

# Navigation

------------------------------------------------------------------------

Main Navigation候補


Home

History

Graph

Settings


血圧入力は

Homeから目立つActionとして開始する。

------------------------------------------------------------------------

# UX方針

------------------------------------------------------------------------

## Input First

Homeから

すぐに記録を開始できる。

------------------------------------------------------------------------

## Progressive Disclosure

初期画面では

必要最小限を表示し、

Memo、Tags、詳細設定は

必要時に展開する。

------------------------------------------------------------------------

## Safe Destructive Action

削除、全削除、Restoreには

確認を設ける。

------------------------------------------------------------------------

## Clear State

-   Loading
-   Empty
-   Error
-   Success
-   Disabled

を明確にする。

------------------------------------------------------------------------

## Calm Interaction

過度な警告、

強い赤、

連続Animationを避ける。

------------------------------------------------------------------------

# Design System

------------------------------------------------------------------------

## Colors

目的別Tokenを使用する。

-   Primary
-   Secondary
-   Surface
-   Text
-   Success
-   Warning
-   Error
-   Chart SYS
-   Chart DIA
-   Chart Pulse

色だけで意味を伝えない。

------------------------------------------------------------------------

## Typography

-   可読性
-   日本語表示
-   大きなText Scale
-   数値視認性
-   単位表示
-   Hierarchy

を重視する。

------------------------------------------------------------------------

## Components

-   App Scaffold
-   App Bar
-   Primary Button
-   Secondary Button
-   Input Field
-   Blood Pressure Input Group
-   Record Card
-   Chart
-   Dialog
-   Bottom Sheet
-   Empty State
-   Error State
-   Loading State

------------------------------------------------------------------------

## Animation

-   短い
-   穏やか
-   意味がある
-   Reduce Motion対応
-   操作を待たせない

------------------------------------------------------------------------

## Emotion

利用者へ


安心

穏やか

信頼

継続しやすさ

責められない感覚


を与える。

------------------------------------------------------------------------

# Flutter技術構成

------------------------------------------------------------------------

## Framework

Flutter Stable。

------------------------------------------------------------------------

## Language

Dart。

------------------------------------------------------------------------

## Architecture

Feature Firstと

Layered Architectureを組み合わせる。


Presentation

Application

Domain

Data


------------------------------------------------------------------------

## State Management

Riverpod。

------------------------------------------------------------------------

## Navigation

GoRouter。

------------------------------------------------------------------------

## Local Database

Drift・SQLite。

------------------------------------------------------------------------

## Preferences

SharedPreferences。

------------------------------------------------------------------------

## Secure Storage

Flutter Secure Storage。

------------------------------------------------------------------------

## Chart

fl_chartを第一候補とする。

------------------------------------------------------------------------

## Notification

flutter_local_notifications。

------------------------------------------------------------------------

## Export

pdf、printing、share_plus。

------------------------------------------------------------------------

## Backup

File、Archive、Encryptionを

Adapterで管理する。

------------------------------------------------------------------------

## AI Communication

Flutter Clientから

AI Providerへ直接接続せず、

原則としてBackendを経由する。

------------------------------------------------------------------------

# Flutter Folder概要

------------------------------------------------------------------------


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

# Dependency Rules

------------------------------------------------------------------------

許可


Presentation → Application → Domain

Data → Domain


禁止


Domain → Flutter

Domain → Riverpod

Domain → Drift

Core → Feature

Feature A → Feature B Data


------------------------------------------------------------------------

# Source of Truth

------------------------------------------------------------------------

血圧記録のSource of Truthは

Local Databaseに保存された

Domain Recordである。

Home、History、Graph、

Statistics、Export、AIは

同じRepositoryを通じて参照する。

------------------------------------------------------------------------

# Offline方針

------------------------------------------------------------------------

次の主要機能は

Offlineで利用可能にする。

-   Record
-   Edit
-   Delete
-   History
-   Graph
-   Statistics
-   Settings
-   Reminder設定
-   PDF・CSV
-   Local Backup

AIはOffline時に

Fallbackを表示する。

------------------------------------------------------------------------

# AI方針

------------------------------------------------------------------------

## AIの役割

-   記録傾向の要約
-   振り返り補助
-   Memo入力補助
-   Natural Language Search補助
-   説明文生成補助

------------------------------------------------------------------------

## AIが行わないこと

-   診断
-   薬変更指示
-   治療方針の断定
-   緊急性の断定
-   医療者の代替
-   記録値の自動変更

------------------------------------------------------------------------

## AI必須要件

-   Consent
-   Data Minimization
-   Local Aggregation
-   Prompt Version
-   Timeout
-   Cancel
-   Retry Limit
-   Schema Validation
-   Safety Validation
-   Grounding Validation
-   Disclaimer
-   Fallback
-   Feature Flag

------------------------------------------------------------------------

# Privacy

------------------------------------------------------------------------

## 原則

健康データは

機微性の高い情報として扱う。

------------------------------------------------------------------------

## Local Data

主要データは

端末内へ保存する。

------------------------------------------------------------------------

## External Transmission

外部送信時は

-   利用目的
-   送信項目
-   送信先
-   保存方針

を説明し、

同意を得る。

------------------------------------------------------------------------

## Log禁止

-   SYS
-   DIA
-   Pulse
-   Memo
-   Full Prompt
-   Full AI Response
-   Token
-   Encryption Key

------------------------------------------------------------------------

## Analytics

血圧値やMemoを

Analytics Eventへ含めない。

------------------------------------------------------------------------

# Security

------------------------------------------------------------------------

-   API KeyをClientへ埋め込まない
-   SecretをGit管理しない
-   TokenをSecure Storageへ保存する
-   Backup FileをValidationする
-   Backup暗号化を検討する
-   Path Traversalを防ぐ
-   Zip Slipを防ぐ
-   Deep LinkをValidationする
-   SQL Parameter Queryを使用する
-   Temporary Fileを削除する

------------------------------------------------------------------------

# Accessibility

------------------------------------------------------------------------

必須対応

-   Screen Reader
-   Semantics
-   Input Label
-   Error Announcement
-   Text Scale 200%
-   Large Button
-   Touch Target
-   Color Contrast
-   Dark Mode
-   High Contrast
-   Reduce Motion
-   Graph代替情報

------------------------------------------------------------------------

# Non Functional Requirements

------------------------------------------------------------------------

## Accuracy

記録、統計、出力値を

一致させる。

------------------------------------------------------------------------

## Reliability

保存中の異常終了でも

Data Integrityを保つ。

------------------------------------------------------------------------

## Performance

通常保存は

利用者を待たせない時間で完了する。

大量履歴でも

操作可能な性能を維持する。

------------------------------------------------------------------------

## Recoverability

Backup・Restore、

Migration、

失敗時のRollbackを考慮する。

------------------------------------------------------------------------

## Maintainability

Feature単位で

変更、Test、削除が可能な構造にする。

------------------------------------------------------------------------

## Compatibility

Android・iOSの

最低対応Versionと最新Versionを検証する。

------------------------------------------------------------------------

# Test Strategy

------------------------------------------------------------------------

## Static

-   Requirements Review
-   UX Review
-   Design Review
-   Architecture Review
-   Prompt Review

## Unit

-   Value Object
-   Domain Service
-   UseCase
-   Mapper
-   Validator
-   AI Safety

## Repository・Database

-   CRUD
-   Query
-   Transaction
-   Migration
-   Backup
-   Restore

## Widget

-   Loading
-   Data
-   Empty
-   Error
-   Accessibility
-   Large Text

## Golden

-   Light
-   Dark
-   Large Text
-   Smartphone
-   Tablet

## Integration

-   Record
-   Edit
-   Delete
-   History
-   Graph
-   Export
-   Backup Restore
-   AI Fallback

------------------------------------------------------------------------

# Release Quality Gate

------------------------------------------------------------------------

Release前に

-   Critical Defect 0
-   High Defect 0
-   Test Pass
-   Analyze Pass
-   Migration Pass
-   Backup・Restore Pass
-   Android Release Build Pass
-   iOS Release Build Pass
-   Privacy Review Pass
-   Security Review Pass
-   AI Safety Pass
-   Monitoring準備
-   Rollback準備

を必須とする。

------------------------------------------------------------------------

# 開発順序

------------------------------------------------------------------------


1. Vision

2. Requirements

3. UX

4. Design System

5. Figma

6. Flutter Architecture

7. Flutter Implementation

8. AI

9. Testing

10. Release


------------------------------------------------------------------------

# 実装優先順位

------------------------------------------------------------------------

## Phase 1

-   Project Setup
-   Architecture
-   Design System
-   Database
-   F001 Recording

## Phase 2

-   Home
-   History
-   Graph
-   Statistics

## Phase 3

-   Reminder
-   Export
-   Backup
-   Settings

## Phase 4

-   AI Summary
-   AI Advice
-   Natural Language Search
-   Memo Assistance

## Phase 5

-   Cloud Sync
-   Health Platform
-   Device Integration

------------------------------------------------------------------------

# Documentation Structure

------------------------------------------------------------------------


docs/
├─ 00_Project/
├─ 01_Requirements/
├─ 02_UX/
├─ 03_Screens/
├─ 04_DesignSystem/
├─ 05_AI/
├─ 06_Flutter/
├─ 07_Test/
├─ 08_Release/
└─ 09_AI_Context/


------------------------------------------------------------------------

# AI Context Structure

------------------------------------------------------------------------


09_AI_Context/
├─ AGENTS.md
├─ PROJECT.md
├─ CodingRules.md
├─ CurrentArchitecture.md
├─ CurrentFeatureMap.md
└─ PromptExamples.md


AGENTS.md

AIの行動規則。

PROJECT.md

Project全体概要。

------------------------------------------------------------------------

# AIエージェントの参照順序

------------------------------------------------------------------------

作業開始時


09_AI_Context/PROJECT.md

09_AI_Context/AGENTS.md

対象Feature

対象Screen

Architecture

Test Plan


AI Featureの場合


Prompt.md

AIWorkflow.md


を追加する。

------------------------------------------------------------------------

# 開発ツール

------------------------------------------------------------------------

## Design

-   Figma Desktop
-   Figma Dev Mode
-   Figma MCP

## Development

-   Flutter
-   Dart
-   VS CodeまたはAndroid Studio
-   Dart・Flutter MCP
-   Git
-   GitHub

## AI

-   ChatGPT
-   Codex
-   Claude Code
-   Gemini
-   GitHub Copilot

## Quality

-   flutter analyze
-   flutter test
-   integration_test
-   build_runner
-   CI

------------------------------------------------------------------------

# MCP活用方針

------------------------------------------------------------------------

## Figma MCP

-   Frame
-   Component
-   Variant
-   Auto Layout
-   Style
-   Token
-   Dev Mode情報

## Dart・Flutter MCP

-   SDK API
-   Package API
-   Analyzer
-   Test
-   Symbol
-   Refactoring

## GitHub連携

-   Issue
-   Pull Request
-   Review
-   CI
-   Repository Context

MCP結果も

既存仕様と照合する。

------------------------------------------------------------------------

# Git運用

------------------------------------------------------------------------

Branch例


feature/f001-recording

feature/history

fix/graph-tooltip

refactor/database

docs/project-context


------------------------------------------------------------------------

## Pull Request

必須情報

-   Purpose
-   Feature ID
-   Changes
-   Test
-   Screenshot
-   Migration
-   Privacy
-   AI Impact
-   Risk
-   Rollback

------------------------------------------------------------------------

# Definition of Done

------------------------------------------------------------------------

Featureは

次を満たして完了とする。

□ Requirementsと一致する

□ Acceptance Criteriaを満たす

□ Architecture Ruleを守る

□ Design Systemを使用する

□ Accessibilityへ対応する

□ Error・Empty・Loadingを扱う

□ Health Dataを正しく保存する

□ Unit Testがある

□ 必要なWidget Testがある

□ Regression Testがある

□ Analyzerが成功する

□ Testが成功する

□ Documentationが更新される

□ Privacy・Securityを確認する

□ Release影響を確認する

------------------------------------------------------------------------

# Project Risk

------------------------------------------------------------------------

## Data Loss

対策

-   Transaction
-   Migration Test
-   Backup
-   Restore
-   Integrity Check

------------------------------------------------------------------------

## Incorrect Calculation

対策

-   Domain Service
-   Single Source of Truth
-   Unit Test
-   Boundary Test
-   Export一致Test

------------------------------------------------------------------------

## Complex UX

対策

-   Input First
-   Progressive Disclosure
-   UAT
-   High Frequency Flow優先

------------------------------------------------------------------------

## Accessibility不足

対策

-   Design System
-   Screen Reader Test
-   Text Scale Test
-   Touch Target
-   Contrast

------------------------------------------------------------------------

## AI Unsafe Output

対策

-   Medical Limit
-   Schema Validation
-   Safety Validation
-   Grounding
-   Fallback
-   Feature Flag

------------------------------------------------------------------------

## Package Lock In

対策

-   Interface
-   Adapter
-   Repository
-   Package Review
-   Migration Plan

------------------------------------------------------------------------

# Success Metrics

------------------------------------------------------------------------

## Product

-   Record Completion Rate
-   Daily・Weekly Continuation
-   Multiple Measurement利用率
-   Export Completion
-   Backup利用率

------------------------------------------------------------------------

## Usability

-   Record Task Completion
-   Time to Record
-   Input Error Rate
-   UAT Satisfaction
-   Accessibility Issue Count

------------------------------------------------------------------------

## Quality

-   Crash Free User
-   Save Failure
-   Migration Failure
-   Backup Restore Success
-   Critical Defect
-   High Defect

------------------------------------------------------------------------

## AI

-   AI Completion
-   Fallback Rate
-   Safety Block Rate
-   Schema Failure
-   User Acceptance
-   Cost per Request

健康データそのものを

Metricへ含めない。

------------------------------------------------------------------------

# 現在のプロジェクト状態

------------------------------------------------------------------------

完成済み文書


00_Project/
  Vision.md
  Roadmap.md
  Roadmap_日本語版.md

01_Requirements/
  FeatureIndex.md
  F001〜F009

02_UX/
  UserFlow.md
  Navigation.md
  ScreenList.md

03_Screens/
  Home.md
  Input.md
  History.md
  Graph.md
  Settings.md

04_DesignSystem/
  Colors.md
  Typography.md
  Components.md
  Animation.md
  Emotion.md

05_AI/
  Prompt.md
  AIWorkflow.md

06_Flutter/
  Architecture.md
  FolderStructure.md
  Packages.md

07_Test/
  TestPlan.md

08_Release/
  ReleaseChecklist.md

09_AI_Context/
  AGENTS.md
  PROJECT.md


------------------------------------------------------------------------

# 次の推奨作業

------------------------------------------------------------------------

候補

-   DataModel.md
-   StateManagement.md
-   ErrorHandling.md
-   Database.md
-   TestCases.md
-   Regression.md
-   UAT.md
-   CodingRules.md
-   CurrentArchitecture.md
-   CurrentFeatureMap.md
-   PromptExamples.md

------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   Project Visionと異なる方向へ機能を拡張する
-   F001以外の場所へ血圧記録Ruleを重複定義する
-   AIを中心機能の必須依存にする
-   健康データを無断で外部送信する
-   診断や薬変更をAIに行わせる
-   Accessibilityを後回しにする
-   MigrationなしでSchemaを変更する
-   Backup Restore未検証でReleaseする
-   実利用者データをTestへ使う
-   Health DataをLogへ出す
-   Packageを無検証で追加する
-   Generated Codeを手動編集する
-   TestなしでFeatureを完了扱いにする
-   仕様と異なる実装を暗黙に採用する
-   Release Checklist未完了でProductionへ出す

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Project理解

-   Project名を理解できる
-   Visionを理解できる
-   対象利用者を理解できる
-   解決課題を理解できる
-   Product Principlesを理解できる

## Scope

-   MVP Featureを理解できる
-   F001を中心Domainとして理解できる
-   Multiple Measurementを理解できる
-   Export・Backupを理解できる
-   AIをOptionalと理解できる

## UX・Design

-   Main User Flowを理解できる
-   Main Navigationを理解できる
-   Input Firstを理解できる
-   Design Systemの目的を理解できる
-   Accessibilityを基本品質として理解できる

## Flutter

-   技術構成を理解できる
-   Architectureを理解できる
-   Folder構成を理解できる
-   Dependency Ruleを理解できる
-   Local Firstを理解できる

## AI

-   AIの役割を理解できる
-   AI禁止範囲を理解できる
-   Consentを理解できる
-   Safety・Groundingを理解できる
-   Fallbackを理解できる

## Quality

-   Test Strategyを理解できる
-   Release Gateを理解できる
-   Privacy・Securityを理解できる
-   Definition of Doneを理解できる
-   Project Riskを理解できる

------------------------------------------------------------------------

## Acceptance Criteria

□ Project名と目的を説明できる

□ Product Visionを説明できる

□ 対象利用者を説明できる

□ 解決する主要課題を説明できる

□ Product Principlesを説明できる

□ MVP Featureを一覧化できる

□ F001を中心Domainとして理解できる

□ Blood Pressure Recordを説明できる

□ Measurement Sessionを説明できる

□ Representative Valueを説明できる

□ Multiple Measurement方式を説明できる

□ Main User Flowを説明できる

□ Main Screenを一覧化できる

□ Main Navigationを説明できる

□ UX方針を説明できる

□ Design System方針を説明できる

□ Flutter技術構成を説明できる

□ ArchitectureとDependency Ruleを説明できる

□ Source of Truthを説明できる

□ Offline方針を説明できる

□ AIの役割と禁止範囲を説明できる

□ AIのSafety要件を説明できる

□ Privacy方針を説明できる

□ Security方針を説明できる

□ Accessibility要件を説明できる

□ Non Functional Requirementを説明できる

□ Test Strategyを説明できる

□ Release Quality Gateを説明できる

□ 開発順序と実装優先順位を説明できる

□ Documentation構成を説明できる

□ AI Context文書の役割を説明できる

□ Definition of Doneを説明できる

□ Project Riskと対策を説明できる

□ 現在の文書完成状況を把握できる

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

★★★★★（すべてのProject参加者・AI Agentで必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap.md
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
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/Packages.md
-   07_Test/TestPlan.md
-   08_Release/ReleaseChecklist.md
-   09_AI_Context/AGENTS.md

------------------------------------------------------------------------

## 将来拡張

-   Product Glossary
-   CurrentFeatureMap.md
-   CurrentArchitecture.md
-   CodingRules.md
-   PromptExamples.md
-   Requirement Traceability
-   Figma Component Map
-   Domain Model Diagram
-   Database ER Diagram
-   API Specification
-   Cloud Sync Architecture
-   Apple Health Integration
-   Health Connect Integration
-   Bluetooth Blood Pressure Monitor
-   Wearable Integration
-   Family Account
-   Medical Institution Export
-   Multi Language Expansion
-   On Device AI
-   Project Status自動更新
-   AI Context自動生成
