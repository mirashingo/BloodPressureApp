# ScreenList.md

# BloodPressureApp 画面一覧

Version: 1.0

------------------------------------------------------------------------

# 目的

BloodPressureAppで使用するすべての画面を一覧化し、

画面ID、画面名、目的、主要要素、

遷移元、遷移先、関連機能、優先度を定義する。

本書は、

-   UX設計
-   画面設計
-   Figma作成
-   Flutter実装
-   AIによるコード生成
-   テスト設計
-   画面進捗管理

の共通基準として使用する。

------------------------------------------------------------------------

# 画面管理方針

-   すべての画面に一意の画面IDを付与する
-   1画面1ファイルを基本とする
-   画面名はFlutterのScreen名と対応させる
-   主要画面と詳細画面を区別する
-   モーダルとダイアログも管理対象とする
-   MVP対象と将来拡張を明確にする
-   画面追加時は本書を先に更新する

------------------------------------------------------------------------

# 画面ID命名規則

画面IDは次の形式とする。


SC + 3桁の連番


例


SC001
SC002
SC003


ダイアログは次の形式とする。


DG + 3桁の連番


例


DG001
DG002


ボトムシートは次の形式とする。


BS + 3桁の連番


例


BS001
BS002


------------------------------------------------------------------------

# 画面カテゴリ

## 起動・初期設定

-   Splash
-   Onboarding
-   Initial Settings

## 主要画面

-   Home
-   History
-   Graph
-   Statistics
-   Settings

## 血圧記録

-   Blood Pressure Input
-   Multiple Measurement
-   Record Confirmation
-   Record Detail
-   Record Edit

## 通知

-   Reminder Settings
-   Reminder Edit

## データ管理

-   Export Settings
-   PDF Preview
-   Backup Settings
-   Restore Preview

## 詳細設定

-   Display Settings
-   Recording Settings
-   Privacy Settings
-   About

------------------------------------------------------------------------

# 画面一覧サマリー

| 画面ID | 画面名 | Flutter名 | 階層 | MVP |
|---|---|---|---|---|
| SC001 | スプラッシュ | SplashScreen | 起動 | 必須 |
| SC002 | オンボーディング | OnboardingScreen | 起動 | 必須 |
| SC003 | 初期設定 | InitialSettingsScreen | 起動 | 必須 |
| SC010 | ホーム | HomeScreen | 第1階層 | 必須 |
| SC011 | 履歴 | HistoryScreen | 第1階層 | 必須 |
| SC012 | グラフ | GraphScreen | 第1階層 | 必須 |
| SC013 | 統計 | StatisticsScreen | 第1階層 | 必須 |
| SC014 | 設定 | SettingsScreen | 第1階層 | 必須 |
| SC020 | 血圧入力 | BloodPressureInputScreen | 第2階層 | 必須 |
| SC021 | 複数回測定 | MultipleMeasurementScreen | 第2階層 | 必須 |
| SC022 | 記録確認 | RecordConfirmationScreen | 第3階層 | 必須 |
| SC023 | 記録詳細 | RecordDetailScreen | 第2階層 | 必須 |
| SC024 | 記録編集 | RecordEditScreen | 第3階層 | 必須 |
| SC030 | リマインダー設定 | ReminderSettingsScreen | 第2階層 | 必須 |
| SC031 | リマインダー編集 | ReminderEditScreen | 第3階層 | 必須 |
| SC040 | データ出力 | ExportSettingsScreen | 第2階層 | 必須 |
| SC041 | PDFプレビュー | PdfPreviewScreen | 第3階層 | 必須 |
| SC050 | バックアップ | BackupSettingsScreen | 第2階層 | 重要 |
| SC051 | 復元プレビュー | RestorePreviewScreen | 第3階層 | 重要 |
| SC060 | 表示設定 | DisplaySettingsScreen | 第2階層 | 必須 |
| SC061 | 記録設定 | RecordingSettingsScreen | 第2階層 | 必須 |
| SC062 | プライバシー設定 | PrivacySettingsScreen | 第2階層 | 必須 |
| SC063 | アプリ情報 | AboutScreen | 第2階層 | 必須 |

------------------------------------------------------------------------

# SC001 スプラッシュ

## 画面ID

SC001

## 画面名

スプラッシュ

## Flutter名

SplashScreen

## 目的

アプリ起動時に必要な初期処理を行い、

初回起動、認証状態、データ状態を確認して

適切な画面へ遷移する。

## 主要要素

-   アプリアイコン
-   アプリ名
-   読み込み表示

## 遷移元

-   アプリ起動
-   Deep Link
-   通知タップ

## 遷移先

-   SC002 Onboarding
-   SC010 Home
-   生体認証ダイアログ

## 関連機能

-   F009 Settings
-   F008 Backup

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC002 オンボーディング

## 画面ID

SC002

## 画面名

オンボーディング

## Flutter名

OnboardingScreen

## 目的

アプリの目的、基本操作、医療上の注意を

初回利用者へ分かりやすく説明する。

## 主要要素

-   アプリの目的
-   血圧記録の説明
-   グラフ・統計の説明
-   医療診断ではないことの注意
-   次へボタン
-   スキップボタン

## 遷移元

-   SC001 Splash

## 遷移先

-   SC003 Initial Settings
-   SC010 Home

## 関連機能

-   F001 Blood Pressure Recording
-   F002 Home
-   F009 Settings

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC003 初期設定

## 画面ID

SC003

## 画面名

初期設定

## Flutter名

InitialSettingsScreen

## 目的

文字サイズ、通知、時間帯区分などの

基本設定を初回起動時に行う。

## 主要要素

-   文字サイズ
-   ボタンサイズ
-   脈拍入力
-   朝・昼・夜の判定時刻
-   通知設定
-   完了ボタン

## 遷移元

-   SC002 Onboarding

## 遷移先

-   SC010 Home
-   通知権限ダイアログ

## 関連機能

-   F006 Reminder
-   F009 Settings
-   F011 Time Period Classification

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC010 ホーム

## 画面ID

SC010

## 画面名

ホーム

## Flutter名

HomeScreen

## 目的

最新の血圧状態と記録状況を確認し、

血圧記録や主要機能へ素早く移動する。

## 主要要素

-   血圧を記録するボタン
-   最新記録
-   今日の測定状況
-   簡易グラフ
-   平均値
-   次回リマインダー
-   下部ナビゲーション

## 遷移元

-   SC001 Splash
-   SC002 Onboarding
-   SC003 Initial Settings
-   保存完了
-   下部ナビゲーション

## 遷移先

-   SC020 Blood Pressure Input
-   SC011 History
-   SC012 Graph
-   SC013 Statistics
-   SC030 Reminder Settings
-   SC014 Settings

## 関連機能

-   F001 Blood Pressure Recording
-   F002 Home Dashboard
-   F004 Graph
-   F005 Statistics
-   F006 Reminder

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC011 履歴

## 画面ID

SC011

## 画面名

履歴

## Flutter名

HistoryScreen

## 目的

過去の血圧記録を一覧表示し、

期間や時間帯で検索・絞り込みできるようにする。

## 主要要素

-   記録一覧
-   日付
-   SYS
-   DIA
-   Pulse
-   朝・昼・夜区分
-   期間選択
-   フィルター
-   空状態
-   下部ナビゲーション

## 遷移元

-   SC010 Home
-   下部ナビゲーション
-   SC023 Record Detail

## 遷移先

-   SC023 Record Detail
-   SC020 Blood Pressure Input
-   SC040 Export Settings

## 関連機能

-   F001 Blood Pressure Recording
-   F003 History
-   F007 Export
-   F011 Time Period Classification

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC012 グラフ

## 画面ID

SC012

## 画面名

グラフ

## Flutter名

GraphScreen

## 目的

SYS、DIA、Pulseの推移を

期間別に視覚的に確認できるようにする。

## 主要要素

-   折れ線グラフ
-   SYS系列
-   DIA系列
-   Pulse系列
-   期間切替
-   任意期間
-   データ点詳細
-   凡例
-   空状態
-   下部ナビゲーション

## 遷移元

-   SC010 Home
-   SC011 History
-   SC013 Statistics
-   下部ナビゲーション

## 遷移先

-   SC023 Record Detail
-   SC020 Blood Pressure Input
-   SC040 Export Settings

## 関連機能

-   F001 Blood Pressure Recording
-   F004 Graph
-   F007 Export
-   F011 Time Period Classification
-   F107 Multiple Measurement Aggregation

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC013 統計

## 画面ID

SC013

## 画面名

統計

## Flutter名

StatisticsScreen

## 目的

指定期間の血圧記録を集計し、

平均値、最大値、最小値、測定回数などを確認する。

## 主要要素

-   SYS平均
-   DIA平均
-   Pulse平均
-   測定回数
-   測定日数
-   最大値
-   最小値
-   前期間比較
-   期間切替
-   空状態
-   下部ナビゲーション

## 遷移元

-   SC010 Home
-   SC012 Graph
-   下部ナビゲーション

## 遷移先

-   SC012 Graph
-   SC040 Export Settings
-   SC020 Blood Pressure Input

## 関連機能

-   F001 Blood Pressure Recording
-   F005 Statistics
-   F007 Export
-   F011 Time Period Classification
-   F107 Multiple Measurement Aggregation

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC014 設定

## 画面ID

SC014

## 画面名

設定

## Flutter名

SettingsScreen

## 目的

表示、記録、通知、データ管理、

プライバシーなどの設定入口を提供する。

## 主要要素

-   表示設定
-   記録設定
-   リマインダー
-   データ出力
-   バックアップ
-   プライバシー
-   アプリ情報
-   下部ナビゲーション

## 遷移元

-   SC010 Home
-   下部ナビゲーション
-   各設定詳細画面

## 遷移先

-   SC060 Display Settings
-   SC061 Recording Settings
-   SC030 Reminder Settings
-   SC040 Export Settings
-   SC050 Backup Settings
-   SC062 Privacy Settings
-   SC063 About

## 関連機能

-   F006 Reminder
-   F007 Export
-   F008 Backup
-   F009 Settings

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC020 血圧入力

## 画面ID

SC020

## 画面名

血圧入力

## Flutter名

BloodPressureInputScreen

## 目的

SYS、DIA、Pulse、測定日時、

メモ、タグなどを入力して保存する。

## 主要要素

-   測定日時
-   SYS入力
-   DIA入力
-   Pulse入力
-   朝・昼・夜区分
-   メモ
-   タグ
-   続けて測定
-   保存ボタン

## 遷移元

-   SC010 Home
-   SC011 History
-   SC012 Graph
-   SC013 Statistics
-   通知タップ
-   SC023 Record Detail

## 遷移先

-   SC021 Multiple Measurement
-   SC022 Record Confirmation
-   SC010 Home
-   SC023 Record Detail

## 関連機能

-   F001 Blood Pressure Recording
-   F011 Time Period Classification
-   F107 Multiple Measurement Aggregation

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC021 複数回測定

## 画面ID

SC021

## 画面名

複数回測定

## Flutter名

MultipleMeasurementScreen

## 目的

同じ測定機会で行った複数回の血圧測定を

連続して入力し、集約方法を選択する。

## 主要要素

-   測定回数
-   各測定値
-   次の測定を追加
-   測定値の削除
-   集約方法
-   採用値
-   確認ボタン

## 遷移元

-   SC020 Blood Pressure Input

## 遷移先

-   SC020 Blood Pressure Input
-   SC022 Record Confirmation

## 関連機能

-   F001 Blood Pressure Recording
-   F107 Multiple Measurement Aggregation

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC022 記録確認

## 画面ID

SC022

## 画面名

記録確認

## Flutter名

RecordConfirmationScreen

## 目的

保存前に入力内容と集約結果を確認し、

誤入力を防止する。

## 主要要素

-   測定日時
-   SYS
-   DIA
-   Pulse
-   メモ
-   タグ
-   集約方法
-   修正ボタン
-   保存ボタン

## 遷移元

-   SC020 Blood Pressure Input
-   SC021 Multiple Measurement

## 遷移先

-   SC020 Blood Pressure Input
-   SC010 Home
-   SC023 Record Detail

## 関連機能

-   F001 Blood Pressure Recording
-   F107 Multiple Measurement Aggregation

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC023 記録詳細

## 画面ID

SC023

## 画面名

記録詳細

## Flutter名

RecordDetailScreen

## 目的

選択した血圧記録の詳細を確認し、

編集・削除・共有へ進めるようにする。

## 主要要素

-   測定日時
-   SYS
-   DIA
-   Pulse
-   朝・昼・夜区分
-   メモ
-   タグ
-   編集ボタン
-   削除ボタン

## 遷移元

-   SC011 History
-   SC012 Graph
-   Deep Link

## 遷移先

-   SC024 Record Edit
-   SC011 History
-   削除確認ダイアログ

## 関連機能

-   F001 Blood Pressure Recording
-   F003 History
-   F011 Time Period Classification

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC024 記録編集

## 画面ID

SC024

## 画面名

記録編集

## Flutter名

RecordEditScreen

## 目的

保存済みの血圧記録を修正し、

変更内容を安全に保存する。

## 主要要素

-   SC020と同じ入力項目
-   更新ボタン
-   変更破棄
-   未保存確認

## 遷移元

-   SC023 Record Detail

## 遷移先

-   SC023 Record Detail
-   未保存確認ダイアログ

## 関連機能

-   F001 Blood Pressure Recording
-   F003 History

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC030 リマインダー設定

## 画面ID

SC030

## 画面名

リマインダー設定

## Flutter名

ReminderSettingsScreen

## 目的

測定リマインダーの一覧を確認し、

追加・編集・有効無効を管理する。

## 主要要素

-   リマインダー一覧
-   時刻
-   曜日
-   朝・昼・夜区分
-   有効スイッチ
-   追加ボタン
-   通知権限状態

## 遷移元

-   SC010 Home
-   SC014 Settings
-   Deep Link

## 遷移先

-   SC031 Reminder Edit
-   通知権限ダイアログ
-   SC014 Settings

## 関連機能

-   F006 Reminder
-   F009 Settings
-   F011 Time Period Classification

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC031 リマインダー編集

## 画面ID

SC031

## 画面名

リマインダー編集

## Flutter名

ReminderEditScreen

## 目的

通知時刻、曜日、区分、有効状態を設定する。

## 主要要素

-   時刻選択
-   曜日選択
-   朝・昼・夜区分
-   通知タイトル
-   通知メッセージ
-   有効スイッチ
-   保存
-   削除

## 遷移元

-   SC030 Reminder Settings

## 遷移先

-   SC030 Reminder Settings
-   削除確認ダイアログ

## 関連機能

-   F006 Reminder
-   F011 Time Period Classification

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC040 データ出力

## 画面ID

SC040

## 画面名

データ出力

## Flutter名

ExportSettingsScreen

## 目的

PDFまたはCSVの形式、

対象期間、出力項目を選択してデータを生成する。

## 主要要素

-   PDF・CSV選択
-   対象期間
-   出力項目
-   記録件数
-   個人情報の注意
-   出力ボタン

## 遷移元

-   SC011 History
-   SC012 Graph
-   SC013 Statistics
-   SC014 Settings
-   Deep Link

## 遷移先

-   SC041 PDF Preview
-   OS共有画面
-   ファイル保存画面

## 関連機能

-   F003 History
-   F004 Graph
-   F005 Statistics
-   F007 Export

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC041 PDFプレビュー

## 画面ID

SC041

## 画面名

PDFプレビュー

## Flutter名

PdfPreviewScreen

## 目的

PDFを保存・共有する前に

内容とレイアウトを確認する。

## 主要要素

-   PDFプレビュー
-   ページ移動
-   保存
-   共有
-   戻って修正

## 遷移元

-   SC040 Export Settings

## 遷移先

-   SC040 Export Settings
-   OS共有画面
-   ファイル保存画面

## 関連機能

-   F007 Export

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC050 バックアップ

## 画面ID

SC050

## 画面名

バックアップ

## Flutter名

BackupSettingsScreen

## 目的

手動・自動バックアップ、

バックアップ状態、復元操作を管理する。

## 主要要素

-   最終バックアップ日時
-   バックアップ件数
-   今すぐバックアップ
-   自動バックアップ
-   実行頻度
-   バックアップ共有
-   復元ボタン

## 遷移元

-   SC014 Settings
-   Deep Link

## 遷移先

-   SC051 Restore Preview
-   OS共有画面
-   ファイル選択画面

## 関連機能

-   F008 Backup
-   F009 Settings

## 優先度

★★★★☆（重要）

------------------------------------------------------------------------

# SC051 復元プレビュー

## 画面ID

SC051

## 画面名

復元プレビュー

## Flutter名

RestorePreviewScreen

## 目的

復元前にバックアップ日時、

対象データ、件数、復元方法を確認する。

## 主要要素

-   作成日時
-   アプリバージョン
-   記録件数
-   設定件数
-   追加・置換選択
-   復元ボタン
-   個人情報の注意

## 遷移元

-   SC050 Backup Settings

## 遷移先

-   SC050 Backup Settings
-   復元確認ダイアログ
-   SC010 Home

## 関連機能

-   F008 Backup

## 優先度

★★★★☆（重要）

------------------------------------------------------------------------

# SC060 表示設定

## 画面ID

SC060

## 画面名

表示設定

## Flutter名

DisplaySettingsScreen

## 目的

テーマ、文字サイズ、ボタンサイズ、

数値表示サイズなどを変更する。

## 主要要素

-   テーマ
-   文字サイズ
-   ボタンサイズ
-   数値表示サイズ
-   ホーム表示項目
-   初期設定へ戻す

## 遷移元

-   SC014 Settings
-   SC003 Initial Settings

## 遷移先

-   SC014 Settings
-   設定初期化ダイアログ

## 関連機能

-   F002 Home Dashboard
-   F009 Settings

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC061 記録設定

## 画面ID

SC061

## 画面名

記録設定

## Flutter名

RecordingSettingsScreen

## 目的

血圧単位、脈拍入力、時間帯区分、

複数回測定の集約方法を変更する。

## 主要要素

-   血圧単位
-   脈拍入力
-   朝・昼・夜の判定時刻
-   集約方法
-   小数点処理
-   入力初期値

## 遷移元

-   SC014 Settings
-   SC003 Initial Settings

## 遷移先

-   SC014 Settings
-   時刻選択ダイアログ

## 関連機能

-   F001 Blood Pressure Recording
-   F009 Settings
-   F011 Time Period Classification
-   F107 Multiple Measurement Aggregation

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC062 プライバシー設定

## 画面ID

SC062

## 画面名

プライバシー設定

## Flutter名

PrivacySettingsScreen

## 目的

生体認証、アプリロック、

AI機能、データ利用同意を管理する。

## 主要要素

-   生体認証
-   アプリロック
-   AI機能
-   AI利用説明
-   データ利用同意
-   プライバシーポリシー

## 遷移元

-   SC014 Settings

## 遷移先

-   SC014 Settings
-   生体認証ダイアログ
-   プライバシーポリシー

## 関連機能

-   F008 Backup
-   F009 Settings

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# SC063 アプリ情報

## 画面ID

SC063

## 画面名

アプリ情報

## Flutter名

AboutScreen

## 目的

アプリバージョン、利用規約、

プライバシーポリシー、問い合わせ先を表示する。

## 主要要素

-   アプリ名
-   バージョン
-   利用規約
-   プライバシーポリシー
-   ライセンス
-   お問い合わせ

## 遷移元

-   SC014 Settings

## 遷移先

-   SC014 Settings
-   外部ブラウザ
-   メールアプリ

## 関連機能

-   F009 Settings

## 優先度

★★★★★（MVP必須）

------------------------------------------------------------------------

# ダイアログ一覧

| ダイアログID | 名称 | 用途 |
|---|---|---|
| DG001 | 未保存確認 | 入力内容を破棄して戻るか確認 |
| DG002 | 記録削除確認 | 血圧記録の削除確認 |
| DG003 | リマインダー削除確認 | リマインダーの削除確認 |
| DG004 | 通知権限案内 | 通知権限の説明と設定誘導 |
| DG005 | 保存失敗 | 記録保存失敗と再試行 |
| DG006 | 出力失敗 | PDF・CSV生成失敗と再試行 |
| DG007 | 復元確認 | バックアップ復元の最終確認 |
| DG008 | 設定初期化確認 | 設定を初期値へ戻す確認 |
| DG009 | データ削除確認 | 全データ削除の確認 |
| DG010 | 生体認証 | アプリロック解除 |

------------------------------------------------------------------------

# ボトムシート一覧

| ボトムシートID | 名称 | 用途 |
|---|---|---|
| BS001 | 期間選択 | 日・週・月・年・任意期間の選択 |
| BS002 | 履歴フィルター | 時間帯・タグ・期間の絞り込み |
| BS003 | 集約方法選択 | 平均・最低値・最終値・任意値の選択 |
| BS004 | 出力項目選択 | PDF・CSVへ含める項目の選択 |
| BS005 | 共有方法選択 | 保存・共有操作の選択 |

------------------------------------------------------------------------

# Flutter実装

## フォルダ構成例


lib/

features/

onboarding/
  presentation/
    screens/
      splash_screen.dart
      onboarding_screen.dart
      initial_settings_screen.dart

home/
  presentation/
    screens/
      home_screen.dart

record/
  presentation/
    screens/
      blood_pressure_input_screen.dart
      multiple_measurement_screen.dart
      record_confirmation_screen.dart
      record_detail_screen.dart
      record_edit_screen.dart

history/
  presentation/
    screens/
      history_screen.dart

graph/
  presentation/
    screens/
      graph_screen.dart

statistics/
  presentation/
    screens/
      statistics_screen.dart

reminder/
  presentation/
    screens/
      reminder_settings_screen.dart
      reminder_edit_screen.dart

export/
  presentation/
    screens/
      export_settings_screen.dart
      pdf_preview_screen.dart

backup/
  presentation/
    screens/
      backup_settings_screen.dart
      restore_preview_screen.dart

settings/
  presentation/
    screens/
      settings_screen.dart
      display_settings_screen.dart
      recording_settings_screen.dart
      privacy_settings_screen.dart
      about_screen.dart


## ルーティング

GoRouter

## 状態管理

Riverpod

## UI共通化

-   AppScaffold
-   AppBottomNavigation
-   AppTopBar
-   PrimaryButton
-   SecondaryButton
-   AppDialog
-   EmptyState
-   ErrorState
-   LoadingState

------------------------------------------------------------------------

# テスト項目

## 一覧整合性

-   すべての画面に画面IDがある
-   画面IDが重複していない
-   Flutter名が重複していない
-   遷移元と遷移先が対応している
-   関連機能が記載されている
-   MVP対象が明確である

## 画面遷移

-   SC001から適切な初期画面へ移動できる
-   第1階層画面を下部ナビゲーションで移動できる
-   第2階層から呼び出し元へ戻れる
-   第3階層から正しい画面へ戻れる
-   ダイアログを安全に閉じられる
-   Deep Link対象画面を開ける
-   通知からSC020へ移動できる

## UI

-   各画面に画面タイトルがある
-   戻るボタンの有無が適切である
-   大きな文字でも画面を利用できる
-   画面読み上げで主要要素を認識できる
-   空状態・エラー状態・読み込み状態がある

------------------------------------------------------------------------

# Acceptance Criteria

□ すべてのMVP画面が一覧化されている

□ 各画面に一意の画面IDがある

□ 各画面にFlutter名が定義されている

□ 各画面の目的が定義されている

□ 各画面の主要要素が定義されている

□ 各画面の遷移元が定義されている

□ 各画面の遷移先が定義されている

□ 各画面の関連機能が定義されている

□ 各画面の優先度が定義されている

□ ダイアログが一覧化されている

□ ボトムシートが一覧化されている

□ UserFlow.mdと整合している

□ Navigation.mdと整合している

□ Flutterの画面ファイル名と対応できる

□ Figmaの画面名と対応できる

------------------------------------------------------------------------

# 関連ドキュメント

-   02_UX/UserFlow.md
-   02_UX/Navigation.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/Features/F001_BloodPressureRecording.md
-   01_Requirements/Features/F002_HomeDashboard.md
-   01_Requirements/Features/F003_History.md
-   01_Requirements/Features/F004_Graph.md
-   01_Requirements/Features/F005_Statistics.md
-   01_Requirements/Features/F006_Reminder.md
-   01_Requirements/Features/F007_Export.md
-   01_Requirements/Features/F008_Backup.md
-   01_Requirements/Features/F009_Settings.md
-   03_Screens/
-   04_DesignSystem/
-   06_Flutter/

------------------------------------------------------------------------

# 将来拡張

-   家族共有画面
-   複数プロフィール画面
-   医師共有画面
-   AI要約画面
-   スマートウォッチ設定画面
-   Health Connect連携画面
-   Apple Health連携画面
-   クラウド同期画面
-   音声入力画面
-   タブレット専用画面
