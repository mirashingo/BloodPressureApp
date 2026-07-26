# DESIGN_RULES.md

# BloodPressureApp AI開発コンテキスト

Version: 1.0

------------------------------------------------------------------------

# DESIGN_RULES

## ドキュメントID

AI-CONTEXT-DESIGN-RULES-001

------------------------------------------------------------------------

## 名称

BloodPressureApp デザイン実装共通ルール

------------------------------------------------------------------------

## 目的

BloodPressureAppの画面設計、

Figma制作、Flutter実装、

デザインレビュー、AIコード生成において、

視覚表現、情報構造、操作性、

アクセシビリティ、レスポンシブ、

コンポーネント、状態表現、

デザイントークンのルールを統一する。

本書は、

デザイナー、Flutter開発者、

QA、プロダクト担当者、

AI開発エージェントが共通で参照する。

AIはスクリーンショットだけを模倣せず、

本書とDesign System文書、

Screen仕様、Figma Componentを照合して

一貫したUIを実装する。

------------------------------------------------------------------------

## 適用範囲

-   Figma
-   Figma Dev Mode
-   Figma MCP
-   Flutter UI
-   Material Design
-   Android
-   iOS
-   Smartphone
-   Tablet
-   Light Mode
-   Dark Mode
-   High Contrast
-   Accessibility
-   Responsive Layout
-   Component Design
-   Screen State
-   Animation
-   Chart
-   PDF Preview
-   AI Feature UI
-   Golden Test

------------------------------------------------------------------------

## デザインの中心思想


血圧を記録する人が、

毎日、

迷わず、

安心して、

気持ちよく使えること


------------------------------------------------------------------------

## デザイン原則

-   正確性を最優先する
-   情報を読み間違えにくくする
-   頻度の高い操作を最短にする
-   利用者へ記録方法を強制しない
-   文字を小さくしすぎない
-   ボタンを押しやすくする
-   色だけで状態を伝えない
-   強い警告表現を乱用しない
-   高齢者を標準利用者として考える
-   AIを通常機能と視覚的に区別する
-   Design Tokenを使用する
-   画面ごとの独自ルールを作らない
-   Light・Darkの両方を設計する
-   Text Scale 200%まで考慮する
-   SmartphoneとTabletへ対応する
-   Animationなしでも意味が伝わるようにする

------------------------------------------------------------------------

# 指示の優先順位

------------------------------------------------------------------------

デザイン判断は

次の順序で行う。


1. Accessibility・安全性

2. Feature Requirements

3. Screen Specification

4. DESIGN_RULES.md

5. Design System文書

6. Figma Component・Dev Mode

7. Flutter Theme・既存Component

8. Platform慣習


矛盾がある場合は

上位ルールを優先し、

差異を記録する。

------------------------------------------------------------------------

# デザインキーワード

------------------------------------------------------------------------

-   安心
-   穏やか
-   清潔
-   信頼
-   やさしい
-   継続しやすい
-   見やすい
-   押しやすい
-   責められない
-   医療的すぎない
-   子どもっぽすぎない
-   無機質すぎない

------------------------------------------------------------------------

# 避ける印象

------------------------------------------------------------------------

-   緊急警報のような強い赤
-   病院機器のような冷たいUI
-   ゲームのような過度な演出
-   広告のような派手なUI
-   情報量が多すぎるDashboard
-   数値を過度に評価する表現
-   利用者を責める文言
-   不安を煽るAI表現
-   装飾だけのAnimation
-   小さなTouch Target

------------------------------------------------------------------------

# Design Token方針

------------------------------------------------------------------------

すべての画面は

Design Tokenを使用する。

対象

-   Color
-   Typography
-   Spacing
-   Radius
-   Elevation
-   Border
-   Icon Size
-   Motion
-   Breakpoint
-   Component Size

固定値の直書きを

最小化する。

------------------------------------------------------------------------

# Color Rules

------------------------------------------------------------------------

参照


04_DesignSystem/Colors.md


------------------------------------------------------------------------

## Semantic Color

色名ではなく

意味で管理する。

例


colorPrimary

colorOnPrimary

colorSurface

colorOnSurface

colorSurfaceVariant

colorOutline

colorSuccess

colorWarning

colorError

colorInfo

colorDisabled


------------------------------------------------------------------------

## 血圧グラフ色

用途を固定する。


SYS

DIA

Pulse


同じSeriesは

全画面・PDFで同じ色を使用する。

------------------------------------------------------------------------

## 禁止


Color(0xFF...)

Colors.red

Colors.blue


をScreenへ直接書かない。

ThemeまたはToken経由で参照する。

------------------------------------------------------------------------

## Error Color

Errorは

入力不備や処理失敗へ使用する。

血圧値そのものを

機械的に赤くしない。

医療基準による評価表示を行う場合は

別Feature仕様と安全Reviewを必要とする。

------------------------------------------------------------------------

## Warning Color

注意を促す場合も

色だけでなく

Icon、Label、説明文を組み合わせる。

------------------------------------------------------------------------

## Contrast

通常文字

WCAG AA相当以上を目標とする。

大文字でも

視認性を実機で確認する。

------------------------------------------------------------------------

# Typography Rules

------------------------------------------------------------------------

参照


04_DesignSystem/Typography.md


------------------------------------------------------------------------

## Text Style

例


displayLarge

headlineLarge

headlineMedium

titleLarge

titleMedium

bodyLarge

bodyMedium

labelLarge

labelMedium

numberLarge

numberMedium

caption


TextStyleを

画面ごとに新規作成しない。

------------------------------------------------------------------------

## 血圧数値

SYS・DIA・Pulseは

読み間違いを防ぐため、

十分なSize、Weight、

Line Heightを確保する。

単位と数値のHierarchyを分ける。

例


128 mmHg


数値を強く、

単位を補助的に表示する。

------------------------------------------------------------------------

## Font Weight

太字を乱用しない。

優先順位

-   Primary Value
-   Screen Title
-   Primary Action
-   Section Title

------------------------------------------------------------------------

## Line Height

日本語本文は

詰めすぎない。

複数行の説明文は

読みやすいLine Heightを確保する。

------------------------------------------------------------------------

## Text Scale

必須確認

-   100%
-   130%
-   160%
-   200%

200%で

情報が欠落しないこと。

------------------------------------------------------------------------

## Ellipsis

重要情報へ

安易にEllipsisを使用しない。

血圧値、日時、Error、

Primary Actionは省略しない。

------------------------------------------------------------------------

# Spacing Rules

------------------------------------------------------------------------

Spacingは

一定のScaleで管理する。

推奨例


space2

space4

space8

space12

space16

space20

space24

space32

space40

space48


------------------------------------------------------------------------

## 基本

-   Related Itemは近くする
-   Section間は広くする
-   Screen Edgeへ十分な余白を取る
-   Primary Action周辺を詰めすぎない
-   Form LabelとInputを明確に関連付ける

------------------------------------------------------------------------

## 禁止

意味のない

`SizedBox(height: 7)`等を

大量に追加しない。

Design Tokenへ統一する。

------------------------------------------------------------------------

# Radius Rules

------------------------------------------------------------------------

Radiusは

Component Roleで管理する。

例


radiusSmall

radiusMedium

radiusLarge

radiusFull


------------------------------------------------------------------------

## 用途

-   Input
-   Card
-   Button
-   Chip
-   Dialog
-   Bottom Sheet

同じRoleで

画面ごとにRadiusを変えない。

------------------------------------------------------------------------

# Elevation Rules

------------------------------------------------------------------------

Elevationは

階層表現のために限定使用する。

対象

-   Floating Action
-   Modal
-   Bottom Sheet
-   Overlay
-   Temporary Surface

Cardをすべて浮かせない。

BorderやSurface差で

十分な場合はElevationを使わない。

------------------------------------------------------------------------

# Border Rules

------------------------------------------------------------------------

Borderは

-   Input Boundary
-   Selected State
-   Error State
-   Card Separation

へ使用する。

太いBorderを乱用しない。

------------------------------------------------------------------------

# Icon Rules

------------------------------------------------------------------------

## 基本

-   意味が明確なIconを使用する
-   IconだけのButtonにはSemantics Labelを付ける
-   Platformで意味が変わらないIconを選ぶ
-   同じActionに同じIconを使う
-   装飾Iconを増やしすぎない

------------------------------------------------------------------------

## Icon Size

Token化する。

例


iconSmall

iconMedium

iconLarge


------------------------------------------------------------------------

## Icon Only Button

主要操作では

IconとTextを併用する。

Iconだけを使う場合は

一般的に認識されるActionに限定する。

------------------------------------------------------------------------

# Touch Target Rules

------------------------------------------------------------------------

主要Actionは

十分なTouch Targetを確保する。

目標


最低 44〜48 logical pixels相当


Iconが小さくても

Tap領域は広くする。

------------------------------------------------------------------------

# Layout Rules

------------------------------------------------------------------------

## Screen Structure

標準


Scaffold

SafeArea

App Bar

Scrollable Content

Primary Action


------------------------------------------------------------------------

## Vertical Scroll

Text Scaleや

小画面で内容が収まらない場合に備え、

FormやSettingsは

Scroll可能にする。

------------------------------------------------------------------------

## Horizontal Scroll

主要操作で

Horizontal Scrollを要求しない。

Graph等の特別な用途に限定する。

------------------------------------------------------------------------

## Fixed Height

Textを含むComponentへ

固定Heightを指定しすぎない。

最低HeightとPaddingで構成する。

------------------------------------------------------------------------

## Flexible

Row内の長いTextは

FlexibleまたはExpandedで扱う。

------------------------------------------------------------------------

## Safe Area

-   Notch
-   Dynamic Island
-   Navigation Bar
-   Gesture Area

を考慮する。

------------------------------------------------------------------------

# Responsive Rules

------------------------------------------------------------------------

## 基本

Device名ではなく

利用可能Widthで判断する。

------------------------------------------------------------------------

## Breakpoint候補


compact

medium

expanded


最終値は

Design Systemで定義する。

------------------------------------------------------------------------

## Compact

-   1 Column
-   Bottom Navigation
-   Full Width Form
-   Primary Actionを見つけやすくする

------------------------------------------------------------------------

## Medium

-   広いPadding
-   Form Widthを制限
-   2 Column候補
-   Navigation Rail検討

------------------------------------------------------------------------

## Expanded

-   Master Detail
-   Navigation Rail
-   Content Max Width
-   Side Panel

------------------------------------------------------------------------

## Max Width

Tabletで

Formや文章を画面全幅へ伸ばしすぎない。

Readable Widthを設定する。

------------------------------------------------------------------------

# Orientation Rules

------------------------------------------------------------------------

Portraitを優先するが、

Landscapeでも

主要操作を継続できるようにする。

Landscapeで

ButtonやFormが隠れないこと。

------------------------------------------------------------------------

# Component Rules

------------------------------------------------------------------------

参照


04_DesignSystem/Components.md


------------------------------------------------------------------------

## 共通Component

-   AppScaffold
-   AppAppBar
-   PrimaryButton
-   SecondaryButton
-   TertiaryButton
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

------------------------------------------------------------------------

## Rule

同じ見た目・役割のUIを

Screen内で複製しない。

共通Componentを利用する。

------------------------------------------------------------------------

## Component API

Componentは

見た目だけでなく

意味を表すPropertyを持つ。

悪い例


color

height

fontSize


だけを大量に渡す。

良い例


variant

size

state

isLoading

isEnabled

semanticLabel


------------------------------------------------------------------------

# Button Rules

------------------------------------------------------------------------

## Primary Button

画面の最重要Action。

原則1画面1つ。

例

-   保存
-   次へ
-   PDFを作成
-   Backupを作成

------------------------------------------------------------------------

## Secondary Button

補助Action。

------------------------------------------------------------------------

## Tertiary Button

低優先のText Action。

------------------------------------------------------------------------

## Destructive Button

削除など。

Primaryと視覚的に区別する。

------------------------------------------------------------------------

## Loading

押下後は

-   二重送信防止
-   Loading表示
-   Label維持または状態文
-   Cancel可否

を考慮する。

------------------------------------------------------------------------

## Disabled

Disabledだけで

理由が分からなくならないようにする。

必要に応じて

Validation Messageを表示する。

------------------------------------------------------------------------

# Input Rules

------------------------------------------------------------------------

## Label

Placeholderだけに依存しない。

常に理解可能なLabelを表示する。

------------------------------------------------------------------------

## Numeric Input

SYS、DIA、Pulseは

数値Keyboardを使用する。

ただし

PasteやHardware Keyboardも考慮する。

------------------------------------------------------------------------

## Unit

Unitは

入力値と明確に関連付ける。

------------------------------------------------------------------------

## Validation

-   ErrorをInput近くへ表示する
-   Error Colorだけに依存しない
-   Error原因を具体的にする
-   修正後にErrorを解除する
-   Screen Readerへ通知する

------------------------------------------------------------------------

## Focus

入力順に

自然なFocus Orderを設定する。

Next・Doneを適切に使用する。

------------------------------------------------------------------------

## Initial Value

利用者が誤って

前回値を再保存しないよう、

初期値の自動入力は慎重に扱う。

------------------------------------------------------------------------

# Blood Pressure Input Rules

------------------------------------------------------------------------

## SYS・DIA

関連性を視覚的に示すが、

混同しないよう

Labelと配置を明確にする。

------------------------------------------------------------------------

## Pulse

Optionalであることを

分かりやすく表示する。

------------------------------------------------------------------------

## Date・Time

初期値は現在日時を候補とするが、

利用者が確認・変更できるようにする。

------------------------------------------------------------------------

## Multiple Measurement

1回目、2回目、3回目を

明確に区別する。

代表値の決定方式を

保存前に確認できるようにする。

------------------------------------------------------------------------

## Aggregation Method

-   Average
-   Last
-   Lowest
-   User Selected

を説明付きで選択できるようにする。

専門用語だけで表示しない。

------------------------------------------------------------------------

# Card Rules

------------------------------------------------------------------------

Cardは

情報のGroupingに使用する。

1項目ごとに

Cardを作りすぎない。

------------------------------------------------------------------------

## Record Card

最低情報

-   Date
-   Time Period
-   SYS
-   DIA
-   Pulse Optional
-   Multiple Measurement Indicator Optional

------------------------------------------------------------------------

## Tap Area

Card全体をTap可能にする場合は

明確なFeedbackを与える。

内部Actionとの衝突を避ける。

------------------------------------------------------------------------

# Navigation Rules

------------------------------------------------------------------------

## Main Navigation


Home

History

Graph

Settings


------------------------------------------------------------------------

## Primary Entry

血圧入力は

Homeからすぐ開始できる。

------------------------------------------------------------------------

## Back

Platform標準の期待に従う。

未保存変更がある場合は

確認する。

------------------------------------------------------------------------

## Tab State

Main Tab間で

Scroll・Filter等のState保持を検討する。

------------------------------------------------------------------------

## Deep Link

Invalid Linkでも

壊れた画面を表示しない。

------------------------------------------------------------------------

# App Bar Rules

------------------------------------------------------------------------

-   Screen Titleを表示する
-   Backの有無を一貫させる
-   Actionを詰め込みすぎない
-   重要Actionは本文側へ置く
-   長いTitleで崩れない

------------------------------------------------------------------------

# Bottom Navigation Rules

------------------------------------------------------------------------

-   3〜5項目
-   IconとLabelを表示する
-   Current Stateを明確にする
-   Labelを省略しない
-   Text Scaleで崩れない
-   Keyboard表示時の挙動を確認する

------------------------------------------------------------------------

# Dialog Rules

------------------------------------------------------------------------

Dialogは

重要な確認へ限定する。

対象

-   Delete
-   Restore
-   Reset
-   Unsaved Changes
-   AI Consent

------------------------------------------------------------------------

## Dialog構成

-   Title
-   説明
-   Primary Action
-   Cancel
-   Destructive区別

------------------------------------------------------------------------

# Bottom Sheet Rules

------------------------------------------------------------------------

対象

-   Filter
-   Sort
-   Date Range
-   Aggregation Method
-   Secondary Selection

内容が長い場合は

Scroll可能にする。

------------------------------------------------------------------------

# Snackbar・Toast Rules

------------------------------------------------------------------------

短いFeedbackに使用する。

例

-   保存しました
-   Backupを作成しました

Error詳細や

重要確認をSnackbarだけにしない。

------------------------------------------------------------------------

# Screen State Rules

------------------------------------------------------------------------

すべての主要Screenは

次を考慮する。


Initial

Loading

Data

Empty

Error

Refreshing

Disabled

Offline


------------------------------------------------------------------------

## Loading

-   無限に待たせない
-   処理内容を伝える
-   Skeletonを乱用しない
-   AIはCancelを考慮する

------------------------------------------------------------------------

## Empty

-   理由を伝える
-   次のActionを提示する
-   責める文言を使わない

例


まだ記録がありません

最初の血圧を記録してみましょう


------------------------------------------------------------------------

## Error

-   何が起きたか
-   Dataが失われたか
-   次に何ができるか

を伝える。

Exception Messageを

そのまま表示しない。

------------------------------------------------------------------------

## Success

過度なCelebrationを避ける。

毎日の記録に

大きな演出を毎回行わない。

------------------------------------------------------------------------

# Home Rules

------------------------------------------------------------------------

優先順位


1. Record Action

2. Latest Record

3. Today Status

4. Quick Summary

5. Secondary Navigation


情報を詰め込みすぎない。

------------------------------------------------------------------------

# History Rules

------------------------------------------------------------------------

-   日付Grouping
-   読みやすいRecord Card
-   Filter状態の可視化
-   Empty Filter Result
-   Edit・Deleteへの安全な導線
-   大量データでのPerformance

------------------------------------------------------------------------

# Graph Rules

------------------------------------------------------------------------

## Series

SYS、DIA、Pulseを

明確に区別する。

------------------------------------------------------------------------

## Legend

色だけでなく

Labelを表示する。

------------------------------------------------------------------------

## Tooltip

-   Date
-   Time
-   SYS
-   DIA
-   Pulse

を読みやすく表示する。

------------------------------------------------------------------------

## Missing Data

存在しない値を

0として描画しない。

線を誤って補完しない。

------------------------------------------------------------------------

## Accessibility

Graph内容を

Text SummaryまたはData Listで確認可能にする。

------------------------------------------------------------------------

## Scale

極端な値で

Lineが読みづらくならないようにする。

ただし、

利用者を誤解させるScale操作をしない。

------------------------------------------------------------------------

# Statistics Rules

------------------------------------------------------------------------

統計値には

-   対象期間
-   件数
-   単位
-   算出対象

を明示する。

Dataなしの場合に

0と表示しない。

------------------------------------------------------------------------

# Reminder Rules

------------------------------------------------------------------------

Permission要求前に

目的を説明する。

OS Dialogだけで

意味を伝えない。

------------------------------------------------------------------------

# Export Rules

------------------------------------------------------------------------

-   対象期間を確認できる
-   対象項目を確認できる
-   Previewできる
-   AI生成内容を区別する
-   Disclaimerを表示する
-   Share前に内容を確認できる

------------------------------------------------------------------------

# Backup・Restore Rules

------------------------------------------------------------------------

## Backup

-   保存対象を説明する
-   暗号化有無を説明する
-   File取扱注意を説明する

## Restore

-   既存Dataへの影響を説明する
-   Previewを表示する
-   Cancelできる
-   進行中状態を表示する
-   失敗時にData保持を伝える

------------------------------------------------------------------------

# Settings Rules

------------------------------------------------------------------------

Settingsは

カテゴリごとにGroupingする。

例


表示

記録方法

通知

AI

Data・Backup

Privacy

About


Toggleだけを並べず、

必要に応じて説明文を付ける。

------------------------------------------------------------------------

# AI UI Rules

------------------------------------------------------------------------

## 視覚的区別

AI生成結果には

Labelを付ける。

例


AIによる要約

AIによる提案


------------------------------------------------------------------------

## Disclaimer

AIは医療判断ではないことを

適切な場所で示す。

毎回長文を表示して

操作を妨げないよう、

Contextに応じて短文と詳細説明を使い分ける。

------------------------------------------------------------------------

## Loading

通常Loadingと区別し、

生成中であることを明示する。

Cancelを提供する。

------------------------------------------------------------------------

## Error

-   Network
-   Timeout
-   Safety Block
-   Invalid Response

を利用者向けに整理する。

------------------------------------------------------------------------

## Fallback

AIが利用できない場合も

Local Summaryや通常画面へ戻れる。

------------------------------------------------------------------------

## 適用

AI出力を

自動でRecordやSettingsへ反映しない。

利用者確認を必須とする。

------------------------------------------------------------------------

# Motion Rules

------------------------------------------------------------------------

参照


04_DesignSystem/Animation.md


------------------------------------------------------------------------

## 原則

-   意味がある
-   短い
-   穏やか
-   Interrupt可能
-   Reduce Motion対応
-   操作を待たせない

------------------------------------------------------------------------

## Duration Token

例


motionFast

motionNormal

motionSlow


------------------------------------------------------------------------

## 使用例

-   Screen Transition
-   Expand・Collapse
-   Save Success
-   Chart Update
-   Bottom Sheet

------------------------------------------------------------------------

## 禁止

-   無限Loop装飾
-   大きなBounce
-   Flash
-   過度なParallax
-   毎回のConfetti
-   Health Valueの警告Pulse

------------------------------------------------------------------------

# Accessibility Rules

------------------------------------------------------------------------

## Semantics

すべての主要Componentに

意味のあるSemanticsを設定する。

------------------------------------------------------------------------

## Screen Reader

確認対象

-   Screen Title
-   Blood Pressure Values
-   Unit
-   Button
-   Error
-   Graph Summary
-   Selected State

------------------------------------------------------------------------

## Reading Order

視覚順と

読み上げ順を一致させる。

------------------------------------------------------------------------

## Focus

Dialog表示時は

Dialog内へFocusを移す。

閉じた後は

適切な元位置へ戻す。

------------------------------------------------------------------------

## Color Vision

SYS・DIA・Pulseは

色だけで区別せず、

Label、Line Style、Marker等を併用する。

------------------------------------------------------------------------

## Text Scale

固定Heightで

Textを切らない。

------------------------------------------------------------------------

## Reduce Motion

設定またはOS Preferenceを尊重する。

------------------------------------------------------------------------

# Dark Mode Rules

------------------------------------------------------------------------

-   単純な色反転にしない
-   Surface階層を保つ
-   Contrastを確認する
-   Chart色を調整する
-   Error・Warningを過度に発光させない
-   Image・Logoの見え方を確認する
-   Golden Testを用意する

------------------------------------------------------------------------

# High Contrast Rules

------------------------------------------------------------------------

必要に応じて

-   Border強調
-   Text Contrast強化
-   Selected State強化
-   Focus Ring強化

を行う。

------------------------------------------------------------------------

# Localization Rules

------------------------------------------------------------------------

-   日本語を基準とする
-   英語で長くなることを考慮する
-   固定WidthのButtonを避ける
-   Date・Time FormatをLocale対応する
-   String連結でSentenceを作らない
-   単位を翻訳対象として管理する
-   Screenshot内Textを実装Textと一致させる

------------------------------------------------------------------------

# Figma Rules

------------------------------------------------------------------------

## File Structure

推奨


00_Cover

01_Foundations

02_Components

03_Patterns

04_Screens

05_Prototype

06_Dev


------------------------------------------------------------------------

## Component Naming

例


Button/Primary/Default

Button/Primary/Loading

Input/Numeric/Default

Input/Numeric/Error

Card/Record/Default


------------------------------------------------------------------------

## Variant

状態は

Variantで管理する。

-   State
-   Size
-   Theme
-   Selected
-   Disabled
-   Loading

------------------------------------------------------------------------

## Auto Layout

原則として

Auto Layoutを使用する。

固定位置だけで

Screenを構成しない。

------------------------------------------------------------------------

## Constraints

Resize時の挙動を

明示する。

------------------------------------------------------------------------

## Style・Variable

-   Color Variable
-   Text Style
-   Spacing Variable
-   Radius Variable

を使用する。

------------------------------------------------------------------------

## Dev Mode

開発者が確認できるよう

-   Component名
-   Token名
-   Padding
-   Gap
-   State
-   Responsive意図

を整理する。

------------------------------------------------------------------------

# FigmaとFlutter対応

------------------------------------------------------------------------


Figma Variable
    ↓
Flutter Design Token

Figma Component
    ↓
Flutter Widget

Figma Variant
    ↓
Widget Variant・State

Auto Layout
    ↓
Row・Column・Wrap・Flex

Figma Prototype
    ↓
GoRouter・Interaction


------------------------------------------------------------------------

## 対応表

各主要Componentで

次を管理する。


Figma Component Name

Flutter Widget Name

Token

Variant

Screen Usage

Accessibility

Test


------------------------------------------------------------------------

# Flutter UI Rules

------------------------------------------------------------------------

## Theme

Material Themeを基盤とし、

ThemeDataとThemeExtensionで

Tokenを提供する。

------------------------------------------------------------------------

## Build

Build内で

Data取得、重い計算、

Navigationを直接行わない。

------------------------------------------------------------------------

## const

可能なWidgetは

constを使用する。

------------------------------------------------------------------------

## Rebuild

Providerのselect等を使用し、

不要な再Buildを抑える。

------------------------------------------------------------------------

## Platform Widget

安易にPlatform別Widgetを分岐せず、

必要な操作差だけを分離する。

------------------------------------------------------------------------

## Native Feel

Navigation、Date Picker、

Permission等は

Platform慣習を尊重する。

------------------------------------------------------------------------

# Asset Rules

------------------------------------------------------------------------

## Image

-   必要Sizeを使用する
-   高解像度を過剰に含めない
-   Dark Mode対応を確認する
-   Alt・Semanticsを考慮する

------------------------------------------------------------------------

## SVG

複雑なFilter、

Mask、Font依存を避ける。

Flutterで表示確認する。

------------------------------------------------------------------------

## Icon

可能なら

Icon FontまたはSVG Componentへ統一する。

------------------------------------------------------------------------

## Naming


snake_case


用途が分かる名前を付ける。

------------------------------------------------------------------------

# PDF Design Rules

------------------------------------------------------------------------

PDFは

画面UIをそのまま縮小しない。

印刷・共有向けに再構成する。

必須

-   Title
-   Period
-   User入力情報の扱い
-   Record Table
-   Graph
-   Unit
-   Page Number
-   Generated Date
-   AI Label
-   Disclaimer

------------------------------------------------------------------------

# Visual QA

------------------------------------------------------------------------

確認項目

-   Alignment
-   Spacing
-   Typography
-   Color
-   Radius
-   Icon
-   Touch Target
-   State
-   Text Scale
-   Dark Mode
-   Tablet
-   Localization
-   Overflow
-   Keyboard
-   Safe Area

------------------------------------------------------------------------

# Golden Test Rules

------------------------------------------------------------------------

対象

-   Home
-   Input
-   History
-   Graph
-   Settings
-   Dialog
-   Bottom Sheet
-   Record Card
-   Error State
-   Empty State

条件

-   Light
-   Dark
-   Standard Text
-   Large Text
-   Smartphone
-   Tablet

Golden差分は

無確認で更新しない。

------------------------------------------------------------------------

# AI開発エージェント向けルール

------------------------------------------------------------------------

AIがUIを実装する場合

次を行う。


1. Screen仕様を読む

2. DESIGN_RULES.mdを読む

3. Design Systemを読む

4. Figma Componentを確認する

5. 既存Flutter Componentを確認する

6. 新規Componentの必要性を判断する

7. Accessibilityを実装する

8. Widget・Golden Testを追加する


------------------------------------------------------------------------

## AIへの禁止

-   Screenshotだけから固定座標で実装する
-   Color値を直接書く
-   Font Sizeを画面ごとに作る
-   Paddingを任意値で大量追加する
-   共通Buttonを複製する
-   Text Scaleを無視する
-   Error Stateを省略する
-   Dark Modeを省略する
-   Semanticsを省略する
-   Figmaと異なるComponent名を無秩序に作る
-   医療評価を色で勝手に追加する
-   AI結果を通常情報と区別せず表示する

------------------------------------------------------------------------

# デザイン変更手順

------------------------------------------------------------------------


1. 変更理由を明確にする

2. 影響Screenを確認する

3. Design Token影響を確認する

4. Figma Componentを更新する

5. Flutter Componentを更新する

6. Light・Darkを確認する

7. Accessibilityを確認する

8. Golden Testを更新する

9. Documentationを更新する


------------------------------------------------------------------------

# Component追加手順

------------------------------------------------------------------------


1. 既存Componentで代替できないか確認する

2. Roleを定義する

3. Variantを定義する

4. Tokenを定義する

5. Figma Componentを作成する

6. Flutter Widgetを作成する

7. Semanticsを定義する

8. Widget Testを追加する

9. Golden Testを追加する

10. Components.mdを更新する


------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   色の直書き
-   TextStyleの画面内乱造
-   任意Spacingの乱用
-   任意Radiusの乱用
-   任意Animation Durationの乱用
-   固定HeightによるText切れ
-   主要ActionのIcon Only化
-   小さなTouch Target
-   Colorだけの状態表現
-   Error MessageなしのDisabled
-   Loadingなしの非同期処理
-   Empty State省略
-   Dialogの乱用
-   Cardの過剰利用
-   Horizontal Scrollの常用
-   Tabletでの全幅Form
-   Dark Mode未対応
-   Text Scale未対応
-   Screen Reader未対応
-   Reduce Motion未対応
-   医療評価色の独自追加
-   AI生成物の無表示
-   FigmaとFlutterのComponent不一致
-   Golden差分の無確認更新

------------------------------------------------------------------------

# 作業完了チェック

------------------------------------------------------------------------

## Visual

-   Design Systemを使用した
-   Color Tokenを使用した
-   Typography Tokenを使用した
-   Spacing Tokenを使用した
-   Radius Tokenを使用した
-   Componentを再利用した
-   Alignmentが正しい

## State

-   Loadingがある
-   Emptyがある
-   Errorがある
-   Disabledがある
-   Offlineを考慮した
-   Success Feedbackがある

## Responsive

-   Compactで動作する
-   Mediumで動作する
-   Expandedを考慮した
-   Portraitで動作する
-   Landscapeで動作する
-   Safe Areaへ対応した

## Accessibility

-   Semanticsがある
-   Reading Orderが正しい
-   Text Scale 200%で操作できる
-   Touch Targetが十分
-   Contrastが十分
-   Colorだけに依存しない
-   Reduce Motionへ対応した

## Theme・Locale

-   Lightで確認した
-   Darkで確認した
-   High Contrastを確認した
-   日本語で確認した
-   英語で確認した
-   Long Textで確認した

## Quality

-   Widget Testがある
-   Golden Testがある
-   Figmaを更新した
-   Flutterを更新した
-   Documentationを更新した
-   Regressionを確認した

------------------------------------------------------------------------

# Definition of Done

------------------------------------------------------------------------

デザイン実装は

次をすべて満たした場合に完了とする。

□ Screen仕様と一致する

□ Design Systemを使用している

□ FigmaとFlutterが対応している

□ Primary Actionが明確である

□ 情報Hierarchyが明確である

□ Textが読みやすい

□ Touch Targetが十分である

□ Loading・Empty・Errorを扱う

□ Light・Darkへ対応する

□ Text Scale 200%で操作できる

□ Screen Readerで主要操作ができる

□ Colorだけで状態を伝えない

□ Reduce Motionへ対応する

□ Smartphone・Tabletで利用できる

□ Golden Testを通過する

□ Documentationが更新されている

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Foundation

-   Color Tokenを使用できる
-   Typography Tokenを使用できる
-   Spacing Tokenを使用できる
-   Radius Tokenを使用できる
-   Motion Tokenを使用できる

## Layout

-   Safe Areaへ対応できる
-   Scrollへ対応できる
-   Text Scaleで崩れない
-   TabletでWidthを制限できる
-   Landscapeで操作できる

## Component

-   Primary Buttonを統一できる
-   Inputを統一できる
-   Record Cardを統一できる
-   Dialogを統一できる
-   Empty・Errorを統一できる

## Screen

-   Homeの優先順位を維持できる
-   Inputを迷わず操作できる
-   Historyを読みやすくできる
-   Graphを正確に表現できる
-   Settingsを分類できる

## Accessibility

-   Semanticsを設定できる
-   Screen Readerで操作できる
-   Text Scale 200%へ対応できる
-   Touch Targetを確保できる
-   Contrastを確保できる
-   Reduce Motionへ対応できる

## Figma・Flutter

-   Figma VariableをTokenへ対応できる
-   Figma ComponentをWidgetへ対応できる
-   VariantをStateへ対応できる
-   Auto LayoutをFlexへ対応できる
-   Dev Mode情報を実装へ反映できる

## AI

-   AI生成結果を区別できる
-   Disclaimerを表示できる
-   AI Loadingを表示できる
-   AI Errorを表示できる
-   AI Fallbackを表示できる

------------------------------------------------------------------------

## Acceptance Criteria

□ デザインの中心思想を説明できる

□ デザイン原則を適用できる

□ 避ける印象を理解できる

□ Design Tokenを使用できる

□ Semantic Colorを使用できる

□ SYS・DIA・Pulseの色を統一できる

□ 医療評価色を独自追加しない

□ Typography Hierarchyを適用できる

□ 血圧数値を読みやすく表示できる

□ Text Scale 200%へ対応できる

□ Spacing Scaleを使用できる

□ Radius・Elevation・Borderを統一できる

□ Iconを適切に使用できる

□ Touch Targetを確保できる

□ Safe Areaへ対応できる

□ Responsive Layoutを実装できる

□ TabletでReadable Widthを維持できる

□ Orientation変更へ対応できる

□ 共通Componentを再利用できる

□ Button Variantを使い分けられる

□ Input LabelとValidationを実装できる

□ SYS・DIA・Pulseを混同しないUIを作れる

□ Multiple Measurementを分かりやすく表示できる

□ Cardを適切に使用できる

□ Navigationを統一できる

□ DialogとBottom Sheetを使い分けられる

□ Loading・Empty・Errorを実装できる

□ Homeの情報優先順位を維持できる

□ Historyを読みやすく表示できる

□ Graphを正確かつAccessibleに表示できる

□ Statisticsの対象期間と件数を明示できる

□ Reminder Permissionを説明できる

□ Export Previewを提供できる

□ Backup・Restoreの影響を説明できる

□ Settingsをカテゴリ分けできる

□ AI生成結果を視覚的に区別できる

□ Motionを適切に使用できる

□ Screen Readerへ対応できる

□ 色覚差へ配慮できる

□ Dark Modeへ対応できる

□ High Contrastへ対応できる

□ Localizationで崩れない

□ Figma ComponentとFlutter Widgetを対応できる

□ Golden TestでVisual Regressionを検出できる

□ AIが固定座標・直書きでUIを作らない

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

★★★★★（すべてのUI設計・実装で必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
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
-   05_AI/AIWorkflow.md
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/Packages.md
-   07_Test/TestPlan.md
-   08_Release/ReleaseChecklist.md
-   09_AI_Context/AGENTS.md
-   09_AI_Context/PROJECT.md

------------------------------------------------------------------------

## 将来拡張

-   FigmaComponentMap.md
-   DesignTokenMap.md
-   ResponsiveMatrix.md
-   AccessibilityPatterns.md
-   ChartDesignRules.md
-   PDFDesignRules.md
-   IconLibrary.md
-   ContentDesignRules.md
-   LocalizationDesignRules.md
-   DarkModeGuidelines.md
-   HighContrastTheme
-   DynamicColor
-   Material 3 Expressive検証
-   Figma Variables自動同期
-   Flutter Theme Code Generation
-   Visual Regression CI
-   Automated Accessibility Audit
-   Design Lint
-   Component Usage Dashboard
