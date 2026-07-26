# BloodPressureApp

Flutterで開発する、日常利用に特化した血圧管理アプリです。

このプロジェクトでは、使いやすさ、アクセシビリティ、データの安全性、保守性を重視し、AIとCodexを活用しながら段階的に開発を進めます。

---

## 1. プロジェクトの目的

BloodPressureAppは、血圧を毎日記録する人が、できるだけ迷わず、負担なく継続利用できることを目指します。

主な目的は次のとおりです。

- 最高血圧、最低血圧、脈拍を簡単に記録できる
- 複数回測定や平均値、採用値など、実際の測定習慣に対応できる
- 記録履歴やグラフから変化を確認できる
- PDFやCSVで医師や家族と共有できる
- 文字サイズやボタンサイズなどを利用者に合わせて調整できる
- 広告に依存せず、安心して利用できる
- AIを補助的かつ安全に活用できる
- 長期的に保守・拡張しやすいFlutterアプリとして構築する

本アプリは医療診断を行うものではありません。

---

## 2. 現在の開発状況

現在の基本状態は次のとおりです。

- 設計ドキュメント作成済み
- Flutter実装開始フェーズ
- Repository初期構築中
- 最初の主要実装対象はF001「血圧記録」
- 一度に全機能を実装せず、Vertical Sliceで段階的に進める

最新の進捗は、Issue、Pull Request、各Feature文書、またはRelease関連文書を確認してください。

---

## 3. 重要な入口

> **注意**: 開発を開始する前に、まず `START_HERE.md` を読み、その後 `AGENTS.md` を確認してください。READMEはプロジェクト紹介を目的とし、実装ルールの正本ではありません。


このRepositoryで作業を始める場合は、最初に次のファイルを確認してください。

1. [`START_HERE.md`](./START_HERE.md)
2. [`AGENTS.md`](./AGENTS.md)
3. [`docs/09_AI_Context/PROJECT.md`](./docs/09_AI_Context/PROJECT.md)
4. [`docs/09_AI_Context/AGENTS.md`](./docs/09_AI_Context/AGENTS.md)
5. [`docs/09_AI_Context/DESIGN_RULES.md`](./docs/09_AI_Context/DESIGN_RULES.md)
6. [`docs/09_AI_Context/CODING_RULES.md`](./docs/09_AI_Context/CODING_RULES.md)
7. [`docs/09_AI_Context/SCREEN_CONTEXT.md`](./docs/09_AI_Context/SCREEN_CONTEXT.md)

AI、Codex、開発者のいずれも、仕様を推測する前に既存ドキュメントを確認してください。

---

## 4. 採用技術

基本技術構成は次のとおりです。

- Flutter Stable
- Dart Stable
- Material 3
- Riverpod
- GoRouter
- Drift
- Feature First Architecture
- Design Token
- Figma Desktop
- Figma Dev Mode
- Unit Test
- Widget Test
- Golden Test
- Integration Test

パッケージやバージョンの詳細は、以下を参照してください。

- [`docs/06_Flutter/Packages.md`](./docs/06_Flutter/Packages.md)
- [`pubspec.yaml`](./pubspec.yaml)

---

## 5. アーキテクチャ方針

本プロジェクトではFeature First Architectureを採用します。

想定する基本構成は次のとおりです。

```text
lib/
  app/
  core/
  shared/
  features/
    recording/
      domain/
      application/
      data/
      presentation/
```

実際の構成は、次の文書を正としてください。

- [`docs/06_Flutter/Architecture.md`](./docs/06_Flutter/Architecture.md)
- [`docs/06_Flutter/FolderStructure.md`](./docs/06_Flutter/FolderStructure.md)

依存方向の基本方針は次のとおりです。

```text
presentation
    ↓
application
    ↓
domain

data
    ↓
domain
```

Domain層は、Flutter、Riverpod、DriftなどのFrameworkへ依存させません。

---

## 6. Repository構成

想定するRepository構成は次のとおりです。

```text
blood_pressure_app/
├─ AGENTS.md
├─ README.md
├─ START_HERE.md
├─ pubspec.yaml
├─ analysis_options.yaml
├─ lib/
├─ test/
├─ integration_test/
├─ assets/
└─ docs/
```

ドキュメント構成は次のとおりです。

```text
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
```

---

## 7. ドキュメント一覧

### 7.1 Project

```text
docs/00_Project/
├─ Vision.md
└─ Roadmap.md
```

プロジェクトの目的、背景、方向性、開発ロードマップを定義します。

### 7.2 Requirements

```text
docs/01_Requirements/
├─ Feature.md
└─ Requirements.md
```

機能要件、Acceptance Criteria、制約を定義します。

### 7.3 UX

```text
docs/02_UX/
├─ UserFlow.md
├─ Navigation.md
└─ ScreenList.md
```

ユーザーフロー、画面遷移、画面一覧を定義します。

### 7.4 Screens

```text
docs/03_Screens/
├─ Home.md
├─ Input.md
├─ History.md
├─ Graph.md
└─ Settings.md
```

各画面の表示内容、状態、操作、例外ケースを定義します。

### 7.5 Design System

```text
docs/04_DesignSystem/
├─ Colors.md
├─ Typography.md
├─ Components.md
├─ Animation.md
└─ Emotion.md
```

UIの色、文字、共通Component、Animation、感情設計を定義します。

### 7.6 AI

```text
docs/05_AI/
├─ Prompt.md
└─ AIWorkflow.md
```

AI機能のPrompt設計、安全性、データフロー、Fallbackを定義します。

### 7.7 Flutter

```text
docs/06_Flutter/
├─ Architecture.md
├─ FolderStructure.md
└─ Packages.md
```

Flutter実装方針、Directory構成、依存パッケージを定義します。

### 7.8 Test

```text
docs/07_Test/
└─ TestPlan.md
```

Unit Test、Widget Test、Golden Test、Integration Testの方針を定義します。

### 7.9 Release

```text
docs/08_Release/
└─ ReleaseChecklist.md
```

Release前に必要な確認項目を定義します。

### 7.10 AI Context

```text
docs/09_AI_Context/
├─ AGENTS.md
├─ PROJECT.md
├─ DESIGN_RULES.md
├─ CODING_RULES.md
├─ SCREEN_CONTEXT.md
└─ PROMPTS.md
```

ChatGPT、Codex、その他AIエージェントが作業するための共通Contextを定義します。

---

## 8. 開発環境

### 8.1 推奨環境

- Windows 11
- Flutter Stable
- Dart Stable
- Android Studio
- Visual Studio Code
- Git
- GitHub
- Codex
- Figma Desktop

iOSのBuildにはmacOSとXcodeが必要です。

### 8.2 環境確認

```bash
flutter doctor -v
flutter --version
dart --version
```

接続中のDeviceを確認します。

```bash
flutter devices
```

---

## 9. セットアップ

Repositoryを取得します。

```bash
git clone <repository-url>
cd blood_pressure_app
```

依存関係を取得します。

```bash
flutter pub get
```

コード生成が必要な場合は、プロジェクトで指定されたコマンドを実行します。

```bash
dart run build_runner build --delete-conflicting-outputs
```

環境設定ファイルやSecretが必要な場合は、Repository内のTemplateまたはRelease文書を確認してください。

API KeyやSecretをGitへCommitしないでください。

---

## 10. アプリの起動

基本的な起動コマンドは次のとおりです。

```bash
flutter run
```

FlavorまたはEntry Pointを分ける場合は、実装済みの構成に合わせて実行してください。

例：

```bash
flutter run -t lib/main_development.dart
```

利用可能なEntry PointやFlavorは、実際のRepository構成を確認してください。

---

## 11. 品質確認コマンド

実装後は、原則として次を実行します。

### Format

```bash
dart format .
```

### Analyze

```bash
flutter analyze
```

### Test

```bash
flutter test
```

### Integration Test

```bash
flutter test integration_test
```

実行可能なPlatformやDeviceが必要な場合があります。

Testを実行できなかった場合は、未実行の理由を明示してください。

---

## 12. 開発フロー

標準的な作業フローは次のとおりです。

1. 対象Issueまたはタスクを確認する
2. `START_HERE.md`と`AGENTS.md`を確認する
3. 対象FeatureのRequirementを確認する
4. 対象Screen仕様を確認する
5. 関連するDesign Systemを確認する
6. 影響範囲を調査する
7. 小さな単位で実装する
8. Testを追加または更新する
9. Format、Analyze、Testを実行する
10. Diffを確認する
11. Documentationを更新する
12. CommitまたはPull Requestを作成する

Scope外の機能を同時に実装しないでください。

---

## 13. 推奨実装順序

開発は原則として次の順序で進めます。

1. Repository監査
2. Flutter開発環境確認
3. Flutterプロジェクト初期化
4. Folder Structure作成
5. Riverpod、GoRouter、Themeの最小構成
6. Design System Foundation
7. F001「血圧記録」のDomain層
8. F001のData層
9. F001のApplication層
10. F001のInput画面
11. Home画面への最新記録表示
12. History
13. Graph
14. Statistics
15. Settings
16. Reminder
17. Export
18. Backup
19. AI機能
20. Release準備

ユーザーまたはIssueで別の順序が指定されている場合は、その指示を優先してください。

---

## 14. 最初のVertical Slice

最初の主要実装対象はF001「血圧記録」です。

最初のVertical Sliceでは、少なくとも以下を実現します。

```text
Input
↓
Validation
↓
Domain
↓
UseCase
↓
Repository
↓
Drift
↓
Save
↓
Reload
↓
Latest Record
```

初期完了条件の例は次のとおりです。

- 最高血圧を入力できる
- 最低血圧を入力できる
- 脈拍を入力できる
- 入力Validationが動作する
- Local Databaseへ保存できる
- アプリ再起動後も記録が残る
- 最新記録を取得できる
- Error Stateを表示できる
- Unit Testがある
- Widget Testがある
- `flutter analyze`が成功する
- `flutter test`が成功する

詳細は対象Requirementを参照してください。

---

## 15. Design System

画面実装では、Design Tokenと共通Componentを使用してください。

次のような直接指定を避けます。

```dart
Color(0xFF123456)
EdgeInsets.all(13)
BorderRadius.circular(11)
TextStyle(fontSize: 17)
```

原則として、Theme、Token、共通Widgetを利用します。

アクセシビリティでは、少なくとも次を考慮します。

- 文字サイズ拡大
- 十分なTap Target
- Contrast
- Semantics
- Screen Reader
- Focus順
- 色だけに依存しない状態表現
- Reduce Motion
- 高齢者にも読みやすい情報設計

---

## 16. Health DataとPrivacy

血圧記録は個人性の高い健康情報です。

以下を守ってください。

- 血圧値を平文Logへ出力しない
- Test Dataへ実在人物の情報を使用しない
- API KeyやSecretをCommitしない
- 外部送信前に同意を確認する
- 必要最小限のデータだけを送信する
- Analyticsへ健康値を送信しない
- ExportやBackupの取扱いを明確にする
- ScreenshotやError Reportへの個人情報混入を考慮する

---

## 17. AI機能の方針

AIは補助機能として扱います。

以下を前提とします。

- AIは診断を行わない
- 服薬変更や治療を断定的に指示しない
- AI出力であることを明示する
- AIが失敗しても主要機能を利用できる
- AIへ送信するデータを最小限にする
- Prompt Injectionを考慮する
- AI出力を検証済み医療情報として扱わない
- 緊急性に関する表示は設計済みルールに従う

詳細は次を参照してください。

- [`docs/05_AI/Prompt.md`](./docs/05_AI/Prompt.md)
- [`docs/05_AI/AIWorkflow.md`](./docs/05_AI/AIWorkflow.md)
- [`docs/09_AI_Context/PROMPTS.md`](./docs/09_AI_Context/PROMPTS.md)

---

## 18. GitとCommit

Commitは1つの目的に絞ります。

例：

```text
chore: initialize Flutter project structure
feat(design): add application design tokens
feat(recording): add blood pressure domain model
feat(recording): add Drift repository
test(recording): add record validation tests
fix(history): handle empty record list
docs: update F001 implementation status
```

避けるべき例：

```text
update
fix
various changes
all implementation
```

Pull Requestには、少なくとも次を含めます。

- 目的
- 主な変更
- 対象外
- Test結果
- Screenshotまたは動画
- 既知の制約
- 関連Issue

---

## 19. Definition of Done

タスクは原則として以下を満たした時点で完了です。

- 対象Requirementを満たしている
- Acceptance Criteriaを満たしている
- Architectureに準拠している
- Design Systemに準拠している
- Accessibilityを考慮している
- 必要なTestがある
- `dart format`が完了している
- `flutter analyze`が成功している
- `flutter test`が成功している
- 必要なDocumentationが更新されている
- Secretや個人情報が含まれていない
- 不要な変更が含まれていない
- Diffがレビュー可能な大きさである

---

## 20. Codexへ依頼するときの基本形式

Codexへの依頼は、次の要素を含めます。

```text
目的:
参照ドキュメント:
対象範囲:
対象外:
制約:
Test方針:
実行コマンド:
完了条件:
```

例：

```text
BloodPressureAppのF001 Domain層を実装してください。

参照:
- START_HERE.md
- AGENTS.md
- docs/09_AI_Context/PROJECT.md
- docs/09_AI_Context/CODING_RULES.md
- 対象Requirement
- docs/06_Flutter/Architecture.md

対象:
- Entity
- Value Object
- Repository Interface
- Unit Test

対象外:
- Drift
- Riverpod
- UI
- Navigation

制約:
- DomainはFlutter非依存
- 既存Architectureを変更しない
- 仕様を推測しない

完了条件:
- flutter analyze成功
- flutter test成功
```

---

## 21. 新しいAIセッションの開始文

新しいChatGPTまたはCodexセッションでは、次のように開始します。

```text
このRepositoryはBloodPressureAppです。

最初に以下を確認してください。

1. START_HERE.md
2. AGENTS.md
3. README.md
4. docs/09_AI_Context/PROJECT.md
5. docs/09_AI_Context/AGENTS.md
6. docs/09_AI_Context/DESIGN_RULES.md
7. docs/09_AI_Context/CODING_RULES.md
8. docs/09_AI_Context/SCREEN_CONTEXT.md
9. 対象機能のRequirement
10. 対象画面の仕様

今回は指定したタスクだけを実施してください。
仕様を推測せず、実装後は必要なTestと検証を行ってください。
```

---

## 22. 注意事項

以下を避けてください。

- 仕様書を確認せずに実装する
- Architectureを独断で変更する
- Design Systemを無視する
- UIへBusiness Logicを書く
- Domain層をFlutterへ依存させる
- Generated Codeを直接編集する
- Testを削除してBuildを通す
- Analyze警告を無効化して問題を隠す
- 未実行のTestを成功と報告する
- 医療診断を断定表示する
- Health DataをLogへ出力する
- API KeyやSecretをCommitする
- Scope外の機能を先回りして実装する

---

## 23. License

Licenseはプロジェクト方針に従って設定してください。

公開Repositoryにする場合は、Licenseの有無と適用範囲を明確にしてください。

---

## 24. Contact

開発方針、仕様、Design、AI運用に関する判断は、RepositoryのIssue、Discussion、Pull Request、またはプロジェクト管理者の指示を確認してください。

重大な仕様矛盾や医療・Privacy上の懸念がある場合は、独断で実装を進めず、影響と選択肢を整理してください。
