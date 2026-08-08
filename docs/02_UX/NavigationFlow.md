# NavigationFlow.md

## 1. Purpose

本ドキュメントは、BloodPressureAppでユーザーが各画面をどのように移動するかを定義する。

Navigation Flowは、Navigation Structureで整理した画面領域を前提に、日常利用、記録、履歴確認、グラフ確認、統計確認、設定、補助機能への移動を整理するための資料である。

本ドキュメントでは、Route Path、Route名、GoRouter実装、Flutter Widget構成は定義しない。

## 2. Navigation Overview

BloodPressureAppの基本利用は、Homeを起点に進む。

ユーザーはアプリ起動後にHomeへ到達し、Homeから血圧記録を開始する。保存済みのRecording Dataは、Historyで個別記録として確認し、Graphで時間変化として確認し、Statisticsで期間集計として確認する。Settingsは毎日使わない設定や補助機能の入口として扱う。

代表的な利用イメージ:

1.  アプリを起動する。
2.  Homeで現在状態を確認する。
3.  Blood Pressure Inputで血圧を記録する。
4.  Historyで過去記録を確認する。
5.  GraphまたはStatisticsで振り返る。
6.  必要に応じてSettingsからReminder、Export、Backup、Privacyなどを開く。

## 3. Entry Flow

Entry Flowは、アプリ起動からHomeへ到達するまでの流れである。

| 状態 | 移動 |
|---|---|
| 初回起動 | Splash、Onboarding、Initial Settingsを経てHomeへ進む |
| 2回目以降の起動 | Splash後、通常はHomeへ進む |
| 通知から起動 | 通知内容に応じてBlood Pressure Inputなどの関連画面へ進む可能性がある |
| 初期設定が未完了 | OnboardingまたはInitial Settingsを優先する |

Onboardingでは、アプリの目的、医療診断ではないこと、Privacy、通知などを説明する。Initial Settingsでは、文字サイズ、ボタンサイズ、脈拍入力、時間帯分類、通知などの初期設定を扱う。

Homeへ到達した後は、Primary Navigationを利用できる状態になる。

## 4. Primary Navigation Flow

Primary Navigationは次の5画面を対象とする。

-   Home
-   History
-   Graph
-   Statistics
-   Settings

Primary Navigationの基本ルール:

-   5画面はBottom Navigationから相互に移動できる。
-   Bottom Navigationでは現在地が分かる状態を維持する。
-   Homeは記録開始と現在状態確認の起点である。
-   Historyは個々の記録確認の起点である。
-   Graphは期間変化確認の起点である。
-   Statisticsは期間集計確認の起点である。
-   Settingsは補助機能と設定変更の起点である。

Blood Pressure Input、Record Detail、PDF Preview、Restore Preview、各種詳細設定画面では、Primary Navigationの表示や扱いは後続のScreen Specificationで具体化する。

## 5. Recording Flow

Recording Flowは、血圧記録を開始し、保存するまでの流れである。

基本導線:

| Step | Screen / State | 内容 |
|---|---|---|
| 1 | Home | 血圧記録のPrimary Actionを選択する |
| 2 | Blood Pressure Input | SYS、DIA、Pulse、測定日時、メモなどを入力する |
| 3 | Multiple Measurement | 必要な場合のみ複数回測定を追加する |
| 4 | Record Confirmation | 入力内容、集約結果、保存内容を確認する |
| 5 | 保存 | 記録を保存する |
| 6 | Home | 通常の保存完了後はHomeへ戻る |

補足:

-   History、Graph、StatisticsからもBlood Pressure Inputを開始できる構造を想定する。
-   複数回測定を行わない場合、Multiple Measurementは通過しない。
-   編集としてBlood Pressure Inputを開いた場合、保存後の戻り先はRecord Detailを基本候補とする。
-   保存失敗時は入力内容を保持し、再試行できる状態を優先する。

保存後にHomeへ戻るかHistoryへ移動するかは、基本方針ではHomeを優先しつつ、詳細は後続設計で確認する。

## 6. History Flow

History Flowは、保存済み記録を確認、編集、削除する流れである。

基本導線:

| Step | Screen / State | 内容 |
|---|---|---|
| 1 | History | 記録一覧を確認する |
| 2 | History内Filter / Sort | 期間、時間帯、タグなどで表示を絞る |
| 3 | Record Detail | 選択した記録の詳細を確認する |
| 4 | Record Edit | 必要に応じて記録を編集する |
| 5 | History | 編集または削除の結果を一覧へ反映する |

削除導線:

-   Record Detailから削除を選択する。
-   削除確認を表示する。
-   キャンセルした場合はRecord Detailへ留まる。
-   削除した場合はHistoryへ戻る。

History内のFilter、Sort、Searchは、原則としてHistory画面内で完結させる。

## 7. Graph Flow

Graph Flowは、Recording Dataの時間変化を確認する流れである。

基本導線:

| Step | Screen / State | 内容 |
|---|---|---|
| 1 | Graph | 初期期間のグラフを確認する |
| 2 | Period Change | 表示期間を変更する |
| 3 | Series / Data Point | SYS、DIA、Pulseや特定時点の値を確認する |
| 4 | Record Detail | 必要な場合のみ対象記録の詳細へ進む |

Graphでは、期間変更や表示項目変更は同一画面内で完結させる。データ点を選択した場合は、画面内の詳細表示を優先し、Record Detailへの移動は対象記録が明確な場合に限定する。

## 8. Statistics Flow

Statistics Flowは、Recording Dataを期間集計として確認する流れである。

基本導線:

| Step | Screen / State | 内容 |
|---|---|---|
| 1 | Statistics | 初期期間の統計を確認する |
| 2 | Period Change | 集計期間を変更する |
| 3 | Comparison | 前期間との差や傾向を確認する |
| 4 | Graph | 必要に応じて時間変化の確認へ移動する |
| 5 | Export | 必要に応じて集計対象の出力へ進む |

Statisticsでは、平均、最大、最小、測定回数、測定日数などを扱う。Record Detailへの移動は、対象記録が明確な場合のみ扱う。

## 9. Settings Flow

Settings Flowは、毎日使わない設定や補助機能へ移動する流れである。

Settings配下の基本導線:

| Settings Area | 主な移動先 | 内容 |
|---|---|---|
| Display | Display Settings | Theme、文字サイズ、ボタンサイズ、数値表示など |
| Recording | Recording Settings | 脈拍入力、時間帯分類、複数回測定の扱いなど |
| Reminder | Reminder Settings / Reminder Edit | 通知時刻、曜日、有効状態など |
| Export | Export Settings / PDF Preview | PDF / CSV出力、出力条件、Preview |
| Backup | Backup Settings / Restore Preview | Backup作成、Restore確認 |
| Privacy | Privacy Settings | Privacy説明、データ利用、同意、AI利用など |
| About | About | Version、利用規約、ライセンス、問い合わせなど |

危険な操作は、通常設定から視覚的に分離し、確認を挟む。例として、全データ削除、バックアップ置換復元、設定初期化などを想定する。

## 10. Cross Navigation

Cross Navigationは、Primary Navigationや補助画面をまたぐ移動である。

現在整理できる主な導線:

| From | To | 目的 |
|---|---|---|
| Home | Blood Pressure Input | 記録開始 |
| Home | History | 過去記録確認 |
| Home | Graph | 時間変化確認 |
| Home | Statistics | 期間集計確認 |
| Home | Reminder Settings | 通知設定 |
| History | Record Detail | 個別記録確認 |
| History | Blood Pressure Input | 記録追加または編集入口 |
| History | Export Settings | 記録一覧の出力 |
| Graph | Record Detail | 対象記録が明確な場合の詳細確認 |
| Graph | Export Settings | グラフ対象期間の出力候補 |
| Statistics | Graph | 集計結果から時間変化を確認 |
| Statistics | Export Settings | 集計対象期間の出力候補 |
| Settings | Reminder Settings | 通知管理 |
| Settings | Export Settings | データ出力 |
| Settings | Backup Settings | Backup / Restore |
| Settings | Privacy Settings | Privacy確認 |

同じ情報への入口を必要以上に増やさない。Cross Navigationは、利用目的が明確な場合に限定する。

## 11. Back Navigation Policy

戻る操作は、ユーザーが結果を予測できることを優先する。

基本方針:

-   第2階層からは呼び出し元またはPrimary Navigationへ戻る。
-   第3階層からは原則として呼び出し元へ戻る。
-   タブ間移動では履歴スタックを増やしすぎない。
-   未保存状態では確認を表示する。
-   モーダルは戻る操作で閉じられるようにする。

代表例:

| 状態 | 戻り先の考え方 |
|---|---|
| 新規記録保存後 | 基本的にHomeへ戻る |
| 履歴編集保存後 | Record Detailへ戻る候補とする |
| 編集キャンセル | 呼び出し元へ戻る |
| 削除キャンセル | Record Detailへ留まる |
| 削除完了 | Historyへ戻る |
| PDF Previewから戻る | Export Settingsへ戻る |
| Restore Previewから戻る | Backup Settingsへ戻る |
| 詳細設定から戻る | Settingsへ戻る |

Androidの戻る操作、iOSの戻る操作、スワイプバックの詳細は、Screen SpecificationとFlutter実装タスクで具体化する。

## 12. Modal / Dialog Policy

Modal / Dialogは、重要な確認、未保存状態、権限案内、破壊的操作、エラー表示に限定して使用する。

現時点で必要な確認:

| Modal / Dialog | 使用場面 | 方針 |
|---|---|---|
| 未保存確認 | Blood Pressure Input、Record Editなどで未保存のまま戻る場合 | 入力を続けるか破棄するかを明確にする |
| 削除確認 | Record Detailから削除する場合 | キャンセルと削除を明確に分ける |
| 保存確認 | Record Confirmationで保存内容を確認する場合 | 保存前に入力内容を確認できるようにする |
| 通知権限案内 | Reminderで通知権限がない場合 | 端末設定へ進むか後で設定するかを選べるようにする |
| Restore確認 | Backup復元、特に置換復元の場合 | 影響範囲を明示し、誤操作を防ぐ |
| データ削除確認 | Settingsから全データ削除などを行う場合 | 破壊的操作として強い確認を行う |
| Error表示 | 保存、Export、Backup、Restoreなどに失敗した場合 | 再試行または戻る方法を提示する |

重要な選択肢は増やしすぎず、キャンセルを明確に表示する。

## 13. Exception Flow

Exception Flowは、通常利用から外れる状態でユーザーを迷わせないための流れである。

| 状態 | Flow方針 |
|---|---|
| 初回起動 | OnboardingとInitial Settingsを経てHomeへ進む |
| データ0件 | Home、History、Graph、Statisticsで空状態を表示し、記録開始へ誘導する |
| 入力値エラー | 該当項目にエラーを表示し、修正後に再度確認できるようにする |
| 保存失敗 | 入力内容を保持し、再試行できるようにする |
| Reminder未設定 | HomeやReminder Settingsで未設定状態を案内する |
| 通知権限なし | 権限案内を表示し、拒否してもアプリ利用を継続できるようにする |
| Export対象なし | 空状態を表示し、期間変更へ誘導する |
| Backupなし | Restore入口ではBackup File選択や作成案内を行う |
| Restore失敗 | 既存データを保持し、失敗理由と再試行方法を示す |
| Offline | 主要画面は利用できる前提とし、外部連携が必要な操作は状態を案内する |

医療診断、病気判定、危険度の断定へ誘導するException Flowは作らない。

## 14. Open Issues

| Issue | 状態 | 後続で確認すること |
|---|---|---|
| 保存後の戻り先 | 一部未確定 | 新規保存後にHome固定か、Historyへの導線を併設するか |
| 編集保存後の戻り先 | 一部未確定 | Record Detailへ戻すか、Historyへ戻すか |
| Export入口 | 一部未確定 | History、Graph、Statistics、Settingsのどれを主入口とするか |
| AI Summary導線 | 未決定 | Home、Graph、Statistics、Exportなどから入口を設けるか |
| Deep Link | 後続扱い | 通知、Reminder、Record Detail、Exportなどへの直接移動をどう扱うか |
| Primary Action表現 | 未決定 | Home内Primary Button、FAB、Navigation Bar中央ボタンのどれを採用するか |
| タブごとのNavigation Stack | 未決定 | タブ移動時のStack保持方針をどうするか |
| Tablet Navigation | 未決定 | Navigation RailなどLarge Screen向け構造を採用するか |

