# NavigationStructure.md

## 1. Purpose

本ドキュメントは、BloodPressureApp全体のNavigation Structureを定義する。

ここで扱うのは、アプリ全体をどのようなNavigation構造で整理するかである。個別の画面遷移、詳細なNavigation Flow、Route Path、Route名、画面ごとのUI仕様は本ドキュメントでは定義しない。

Navigation Structureは、`docs/00_Project/AppConcept.md`、`docs/02_UX/InformationArchitecture.md`、`docs/02_UX/Navigation.md`、`docs/02_UX/UserFlow.md`、`docs/02_UX/ScreenList.md`を前提とする。

## 2. Navigation Philosophy

BloodPressureAppのNavigationは、毎日の血圧記録と振り返りを迷わず行えることを最優先とする。

-   毎日使う画面へ短い操作で到達できるようにする。
-   血圧記録の開始を最も分かりやすいPrimary Actionとして扱う。
-   Homeは現在状態の確認と記録開始の起点にする。
-   History、Graph、Statisticsは同じRecording Dataを異なる目的で確認する領域として分ける。
-   Settingsは表示、記録方法、通知、データ管理、Privacyなどの補助設定をまとめる。
-   Splash、Onboarding、Initial SettingsはMain Navigationとは分けて扱う。
-   医療診断と誤認させる導線や分類を作らない。
-   高齢者、Large Text、Accessibilityを考慮し、主要導線を複雑にしない。

## 3. Navigation Principles

Navigation Principlesは、画面設計、Figma、Flutter実装時にNavigation判断で迷ったときの基準である。

1.  主要操作は3タップ以内で到達できることを目標とする。
2.  Blood Pressure InputはPrimary Actionとして常に分かりやすい入口を持つ。
3.  Homeは現在状態の確認と記録開始の起点とする。
4.  Bottom Navigationでは現在地が常に分かるようにする。
5.  History、Graph、Statisticsは役割を重複させない。
6.  同じ情報への入口を必要以上に増やさない。
7.  Settingsには毎日使わない設定・補助機能を集約する。
8.  医療診断を連想させるNavigationやラベルを作らない。
9.  Accessibilityを優先し、Large Text、片手操作、高齢者を考慮する。
10. Navigation構造はFlutter実装都合ではなく、UXを最優先に決定する。

## 4. Primary Navigation

MVPのPrimary Navigationは、次の5領域を基本とする。

| Navigation | 役割 | 主目的 | アクセス頻度 |
|---|---|---|---|
| Home | 現在状態と記録開始の起点 | 最新記録、今日の状態、Quick Summary、記録開始を確認する | 高 |
| History | 個々の過去記録の確認 | 記録一覧、Record Detail、Edit / Deleteの入口を提供する | 高 |
| Graph | 時間変化の確認 | SYS、DIA、Pulseの推移と期間変化を確認する | 中 |
| Statistics | 期間集計の確認 | 平均、最大、最小、測定回数、測定日数などを確認する | 中 |
| Settings | アプリ設定と補助機能の入口 | 表示、記録方法、通知、Data / Backup、Privacy、Aboutを管理する | 低から中 |

Primary Navigationは、日常的に利用する主要情報領域を代表する。詳細画面、入力画面、確認画面、Preview、各種設定詳細はPrimary Navigationそのものには含めない。

## 5. Primary Action

Blood Pressure Inputは、BloodPressureAppのPrimary Actionとして扱う。

Homeとの関係:

-   HomeはBlood Pressure Inputへの最も明確な入口を持つ。
-   記録開始ActionはHomeで最も目立つ位置に置く。
-   Homeは記録開始だけでなく、最新記録と今日の状態も確認できる起点とする。

Bottom Navigationとの関係:

-   Blood Pressure InputはPrimary Navigationの1タブとしては扱わない。
-   Home、History、Graph、Statisticsからも記録開始へアクセスできる構造を想定する。
-   入力中はMain Navigationとは別の記録作業領域として扱う。

Action表現:

-   既存資料ではHomeの最も目立つ位置に配置する方針が示されている。
-   必要に応じてFloating Action Buttonとして提供する可能性がある。
-   Navigation Bar中央ボタンを採用するかは現時点では未決定とする。
-   FAB、Navigation Bar中央ボタン、Home内Primary Buttonの最終判断は後続のNavigation FlowまたはWireframeで扱う。

## 6. Secondary Navigation

Secondary Navigationは、Main Navigationではない補助領域への入口である。主にSettings配下、またはHome / History / Graph / Statisticsから必要に応じて到達する領域として扱う。

| Area | 位置付け | 主な内容 |
|---|---|---|
| Reminder | 継続支援 | 測定通知、通知時刻、通知状態 |
| Export | データ活用 | PDF / CSV出力、出力条件、Preview |
| Backup | データ保護 | Backup作成、Restore入口、Backup状態 |
| Restore | データ復元 | Backup File確認、Restore Preview、復元確認 |
| Privacy | 安心・同意 | Privacy説明、データ利用、AI利用、Backup注意事項 |
| Display | 表示調整 | Theme、文字サイズ、数値表示、ボタンサイズ |
| Recording | 記録方法 | 脈拍入力、時間帯分類、複数回測定の扱い |
| About | アプリ情報 | Version、利用規約、ライセンス、問い合わせ |

Export、Reminder、Backup、Privacy、AboutはSettings配下の補助導線として整理する。ただし、ExportはHistory、Graph、Statisticsなどから関連導線を持つ可能性がある。

## 7. Recording Flow Position

Recordingは、Main Navigationの1タブではなく、BloodPressureAppの中心Actionと中心Dataを扱う作業領域である。

Recordingに含まれる主な情報領域:

-   Blood Pressure Input
-   Multiple Measurement
-   Record Confirmation
-   Record Detail
-   Record Edit

Recordingの位置付け:

-   Blood Pressure Inputは新規記録の入口である。
-   Multiple Measurementは複数回測定を扱う補助構造である。
-   Record Confirmationは保存前の確認領域である。
-   Record Detailは保存済み記録の確認領域である。
-   Record Editは保存済み記録の修正領域である。
-   Historyは保存済みRecording Dataを記録単位で確認するPrimary Navigationである。

本章はRecordingの構造上の位置付けを整理するものであり、画面遷移順や戻り先を定義しない。

## 8. Navigation Hierarchy

BloodPressureAppのNavigation Structureは、次の階層を基本とする。

```text
BloodPressureApp
├─ System / Entry
│  ├─ Splash
│  ├─ Onboarding
│  └─ Initial Settings
│
├─ Primary Navigation
│  ├─ Home
│  ├─ History
│  ├─ Graph
│  ├─ Statistics
│  └─ Settings
│
├─ Primary Action / Recording
│  ├─ Blood Pressure Input
│  ├─ Multiple Measurement
│  ├─ Record Confirmation
│  ├─ Record Detail
│  └─ Record Edit
│
└─ Secondary Navigation
   ├─ Reminder
   ├─ Export
   ├─ Backup
   ├─ Restore
   ├─ Privacy
   ├─ Display
   ├─ Recording Settings
   └─ About
```

Settings配下の構造は次を基本とする。

```text
Settings
├─ Display
├─ Recording
├─ Reminder
├─ Export
├─ Backup
├─ Privacy
└─ About
```

この階層はNavigation Structureであり、Route Pathや画面遷移図ではない。

## 9. Flutter Mapping

Flutter実装では、Navigation Structureを次のように対応させる想定とする。

| Structure | Flutter上の対応候補 | 備考 |
|---|---|---|
| Primary Navigation | ShellRoute、BottomNavigationBarまたはNavigationBar | Main 5領域を管理する候補 |
| Home / History / Graph / Statistics / Settings | Shell配下の主要画面 | P3-06でShellRouteは未導入。後続タスクで判断する |
| Blood Pressure Input | Shell外またはMain Navigation外の記録作業画面 | Primary Actionとして起動する |
| Record Detail / Record Edit | 記録確認・編集の詳細画面 | History、Graph、Statisticsなどとの関係を後続で整理する |
| Settings配下 | Settingsから到達する詳細設定画面 | Display、Recording、Reminder、Export、Backup、Privacy、Aboutを扱う |
| System / Entry | 起動・初回設定用の画面群 | Splash、Onboarding、Initial SettingsをMain Navigationから分離する |

GoRouterを使用する方針は既存Flutter基盤と整合する。Route定義、Route Path、Route名、Redirect、Deep Link、Navigation APIの詳細は本ドキュメントでは定義しない。

## 10. Open Issues

| Issue | 状態 | 後続で確認すること |
|---|---|---|
| Primary Actionの表現 | 未決定 | Home内Primary Button、FAB、Navigation Bar中央ボタンのどれを採用するか |
| Bottom Navigationの具体Component | 未決定 | Material 3 NavigationBar、BottomNavigationBar、独自Design System Componentの扱い |
| ShellRoute採用時期 | 未決定 | Main 5タブ実装時にShellRouteまたはStatefulShellRouteを採用するか |
| タブごとのNavigation Stack保持 | 未決定 | StatefulShellRoute.indexedStackが必要か |
| NavigationRail / Tablet対応 | 未決定 | TabletやLarge ScreenでNavigation Railを使うか |
| Export入口 | 一部未確定 | History、Graph、Statistics、Settingsのどこを主入口にするか |
| AI Summary入口 | 未決定 | Home、Graph、Statistics、Exportなどからの入口を採用するか |
| Settings配下の細かな階層 | 一部未確定 | Display、Recording、Privacy、Aboutなどの詳細階層 |
| Deep Link | 後続扱い | P3-06以降またはFeature実装時に整理する |
| 未保存状態の戻る確認 | 後続扱い | Navigation FlowとScreen Specificationで具体化する |

## 11. Boundary

本ドキュメントでは次を行わない。

-   Navigation Flowの作成
-   画面遷移図の作成
-   Route Pathの定義
-   Route名の定義
-   GoRouter実装方針の詳細化
-   Widget構成の定義
-   Figma Componentの定義
-   Flutter / Dart実装
-   既存ドキュメントの変更
