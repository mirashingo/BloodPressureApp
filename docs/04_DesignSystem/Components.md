# Components.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Components

## ドキュメントID

DS-COMP-001

------------------------------------------------------------------------

## 名称

コンポーネントデザインシステム

------------------------------------------------------------------------

## 目的

BloodPressureApp全体で使用するUIコンポーネントの

役割、構造、状態、サイズ、操作、アクセシビリティ、

Figma実装、Flutter実装を統一し、

画面ごとの見た目と操作方法のばらつきを防ぐこと。

血圧記録アプリとして重要な

入力のしやすさ、数値の読みやすさ、

誤操作防止、継続利用のしやすさを

すべてのコンポーネントで一貫して実現することを

設計目標とする。

------------------------------------------------------------------------

## 適用範囲

-   Home
-   Input
-   History
-   Graph
-   Statistics
-   Reminder
-   Export
-   Backup
-   Settings
-   Onboarding
-   Dialog
-   Bottom Sheet
-   Notification
-   PDF Preview
-   Figma Components
-   Flutter Widgets

------------------------------------------------------------------------

## 基本方針

-   共通UIは再利用可能なコンポーネントとして管理する
-   画面固有の見た目を直接実装しない
-   コンポーネントは役割名で命名する
-   色、文字、余白、角丸をDesign Tokenから参照する
-   状態を明示的に定義する
-   色だけで状態を表現しない
-   最小タップ領域を確保する
-   大きな文字でも操作できる
-   画面読み上げに対応する
-   高齢者や片手操作へ配慮する
-   破壊的操作は通常操作と分離する
-   医療診断を示すUIとして誤認されない
-   FigmaとFlutterで名称と構造を対応させる

------------------------------------------------------------------------

## コンポーネント構造


Components
├─ Navigation
│   ├─ App Bar
│   ├─ Bottom Navigation
│   ├─ Navigation Tile
│   └─ Back Button
│
├─ Actions
│   ├─ Primary Button
│   ├─ Secondary Button
│   ├─ Tertiary Button
│   ├─ Icon Button
│   ├─ Floating Action Button
│   └─ Destructive Button
│
├─ Inputs
│   ├─ Text Field
│   ├─ Numeric Field
│   ├─ Blood Pressure Field
│   ├─ Time Picker Field
│   ├─ Date Picker Field
│   ├─ Switch
│   ├─ Checkbox
│   ├─ Radio
│   ├─ Segmented Control
│   └─ Slider
│
├─ Data Display
│   ├─ Blood Pressure Card
│   ├─ Summary Card
│   ├─ Statistics Card
│   ├─ History Record Card
│   ├─ Empty State
│   ├─ Error State
│   ├─ Loading State
│   └─ Badge
│
├─ Feedback
│   ├─ Dialog
│   ├─ Bottom Sheet
│   ├─ SnackBar
│   ├─ Banner
│   ├─ Progress Indicator
│   └─ Tooltip
│
├─ Filters
│   ├─ Filter Chip
│   ├─ Choice Chip
│   ├─ Date Range Selector
│   ├─ Period Selector
│   └─ Sort Selector
│
└─ Domain Specific
    ├─ SYS/DIA Value Pair
    ├─ Pulse Display
    ├─ Measurement Session Card
    ├─ Graph Legend
    ├─ Reminder Schedule Tile
    ├─ Backup Status Card
    └─ AI Notice Card


------------------------------------------------------------------------

## 命名規則

Figma


Component/Category/Name


例


Component/Button/Primary

Component/Input/BloodPressure

Component/Card/HistoryRecord

Component/Navigation/BottomNavigation


Flutter


AppPrimaryButton

BloodPressureInputField

HistoryRecordCard

AppBottomNavigation


Variant


state=default

state=pressed

state=disabled

state=loading

size=small

size=medium

size=large


------------------------------------------------------------------------

## 共通状態

すべての操作可能コンポーネントは

必要に応じて次の状態を持つ。

-   Default
-   Hover
-   Focus
-   Pressed
-   Selected
-   Disabled
-   Loading
-   Error
-   Success

Hoverは

Web・Desktopで使用する。

Focusは

キーボード、スイッチアクセス、

外部入力デバイスで識別できること。

------------------------------------------------------------------------

## サイズ

基本サイズ

-   Small
-   Medium
-   Large

最小タップ領域

44 × 44dp以上。

推奨

48 × 48dp以上。

高齢者向け

56 × 56dp以上を推奨する。

コンポーネントの視覚サイズが小さい場合も

タップ領域を確保する。

------------------------------------------------------------------------

# Navigation

------------------------------------------------------------------------

## App Bar

### 目的

画面タイトル、戻る操作、補助操作を表示する。

### 構成


AppBar
├─ Leading
├─ Title
└─ Actions


### 表示項目

-   戻るボタン
-   画面タイトル
-   補助アクション
-   保存
-   編集
-   出力

### UI要件

-   高さは56dpを基準とする
-   大きな文字では高さを可変にする
-   タイトルは原則1行、最大2行
-   戻るボタンのタップ領域を48dp以上確保する
-   アクションを3個以上並べない
-   重要度の低い操作はOverflow Menuへ移動する

### Flutter

AppBar。

共通Wrapperとして

AppPageAppBarを使用可能とする。

------------------------------------------------------------------------

## Bottom Navigation

### 目的

主要5画面を切り替える。

### 項目

-   Home
-   History
-   Graph
-   Statistics
-   Settings

### UI要件

-   アイコンとラベルを表示する
-   選択状態を色、太さ、背景で示す
-   色だけで選択状態を表現しない
-   各項目のタップ領域を均等にする
-   FABと重ならない
-   Safe Areaを考慮する

### 状態

-   Default
-   Selected
-   Pressed
-   Disabled

### UX要件

-   タブ切替時に各画面状態を保持する
-   現在タブを再度押した場合は先頭へ戻れる
-   読み上げで「選択中」を伝える

### Flutter

NavigationBar。

GoRouter ShellRouteと連携する。

------------------------------------------------------------------------

## Navigation Tile

### 目的

Settingsなどで詳細画面への移動を示す。

### 構成


NavigationTile
├─ Leading Icon
├─ Title
├─ Subtitle
├─ Current Value
└─ Trailing Arrow


### UI要件

-   行全体をタップ可能にする
-   現在値を表示可能とする
-   矢印のみを操作対象にしない
-   最小高さ56dp
-   説明がある場合は72dp以上を許可する

------------------------------------------------------------------------

# Actions

------------------------------------------------------------------------

## Primary Button

### 目的

画面内で最も重要な操作を実行する。

### 使用例

-   記録を保存する
-   血圧を記録する
-   バックアップを作成する
-   PDFを出力する

### 構成


PrimaryButton
├─ Leading Icon
├─ Label
└─ Loading Indicator


### サイズ

Small

高さ40dp。

Medium

高さ48dp。

Large

高さ56dp。

### UI要件

-   画面内の主要操作は原則1つ
-   ラベルは動詞から始める
-   最小幅は内容に応じる
-   全幅表示を許可する
-   アイコンだけにしない
-   Loading中は重複操作を防止する

### 状態

-   Default
-   Hover
-   Focus
-   Pressed
-   Disabled
-   Loading

### アクセシビリティ

-   操作名を読み上げる
-   Loading中であることを読み上げる
-   Disabled理由を必要に応じて説明する

### Flutter

FilledButton。

AppPrimaryButtonとしてラップする。

------------------------------------------------------------------------

## Secondary Button

### 目的

主要操作を補助する。

### 使用例

-   キャンセル
-   後で設定する
-   履歴を見る
-   期間を変更する

### UI要件

-   Primaryより視覚的優先度を下げる
-   枠線またはTonal Styleを使用する
-   Primaryと並べる場合は順序を統一する
-   破壊的操作には使用しない

### Flutter

OutlinedButtonまたはFilledButton.tonal。

------------------------------------------------------------------------

## Tertiary Button

### 目的

軽い補助操作を提供する。

### 使用例

-   詳細を見る
-   すべて表示
-   編集
-   ヘルプ

### UI要件

-   Text Buttonを基本とする
-   タップ領域は44dp以上
-   リンクと区別できる
-   過度に多用しない

### Flutter

TextButton。

------------------------------------------------------------------------

## Destructive Button

### 目的

削除、置換、初期化などの破壊的操作を実行する。

### 使用例

-   記録を削除する
-   全データを削除する
-   バックアップで置換する
-   設定を初期化する

### UI要件

-   Error Colorを使用する
-   アイコンとラベルを併用する
-   通常操作から余白で分離する
-   実行前に確認を表示する
-   全データ削除は2段階確認とする

### Flutter

AppDestructiveButton。

------------------------------------------------------------------------

## Icon Button

### 目的

編集、共有、閉じるなどの短い操作を提供する。

### UI要件

-   Tooltip必須
-   Semantics Label必須
-   タップ領域48dp以上
-   意味が不明な独自アイコンを使用しない
-   重要な操作をアイコンだけにしない

### Flutter

IconButton。

------------------------------------------------------------------------

## Floating Action Button

### 目的

血圧記録を開始する主要導線を常時提供する。

### ラベル

血圧を記録。

### UI要件

-   Extended FABを推奨する
-   アイコンと文字を表示する
-   Bottom Navigationと重ならない
-   Keyboard表示時に位置を調整する
-   主要操作が別にある画面では非表示を検討する

### Flutter

FloatingActionButton.extended。

------------------------------------------------------------------------

# Inputs

------------------------------------------------------------------------

## Text Field

### 目的

メモ、タグ名、検索語などの文字入力を受け付ける。

### 構成


TextField
├─ Label
├─ Input
├─ Leading Icon
├─ Trailing Action
├─ Helper Text
└─ Error Text


### 状態

-   Empty
-   Focused
-   Filled
-   Disabled
-   Error
-   Read Only

### UI要件

-   ラベルを常に確認可能にする
-   Placeholderだけで項目名を伝えない
-   Error Textを入力欄の近くに表示する
-   文字数制限がある場合は残数を表示する
-   Clear Buttonは入力時のみ表示可能とする

### Flutter

TextFormField。

------------------------------------------------------------------------

## Numeric Field

### 目的

数値入力を受け付ける。

### 使用例

-   SYS
-   DIA
-   Pulse
-   回数
-   時刻

### UI要件

-   数字キーボードを表示する
-   等幅数字を使用する
-   単位を隣接表示する
-   上下ボタンを使用する場合は誤操作を防ぐ
-   0を未入力値として扱わない
-   範囲外値を明確に表示する

### Flutter

TextFormField + TextInputType.number。

------------------------------------------------------------------------

## Blood Pressure Input Field

### 目的

SYS、DIA、Pulseを

大きく分かりやすく入力する。

### 構成


BloodPressureInput
├─ SYS Field
│   ├─ Label
│   ├─ Value
│   └─ Unit
├─ DIA Field
│   ├─ Label
│   ├─ Value
│   └─ Unit
└─ Pulse Field
    ├─ Label
    ├─ Value
    └─ Unit


### UI要件

-   SYSとDIAを明確に分離する
-   日本語ラベルを併記可能とする
-   数値を40sp以上で表示する
-   現在入力中の項目を明確にする
-   次の項目へ移動しやすくする
-   単位を常に表示する
-   文字拡大時は縦配置へ切り替える

### バリデーション

-   必須
-   数値
-   定義範囲
-   SYSとDIAの関係
-   Pulse範囲

### Flutter

BloodPressureInputGroup。

内部に

BloodPressureNumberFieldを使用する。

------------------------------------------------------------------------

## Date Picker Field

### 目的

測定日、出力期間、任意期間を選択する。

### UI要件

-   現在値を表示する
-   カレンダーアイコンを表示する
-   テキスト直接入力に依存しない
-   未来日不可の場合は選択不可にする
-   ロケール形式で表示する

### Flutter

showDatePickerまたは独自Bottom Sheet。

------------------------------------------------------------------------

## Time Picker Field

### 目的

測定時刻、リマインダー時刻を選択する。

### UI要件

-   24時間・12時間表記を端末設定へ対応する
-   現在値を表示する
-   手入力とPickerを選択可能にする
-   読み上げで時刻を明確に伝える

### Flutter

showTimePicker。

------------------------------------------------------------------------

## Switch

### 目的

ON・OFFを即時切り替える。

### 使用例

-   Pulse入力
-   リマインダー
-   自動バックアップ
-   アプリロック
-   AI機能

### UI要件

-   ラベルと説明を併記する
-   行全体をタップ可能にする
-   即時反映する設定に使用する
-   重大な設定変更では確認を表示する
-   ON・OFFを色だけで表現しない

### Flutter

SwitchListTileまたはAppSwitchTile。

------------------------------------------------------------------------

## Checkbox

### 目的

複数選択を受け付ける。

### 使用例

-   出力項目
-   曜日
-   表示系列
-   バックアップ対象

### UI要件

-   ラベルをタップ可能にする
-   複数選択可能であることを明確にする
-   Mixed状態が必要な場合は定義する
-   タップ領域44dp以上

### Flutter

CheckboxListTile。

------------------------------------------------------------------------

## Radio

### 目的

複数候補から1つを選択する。

### 使用例

-   集約方法
-   テーマ
-   復元方式
-   出力形式

### UI要件

-   同一グループ内で1つだけ選択できる
-   選択中の説明を表示可能とする
-   行全体をタップ可能にする

### Flutter

RadioListTile。

------------------------------------------------------------------------

## Segmented Control

### 目的

少数の選択肢を素早く切り替える。

### 使用例

-   日・週・月・年
-   朝・昼・夜
-   PDF・CSV

### UI要件

-   2〜5項目を推奨する
-   ラベル長を揃える
-   選択状態を背景、枠、文字で示す
-   横幅不足時はスクロールまたは別UIへ切り替える

### Flutter

SegmentedButton。

------------------------------------------------------------------------

# Data Display

------------------------------------------------------------------------

## Blood Pressure Value Pair

### 目的

SYSとDIAを誤読しにくく表示する。

### 表示形式

横型


128 / 78 mmHg


縦型


SYS 128
DIA  78


### UI要件

-   SYS・DIAラベルを表示可能にする
-   数値は等幅数字
-   数値と単位を分離しすぎない
-   色だけで区別しない
-   高齢者向けでは縦型を優先する

### Flutter

BloodPressureValuePair。

------------------------------------------------------------------------

## Pulse Display

### 目的

Pulseを値・単位・ラベルとともに表示する。

### 表示例


Pulse 64 bpm


### UI要件

-   未入力を0と表示しない
-   未入力は「記録なし」とする
-   血圧値より視覚優先度を下げる
-   必要に応じてアイコンを併用する

### Flutter

PulseValueDisplay。

------------------------------------------------------------------------

## Blood Pressure Card

### 目的

HomeやRecord Detailで

最新または主要な血圧情報を表示する。

### 構成


BloodPressureCard
├─ Header
│   ├─ Title
│   └─ Date Time
├─ Value Pair
├─ Pulse
├─ Time Period
├─ Measurement Count
└─ Actions


### Variant

-   Latest
-   Summary
-   Compact
-   Detailed

### UI要件

-   血圧値を最も大きく表示する
-   測定日時を明確にする
-   複数回測定数を表示可能にする
-   カード全体のタップ動作を明確にする
-   編集・詳細操作を重複させない

### Flutter

BloodPressureCard。

------------------------------------------------------------------------

## History Record Card

### 目的

履歴一覧で1記録を表示する。

### 構成


HistoryRecordCard
├─ Time
├─ SYS/DIA
├─ Pulse
├─ Time Period
├─ Tags
├─ Memo Preview
└─ More Action


### UI要件

-   日付グループ内で比較しやすくする
-   数字を揃える
-   Memoは最大2行
-   削除を直接実行しない
-   タップでRecord Detailへ移動する

### Flutter

HistoryRecordCard。

------------------------------------------------------------------------

## Summary Card

### 目的

平均値、回数、期間などを要約表示する。

### 構成


SummaryCard
├─ Label
├─ Value
├─ Unit
├─ Supporting Text
└─ Trend Indicator


### UI要件

-   Valueを優先表示する
-   Trendは診断と誤認されない表現にする
-   色だけで増減を示さない
-   比較期間を明示する

### Flutter

SummaryMetricCard。

------------------------------------------------------------------------

## Statistics Card

### 目的

統計情報をカード単位で表示する。

### 使用例

-   平均SYS
-   平均DIA
-   平均Pulse
-   測定回数
-   測定日数
-   朝夜差

### UI要件

-   数値、単位、期間を明示する
-   グラフへ遷移可能な場合は導線を表示する
-   医療評価を断定しない
-   大きな文字でも複数列を維持できない場合は1列にする

------------------------------------------------------------------------

## Measurement Session Card

### 目的

複数回測定した1セッションを表示する。

### 構成


MeasurementSessionCard
├─ Representative Value
├─ Aggregation Method
├─ Measurement Count
├─ Individual Measurements
└─ Edit Representative Action


### UI要件

-   代表値と個別値を混同させない
-   集約方法を表示する
-   展開・折りたたみに対応する
-   個別値の順序を明確にする

------------------------------------------------------------------------

## Badge

### 目的

短い状態や件数を表示する。

### 使用例

-   朝
-   夜
-   3回測定
-   未同期
-   新規

### UI要件

-   1〜2語
-   色と文字を併用する
-   長文を入れない
-   重要情報をBadgeだけで伝えない

### Flutter

AppBadge。

------------------------------------------------------------------------

## Empty State

### 目的

データがない状態で

次の操作を案内する。

### 構成


EmptyState
├─ Illustration or Icon
├─ Title
├─ Description
├─ Primary Action
└─ Secondary Action


### 使用例

-   記録なし
-   検索結果なし
-   リマインダーなし
-   バックアップなし

### UI要件

-   否定的すぎる表現を避ける
-   次の操作を1つ以上提供する
-   イラストだけで意味を伝えない
-   画面中央または文脈位置へ配置する

### Flutter

AppEmptyState。

------------------------------------------------------------------------

## Error State

### 目的

読み込みや保存に失敗した状態を表示する。

### 構成


ErrorState
├─ Icon
├─ Title
├─ Description
├─ Retry
└─ Alternative Action


### UI要件

-   原因を簡潔に示す
-   再試行を提供する
-   技術的例外を表示しない
-   Error Colorだけで表現しない

### Flutter

AppErrorState。

------------------------------------------------------------------------

## Loading State

### 目的

処理中であることを表示する。

### Variant

-   Full Screen
-   Inline
-   Button
-   Skeleton
-   Refresh

### UI要件

-   短時間処理では過剰表示しない
-   画面全体を不用意にブロックしない
-   保存中は重複操作を防ぐ
-   読み上げで処理中を伝える

### Flutter

CircularProgressIndicator、

LinearProgressIndicator、

Skeleton Widget。

------------------------------------------------------------------------

# Feedback

------------------------------------------------------------------------

## Dialog

### 目的

確認、警告、重要な選択を表示する。

### 構成


Dialog
├─ Icon
├─ Title
├─ Body
├─ Optional Content
└─ Actions


### Variant

-   Confirmation
-   Warning
-   Error
-   Destructive
-   Information

### UI要件

-   タイトルを明確にする
-   本文を簡潔にする
-   Primary Actionを1つにする
-   キャンセル方法を提供する
-   画面外タップで閉じてよいかを状態ごとに定義する
-   Destructiveは誤タップしにくくする

### Flutter

AlertDialogまたはAppDialog。

------------------------------------------------------------------------

## Bottom Sheet

### 目的

現在画面を保ちながら

選択・設定・詳細操作を提供する。

### 使用例

-   フィルター
-   日付範囲
-   集約方法
-   データ点詳細
-   記録アクション

### UI要件

-   Drag Handleを表示する
-   タイトルを表示する
-   Safe Areaを考慮する
-   Keyboard表示時に追従する
-   長い内容はスクロール可能にする
-   大きな文字でも操作可能にする

### Flutter

showModalBottomSheet。

------------------------------------------------------------------------

## SnackBar

### 目的

短時間の結果通知を表示する。

### 使用例

-   保存しました
-   削除しました
-   コピーしました
-   再試行してください

### UI要件

-   1〜2行
-   長時間必要な情報に使用しない
-   Undoを必要に応じて提供する
-   画面読み上げへ通知する
-   Bottom NavigationやFABと重ならない

### Flutter

SnackBar。

------------------------------------------------------------------------

## Banner

### 目的

画面内で継続的に注意や状態を表示する。

### 使用例

-   通知権限なし
-   バックアップ未設定
-   AI機能説明
-   オフライン

### UI要件

-   タイトル、説明、操作を表示可能にする
-   閉じられるかを明示する
-   重要度に応じて色とアイコンを変更する
-   画面上部の重要情報を隠さない

### Flutter

MaterialBannerまたはAppNoticeBanner。

------------------------------------------------------------------------

## Tooltip

### 目的

アイコンやグラフ要素の補足を表示する。

### UI要件

-   短い説明
-   Hover・Long Press・Focusで表示する
-   重要操作の唯一の説明にしない
-   文字拡大に対応する

------------------------------------------------------------------------

# Filters

------------------------------------------------------------------------

## Filter Chip

### 目的

複数条件のON・OFFを切り替える。

### 使用例

-   朝
-   昼
-   夜
-   Pulseあり
-   メモあり

### UI要件

-   選択状態を背景、チェック、文字で示す
-   横スクロール可能にする
-   解除方法を明確にする
-   選択数を必要に応じて表示する

### Flutter

FilterChip。

------------------------------------------------------------------------

## Choice Chip

### 目的

少数候補から1つを選択する。

### 使用例

-   平均
-   最終
-   最低
-   任意

### Flutter

ChoiceChip。

------------------------------------------------------------------------

## Period Selector

### 目的

Graph・Statisticsの期間を切り替える。

### 項目

-   日
-   週
-   月
-   年
-   任意

### UI要件

-   選択中期間を明確にする
-   任意期間は別のDate Range UIを開く
-   横幅不足時はスクロール可能にする
-   期間変更後に対象期間を表示する

### Flutter

GraphPeriodSelector。

------------------------------------------------------------------------

## Date Range Selector

### 目的

開始日と終了日を選択する。

### 構成


DateRangeSelector
├─ Start Date
├─ Separator
├─ End Date
├─ Presets
└─ Apply Action


### バリデーション

-   開始日必須
-   終了日必須
-   開始日 <= 終了日
-   未来日のみ不可
-   最大期間制限がある場合は明示する

------------------------------------------------------------------------

## Sort Selector

### 目的

履歴の並び順を変更する。

### 選択肢

-   新しい順
-   古い順
-   SYS高い順
-   SYS低い順

MVPでは

新しい順を初期値とする。

------------------------------------------------------------------------

# Domain Specific

------------------------------------------------------------------------

## Graph Legend

### 目的

SYS、DIA、Pulseの系列を識別する。

### 構成


GraphLegend
├─ Line Sample
├─ Marker
├─ Label
└─ Visibility Toggle


### UI要件

-   色と線種を併用する
-   ラベルを省略しない
-   表示・非表示を切り替え可能にする
-   最低1系列を表示する
-   画面読み上げで状態を伝える

------------------------------------------------------------------------

## Graph Data Point Tooltip

### 目的

選択したデータ点の詳細を表示する。

### 表示項目

-   日時
-   SYS
-   DIA
-   Pulse
-   時間帯
-   測定回数
-   集約方法

### UI要件

-   グラフを過度に隠さない
-   画面端で位置を調整する
-   詳細画面への導線を表示可能にする
-   キーボード操作でも選択可能にする

------------------------------------------------------------------------

## Reminder Schedule Tile

### 目的

1件のリマインダー設定を表示する。

### 構成


ReminderScheduleTile
├─ Time
├─ Days
├─ Label
├─ Enabled Switch
└─ More Action


### UI要件

-   時刻を大きく表示する
-   曜日を省略しすぎない
-   ON・OFFを明確にする
-   行全体で編集可能にする
-   削除はMore Actionから実行する

------------------------------------------------------------------------

## Backup Status Card

### 目的

バックアップ状態を確認する。

### 表示項目

-   最終バックアップ日時
-   状態
-   保存先
-   自動バックアップ
-   実行ボタン

### 状態

-   Never
-   Success
-   In Progress
-   Failed
-   Permission Required

### UI要件

-   状態を文字とアイコンで表示する
-   失敗時に再試行を提供する
-   最終成功日時を明示する
-   「バックアップ済み」を過度に保証表現しない

------------------------------------------------------------------------

## AI Notice Card

### 目的

AI機能の利用条件と注意を表示する。

### 表示項目

-   AI機能であること
-   医療診断ではないこと
-   使用データ
-   外部送信の有無
-   同意・無効化導線

### UI要件

-   閉じるだけで同意扱いにしない
-   説明を確認できる
-   AIなしでも主要機能を利用可能であることを示す
-   警告色を過度に使用しない

------------------------------------------------------------------------

## Component Composition

複雑な画面は

小さいコンポーネントを組み合わせて構成する。

例


HomeLatestRecordSection
├─ SectionHeader
├─ BloodPressureCard
│   ├─ BloodPressureValuePair
│   ├─ PulseValueDisplay
│   └─ AppBadge
└─ TertiaryButton



BloodPressureInputSection
├─ SectionHeader
├─ BloodPressureInputGroup
│   ├─ BloodPressureNumberField
│   ├─ BloodPressureNumberField
│   └─ BloodPressureNumberField
├─ MeasurementTimeSelector
└─ AppPrimaryButton


------------------------------------------------------------------------

## コンポーネント依存ルール

-   Atomic Componentは画面仕様へ依存しない
-   Domain ComponentはFeatureに依存してよい
-   Domain ComponentからRepositoryを直接呼ばない
-   状態は外部から受け取る
-   コールバックで操作を通知する
-   画面遷移はScreenまたはControllerが管理する
-   Theme・LocalizationをContextから取得する
-   ビジネスロジックをWidgetへ埋め込まない

------------------------------------------------------------------------

## Figma実装

Component Setを使用する。

Variant Property例


State
    Default
    Hover
    Focus
    Pressed
    Disabled
    Loading
    Error
    Success

Size
    Small
    Medium
    Large

Style
    Primary
    Secondary
    Tertiary
    Destructive

Icon
    None
    Leading
    Trailing
    Both


Boolean Property例

-   Show Icon
-   Show Subtitle
-   Show Badge
-   Show Divider
-   Full Width

Text Property例

-   Label
-   Title
-   Subtitle
-   Value
-   Unit

すべてのComponentは

Colors、Typography、Spacing、Radiusの

Tokenを参照する。

------------------------------------------------------------------------

## Figma命名例


Component/Button/Primary

Component/Button/Secondary

Component/Button/Destructive

Component/Input/TextField

Component/Input/NumericField

Component/Input/BloodPressureField

Component/Card/BloodPressure

Component/Card/HistoryRecord

Component/Card/Summary

Component/Feedback/EmptyState

Component/Feedback/ErrorState

Component/Navigation/BottomNavigation

Component/Filter/PeriodSelector


------------------------------------------------------------------------

## Flutter実装

ディレクトリ例


lib/
├─ core/
│  └─ widgets/
│     ├─ buttons/
│     ├─ inputs/
│     ├─ navigation/
│     ├─ feedback/
│     ├─ cards/
│     └─ filters/
│
└─ features/
   ├─ recording/
   │  └─ presentation/widgets/
   ├─ history/
   │  └─ presentation/widgets/
   ├─ graph/
   │  └─ presentation/widgets/
   └─ settings/
      └─ presentation/widgets/


Core Widget例

-   AppPrimaryButton
-   AppSecondaryButton
-   AppDestructiveButton
-   AppTextField
-   AppNumericField
-   AppEmptyState
-   AppErrorState
-   AppLoadingIndicator
-   AppDialog
-   AppBottomSheet
-   AppBadge
-   AppNoticeBanner

Domain Widget例

-   BloodPressureInputGroup
-   BloodPressureValuePair
-   BloodPressureCard
-   HistoryRecordCard
-   GraphLegend
-   ReminderScheduleTile
-   BackupStatusCard
-   AiNoticeCard

------------------------------------------------------------------------

## Flutter API設計例

dart
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.semanticLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Icon(icon),
      label: Text(label),
    );

    return Semantics(
      label: semanticLabel ?? label,
      button: true,
      enabled: onPressed != null && !isLoading,
      child: isFullWidth
          ? SizedBox(
              width: double.infinity,
              child: button,
            )
          : button,
    );
  }
}


------------------------------------------------------------------------

## 状態管理

表示コンポーネントは

可能な限りStatelessとする。

状態の管理先

-   Riverpod Provider
-   Screen Controller
-   Form State
-   Local UI State

コンポーネント内部で保持してよい状態

-   Hover
-   Focus
-   Expand・Collapse
-   Animation
-   一時的な入力表示

ビジネス状態は

コンポーネント内部で保持しない。

------------------------------------------------------------------------

## アニメーション

使用例

-   Press
-   Expand
-   Tab Change
-   Loading
-   Success Feedback
-   Bottom Sheet

基本時間


Fast       100〜150ms

Standard   200〜250ms

Slow       300〜400ms


原則

-   操作結果を理解しやすくするために使用する
-   装飾目的で多用しない
-   reduceMotion設定に対応する
-   点滅を使用しない
-   数値変化を過度に動かさない

------------------------------------------------------------------------

## アクセシビリティ

すべての操作コンポーネントは

-   Semantics Labelを持つ
-   Roleを正しく設定する
-   状態を読み上げる
-   タップ領域44dp以上
-   Keyboard Focusを持つ
-   Focus Indicatorを表示する
-   色だけで状態を示さない
-   大きな文字に対応する
-   読み上げ順序を視覚順序と一致させる

数値コンポーネントは

数値と単位をまとめて読み上げる。

例


収縮期血圧 128 ミリメートル水銀柱


------------------------------------------------------------------------

## レスポンシブ対応

Small Phone

-   1列
-   Buttonは全幅を優先
-   SYS・DIAは縦配置可能
-   Chipは横スクロール
-   Dialogは画面幅に合わせる

Large Phone

-   2列カードを許可
-   FAB Extendedを使用可能

Tablet

-   NavigationRailを将来検討
-   Card最大幅を設定
-   画面中央へコンテンツを制限
-   Dialog幅を制限

大きな文字

-   高さ固定を避ける
-   横並びを縦並びへ切り替える
-   Labelの省略を避ける
-   Bottom Navigationの高さを可変にする

------------------------------------------------------------------------

## エラー防止

-   Loading中に同一操作を再実行させない
-   破壊的操作は確認する
-   Undo可能な削除ではSnackBarを提供する
-   入力エラーを保存時だけでなく入力後にも示す
-   無効操作の理由を説明する
-   戻る操作で未保存データを確認する
-   重要なToggle変更では説明を表示する

------------------------------------------------------------------------

## 禁止事項

-   Screen内で独自Buttonを直接作る
-   同じ役割のComponentを複数作る
-   固定HEX値をComponentへ記述する
-   固定fontSizeをComponentへ記述する
-   タップ領域が44dp未満
-   アイコンだけで重要操作を示す
-   色だけで選択・エラーを示す
-   Placeholderだけで入力項目名を示す
-   Dialog内に多数の操作を並べる
-   Loading中に重複送信を許可する
-   破壊的操作をPrimary Colorで表示する
-   Domain WidgetからRepositoryを直接呼ぶ
-   画面遷移を低レベルComponentへ埋め込む

------------------------------------------------------------------------

## テスト項目

Button

-   Default表示
-   Pressed表示
-   Disabled表示
-   Loading表示
-   Full Width表示
-   アイコンあり・なし
-   大きな文字
-   画面読み上げ
-   Keyboard操作

Input

-   Empty
-   Focused
-   Filled
-   Error
-   Disabled
-   Read Only
-   Keyboard種別
-   バリデーション表示
-   文字拡大

Navigation

-   App Bar戻る操作
-   Bottom Navigation切替
-   選択状態
-   タブ状態保持
-   画面読み上げ
-   Safe Area

Card

-   データあり
-   データ欠損
-   長いメモ
-   大きな数値
-   大きな文字
-   Dark Theme
-   High Contrast

Feedback

-   Empty State
-   Error State
-   Loading State
-   Dialog
-   Bottom Sheet
-   SnackBar
-   Banner

Domain

-   SYS・DIA表示
-   Pulse欠損
-   複数回測定
-   Graph Legend
-   Reminder ON・OFF
-   Backup失敗
-   AI同意前・後

アクセシビリティ

-   44dp以上のタップ領域
-   色だけに依存しない
-   Focus Indicator
-   TalkBack
-   VoiceOver
-   Text Scale 2.0
-   Switch Access
-   Keyboard Navigation

実装

-   FigmaとFlutterの名称が一致する
-   Design Tokenを参照する
-   Widget内に固定色がない
-   Widget内に任意の文字サイズがない
-   Widget Testを作成できる
-   Golden Testを作成できる
-   Semantics Testを作成できる

------------------------------------------------------------------------

## Acceptance Criteria

□ 共通コンポーネントをカテゴリ別に定義できる

□ Navigation Componentを定義できる

□ Button Componentを定義できる

□ Input Componentを定義できる

□ Card Componentを定義できる

□ Feedback Componentを定義できる

□ Filter Componentを定義できる

□ 血圧専用Componentを定義できる

□ Default、Pressed、Disabled、Loading状態を定義できる

□ Error、Success状態を定義できる

□ Small、Medium、Largeサイズを定義できる

□ 最小タップ領域44dpを確保できる

□ 色だけに依存せず状態を識別できる

□ 大きな文字でも操作できる

□ 画面読み上げで操作名と状態を確認できる

□ Keyboard操作に対応できる

□ Figma Component Setとして管理できる

□ Figma Variantを定義できる

□ Flutter Widgetとして再利用できる

□ Core WidgetとDomain Widgetを分離できる

□ Design Tokenを参照できる

□ ビジネスロジックをWidgetから分離できる

□ 破壊的操作を通常操作と分離できる

□ Loading中の重複操作を防止できる

□ Widget Testを実施できる

□ Golden Testを実施できる

□ Semantics Testを実施できる

□ 医療診断と誤認されるComponent表現を使用しない

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

------------------------------------------------------------------------

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

## 関連ドキュメント

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
-   04_DesignSystem/Spacing.md
-   06_Flutter/

------------------------------------------------------------------------

## 将来拡張

-   NavigationRail
-   Desktop Navigation
-   Wear OS Components
-   Apple Watch Components
-   Health Connect Connection Card
-   Bluetooth Device Card
-   Family Profile Switcher
-   Doctor Share Card
-   Advanced Chart Controls
-   Voice Input Component
-   Camera OCR Input Component
-   AI Summary Component
-   Adaptive Layout Components
-   Web Responsive Components
-   Component Catalog App
-   Storybook相当のWidget Gallery
