# InformationArchitecture.md

## 1. Purpose

本ドキュメントは、BloodPressureApp全体の情報構造を定義する。

ここで扱うのは、アプリにどの情報領域があり、それらをどのように分類し、何をPrimary / Secondaryとして扱うかである。詳細な画面遷移、画面ごとの具体UI、実装方法は後続タスクで定義する。

本ドキュメントは、UX、Navigation、Screen、Figma、Flutter設計の共通基準とする。`docs/00_Project/AppConcept.md`のMission、Vision、UX Principlesを前提とし、BloodPressureAppは医療診断ではなく、血圧記録と振り返り支援を目的とする。

## 2. Design Principles

Information Architectureでは、既存のAppConcept、Requirements、UX資料に基づき、次の原則を採用する。

- 血圧記録開始を最短導線にする。
- 血圧値を最重要情報として扱う。
- 過去記録を探しやすく、振り返りやすくする。
- History、Graph、Statisticsは同じRecording Dataを異なる目的で扱う。
- 情報を詰め込みすぎず、各領域の目的を一つに絞る。
- 医療診断、病気判定、危険度断定と誤認される分類を作らない。
- AI機能がなくても、記録、履歴確認、グラフ確認、統計確認、出力、バックアップを完結できる。
- 高齢者、Large Text、Screen Reader、片手操作を考慮する。
- 色だけに依存せず、情報の意味を文字や構造でも伝える。

## 3. Top-Level Information Architecture

アプリ全体の情報構造は、Main NavigationとSystem / Entry Flowを分けて扱う。

```text
BloodPressureApp
├─ System / Entry Flow
│  ├─ Splash
│  ├─ Onboarding
│  └─ Initial Settings
│
├─ Main Navigation
│  ├─ Home
│  ├─ History
│  ├─ Graph
│  ├─ Statistics
│  └─ Settings
│
├─ Recording
│  ├─ Blood Pressure Input
│  ├─ Multiple Measurement
│  ├─ Record Confirmation
│  ├─ Record Detail
│  └─ Record Edit
│
└─ Supporting Areas
   ├─ Reminder
   ├─ Export
   ├─ Backup / Restore
   ├─ Privacy
   └─ AI Summary
```

Main Navigationは、利用者が日常的に確認する主要情報領域を代表する。Splash、Onboarding、Initial Settingsは起動時や初期設定のためのSystem / Entry Flowであり、Main Navigationには含めない。

## 4. Primary Information Areas

### Home

Homeは、記録開始と現在状態の確認を代表する情報領域である。

| 情報 | 役割 |
|---|---|
| 記録開始 | Blood Pressure Inputへ進むPrimary Action |
| 最新記録 | 直近のSYS、DIA、Pulse、測定日時、時間帯を確認する |
| 今日の状態 | 今日の測定回数、朝・昼・夜の測定状態を確認する |
| Quick Summary | 直近期間の平均値や簡易傾向を確認する |
| Reminder Status | 次回通知や通知状態を補助情報として確認する |

### History

Historyは、個々の過去記録を確認する情報領域である。

| 情報 | 役割 |
|---|---|
| 過去記録一覧 | 測定日時ごとの記録を時系列で確認する |
| Filter | 期間、時間帯、タグなどで絞り込む |
| Sort | 新しい順、古い順などで見方を変える |
| Record Detail | 1件の記録の詳細確認へ進む入口 |
| Edit / Delete | 記録の修正、削除へ進む入口 |

### Graph

Graphは、Recording Dataの時間変化を見る情報領域である。

| 情報 | 役割 |
|---|---|
| SYS / DIA | 血圧値の推移を確認する中心系列 |
| Pulse | 脈拍の推移を補助的に確認する系列 |
| Period | 日、週、月、年、任意期間で表示範囲を切り替える |
| Data Point | 特定時点の測定値を確認する |
| Trend | 期間内の変化を診断ではなく振り返りとして確認する |

### Statistics

Statisticsは、Recording Dataを期間集計として見る情報領域である。

| 情報 | 役割 |
|---|---|
| 平均値 | SYS、DIA、Pulseの平均を確認する |
| 測定回数 | 記録頻度を確認する |
| 測定日数 | 継続状況を確認する |
| 最大値 / 最小値 | 期間内の範囲を確認する |
| 前期間との差 | 傾向確認の補助として比較する |

### Settings

Settingsは、利用者の使い方に合わせてアプリ情報を調整する情報領域である。

| 情報カテゴリ | 役割 |
|---|---|
| Display | テーマ、文字サイズ、ボタンサイズ、数値表示サイズを管理する |
| Recording | 脈拍入力、時間帯判定、保存前確認などの記録方法を管理する |
| Reminder | 測定通知を管理する |
| AI | AI機能の有効化、説明、同意を管理する |
| Data / Backup | Export、Backup、Restore、データ削除を管理する |
| Privacy | アプリロック、データ利用同意、プライバシー情報を管理する |
| About | アプリ情報、利用規約、ライセンス、問い合わせを扱う |

## 5. Recording Information Structure

Recordingは、BloodPressureAppの中心情報領域である。Home、History、Graph、Statistics、Export、Backup、AI Summaryは、Recording Dataを異なる目的で利用する。

```text
Recording
├─ New Record
│  ├─ Single Measurement
│  │  ├─ measuredAt
│  │  ├─ SYS
│  │  ├─ DIA
│  │  ├─ Pulse
│  │  ├─ Time Period
│  │  ├─ Memo
│  │  └─ Tags
│  │
│  └─ Multiple Measurement
│     ├─ Measurement Session
│     │  ├─ Individual Measurement 1
│     │  ├─ Individual Measurement 2
│     │  └─ Individual Measurement 3...
│     ├─ Average
│     └─ Representative Selection
│        ├─ Average (Default)
│        └─ Individual Measurement
│
├─ Confirmation
│  ├─ Input Summary
│  ├─ Representative Value
│  └─ Save Decision
│
├─ Detail
│  ├─ Stored Record
│  ├─ Measurement Session
│  ├─ Memo / Tags
│  └─ Edit / Delete Entry
│
└─ Edit
   ├─ Existing Record Values
   ├─ Correction
   └─ Update Decision
```

この構造は情報の分類であり、画面遷移や保存処理の詳細を定義するものではない。

Multiple Measurementでは、AverageをデフォルトのRepresentative Valueとして扱う。ユーザーがIndividual MeasurementをRepresentative Valueとして選択した場合でも、他のIndividual MeasurementsはMeasurement Session内の情報として保持する。

## 6. Historical Information Structure

History、Graph、Statisticsは同じRecording Dataを参照するが、利用目的が異なる。

| 領域 | 見る情報 | 主な目的 |
|---|---|---|
| History | 個々の記録 | いつ、どの値を記録したか確認する |
| Graph | 時間変化 | SYS、DIA、Pulseの推移を見る |
| Statistics | 期間集計 | 平均、最大、最小、測定回数、測定日数を見る |

Historyは記録単位、Graphは時系列変化、Statisticsは期間集計を扱う。これはUX上の情報関係であり、実装上の依存関係を定義するものではない。

## 7. Settings Information Structure

Settings以下は、利用者の目的別に分類する。

```text
Settings
├─ Display
│  ├─ Theme
│  ├─ Text Size
│  ├─ Button Size
│  ├─ Number Display Size
│  ├─ Home Display Items
│  ├─ High Contrast
│  └─ Reduce Motion
│
├─ Recording
│  ├─ Blood Pressure Unit
│  ├─ Pulse Input
│  ├─ Time Period Policy
│  └─ Confirm Before Save
│
├─ Reminder
│  ├─ Reminder List
│  ├─ Notification Permission
│  ├─ Time
│  ├─ Days
│  └─ Time Period
│
├─ Data / Backup
│  ├─ Export
│  ├─ Backup
│  ├─ Restore
│  └─ Delete All Data
│
├─ Privacy
│  ├─ App Lock
│  ├─ Biometric
│  ├─ AI
│  ├─ Data Consent
│  └─ Privacy Policy
│
└─ About
   ├─ App Version
   ├─ Terms
   ├─ Licenses
   └─ Contact
```

ExportはData / Backupカテゴリのデータ活用領域、BackupとRestoreはData / Backupカテゴリのデータ保護領域、PrivacyはPrivacyカテゴリに属する。

## 8. Supporting / Secondary Information Areas

Main Navigationに含まれない補助領域は、意味に応じて次のように整理する。

| カテゴリ | 情報領域 | 役割 |
|---|---|---|
| Entry / System | Splash | 起動時の初期化と初期状態判定 |
| Entry / System | Onboarding | アプリ価値、基本操作、Privacy、任意Permissionの説明 |
| Entry / System | Initial Settings | 初回の基本設定 |
| Supporting Feature | Reminder | 測定習慣を支援する通知情報 |
| Data Management | Export | PDF / CSVとして記録を活用する情報 |
| Data Management | Backup | 記録と設定を保護する情報 |
| Data Management | Restore | 復元前確認と復元対象情報 |
| Privacy | Privacy | AI、Backup、外部送信、同意を利用者向けに説明する情報 |
| Optional AI | AI Summary | 記録や統計を元にした補助的な振り返り情報 |

AI Summaryは任意機能であり、主要な記録、確認、出力、バックアップの完了に必須ではない。

## 9. Screen Category Map

Screen IDは`docs/09_AI_Context/SCREEN_CONTEXT.md`を正本として整理する。

### Entry / System

| Screen ID | Screen |
|---|---|
| SCR-001 | Splash |
| SCR-002 | Onboarding |

### Core

| Screen ID | Screen |
|---|---|
| SCR-010 | Home |
| SCR-030 | History |
| SCR-040 | Graph |
| SCR-050 | Statistics |
| SCR-090 | Settings |

### Recording

| Screen ID | Screen |
|---|---|
| SCR-020 | Blood Pressure Input |
| SCR-021 | Multiple Measurement |
| SCR-022 | Record Confirmation |
| SCR-031 | Record Detail |
| SCR-032 | Record Edit |

### Supporting

| Screen ID | Screen |
|---|---|
| SCR-060 | Reminder |
| SCR-070 | Export |
| SCR-080 | Backup |
| SCR-081 | Restore |
| SCR-091 | Privacy |
| SCR-100 | AI Summary |

## 10. Cross-Feature Information Relationships

Blood Pressure Recordingを中心に、各情報領域は次のように関係する。

```text
Blood Pressure Recording
├─ Home
│  ├─ Latest Record
│  ├─ Today Status
│  └─ Quick Summary
│
├─ History
│  ├─ Record List
│  ├─ Filter / Sort
│  └─ Detail / Edit / Delete
│
├─ Graph
│  ├─ Period Records
│  ├─ SYS / DIA / Pulse
│  └─ Data Point
│
├─ Statistics
│  ├─ Average
│  ├─ Count
│  ├─ Min / Max
│  └─ Comparison
│
├─ Export
│  ├─ Period Records
│  ├─ Summary
│  └─ Output Selection
│
├─ Backup
│  ├─ Records
│  ├─ Settings
│  └─ Reminders
│
└─ AI Summary
   ├─ Local Statistics
   ├─ Target Period
   └─ Generated Summary
```

Settingsは、次の情報に影響する。

| Settings領域 | 影響する情報 |
|---|---|
| Recording Policy | Input、Multiple Measurement、History、Graph、Statistics |
| Reminder | Home、Reminder |
| Display | Home、History、Graph、Statistics、Settings |
| AI | AI Summary、Home、Graph、Statistics、Export |
| Backup | Backup、Restore |
| Privacy | AI、Backup、Export、Data Consent |

ここでは、どの情報がどこで利用されるかだけを示す。

## 11. Information Priority

Information Priorityは`docs/00_Project/AppConcept.md`の順序を優先する。

1. 血圧値
2. 日付・時間帯
3. 継続状況
4. 傾向
5. 補助情報

画面ごとの情報整理では、この順序を基準にする。Homeでは記録開始Actionが最重要操作として扱われるが、情報そのものの優先順位は血圧値を最上位とする。

## 12. MVP Boundary

MVP範囲は`docs/01_Requirements/FeatureIndex.md`を正本とする。

### MVPに必須

| Feature ID | Feature | IA上の位置付け |
|---|---|---|
| F001 | 血圧記録 | 中心情報領域 |
| F002 | ホームダッシュボード | Main Navigation / Home |
| F003 | 履歴 | Main Navigation / History |
| F004 | グラフ | Main Navigation / Graph |

### MVPで実装を推奨

| Feature ID | Feature | IA上の位置付け |
|---|---|---|
| F005 | 統計 | Main Navigation / Statistics |
| F006 | 測定リマインダー | Supporting / Reminder |
| F007 | PDF・CSV出力 | Data Management / Export |
| F008 | バックアップ・復元 | Data Management / Backup / Restore |
| F009 | 設定 | Main Navigation / Settings |
| F011 | 測定時間帯分類 | Recording、History、Graph、Statisticsを支える分類情報 |

### MVP判断が必要

| Feature ID | Feature | IA上の位置付け |
|---|---|---|
| F010 | 測定継続状況 | Home、Statisticsの補助情報 |
| F012 | 記録検索・絞り込み | Historyの探索補助 |
| F107 | 複数回測定の集約 | RecordingのMultiple Measurement構造。平均値をデフォルト代表値とし、必要に応じて個別測定を代表値として選択する |

F107はRecording Featureの情報構造と強く関係するが、FeatureIndex上はMVP判断が必要な機能として扱う。

## 13. Future Expansion Boundary

Future機能は、現MVPの必須画面として追加しない。

| 領域 | Future候補 |
|---|---|
| 外部データ連携 | Health Connect、Apple Health、Bluetooth血圧計、スマートウォッチ |
| 入力補助 | OCR入力、音声入力 |
| 同期・共有 | Cloud Sync、医療機関向け共有 |
| 利用者管理 | Multi Profile、Family Account |
| 高度な振り返り | Advanced AI、週間・月間要約、AI傾向要約 |
| 情報拡張 | 健康メモ、タグ管理、高度な検索、表示モード切替 |

これらは将来拡張として、現時点のMain NavigationやMVPのScreen Category Mapへ追加しない。

## 14. Figma / Flutter Mapping Boundary

Information Architectureは、後続作業の起点である。

```text
Information Architecture
↓
Navigation Flow
↓
Screen List
↓
Screen Specification
↓
Wireframe
↓
Figma
↓
Flutter
```

本ドキュメントでは、具体的な画面部品名、状態管理名、ファイル名、パス文字列、Figma上の部品名は定義しない。

## 15. Open Issues

既存資料だけでは、次の事項は未確定または表記揺れが残る。

| Issue | 内容 | 対応方針 |
|---|---|---|
| Screen ID表記 | SCREEN_CONTEXT.mdはSCR形式、ScreenList.mdと個別Screen仕様はSC形式でScreen IDを記載している。 | 本ドキュメントではSCREEN_CONTEXT.mdを正本としてSCR形式を使用する。後続のScreen List Reviewで統一を検討する。 |
| AI SummaryのFeature ID | FeatureIndex.mdではAI傾向要約はF102、SCREEN_CONTEXT.mdの依存機能ではF201 AI Summaryと記載されている一方、FeatureIndex.mdのF201はBluetooth血圧計連携である。 | 本ドキュメントではAI Summaryに新しいFeature IDを割り当てない。Feature ID統一は別タスクで確認する。 |
| AI SummaryのEntry Point | SCREEN_CONTEXT.mdではHome、Graph、Statistics、ExportからのEntryが示されているが、MVPでの採用範囲は確定していない。 | Optional AIとして扱い、MVP必須情報構造には含めない。 |
| Tablet時Navigation | Navigation.mdでは将来拡張としてNavigation Rail等が示されているが、Phase 3.5時点のIAでは詳細を確定しない。 | 後続のNavigation FlowまたはResponsive設計で検討する。 |
| Averageの丸めRule | Multiple MeasurementのAverageについて、具体的な丸めRuleは既存の正本で確定していない。 | 後続のRequirementまたはScreen Specificationで決定する。 |
