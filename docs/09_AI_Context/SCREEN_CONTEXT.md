# SCREEN_CONTEXT.md

# BloodPressureApp AI開発コンテキスト

Version: 1.0

------------------------------------------------------------------------

# SCREEN_CONTEXT

## ドキュメントID

AI-CONTEXT-SCREEN-CONTEXT-001

------------------------------------------------------------------------

## 名称

BloodPressureApp 画面共通コンテキスト

------------------------------------------------------------------------

## 目的

BloodPressureAppの画面設計、

Figma制作、Flutter実装、

画面Test、Code Review、

AIによるUI生成において、

各画面の目的、責務、遷移、

主要要素、状態、入力、

Validation、Data依存、

Accessibility、Responsive、

Figma・Flutter対応を統一して伝える。

本書は、

Screen仕様を横断して理解するための

AI Contextである。

個別画面の詳細は

`03_Screens/`配下を正とし、

本書は画面間の共通ルール、

全体構造、参照順序、

実装時の判断基準を提供する。

------------------------------------------------------------------------

## 適用範囲

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
-   Restore
-   Settings
-   Privacy
-   AI Summary
-   Dialog
-   Bottom Sheet
-   Empty State
-   Error State
-   Loading State
-   Android
-   iOS
-   Smartphone
-   Tablet

------------------------------------------------------------------------

## 基本方針

-   画面の目的を一つに絞る
-   頻度の高い操作を優先する
-   血圧値を読み間違えにくくする
-   利用者の測定習慣を強制しない
-   UIへBusiness Logicを置かない
-   画面固有状態とDomain状態を分離する
-   Loading・Empty・Errorを省略しない
-   未保存変更を安全に扱う
-   削除・Restoreは確認を行う
-   AI生成結果を通常情報と区別する
-   AIが停止しても主要画面を利用可能にする
-   Text Scale 200%へ対応する
-   Screen Readerで主要操作を完了可能にする
-   SmartphoneとTabletへ対応する
-   Design Systemと共通Componentを使用する
-   画面ごとの固定値・独自Styleを作らない

------------------------------------------------------------------------

# 指示の優先順位

------------------------------------------------------------------------

画面実装時は

次の順序で判断する。


1. Accessibility・安全性

2. Feature Requirements

3. 個別Screen仕様

4. SCREEN_CONTEXT.md

5. UX・Navigation

6. DESIGN_RULES.md

7. Design System

8. Figma Component・Prototype

9. Existing Flutter UI


矛盾時は

上位を優先し、

Screen仕様または関連文書の

更新要否を記録する。

------------------------------------------------------------------------

# 参照順序

------------------------------------------------------------------------

画面作業開始時


09_AI_Context/PROJECT.md

09_AI_Context/AGENTS.md

09_AI_Context/SCREEN_CONTEXT.md

対象Feature Requirement

対象Screen仕様

02_UX/UserFlow.md

02_UX/Navigation.md

04_DesignSystem/*.md

09_AI_Context/DESIGN_RULES.md

09_AI_Context/CODING_RULES.md


AI画面の場合


05_AI/Prompt.md

05_AI/AIWorkflow.md


を追加する。

------------------------------------------------------------------------

# 画面ID方針

------------------------------------------------------------------------

各Screenは

一意のScreen IDを持つ。

推奨例


SCR-001 Splash

SCR-002 Onboarding

SCR-010 Home

SCR-020 Input

SCR-021 Multiple Measurement

SCR-022 Record Confirmation

SCR-030 History

SCR-031 Record Detail

SCR-032 Record Edit

SCR-040 Graph

SCR-050 Statistics

SCR-060 Reminder

SCR-070 Export

SCR-080 Backup

SCR-081 Restore

SCR-090 Settings

SCR-091 Privacy

SCR-100 AI Summary


Screen IDは

Requirements、Figma、

Flutter Route、Test Caseで

追跡可能にする。

------------------------------------------------------------------------

# Main Navigation

------------------------------------------------------------------------

標準Main Navigation


Home

History

Graph

Settings


------------------------------------------------------------------------

## Navigation目的

Home

記録開始と

現在状態の確認。

History

過去記録の確認、

編集、削除。

Graph

期間変化の確認。

Settings

表示、記録方法、

通知、AI、Data管理。

------------------------------------------------------------------------

## Main Action

血圧記録は

Homeから

最短で開始可能にする。

------------------------------------------------------------------------

## Navigation State

Main Tab間では

必要に応じて

-   Scroll Position
-   Filter
-   Selected Period
-   Draft以外の表示状態

を保持する。

------------------------------------------------------------------------

# Screen共通構造

------------------------------------------------------------------------

標準


Scaffold

SafeArea

App Bar

Scrollable Content

Primary Action

Transient Feedback


------------------------------------------------------------------------

## App Bar

-   Screen Title
-   Back
-   必要最小限のAction
-   Long Title対応
-   Semantics

------------------------------------------------------------------------

## Content

-   Section単位
-   Design Token
-   Responsive Width
-   Large Text対応
-   Keyboard対応
-   Safe Area対応

------------------------------------------------------------------------

## Primary Action

画面の最重要Actionを

一つ明確にする。

例

-   記録する
-   保存する
-   PDFを作成する
-   Backupを作成する
-   復元する

------------------------------------------------------------------------

# Screen State Model

------------------------------------------------------------------------

主要画面は

次を考慮する。


initial

loading

data

empty

error

refreshing

submitting

success

disabled

offline


画面によって

不要な状態は省略できるが、

省略理由を説明可能にする。

------------------------------------------------------------------------

## Initial

初回表示前の状態。

不要な空白表示を避ける。

------------------------------------------------------------------------

## Loading

-   処理内容を伝える
-   無限に待たせない
-   二重操作を防止する
-   Cancel可否を定義する
-   Screen Readerへ通知する

------------------------------------------------------------------------

## Data

正常な表示状態。

------------------------------------------------------------------------

## Empty

-   Dataがない理由
-   次のAction
-   Filter解除等の復旧方法

を示す。

------------------------------------------------------------------------

## Error

-   何が起きたか
-   Dataが失われたか
-   Retry可能か
-   次に何をすべきか

を示す。

------------------------------------------------------------------------

## Submitting

保存、削除、Export、

Restore等の実行中。

二重送信を防止する。

------------------------------------------------------------------------

## Success

短く穏やかにFeedbackする。

毎日の記録へ

過剰な演出を行わない。

------------------------------------------------------------------------

## Offline

Offlineでも使用可能な画面は

通常通り動作させる。

AI等のOnline機能だけを

部分的にUnavailableにする。

------------------------------------------------------------------------

# Screen Data Flow

------------------------------------------------------------------------

標準


Screen

Widget

Controller・Notifier

UseCase

Repository

Data Source


------------------------------------------------------------------------

## 禁止


Screen → Drift DAO

Screen → SQL

Screen → AI Provider

Screen → File System

Screen → Notification Plugin


------------------------------------------------------------------------

## Screenへ渡すData

Presentation用View Dataへ

必要に応じて変換する。

Domain Entityを

そのまま表示可能な場合も、

Format RuleはPresentation層へ置く。

------------------------------------------------------------------------

# Side Effect Rules

------------------------------------------------------------------------

Side Effect例

-   Navigation
-   Dialog
-   Snackbar
-   Share Sheet
-   Permission Dialog
-   File Picker
-   Date Picker

Build中に実行しない。

Riverpod `listen`、

Event Handler、

Coordinator等を使用する。

------------------------------------------------------------------------

# Draft Rules

------------------------------------------------------------------------

入力・編集画面では

Draftを画面Stateとして管理する。

------------------------------------------------------------------------

## Draft対象

-   SYS
-   DIA
-   Pulse
-   Date
-   Time
-   Time Period
-   Memo
-   Tags
-   Measurements
-   Aggregation Method

------------------------------------------------------------------------

## 未保存変更

戻る操作時に

変更がある場合は

破棄確認を表示する。

変更がない場合は

確認なしで戻れる。

------------------------------------------------------------------------

## Draft Persistence

通常は画面内Stateとする。

OS終了後のDraft復元は

別Featureとして定義する。

------------------------------------------------------------------------

# Validation Rules

------------------------------------------------------------------------

## UI Validation

-   必須
-   数値形式
-   入力可能文字
-   Immediate Feedback

------------------------------------------------------------------------

## Domain Validation

-   Business Rule
-   値範囲
-   不変条件
-   保存可能性

------------------------------------------------------------------------

## 表示

Errorは

対象Input近くに表示する。

画面上部だけに

まとめない。

------------------------------------------------------------------------

## Focus

保存時にErrorがある場合は

最初のErrorへFocusを移す。

------------------------------------------------------------------------

# Loading・Submit Control

------------------------------------------------------------------------

保存中は

-   Save Buttonを再押下不可にする
-   Form編集可否を定義する
-   Back操作を定義する
-   Loading Labelを表示する
-   失敗時にDraftを保持する

------------------------------------------------------------------------

# Delete Rules

------------------------------------------------------------------------

削除前に

-   対象
-   影響
-   取消不可

を説明する。

削除失敗時に

画面上のRecordを

先に消さない。

Optimistic Updateを使用する場合は

Rollbackを実装する。

------------------------------------------------------------------------

# Responsive Rules

------------------------------------------------------------------------

## Compact

-   1 Column
-   Bottom Navigation
-   Full Widthに近いForm
-   Primary Actionを明確にする

------------------------------------------------------------------------

## Medium

-   Content Max Width
-   Wide Padding
-   2 Column候補
-   Navigation Rail検討

------------------------------------------------------------------------

## Expanded

-   Master Detail
-   Side Panel
-   Navigation Rail
-   Detail同時表示

------------------------------------------------------------------------

## 基本

Device名ではなく

Available Widthで判断する。

------------------------------------------------------------------------

# Accessibility Rules

------------------------------------------------------------------------

各Screenで

次を確認する。

-   Screen Titleが読み上げられる
-   Reading Orderが自然
-   Button Labelがある
-   Input Labelがある
-   Unitが読み上げられる
-   Selected Stateが分かる
-   Errorが通知される
-   Text Scale 200%で操作可能
-   Touch Targetが十分
-   Colorだけに依存しない
-   Focus移動が自然
-   Reduce Motionへ対応する

------------------------------------------------------------------------

# Figma・Flutter対応

------------------------------------------------------------------------


Figma Frame
    ↓
Flutter Screen

Figma Component
    ↓
Flutter Widget

Figma Variant
    ↓
Widget State・Variant

Prototype Link
    ↓
GoRouter Route・Action

Figma Variable
    ↓
Flutter Design Token


各Screenで

次を記録する。


Screen ID

Figma Frame Name

Flutter Route Name

Flutter Screen Class

Primary Feature ID

Primary Controller

Primary Provider

Golden Test


------------------------------------------------------------------------

# Screen共通Component

------------------------------------------------------------------------

-   AppScaffold
-   AppAppBar
-   PrimaryButton
-   SecondaryButton
-   DestructiveButton
-   AppTextField
-   NumericInput
-   BloodPressureInput
-   RecordCard
-   MetricCard
-   SectionHeader
-   FilterChip
-   StatusChip
-   EmptyState
-   ErrorState
-   LoadingState
-   ConfirmationDialog
-   AppBottomSheet
-   AppSnackbar
-   ResponsiveContent
-   AccessibleMetric

------------------------------------------------------------------------

# SCR-001 Splash

------------------------------------------------------------------------

## 目的

App起動時に

必要な初期化を行い、

適切な初期Routeへ遷移する。

------------------------------------------------------------------------

## Entry

App Launch。

------------------------------------------------------------------------

## Exit

-   Onboarding
-   Home
-   Fatal Error Screen

------------------------------------------------------------------------

## 表示要素

-   App Logo
-   App Name
-   Minimal Loading

------------------------------------------------------------------------

## 初期化

-   Database
-   Preferences
-   Theme
-   Locale
-   Onboarding Status
-   Migration
-   Feature Flag

------------------------------------------------------------------------

## 禁止

長時間の業務処理、

AI Request、

不要なAnimation。

------------------------------------------------------------------------

## Error

致命的初期化失敗時は

再起動案内、

Support導線、

Data保護状況を示す。

------------------------------------------------------------------------

# SCR-002 Onboarding

------------------------------------------------------------------------

## 目的

Appの価値、

基本操作、

Privacy、

任意Permissionを説明する。

------------------------------------------------------------------------

## Entry

初回起動。

------------------------------------------------------------------------

## Exit

Home。

------------------------------------------------------------------------

## 主要内容

-   記録
-   履歴
-   グラフ
-   Backup
-   Privacy
-   AI Optional

------------------------------------------------------------------------

## Rule

長すぎない。

Skip可否を定義する。

Notification Permissionは

目的説明後に要求する。

AI同意は

AI使用時に分離して取得可能にする。

------------------------------------------------------------------------

# SCR-010 Home

------------------------------------------------------------------------

## 目的

最短で血圧記録を開始し、

最新記録と本日の状態を確認する。

------------------------------------------------------------------------

## Primary Action

血圧を記録する。

------------------------------------------------------------------------

## 主要要素

-   Greeting Optional
-   Record Button
-   Latest Record
-   Today Status
-   Quick Summary
-   Reminder Status Optional
-   Secondary Navigation

------------------------------------------------------------------------

## 情報優先順位


1. Record Action

2. Latest Record

3. Today Status

4. Quick Summary

5. Secondary Information


------------------------------------------------------------------------

## State

-   Loading
-   No Record
-   Has Record
-   Today Recorded
-   Today Not Recorded
-   Error

------------------------------------------------------------------------

## Data

-   Latest Record
-   Today Record Count
-   Morning・Evening Status
-   User Settings

------------------------------------------------------------------------

## Navigation

-   Input
-   Record Detail
-   History
-   Graph
-   Settings

------------------------------------------------------------------------

## 禁止

情報を詰め込みすぎる。

医療評価を独自表示する。

------------------------------------------------------------------------

# SCR-020 Blood Pressure Input

------------------------------------------------------------------------

## 目的

1回または複数回の

血圧測定値を正確に入力し、

保存へ進む。

------------------------------------------------------------------------

## Entry

-   Home Record Action
-   History Add
-   Notification Tap

------------------------------------------------------------------------

## Exit

-   Confirmation
-   Home
-   Back

------------------------------------------------------------------------

## 主要要素

-   SYS Input
-   DIA Input
-   Pulse Input Optional
-   Date
-   Time
-   Time Period
-   Multiple Measurement Action
-   Memo Optional
-   Tags Optional
-   Save Button

------------------------------------------------------------------------

## Input Order


SYS

DIA

Pulse

Date・Time

Time Period

Memo・Tags


------------------------------------------------------------------------

## Keyboard

数値Inputは

Numeric Keyboardを使用する。

Hardware Keyboard、

Pasteも考慮する。

------------------------------------------------------------------------

## Validation

F001を参照する。

UIとDomainで

異なるRuleを作らない。

------------------------------------------------------------------------

## Default

Date・Timeは

現在を候補とする。

過去・未来日時のRuleは

F001へ従う。

------------------------------------------------------------------------

## Error

保存失敗時も

入力Draftを保持する。

------------------------------------------------------------------------

## Unsaved

Back時に

変更がある場合は確認する。

------------------------------------------------------------------------

# SCR-021 Multiple Measurement

------------------------------------------------------------------------

## 目的

同じ測定機会に行った

複数回の値を入力し、

代表値の決定方法を選択する。

------------------------------------------------------------------------

## 主要要素

-   Measurement List
-   Add Measurement
-   Remove Measurement
-   Measurement Number
-   Aggregation Method
-   Representative Preview
-   Continue・Save

------------------------------------------------------------------------

## Measurement

各測定に

-   SYS
-   DIA
-   Pulse Optional

を持つ。

------------------------------------------------------------------------

## Aggregation Method

-   Average
-   Last
-   Lowest
-   User Selected

説明文を表示する。

------------------------------------------------------------------------

## Preview

保存前に

代表値を確認可能にする。

------------------------------------------------------------------------

## Rule

計算はDomainで行う。

画面は結果を表示するだけとする。

------------------------------------------------------------------------

## Delete Measurement

最低測定数を下回る場合の

挙動を定義する。

------------------------------------------------------------------------

# SCR-022 Record Confirmation

------------------------------------------------------------------------

## 目的

保存内容を確認し、

入力ミスを減らす。

------------------------------------------------------------------------

## 主要要素

-   SYS
-   DIA
-   Pulse
-   Date
-   Time
-   Time Period
-   Measurement Count
-   Aggregation Method
-   Memo
-   Tags
-   Save
-   Edit

------------------------------------------------------------------------

## Rule

確認画面を常時必須にするかは

UX仕様へ従う。

設定により省略する場合も

保存後Feedbackは必要。

------------------------------------------------------------------------

# SCR-030 History

------------------------------------------------------------------------

## 目的

過去の記録を

時系列で確認し、

検索、Filter、Detail遷移を行う。

------------------------------------------------------------------------

## 主要要素

-   Record List
-   Date Group
-   Filter
-   Sort
-   Period
-   Add Record
-   Record Card

------------------------------------------------------------------------

## Default Sort

新しい順。

------------------------------------------------------------------------

## Record Card

-   Date
-   Time
-   Time Period
-   SYS
-   DIA
-   Pulse Optional
-   Multiple Measurement Indicator

------------------------------------------------------------------------

## State

-   Loading
-   Empty
-   Data
-   Filter Empty
-   Error
-   Refreshing

------------------------------------------------------------------------

## Empty

記録なしと

Filter結果なしを区別する。

------------------------------------------------------------------------

## Performance

大量Dataで

Lazy List、Paging、

適切なQueryを使用する。

------------------------------------------------------------------------

## Navigation

-   Record Detail
-   Input
-   Filter Sheet

------------------------------------------------------------------------

# SCR-031 Record Detail

------------------------------------------------------------------------

## 目的

1件の記録を

詳細に確認する。

------------------------------------------------------------------------

## 主要要素

-   Representative Value
-   Date・Time
-   Time Period
-   Individual Measurements
-   Aggregation Method
-   Memo
-   Tags
-   Edit
-   Delete

------------------------------------------------------------------------

## Delete

Confirmation Dialogを表示する。

------------------------------------------------------------------------

## Not Found

削除済みやInvalid IDの場合は

Error Stateを表示し、

Historyへ戻れるようにする。

------------------------------------------------------------------------

# SCR-032 Record Edit

------------------------------------------------------------------------

## 目的

既存記録を

安全に変更する。

------------------------------------------------------------------------

## 基本

Input画面と

同一Component・Validationを使用する。

------------------------------------------------------------------------

## Preload

保存済み値を

Draftへ読み込む。

------------------------------------------------------------------------

## Rule

Original DataとDraftを比較し、

変更なしの場合の保存挙動を定義する。

------------------------------------------------------------------------

## Multiple Measurement

代表値だけでなく

元測定値との整合性を保つ。

------------------------------------------------------------------------

## Save

Transactionで更新する。

------------------------------------------------------------------------

# SCR-040 Graph

------------------------------------------------------------------------

## 目的

血圧・Pulseの

期間変化を視覚的に確認する。

------------------------------------------------------------------------

## 主要要素

-   Period Selector
-   SYS Series
-   DIA Series
-   Pulse Series
-   Legend
-   Tooltip
-   Summary
-   Accessibility Data View

------------------------------------------------------------------------

## Period

例

-   7 Days
-   30 Days
-   3 Months
-   6 Months
-   1 Year
-   All

------------------------------------------------------------------------

## Missing Data

0として描画しない。

存在しないDataを

補完しない。

------------------------------------------------------------------------

## Tooltip

-   Date
-   Time
-   SYS
-   DIA
-   Pulse

------------------------------------------------------------------------

## Accessibility

Graphと同じ内容を

Text SummaryまたはListで確認可能にする。

------------------------------------------------------------------------

## State

-   Loading
-   No Data
-   Data
-   Error

------------------------------------------------------------------------

# SCR-050 Statistics

------------------------------------------------------------------------

## 目的

指定期間の

集計値を確認する。

------------------------------------------------------------------------

## 主要要素

-   Period Selector
-   Record Count
-   SYS Average
-   DIA Average
-   Pulse Average
-   Minimum
-   Maximum
-   Morning・Evening Breakdown
-   Data Note

------------------------------------------------------------------------

## Rule

Dataなしを

0と表示しない。

Pulse nullを

0として集計しない。

------------------------------------------------------------------------

## Source

Graph、Exportと

同じRepository・計算Ruleを使用する。

------------------------------------------------------------------------

# SCR-060 Reminder

------------------------------------------------------------------------

## 目的

血圧測定の通知を

設定、編集、削除する。

------------------------------------------------------------------------

## 主要要素

-   Permission Status
-   Morning Reminder
-   Evening Reminder
-   Time
-   Weekday
-   Enable
-   Edit
-   Delete
-   OS Settings Link

------------------------------------------------------------------------

## Permission

OS Dialog前に

目的を説明する。

拒否時は

Settingsへの導線を提供する。

------------------------------------------------------------------------

## State

-   Permission Unknown
-   Granted
-   Denied
-   Permanently Denied
-   Scheduled
-   Disabled
-   Error

------------------------------------------------------------------------

# SCR-070 Export

------------------------------------------------------------------------

## 目的

指定期間の記録を

PDF・CSVで確認、生成、共有する。

------------------------------------------------------------------------

## 主要要素

-   Format
-   Date Range
-   Field Selection
-   Preview
-   Generate
-   Share
-   AI Section Optional
-   Disclaimer

------------------------------------------------------------------------

## State

-   Configure
-   Generating
-   Preview
-   Sharing
-   Success
-   Error
-   Cancelled

------------------------------------------------------------------------

## Rule

AIなしで

基本Exportを完了可能にする。

------------------------------------------------------------------------

## Privacy

共有前に

内容を確認できるようにする。

------------------------------------------------------------------------

# SCR-080 Backup

------------------------------------------------------------------------

## 目的

端末内Dataの

Backup Fileを作成する。

------------------------------------------------------------------------

## 主要要素

-   Backup対象
-   Last Backup
-   Encryption Status
-   Create Backup
-   Save・Share
-   Restore Entry
-   Privacy Note

------------------------------------------------------------------------

## State

-   Ready
-   Creating
-   Success
-   Error

------------------------------------------------------------------------

## Rule

Partial Fileを残さない。

失敗時に

既存Dataへ影響を与えない。

------------------------------------------------------------------------

# SCR-081 Restore

------------------------------------------------------------------------

## 目的

Backup Fileを検証し、

安全にDataを復元する。

------------------------------------------------------------------------

## Flow


Select File

Validate

Preview

Confirm

Restore

Integrity Check

Complete


------------------------------------------------------------------------

## 主要要素

-   File Picker
-   File Information
-   Backup Version
-   Record Count
-   Settings Count
-   Warning
-   Restore
-   Cancel

------------------------------------------------------------------------

## Confirmation

既存Dataへの影響を

明確に説明する。

------------------------------------------------------------------------

## Failure

元Dataを保持し、

再試行またはCancel可能にする。

------------------------------------------------------------------------

# SCR-090 Settings

------------------------------------------------------------------------

## 目的

表示、記録方法、

通知、AI、Data、

Privacyを設定する。

------------------------------------------------------------------------

## Category


表示

記録方法

通知

AI

Data・Backup

Privacy

About


------------------------------------------------------------------------

## 主要設定

-   Theme
-   Text Size
-   Button Size
-   High Contrast
-   Reduce Motion
-   Time Period Rule
-   Aggregation Method
-   Reminder
-   AI Enable
-   Backup
-   Delete All
-   Privacy Policy

------------------------------------------------------------------------

## Rule

Toggleだけを並べず、

必要な説明を表示する。

------------------------------------------------------------------------

## Dangerous Setting

Delete All、

Reset、

Restoreは

別確認を行う。

------------------------------------------------------------------------

# SCR-091 Privacy

------------------------------------------------------------------------

## 目的

Dataの保存、送信、

AI利用、Backup、

削除方針を説明する。

------------------------------------------------------------------------

## 主要要素

-   Local Storage
-   External Transmission
-   AI Data
-   Analytics
-   Crash Reporting
-   Backup File
-   Delete All
-   Privacy Policy Link
-   Consent Management

------------------------------------------------------------------------

## Rule

法的文書だけでなく、

利用者向けの

理解しやすい要約を表示する。

------------------------------------------------------------------------

# SCR-100 AI Summary

------------------------------------------------------------------------

## 目的

記録Dataを元に

AIによる振り返り補助を提供する。

------------------------------------------------------------------------

## Entry

-   Home
-   Graph
-   Statistics
-   Export

------------------------------------------------------------------------

## 主要要素

-   AI Label
-   Target Period
-   Local Statistics
-   Generated Summary
-   Disclaimer
-   Regenerate
-   Cancel
-   Copy・Export Optional
-   Feedback Optional

------------------------------------------------------------------------

## State

-   Consent Required
-   Preparing
-   Requesting
-   Validating
-   Success
-   Safety Block
-   Timeout
-   Offline
-   Cancelled
-   Error

------------------------------------------------------------------------

## Rule

-   AI生成結果を明示する
-   診断を表示しない
-   薬変更を表示しない
-   Local Dataと数値を照合する
-   Unsafe Responseを表示しない
-   AIなしFallbackを提供する
-   自動でRecordを変更しない

------------------------------------------------------------------------

# Dialog Context

------------------------------------------------------------------------

主なDialog

-   Delete Record
-   Discard Draft
-   Restore Confirmation
-   Delete All
-   AI Consent
-   Permission Explanation
-   Export Error

------------------------------------------------------------------------

## 共通Rule

-   Title
-   説明
-   Primary Action
-   Cancel
-   Destructive区別
-   Focus管理
-   Screen Reader対応

------------------------------------------------------------------------

# Bottom Sheet Context

------------------------------------------------------------------------

主なBottom Sheet

-   History Filter
-   History Sort
-   Date Range
-   Aggregation Method
-   Tag Selection
-   Export Field Selection

------------------------------------------------------------------------

## 共通Rule

-   Drag Handle Optional
-   Title
-   Scroll
-   Safe Area
-   Apply
-   Reset
-   Cancel
-   Large Text対応

------------------------------------------------------------------------

# Permission Context

------------------------------------------------------------------------

対象

-   Notification
-   File
-   Biometric Optional

------------------------------------------------------------------------

## Flow


In App Explanation

Request

Granted or Denied

Next Guidance


OS Dialogだけで

説明を完結しない。

------------------------------------------------------------------------

# Keyboard Context

------------------------------------------------------------------------

Input画面では

-   Numeric Keyboard
-   Next
-   Done
-   Focus Order
-   Keyboard Avoidance
-   Scroll to Error
-   Hardware Keyboard

を確認する。

------------------------------------------------------------------------

# Date・Time Context

------------------------------------------------------------------------

-   Locale Format
-   Device Timezone
-   Date Picker
-   Time Picker
-   Future Date Rule
-   Day Boundary
-   Time Period Classification
-   DST
-   Timezone Change

を考慮する。

------------------------------------------------------------------------

# Localization Context

------------------------------------------------------------------------

-   ja-JPを基準にする
-   英語の長いLabelへ対応する
-   固定Widthを避ける
-   Date・Number FormatをLocale対応する
-   ErrorをLocalizationする
-   Notification文言をLocalizationする
-   PDF文言をLocalizationする
-   AI DisclaimerをLocalizationする

------------------------------------------------------------------------

# Theme Context

------------------------------------------------------------------------

各Screenで

-   Light
-   Dark
-   High Contrast
-   Text Size
-   Button Size
-   Reduce Motion

を確認する。

------------------------------------------------------------------------

# Data Dependency Matrix

------------------------------------------------------------------------

## Home

-   Latest Record
-   Today Records
-   Settings
-   Reminder Status

## Input

-   Settings
-   Time Period Policy
-   Aggregation Policy
-   Tags

## History

-   Records
-   Filter
-   Sort

## Detail・Edit

-   Record by ID
-   Session
-   Measurements
-   Tags

## Graph

-   Period Records
-   Chart Settings

## Statistics

-   Period Records
-   Aggregation Service

## Reminder

-   Permission
-   Reminder Settings

## Export

-   Period Records
-   User Selection
-   AI Output Optional

## Backup

-   Records
-   Settings
-   Reminders
-   Schema Version

## AI Summary

-   Consent
-   Local Aggregation
-   Prompt Version
-   Feature Flag

------------------------------------------------------------------------

# Route Context

------------------------------------------------------------------------

推奨Route名例


splash

onboarding

home

recordInput

multipleMeasurement

recordConfirmation

history

recordDetail

recordEdit

graph

statistics

reminder

export

backup

restore

settings

privacy

aiSummary


Pathを

Widgetへ直書きしない。

------------------------------------------------------------------------

# Screen Test Rules

------------------------------------------------------------------------

各Screenで

最低限確認する。

-   Initial
-   Loading
-   Data
-   Empty
-   Error
-   Primary Action
-   Navigation
-   Back
-   Large Text
-   Dark Mode
-   Screen Reader
-   Smartphone
-   Tablet

------------------------------------------------------------------------

# Widget Test

------------------------------------------------------------------------

確認例


Homeに記録がないときEmpty Stateを表示する

InputでSYS未入力時に必須Errorを表示する

HistoryでFilter結果がないときFilter Emptyを表示する

GraphでDataがないとき0を描画しない

Restore失敗時に元Data保持の案内を表示する


------------------------------------------------------------------------

# Golden Test

------------------------------------------------------------------------

対象

-   Home
-   Input
-   Multiple Measurement
-   History
-   Detail
-   Graph
-   Statistics
-   Settings
-   Empty
-   Error
-   Dialog
-   Bottom Sheet

条件

-   Light
-   Dark
-   Large Text
-   Smartphone
-   Tablet

------------------------------------------------------------------------

# Integration Test

------------------------------------------------------------------------

主要Flow


Home → Input → Save → Home

Input → Multiple Measurement → Save

History → Detail → Edit → Save

History → Detail → Delete

Graph → Period Change

Settings → Reminder

Export → Preview → Share

Backup → Create

Restore → Preview → Restore

AI Summary → Consent → Generate → Fallback


------------------------------------------------------------------------

# Screen変更手順

------------------------------------------------------------------------


1. Feature Requirementを確認する

2. Screen仕様を更新する

3. User Flow・Navigation影響を確認する

4. Figma Frame・Componentを更新する

5. Flutter Screen・Stateを更新する

6. Accessibilityを確認する

7. Widget・Golden Testを更新する

8. Related Documentを更新する

9. Release影響を確認する


------------------------------------------------------------------------

# Screen追加手順

------------------------------------------------------------------------


1. Screen目的を定義する

2. Screen IDを付ける

3. Entry・Exitを定義する

4. Primary Actionを定義する

5. Data依存を定義する

6. Stateを定義する

7. Error・Emptyを定義する

8. Accessibilityを定義する

9. Figma Frameを作成する

10. Routeを追加する

11. Flutter実装する

12. Testを追加する

13. ScreenListを更新する


------------------------------------------------------------------------

# AI開発エージェント向け作業手順

------------------------------------------------------------------------


1. PROJECT.mdを読む

2. AGENTS.mdを読む

3. SCREEN_CONTEXT.mdを読む

4. 対象Featureを読む

5. 対象Screen仕様を読む

6. User Flow・Navigationを読む

7. DESIGN_RULES.mdを読む

8. Existing Screen・Componentを確認する

9. Figmaを確認する

10. 実装・Test・文書更新を行う


------------------------------------------------------------------------

# AIへの禁止事項

------------------------------------------------------------------------

-   Screen仕様を読まずにUIを生成する
-   Screenshotだけで固定座標実装する
-   Routeを独自追加する
-   ScreenへBusiness Logicを書く
-   ScreenからDatabaseを直接呼ぶ
-   Loading・Empty・Errorを省略する
-   Back時のDraft破棄を無視する
-   Text Scaleを無視する
-   Screen Readerを無視する
-   固定HeightでTextを切る
-   医療評価を独自表示する
-   Pulse nullを0表示する
-   Missing Graph Dataを0表示する
-   AI生成物を通常情報として表示する
-   AI失敗時に画面全体を利用不能にする
-   Golden差分を無確認更新する

------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   1画面へ複数の主要目的を詰め込む
-   Primary Actionを複数並列にする
-   Main Navigationを画面ごとに変える
-   Path Literalを直書きする
-   Entity全体をRouteへ渡す
-   Build中にNavigationする
-   UIからPluginを直接呼ぶ
-   ErrorをSnackbarだけで完結させる
-   Empty Stateを空白にする
-   Disabled理由を隠す
-   保存失敗時にDraftを消す
-   削除を確認なしで実行する
-   RestoreをPreviewなしで実行する
-   Colorだけで状態を伝える
-   小さなTouch Targetを使う
-   TabletでFormを全幅表示する
-   Dark Modeを省略する
-   AIを主要Flowの必須依存にする

------------------------------------------------------------------------

# 作業完了チェック

------------------------------------------------------------------------

## Context

-   Screen IDがある
-   目的が一つ
-   Feature IDと関連付く
-   Entry・Exitが明確
-   Primary Actionが明確
-   Data依存が明確

## State

-   Loadingを定義した
-   Dataを定義した
-   Emptyを定義した
-   Errorを定義した
-   Submittingを定義した
-   Offlineを確認した

## Navigation

-   Route名を使用した
-   Backを確認した
-   Invalid IDを確認した
-   Deep Linkを確認した
-   Notification Linkを確認した

## UI

-   Design Systemを使用した
-   共通Componentを使用した
-   Primary Actionが見つけやすい
-   Textが切れない
-   Keyboardで隠れない
-   Responsiveへ対応した

## Accessibility

-   Semanticsがある
-   Reading Orderが正しい
-   Errorが読み上げられる
-   Text Scale 200%で操作できる
-   Touch Targetが十分
-   Colorだけに依存しない

## Quality

-   Widget Testがある
-   Golden Testがある
-   Integration影響を確認した
-   Figmaを更新した
-   Screen仕様を更新した
-   Navigationを更新した

------------------------------------------------------------------------

# Definition of Done

------------------------------------------------------------------------

画面実装は

次をすべて満たした場合に完了とする。

□ Screen目的が明確である

□ Feature Requirementと一致する

□ Screen仕様と一致する

□ Entry・Exitが正しい

□ Primary Actionが明確である

□ Loading・Empty・Errorを扱う

□ 未保存変更を安全に扱う

□ Data SourceがArchitectureに従う

□ UIへBusiness Logicを置かない

□ Design Systemを使用する

□ FigmaとFlutterが対応する

□ Smartphone・Tabletで操作できる

□ Light・Darkへ対応する

□ Text Scale 200%で操作できる

□ Screen Readerで主要操作ができる

□ Widget Testを通過する

□ Golden Testを通過する

□ Related Documentsが更新されている

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Navigation

-   Main Navigationが動作する
-   Inputへ遷移できる
-   Detailへ遷移できる
-   Editへ遷移できる
-   Invalid IDを扱える
-   BackでDraftを保護できる

## State

-   Loadingを表示できる
-   Emptyを表示できる
-   Errorを表示できる
-   Retryできる
-   Submitting中の二重操作を防げる
-   Offlineで部分利用できる

## Home

-   Record Actionが最優先
-   Latest Recordが正しい
-   No Recordを表示できる
-   Today Statusが正しい

## Input

-   SYS・DIAを入力できる
-   Pulse Optionalを扱える
-   Validationを表示できる
-   Draftを保持できる
-   Multiple Measurementへ進める

## History・Detail

-   Date順に表示できる
-   Filter・Sortできる
-   Detailを表示できる
-   Editできる
-   Delete確認できる

## Graph・Statistics

-   Seriesを正しく表示できる
-   Missing Dataを0扱いしない
-   Tooltipを表示できる
-   Text Alternativeを表示できる
-   Dataなしを0表示しない

## Reminder・Export・Backup

-   Permission Flowを表示できる
-   Export Previewできる
-   Backupを作成できる
-   Restore Previewできる
-   Restore失敗時にDataを保持できる

## AI

-   Consentを表示できる
-   AI Loadingを表示できる
-   Safety Blockを表示できる
-   Offline Fallbackを表示できる
-   AI結果を通常情報と区別できる

## Accessibility

-   Screen Titleを読み上げられる
-   Input Labelを読み上げられる
-   Errorを読み上げられる
-   Text Scale 200%で操作できる
-   Touch Targetを確保できる
-   Graph代替情報を利用できる

------------------------------------------------------------------------

## Acceptance Criteria

□ Screen Contextの目的を説明できる

□ 画面実装時の参照順序を判断できる

□ Screen IDを一意に管理できる

□ Main Navigationを統一できる

□ Primary Actionを明確にできる

□ Screen共通構造を適用できる

□ Loading・Data・Empty・Errorを定義できる

□ Screen Data FlowをArchitectureに従わせられる

□ Build中のSide Effectを避けられる

□ Input Draftを安全に管理できる

□ 未保存変更を保護できる

□ UI・Domain Validationを分離できる

□ 保存中の二重操作を防げる

□ Delete・Restoreを安全に確認できる

□ Compact・Medium・Expandedへ対応できる

□ Screen Readerへ対応できる

□ Figma FrameとFlutter Screenを対応できる

□ 共通Componentを再利用できる

□ Splashの初期化責務を限定できる

□ OnboardingでPrivacyを説明できる

□ Homeで記録Actionを最優先にできる

□ InputでF001の値を正確に扱える

□ Multiple Measurementを分かりやすく表示できる

□ Confirmationで保存内容を確認できる

□ Historyで記録を時系列表示できる

□ Detailで元測定値を確認できる

□ Editで整合性を保って更新できる

□ GraphでMissing Dataを正しく扱える

□ StatisticsでPulse nullを0扱いしない

□ Reminder Permissionを適切に案内できる

□ ExportをAIなしで完了できる

□ Backupを安全に作成できる

□ RestoreをPreview・Transaction付きで実行できる

□ Settingsをカテゴリ分けできる

□ Privacyを利用者向けに説明できる

□ AI SummaryのSafety・Fallbackを表示できる

□ DialogとBottom Sheetを使い分けられる

□ Keyboard・Date・Timeを安全に扱える

□ Light・Dark・Large Textへ対応できる

□ Widget・Golden・Integration Testを追加できる

□ AIがScreen仕様を無視して実装しない

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

★★★★★（すべての画面設計・実装で必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
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
-   09_AI_Context/AGENTS.md
-   09_AI_Context/PROJECT.md
-   09_AI_Context/DESIGN_RULES.md
-   09_AI_Context/CODING_RULES.md

------------------------------------------------------------------------

## 将来拡張

-   Splash.md
-   Onboarding.md
-   RecordDetail.md
-   RecordEdit.md
-   Statistics.md
-   Reminder.md
-   Export.md
-   Backup.md
-   Restore.md
-   Privacy.md
-   AISummary.md
-   RouteMap.md
-   ScreenStateMap.md
-   ScreenDataDependencyMap.md
-   FigmaScreenMap.md
-   FlutterScreenMap.md
-   DeepLinkSpecification.md
-   NotificationNavigation.md
-   ResponsiveScreenMatrix.md
-   ScreenAccessibilityChecklist.md
-   ScreenContext自動生成
