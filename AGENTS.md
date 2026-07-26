# AGENTS.md

# BloodPressureApp AI・Codex作業ガイド

このファイルは、BloodPressureAppリポジトリのルート直下に配置する、AIエージェントおよびCodex向けの作業指示書です。

このリポジトリで作業するAIエージェントは、実装・修正・レビューを開始する前に、本ファイルと指定された設計ドキュメントを確認してください。

---

## 1. プロジェクト概要

BloodPressureAppは、Flutterで開発する血圧管理アプリです。

主な目的は次のとおりです。

- 血圧を毎日、簡単かつ気持ちよく記録できること
- 高齢者を含む幅広い利用者にとって見やすく、操作しやすいこと
- 複数回測定、平均値、採用値など、実際の血圧測定習慣に対応すること
- 広告に依存せず、安心して継続利用できること
- 医師への共有に利用できるPDF・CSV出力に対応すること
- AIを安全かつ補助的に活用すること
- 長期的に保守・拡張しやすいFlutterアーキテクチャを採用すること

医療診断を行うアプリではありません。表示文言やAI出力では、診断・治療の断定を避けてください。

---

## 2. 現在の開発フェーズ

現在の基本状態は次のとおりです。

- 設計ドキュメント作成済み
- Flutter実装開始フェーズ
- 仕様書を正として実装する
- 最初の主要実装対象はF001「血圧記録」
- 一度にアプリ全体を実装せず、小さなタスク単位で進める

現在の進捗がドキュメントやIssueで更新されている場合は、最新の記載を優先してください。

---

## 3. 必須の読み込み順

作業開始前に、原則として以下を順番に確認してください。

1. `START_HERE.md`
2. ルートの本ファイル `AGENTS.md`
3. `docs/09_AI_Context/PROJECT.md`
4. `docs/09_AI_Context/AGENTS.md`
5. `docs/09_AI_Context/DESIGN_RULES.md`
6. `docs/09_AI_Context/CODING_RULES.md`
7. `docs/09_AI_Context/SCREEN_CONTEXT.md`
8. `docs/06_Flutter/Architecture.md`
9. `docs/06_Flutter/FolderStructure.md`
10. `docs/06_Flutter/Packages.md`
11. `docs/07_Test/TestPlan.md`
12. 作業対象に対応するRequirements
13. 作業対象に対応するScreen仕様
14. 関連するDesign System文書

すべての作業で全ファイルを読み直す必要はありませんが、対象機能に関係する文書は必ず確認してください。

---

## 4. ドキュメントの優先順位

仕様に矛盾や不明点がある場合は、以下の優先順位で判断してください。

1. ユーザーが現在のタスクで明示した指示
2. `START_HERE.md`
3. ルートの`AGENTS.md`
4. `docs/09_AI_Context/`配下のAI Context
5. `docs/01_Requirements/`配下のRequirements
6. `docs/03_Screens/`配下のScreen仕様
7. `docs/04_DesignSystem/`配下のDesign System
8. `docs/06_Flutter/`配下のFlutter設計
9. 既存コード
10. 一般的なFlutterの慣習

矛盾を独断で解消しないでください。

重大な矛盾がある場合は、次を明確にしてください。

- 矛盾しているファイル
- 該当する仕様
- 実装への影響
- 推奨する解決案

軽微な不一致は、既存設計との整合性を優先して最小限の修正で対応してください。

---

## 5. 基本技術方針

本プロジェクトでは、原則として以下を採用します。

- Flutter Stable
- Dart Stable
- Material 3
- Riverpod
- GoRouter
- Drift
- Feature First Architecture
- Design TokenによるUI管理
- Figma DesktopおよびDev Modeとの連携
- Unit Test
- Widget Test
- Golden Test
- Integration Test
- Androidを主な初期検証環境とする
- iOS対応を前提に、プラットフォーム固有処理を分離する

パッケージ名やバージョンは、`docs/06_Flutter/Packages.md`と`pubspec.yaml`を確認してください。

依存パッケージを追加する前に、既存機能で代替できないか確認してください。

---

## 6. アーキテクチャ原則

### 6.1 Feature First

機能単位でコードを整理してください。

例：


lib/
  features/
    recording/
      domain/
      application/
      data/
      presentation/


実際のフォルダ名は、`docs/06_Flutter/FolderStructure.md`を正としてください。

### 6.2 依存方向

原則として、依存方向は次のようにします。


presentation
    ↓
application
    ↓
domain

data
    ↓
domain


Domain層は、Flutter、Riverpod、Drift、UI Frameworkへ依存させないでください。

### 6.3 UIとBusiness Logicの分離

Widgetへ次の処理を直接書かないでください。

- 保存処理
- 複雑なValidation
- 集計処理
- Repository操作
- Database操作
- 医療判定ロジック
- AI Prompt生成
- Export処理

Widgetは表示とユーザー操作の通知を中心にしてください。

### 6.4 Repository境界

DomainまたはApplication層ではRepository Interfaceを使用し、Driftなどの具体実装を直接参照しないでください。

### 6.5 Generated Code

以下のような自動生成ファイルを直接編集しないでください。

- `*.g.dart`
- `*.freezed.dart`
- `*.gr.dart`
- その他、生成ツールによって作成されるファイル

必要な変更は生成元へ行い、コード生成コマンドを実行してください。

---

## 7. Design Systemルール

画面実装時は、以下を必ず参照してください。

- `docs/04_DesignSystem/Colors.md`
- `docs/04_DesignSystem/Typography.md`
- `docs/04_DesignSystem/Components.md`
- `docs/04_DesignSystem/Animation.md`
- `docs/04_DesignSystem/Emotion.md`
- `docs/09_AI_Context/DESIGN_RULES.md`

次を避けてください。

- 色の直接指定
- 余白値の乱立
- Border Radiusの画面ごとの独自定義
- TextStyleの画面内直接定義
- 共通Buttonと同等の独自Widget作成
- Design Tokenを無視した固定値
- 意味のないAnimation
- 高齢者が読みづらい小さな文字
- 色だけで状態を伝える表現

アクセシビリティを考慮し、次を確認してください。

- Text Scale拡大時のレイアウト
- 十分なTap Target
- Semantics
- Contrast
- Focus順
- Screen Readerで理解できるLabel
- Reduce Motion設定
- Errorを色だけに依存せず伝えること

---

## 8. 血圧記録に関する重要原則

血圧記録では、少なくとも次の値を明確に区別してください。

- 最高血圧
- 最低血圧
- 脈拍
- 測定日時
- 朝・昼・夜などの時間帯
- 1回の測定値
- 複数回測定のSession
- 平均値
- 最後の測定値
- 最低値
- ユーザーが選択した採用値

`null`と`0`を同一視しないでください。

脈拍がOptionalの場合、未入力を`0`として保存しないでください。

入力範囲、Validation、集計方法はRequirementsを正としてください。

医療上の「正常」「異常」を独自に判定しないでください。ユーザー設定のしきい値や設計済みの表示ルールを使用し、診断表現を避けてください。

---

## 9. AI機能に関する安全原則

AI機能を実装する場合は、以下を必須とします。

- AIは診断を行わない
- 医療行為や服薬変更を断定的に指示しない
- 緊急性が疑われる場合の一般的な安全案内を設計に従って表示する
- 個人データの送信前に同意を確認する
- 必要最小限のデータのみ送信する
- 機密情報をLogへ出力しない
- Prompt Injectionを考慮する
- AI出力を信頼済みデータとして保存しない
- AI失敗時のFallbackを用意する
- AI出力であることを利用者に明示する
- AIを使用しなくても主要機能を利用可能にする

詳細は以下を参照してください。

- `docs/05_AI/Prompt.md`
- `docs/05_AI/AIWorkflow.md`
- `docs/09_AI_Context/PROMPTS.md`

---

## 10. Codexの標準作業フロー

各タスクでは、次の順番で作業してください。

### 10.1 調査

1. 対象ドキュメントを読む
2. 対象コードを確認する
3. 既存Testを確認する
4. 影響範囲を特定する
5. 不要な変更を避ける

### 10.2 実装計画

実装前に、少なくとも次を整理してください。

- 目的
- 対象ファイル
- 変更範囲
- 対象外
- Test方針
- 完了条件
- リスク

### 10.3 実装

- 最小差分で変更する
- 既存の命名規則へ合わせる
- 共通処理を再利用する
- 不要なRefactoringを同時に行わない
- Scope外の機能を実装しない
- Temporary Codeを残さない

### 10.4 検証

原則として次を実行してください。

bash
dart format .
flutter analyze
flutter test


コード生成が必要な場合は、プロジェクトで指定されたコマンドを使用してください。

例：

bash
dart run build_runner build --delete-conflicting-outputs


Golden TestやIntegration Testが対象の場合は、関連するコマンドも実行してください。

### 10.5 報告

作業完了時は、次を簡潔に報告してください。

- 変更内容
- 主な変更ファイル
- 実行したTest
- Test結果
- 未実施の確認
- 既知の制約
- 次の推奨タスク

Testを実行できなかった場合は、成功したと記載せず、理由を明示してください。

---

## 11. タスク分割ルール

1つのタスクを大きくしすぎないでください。

良いタスク例：

- Flutterプロジェクトの初期Scaffold作成
- Design Tokenの実装
- BloodPressureRecord Entityの実装
- Value ObjectのValidation実装
- Drift Tableの実装
- Repository Interfaceの実装
- Save UseCaseの実装
- Input Controllerの実装
- Input ScreenのWidget Test追加

避けるべき依頼例：

- 血圧管理アプリ全体を実装する
- 全画面とDatabaseとAIを一度に作る
- 仕様確認なしでArchitectureを全面変更する

---

## 12. 推奨実装順序

※ Repository監査・環境確認は、START_HERE.mdで定義されたStep 1に従って実施します。

原則として次の順番で進めてください。

1. Repository監査
2. Flutter開発環境確認
3. Flutterプロジェクト初期化
4. Folder Structure作成
5. Riverpod・GoRouter・Themeの最小構成
6. Design System Foundation
7. F001 Domain層
8. F001 Data層
9. F001 Application層
10. F001 Input画面
11. Home画面との接続
12. History
13. Graph
14. Statistics
15. Settings
16. Reminder
17. Export
18. Backup
19. AI機能
20. Release準備

ユーザーが別のStepを明示した場合は、その指示を優先してください。

---

## 13. F001の最初の完了条件

F001「血圧記録」の最初のVertical Sliceでは、少なくとも以下を満たしてください。

- 最高血圧を入力できる
- 最低血圧を入力できる
- 脈拍を必要に応じて入力できる
- 測定日時を保持できる
- Validationが動作する
- Local Databaseへ保存できる
- アプリ再起動後も記録が残る
- 最新記録を取得できる
- Error時に利用者へ適切に通知できる
- Unit Testがある
- Widget Testがある
- `flutter analyze`が成功する
- `flutter test`が成功する

複数回測定や採用値の詳細は、対象Requirementsに従い段階的に実装してください。

---

## 14. Testルール

Test方針は`docs/07_Test/TestPlan.md`を正とします。

### 14.1 Unit Test

主に次を対象とします。

- Value Object
- Domain Service
- UseCase
- Mapper
- Repository
- Validation
- 集計処理

### 14.2 Widget Test

主に次を対象とします。

- 正常表示
- Empty State
- Loading State
- Error State
- 入力Validation
- Button操作
- Navigation
- Text Scale
- Semantics

### 14.3 Golden Test

Design Systemや主要画面の視覚的Regressionに使用します。

Golden更新を安易に正解扱いしないでください。差分の理由を確認してください。

### 14.4 Integration Test

主なユーザーフローを対象とします。

例：


起動
→ 血圧入力
→ 保存
→ Homeに最新記録表示
→ Historyで確認
→ 編集
→ 削除


### 14.5 Test Double

外部依存、時刻、UUID、Database、AI Clientなどは、必要に応じて差し替え可能な設計にしてください。

---

## 15. コーディングルール

詳細は`docs/09_AI_Context/CODING_RULES.md`を正とします。

最低限、次を守ってください。

- 意味の明確な名前を使う
- 略語を乱用しない
- 1つのClassへ責務を集めすぎない
- 非同期処理のErrorを無視しない
- `dynamic`を安易に使用しない
- `BuildContext`を非同期処理後に無条件で使わない
- 不要な`late`を使わない
- Nullable設計を明確にする
- Magic Numberを避ける
- Public APIへ必要なDocumentationを書く
- Logへ個人情報を出さない
- TODOには理由と追跡可能な情報を付ける
- Dead Codeを残さない

---

## 16. Databaseルール

Driftを使用する場合は次を守ってください。

- Domain EntityとDatabase Rowを分離する
- Mapperを用意する
- 複数Tableの保存はTransactionを検討する
- Migration Strategyを明示する
- Schema Versionを適切に更新する
- 既存データを破壊する変更を避ける
- Migration Testを追加する
- DateTimeのTimezone方針を統一する
- Optional値を不正なDefault値で埋めない
- Deleteの影響範囲を明確にする

---

## 17. Navigationルール

GoRouterを使用する場合は次を守ってください。

- Route名とPathを一元管理する
- 画面内に文字列Pathを散在させない
- Deep Linkを考慮する
- Navigation LogicをBusiness Logicと分離する
- Edit画面などへ渡すIDの扱いを明確にする
- 存在しないIDのError Stateを用意する
- Back操作を考慮する

---

## 18. 状態管理ルール

Riverpodを使用する場合は次を守ってください。

- UIの一時状態とApplication状態を区別する
- Providerの責務を小さくする
- 巨大なGlobal Providerを避ける
- RepositoryをProvider経由で注入する
- TestでProvider Override可能にする
- AsyncValueのLoading・Error・Dataを適切に扱う
- Widget内でRepositoryを直接生成しない
- 自動生成を使う場合は生成元のみ編集する

---

## 19. Error Handling

Errorは握りつぶさないでください。

利用者向けのErrorと、開発者向けのErrorを区別してください。

例：

- Validation Error
- Database Error
- Permission Error
- Export Error
- Backup Error
- Network Error
- AI Error
- Unknown Error

利用者向け文言では、技術的なException名をそのまま表示しないでください。

再試行できる場合は、明確な再試行手段を提供してください。

---

## 20. PrivacyとSecurity

血圧記録は個人性の高い健康情報です。

次を守ってください。

- Health Dataを平文Logへ出さない
- API KeyをRepositoryへCommitしない
- Secretをソースコードへ直書きしない
- Debug DataをProductionへ含めない
- Backup・Exportの取扱いを明確にする
- 外部送信前に同意を確認する
- 必要最小限の権限のみ要求する
- Analyticsへ健康値を送信しない
- Test Fixtureへ実在人物の情報を使わない
- ScreenshotやError Reportに個人情報が含まれる可能性を考慮する

---

## 21. 禁止事項

以下を禁止します。

- 仕様を読まずに実装する
- Architectureを独断で変更する
- Requirementsを無視する
- Design Systemを無視する
- 画面内へBusiness Logicを埋め込む
- Domain層をFlutterへ依存させる
- Generated Codeを直接編集する
- Testを削除してBuildを通す
- Analyze警告を無効化して問題を隠す
- 既存機能を無断で削除する
- 大規模な無関係Refactoringを行う
- Health DataをLogへ出力する
- API KeyやSecretをCommitする
- 医療診断を断定表示する
- AIの回答を検証なしで正しい医療情報として扱う
- 依頼されていない機能を先回りして実装する
- 未実行のTestを「成功」と報告する

---

## 22. Definition of Done

タスクは、原則として以下を満たしたときに完了とします。

- 対象Requirementを満たしている
- Acceptance Criteriaを満たしている
- Architectureに準拠している
- Design Systemに準拠している
- Accessibilityを考慮している
- 必要なTestが追加されている
- `dart format`が完了している
- `flutter analyze`が成功している
- `flutter test`が成功している
- 必要に応じてDocumentationが更新されている
- 不要な変更が含まれていない
- Secretや個人情報が含まれていない
- Diffがレビュー可能な大きさである

環境上実行できない項目がある場合は、その理由と手動確認手順を報告してください。

---

## 23. Git・Commitルール

Commitは1つの目的に絞ってください。

例：


chore: initialize Flutter project structure
feat(design): add application design tokens
feat(recording): add blood pressure domain model
feat(recording): add Drift repository
test(recording): add record validation tests
fix(history): handle empty record list
docs: update F001 implementation status


次を避けてください。

- 大量の無関係変更を1つのCommitへ含める
- `update`や`fix`だけの曖昧なMessage
- Generated Fileだけを理由なくCommitする
- Formatterによる全Repository変更を機能修正と混在させる

---

## 24. 作業開始時の確認テンプレート

AIエージェントは、必要に応じて次の形式で作業を整理してください。


目的:
対象機能:
参照ドキュメント:
変更予定ファイル:
実装範囲:
対象外:
Test方針:
完了条件:
懸念事項:


小規模な変更では簡略化して構いません。

---

## 25. 作業完了時の報告テンプレート


実施内容:
変更ファイル:
追加・更新したTest:
実行コマンド:
結果:
未確認事項:
既知の制約:
次の推奨タスク:


---

## 26. 新しいセッションでの開始方法

新しいChatGPTまたはCodexセッションでは、原則として次を伝えてください。


このRepositoryはBloodPressureAppです。

最初に以下を確認してください。

1. START_HERE.md
2. AGENTS.md
3. docs/09_AI_Context/PROJECT.md
4. docs/09_AI_Context/AGENTS.md
5. docs/09_AI_Context/DESIGN_RULES.md
6. docs/09_AI_Context/CODING_RULES.md
7. docs/09_AI_Context/SCREEN_CONTEXT.md
8. 対象機能のRequirement
9. 対象画面の仕様

今回は指定したタスクだけを実施してください。
仕様を推測せず、実装後は必要なTestと検証を行ってください。


---

## 27. 最終原則

このプロジェクトでは、速さだけではなく、次を重視します。

- 毎日使いやすいこと
- 利用者が不安にならないこと
- データを安全に扱うこと
- 仕様と実装が一致していること
- 小さな変更を積み重ねること
- Testで品質を維持すること
- AIが独断で設計を変えないこと
- 将来の開発者が理解できるコードにすること

迷った場合は、実装量を増やすのではなく、既存ドキュメントへ戻り、最小で安全な変更を選択してください。
