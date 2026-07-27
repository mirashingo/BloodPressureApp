# Navigation.md

# BloodPressureApp ナビゲーション仕様書

Version: 1.0

------------------------------------------------------------------------

# 目的

BloodPressureAppにおける

画面構造、画面間の移動方法、戻る操作、

下部ナビゲーション、モーダル、Deep Link、

通知タップ時の遷移ルールを定義する。

本書は、

-   UX設計
-   画面設計
-   Figma作成
-   Flutter実装
-   AIによるコード生成
-   ナビゲーションテスト

の共通基準として使用する。

------------------------------------------------------------------------

# 基本方針

-   血圧記録を最優先操作とする
-   主要画面へ1回の操作で移動できる
-   画面階層を深くしすぎない
-   現在位置を常に把握できるようにする
-   戻る操作の結果を予測可能にする
-   未保存データの消失を防止する
-   通知から入力画面へ直接移動できる
-   オフラインでも主要画面を利用できる
-   高齢者が迷いにくい構造とする

------------------------------------------------------------------------

# ナビゲーション構造

## ルート構造


App
├─ Splash
├─ Onboarding
├─ Main Shell
│   ├─ Home
│   ├─ History
│   ├─ Graph
│   ├─ Statistics
│   └─ Settings
├─ Blood Pressure Input
├─ Record Detail
├─ Reminder Settings
├─ Export Settings
├─ PDF Preview
├─ Backup Settings
├─ Restore Preview
├─ Display Settings
├─ Recording Settings
├─ Privacy Settings
└─ About


------------------------------------------------------------------------

# ナビゲーション階層

## 第1階層

アプリの主要画面。

-   Home
-   History
-   Graph
-   Statistics
-   Settings

第1階層は

下部ナビゲーションから直接移動する。

## 第2階層

主要画面から開く詳細画面。

-   Blood Pressure Input
-   Record Detail
-   Reminder Settings
-   Export Settings
-   Backup Settings
-   Display Settings
-   Recording Settings
-   Privacy Settings
-   About

## 第3階層

確認またはプレビューを目的とする画面。

-   PDF Preview
-   Restore Preview
-   Record Edit
-   Export Result

第3階層より深い画面構造は

原則として作成しない。

------------------------------------------------------------------------

# 下部ナビゲーション

## 構成

MVPでは次の5項目とする。

1.  Home
2.  History
3.  Graph
4.  Statistics
5.  Settings

## 表示条件

下部ナビゲーションは

第1階層画面で表示する。

次の画面では非表示とする。

-   Blood Pressure Input
-   Record Detail
-   PDF Preview
-   Restore Preview
-   各種詳細設定画面

## 選択状態

-   現在の画面を強調表示する
-   アイコンとテキストを併記する
-   色だけで選択状態を表現しない
-   選択中の項目は画面読み上げに対応する

## 再選択

現在表示中のタブを再度押した場合は

次の動作を行う。

-   一覧画面は先頭へ戻る
-   絞り込み状態は保持する
-   必要に応じて更新を実行する

------------------------------------------------------------------------

# 血圧記録ボタン

## 配置

血圧記録は

Home画面の最も目立つ位置に配置する。

必要に応じて

Floating Action Buttonとして提供する。

## 遷移先


Home
    ↓
Blood Pressure Input


## 他画面からの利用

History、Graph、Statisticsからも

血圧記録を開始できる。


History / Graph / Statistics
    ↓
Blood Pressure Input


## 保存後

保存完了後は

基本的にHomeへ戻る。

履歴編集から開いた場合は

Record Detailへ戻る。

------------------------------------------------------------------------

# Homeナビゲーション

## 遷移先

Homeから次の画面へ移動できる。

-   Blood Pressure Input
-   History
-   Graph
-   Statistics
-   Reminder Settings
-   Settings

## 優先順位

1.  血圧を記録する
2.  最新記録を確認する
3.  履歴を見る
4.  グラフを見る
5.  統計を見る
6.  リマインダーを設定する

------------------------------------------------------------------------

# Historyナビゲーション

## 基本遷移


History
    ↓
Record Detail


## 詳細からの遷移


Record Detail
    ├─ 編集 → Blood Pressure Input
    ├─ 削除 → 確認ダイアログ
    └─ 戻る → History


## フィルター

フィルターは

History画面内で完結させる。

別画面へ遷移させない。

------------------------------------------------------------------------

# Graphナビゲーション

## 基本遷移

Graphは

第1階層画面として表示する。

期間変更や表示項目変更は

同一画面内で完結させる。

## データ点

データ点を選択した場合は

画面内の詳細表示を優先する。

必要な場合のみ

Record Detailへ移動する。

------------------------------------------------------------------------

# Statisticsナビゲーション

## 基本遷移

Statisticsは

第1階層画面として表示する。

期間変更や比較は

同一画面内で完結させる。

## 関連画面


Statistics
    ├─ Graph
    ├─ Export Settings
    └─ Record Detail


Record Detailへの遷移は

対象記録が明確な場合のみ行う。

------------------------------------------------------------------------

# Settingsナビゲーション

## 構成


Settings
├─ Display Settings
├─ Recording Settings
├─ Reminder Settings
├─ Export Settings
├─ Backup Settings
├─ Privacy Settings
└─ About


## 危険な操作

次の操作は

通常設定から視覚的に分離する。

-   全データ削除
-   バックアップ置換復元
-   設定初期化
-   アカウント削除

------------------------------------------------------------------------

# モーダルナビゲーション

## 使用対象

次の場合にモーダルを使用する。

-   削除確認
-   未保存確認
-   権限案内
-   バックアップ置換確認
-   設定初期化確認
-   エラー表示

## 方針

-   重要な選択肢を2つ以内にする
-   キャンセルを明確に表示する
-   破壊的操作を目立たせる
-   戻る操作で閉じられる
-   読み上げフォーカスをモーダル内へ移動する

------------------------------------------------------------------------

# 戻る操作

## 基本ルール

-   第2階層から第1階層へ戻る
-   第3階層から呼び出し元へ戻る
-   タブ間移動では履歴スタックを増やしすぎない
-   未保存状態では確認を表示する

## Android戻る操作

### 第1階層

Home以外のタブでは

Homeへ戻すのではなく、

現在のタブ内スタックを戻す。

戻る画面がない場合は

アプリ終了確認を行わず

OS標準動作に従う。

### 入力画面

未保存データがある場合は

次を表示する。


入力内容が保存されていません
    ├─ 入力を続ける
    └─ 破棄して戻る


## iOS戻る操作

-   AppBarの戻るボタンに対応する
-   スワイプバックに対応する
-   未保存状態ではスワイプバックを制御する

------------------------------------------------------------------------

# タブ状態の保持

## 保持対象

タブ移動後も次を保持する。

History

-   スクロール位置
-   選択期間
-   フィルター
-   検索条件

Graph

-   表示期間
-   表示項目
-   選択データ点

Statistics

-   表示期間
-   比較条件

Settings

-   スクロール位置

## リセット

アプリ再起動後は

重要設定のみ保持し、

一時的な選択状態は初期値へ戻してよい。

------------------------------------------------------------------------

# Deep Link

## 対応ルート


bloodpressureapp://home

bloodpressureapp://record/new

bloodpressureapp://record/{recordId}

bloodpressureapp://history

bloodpressureapp://graph

bloodpressureapp://statistics

bloodpressureapp://reminders

bloodpressureapp://export

bloodpressureapp://backup

bloodpressureapp://settings


## 処理ルール

-   不正なIDの場合は安全な画面へ移動する
-   対象記録がない場合はHistoryへ移動する
-   アプリ未起動時も指定画面を開く
-   初回起動未完了の場合はOnboardingを優先する
-   アプリロック有効時は認証後に移動する

------------------------------------------------------------------------

# 通知タップ時の遷移

## 測定リマインダー


通知
    ↓
Blood Pressure Input


通知から開いた場合は

次を自動入力する。

-   現在日時
-   朝・昼・夜区分
-   通知元reminderId

## 通知処理

-   アプリ起動中
-   バックグラウンド
-   終了状態

のすべてで同じ遷移結果とする。

## 権限・認証

アプリロックが有効な場合は

認証完了後に入力画面へ移動する。

------------------------------------------------------------------------

# 保存後の遷移

## 新規記録


Blood Pressure Input
    ↓
保存完了
    ↓
Home


## 履歴編集


Record Detail
    ↓
編集
    ↓
Blood Pressure Input
    ↓
保存完了
    ↓
Record Detail


## 複数回測定


Blood Pressure Input
    ↓
次の測定を追加
    ↓
Blood Pressure Input
    ↓
集約確認
    ↓
保存完了
    ↓
Home


------------------------------------------------------------------------

# エラー時のナビゲーション

## 基本方針

-   エラー発生前の画面を保持する
-   入力内容を消去しない
-   再試行を提供する
-   安全な戻り先を用意する

## 保存失敗


保存失敗
    ├─ 再試行
    └─ 入力内容を保持して戻る


## 読み込み失敗


読み込み失敗
    ├─ 再読み込み
    └─ Homeへ戻る


## 不正ルート


不正なルート
    ↓
Home


------------------------------------------------------------------------

# 権限画面への遷移

## 対象

-   通知
-   ファイル保存
-   生体認証
-   クラウド連携

## フロー


機能を実行
    ↓
権限確認
    ├─ 許可済み → 処理を継続
    └─ 未許可
            ↓
        説明ダイアログ
            ├─ 端末設定を開く
            └─ キャンセル


端末設定から戻った場合は

権限状態を再確認する。

------------------------------------------------------------------------

# アクセシビリティ

-   ナビゲーション項目に読み上げラベルを設定する
-   選択中のタブを読み上げる
-   戻るボタンの遷移先を明確にする
-   アイコンとテキストを併記する
-   画面遷移後にタイトルへフォーカスする
-   モーダル表示時は背景操作を無効化する
-   キーボード操作順序を画面構造に合わせる
-   大きな文字でも下部ナビゲーションを維持する

------------------------------------------------------------------------

# Flutter実装

## 画面遷移

GoRouter

## 状態管理

Riverpod

## 推奨ルート


/
├─ /splash
├─ /onboarding
├─ /home
├─ /history
├─ /graph
├─ /statistics
├─ /settings
├─ /record/new
├─ /record/:recordId
├─ /record/:recordId/edit
├─ /reminders
├─ /export
├─ /export/pdf-preview
├─ /backup
├─ /backup/restore-preview
└─ /settings
    ├─ /display
    ├─ /recording
    ├─ /privacy
    └─ /about


## ShellRoute

次の画面をShellRouteで管理する。

-   Home
-   History
-   Graph
-   Statistics
-   Settings

## ルート名


splash
onboarding
home
history
graph
statistics
settings
recordNew
recordDetail
recordEdit
reminders
export
pdfPreview
backup
restorePreview
displaySettings
recordingSettings
privacySettings
about


## リダイレクト

次の条件でリダイレクトする。

初回起動未完了


任意ルート
    ↓
/onboarding


アプリロック有効


保護対象ルート
    ↓
認証
    ↓
元のルート


不正recordId


/record/{recordId}
    ↓
/history


## ナビゲーションAPI

-   go：第1階層の移動
-   push：詳細画面の追加
-   pop：呼び出し元へ戻る
-   replace：保存後などの置換
-   redirect：初回起動・認証制御

------------------------------------------------------------------------

# ナビゲーション状態

## 管理対象

-   選択中タブ
-   各タブのスクロール位置
-   各タブのフィルター
-   未保存状態
-   Deep Link遷移先
-   通知遷移先
-   認証後遷移先

## Riverpod Provider例


navigationStateProvider

selectedTabProvider

pendingRouteProvider

unsavedChangesProvider

deepLinkProvider

notificationRouteProvider


------------------------------------------------------------------------

# テスト項目

## 正常系

-   下部ナビゲーションで5画面を移動できる
-   Homeから入力画面へ移動できる
-   Historyから詳細画面へ移動できる
-   Record Detailから編集画面へ移動できる
-   Settingsから各詳細設定へ移動できる
-   通知タップで入力画面へ移動できる
-   Deep Linkで指定画面を開ける
-   保存後に正しい画面へ戻れる
-   タブ状態を保持できる

## 異常系

-   不正なrecordIdを安全に処理できる
-   不正なDeep LinkをHomeへ戻せる
-   未保存状態で戻る場合に確認できる
-   権限拒否後に元画面へ戻れる
-   読み込み失敗後に再試行できる
-   アプリロック後に元の遷移先へ戻れる

## UI

-   現在のタブを識別できる
-   戻るボタンを確認できる
-   大きな文字でも操作できる
-   画面読み上げで移動できる
-   片手で主要画面へ移動できる

------------------------------------------------------------------------

# Acceptance Criteria

□ 主要5画面を下部ナビゲーションから開ける

□ 現在の画面を明確に識別できる

□ 血圧記録画面へ1回の操作で移動できる

□ 詳細画面から呼び出し元へ戻れる

□ 未保存データの消失を防止できる

□ タブ移動後も必要な状態を保持できる

□ 通知タップで入力画面へ移動できる

□ Deep Linkで指定画面へ移動できる

□ 初回起動未完了時にOnboardingへ移動できる

□ アプリロック後に元の画面へ移動できる

□ 不正なルートを安全に処理できる

□ Androidの戻る操作に対応できる

□ iOSの戻る操作に対応できる

□ 大きな文字でも下部ナビゲーションを利用できる

□ 画面読み上げでナビゲーションを操作できる

------------------------------------------------------------------------

# 関連ドキュメント

-   02_UX/UserFlow.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/F001_BloodPressureRecording.md
-   01_Requirements/F002_HomeDashboard.md
-   01_Requirements/F003_History.md
-   01_Requirements/F004_Graph.md
-   01_Requirements/F005_Statistics.md
-   01_Requirements/F006_Reminder.md
-   01_Requirements/F007_Export.md
-   01_Requirements/F008_Backup.md
-   01_Requirements/F009_Settings.md
-   03_Screens/
-   06_Flutter/

------------------------------------------------------------------------

# 将来拡張

-   タブ構成のカスタマイズ
-   タブ並び替え
-   タブ非表示設定
-   タブレット用Navigation Rail
-   デスクトップ用Navigation Drawer
-   Web URLルーティング
-   家族共有Deep Link
-   医師共有Deep Link
-   ウィジェットからの直接遷移
-   スマートウォッチ通知からの遷移
