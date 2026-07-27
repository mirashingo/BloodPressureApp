# BloodPressureApp 開発スタートガイド

> このファイルは、BloodPressureApp の開発に参加する人、AI、Codex が最初に読む入口です。  
> Repository全体の概要、正とするドキュメント、開発ルール、作業手順、現在の進捗を確認できます。

---

## 1. プロジェクト概要

BloodPressureApp は、Flutterで開発する血圧管理アプリです。

### 目的

- 血圧を記録する人が、毎日気持ちよく使えること
- 年齢やITスキルに関係なく、迷わず操作できること
- 文字サイズ、ボタンサイズ、表示方法などを利用者に合わせて調整できること
- 複数回測定、平均値、採用値など、実際の血圧測定習慣に対応すること
- 広告に依存せず、安心して利用できること
- AIを活用しながら、品質と保守性を維持して開発すること
- 長期的に機能追加しやすいアーキテクチャを採用すること

---

## 2. 現在の進捗

現在は、以下の状態です。

- 設計フェーズ完了
- Flutter実装開始前
- Repository監査前
- Flutterプロジェクト初期化前
- F001および画面実装前

設計ドキュメントは、以下の分類で作成済みです。

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

実装を始める前に、開発環境、Repository構成、ドキュメント参照パス、AGENTS.mdの配置、Flutter初期化条件を確認します。

---

## 3. 正とするドキュメント

実装、テスト、設計判断、レビューでは、Repository内のドキュメントを正とします。

必ず、次の優先順位で確認してください。

1. `/START_HERE.md`
2. `/AGENTS.md`
3. `/docs/09_AI_Context/PROJECT.md`
4. `/docs/09_AI_Context/AGENTS.md`
5. `/docs/09_AI_Context/DESIGN_RULES.md`
6. `/docs/09_AI_Context/CODING_RULES.md`
7. `/docs/09_AI_Context/SCREEN_CONTEXT.md`
8. 対象FeatureのRequirement
9. 対象Screen仕様
10. 対象FeatureまたはScreenから参照される関連ドキュメント

上位ドキュメントと下位ドキュメントの内容が矛盾する場合は、上位ドキュメントを優先します。

ただし、矛盾を推測で解決してはいけません。  
矛盾箇所、影響範囲、候補となる解決方法を報告し、人間の判断を確認してください。

---

## 4. パス表記ルール

ドキュメント、AI、Codexへの指示では、可能な限りRepositoryルートを基準としたパスを使用します。

### 推奨表記

```text
/AGENTS.md
/docs/09_AI_Context/PROJECT.md
/docs/01_Requirements/
/docs/03_Screens/
```

### 避ける表記

```text
AGENTS.md
PROJECT.md
../PROJECT.md
このフォルダのAGENTS.md
```

同じファイル名が複数の場所に存在するため、ファイル名だけで指定してはいけません。

特に、次の2ファイルを取り違えないでください。

```text
/AGENTS.md
/docs/09_AI_Context/AGENTS.md
```

Markdownリンクとして記述する場合は、リンク元ファイルから見た正しい相対パスを使用します。

---

## 5. Repository構成

Flutterプロジェクト初期化後の基本構成は、次を想定します。

```text
/
├─ START_HERE.md
├─ AGENTS.md
├─ README.md
├─ pubspec.yaml
├─ analysis_options.yaml
├─ docs/
├─ lib/
├─ test/
├─ integration_test/
├─ assets/
└─ .github/
```

ただし、Flutterプロジェクト初期化前に、既存Repositoryの実際の構成を監査してください。

既存ファイルを確認せずに、`flutter create .` を実行してはいけません。

---

## 6. AGENTS.mdの役割

このRepositoryでは、2つのAGENTS.mdを使用します。

### 6.1 `/AGENTS.md`

Repository全体に適用する最上位の作業ルールです。

主な役割は次のとおりです。

- AIとCodexが最初に守る共通ルール
- 正とするドキュメントの優先順位
- 作業前に確認するファイル
- ファイル変更の制限
- 実行してよいコマンド、避けるべきコマンド
- Generated Codeの扱い
- テスト、解析、フォーマットのルール
- Definition of Done
- 変更報告とDiff確認のルール

### 6.2 `/docs/09_AI_Context/AGENTS.md`

BloodPressureApp固有のAI向けコンテキストです。

主な役割は次のとおりです。

- BloodPressureApp固有の設計思想
- 血圧管理アプリとしての注意事項
- FeatureとScreenの確認方法
- UI/UX上の固有ルール
- 医療・健康情報を扱う際の注意
- 仕様判断に必要な背景情報
- AIが避けるべき推測や独自判断

### 6.3 優先順位

両方に記載がある場合は、次の順に優先します。

1. `/AGENTS.md`
2. `/docs/09_AI_Context/AGENTS.md`

同じ内容を両方へ重複して書くことは、可能な限り避けます。  
共通ルールはルート側、プロジェクト固有ルールはAI Context側へ配置します。

---

## 7. 採用技術

原則として、次の技術を使用します。

- Flutter Stable
- Dart
- Material 3
- Riverpod
- GoRouter
- Drift
- Feature First Architecture
- Design Token
- Figma Desktop
- Figma Dev Mode
- Codex中心の開発

追加パッケージを採用する場合は、既存ドキュメントとの整合性、必要性、保守性、生成コードの有無、テストへの影響を確認してください。

仕様に記載されていないパッケージを、AIやCodexの判断だけで追加してはいけません。

---

## 8. Flutter SDKと開発環境

「Flutter Stable」だけでなく、実際に使用するバージョンを記録します。

Flutterプロジェクト初期化時または開発環境確定時に、次を確認してください。

```text
Flutter SDK:
Flutter Channel:
Dart SDK:
Android compileSdk:
Android minSdk:
Java:
Gradle:
iOS Deployment Target:
Xcode:
```

必要に応じてFVMを使用しますが、導入はFlutter Architectureドキュメントと初期化方針を確認してから決定します。

Windows環境ではiOSアプリのビルドと実機確認ができないため、Android開発環境とiOS確認環境を分けて管理します。

---

## 9. アーキテクチャ原則

### 9.1 Feature First

機能単位でコードを整理します。

```text
lib/
├─ app/
├─ core/
├─ design_system/
├─ shared/
└─ features/
```

実際のフォルダ構成は、`/docs/06_Flutter/` および `/docs/09_AI_Context/CODING_RULES.md` を正とします。

`design_system/` はColor、Typography、Spacing、Theme、Design Token、再利用可能なUI Componentを配置します。
`shared/` は複数Featureで共有するWidget、Extension、Formatter、Validator、Utility、デザインシステムに属さない共通処理を配置します。

### 9.2 Domain層

- Domain層をFlutterに依存させない
- Widget、BuildContext、Color、TextStyleなどをDomain層へ持ち込まない
- 永続化方式やUIフレームワークの詳細をDomain層へ持ち込まない
- Use Case、Entity、Value Object、Repository Interfaceを適切に分離する

### 9.3 UI層

- UIへBusiness Logicを書かない
- Widget内で直接DB操作を行わない
- Widget内で複雑なValidationや集計処理を行わない
- 状態管理、Use Case、Domain Serviceへ責務を分離する
- Design Tokenを使用し、任意の色、余白、文字サイズを直接指定しない

### 9.4 Data層

- Driftを利用する
- DomainのRepository Interfaceを実装する
- DB ModelとDomain Entityを必要に応じて分離する
- Migrationを考慮する
- 永続化処理をUIから直接呼び出さない

---

## 10. Design System運用

UIは、Design SystemとDesign Tokenを正として実装します。

次の値を各Widgetへ直接書かず、定義済みTokenを使用します。

- Color
- Typography
- Spacing
- Radius
- Border
- Shadow
- Icon Size
- Component Size
- Animation Duration

FigmaとFlutterの対応関係は、Design SystemドキュメントとDesign Rulesを確認してください。

Figma上に存在する値でも、Flutter側のDesign Tokenへ定義されていない場合は、独自に追加せず、差分として報告してください。

---

## 11. Generated Codeの扱い

Generated Codeを直接編集してはいけません。

対象例：

- Riverpod Generator
- Drift Generator
- Freezed
- JSON Serialization
- その他のコード生成ツール

修正が必要な場合は、生成元ファイル、Annotation、設定ファイルを変更し、正式な生成コマンドを実行します。

生成ファイルを直接編集して、一時的にエラーを回避してはいけません。

---

## 12. コード提示ルール

新規ファイルを作成する場合、またはファイル全体を置換する場合は、コンパイル可能な完全なコードを作成します。

次のような省略は行いません。

```dart
// 省略
// 以下同様
// TODO: 実装
...
```

ただし、設計説明、Diffレビュー、問題箇所の説明では、必要な範囲だけを引用して構いません。

---

## 13. テスト方針

実装と同時にテストを追加します。

対象に応じて、次を使用します。

- Unit Test
- Widget Test
- Integration Test
- Repository Test
- Use Case Test
- Validation Test
- Golden Test

すべての変更にIntegration Testが必要という意味ではありません。  
Requirement、Acceptance Criteria、Testドキュメントに従って、適切なテストレベルを選択します。

実装だけを先に大量に進め、最後にまとめてテストを書く進め方は避けます。

---

## 14. 実装後の基本確認

コード変更後は、原則として次を実行します。

```bash
dart format .
flutter analyze
flutter test
```

コード生成が必要な場合は、正式な生成コマンドを先に実行します。

例：

```bash
dart run build_runner build --delete-conflicting-outputs
dart format .
flutter analyze
flutter test
```

実際のコマンドは、Repository内のCoding Rules、README、Makefile、スクリプトを優先します。

コマンドが失敗した場合は、失敗を隠さず、次を報告します。

- 実行したコマンド
- 終了結果
- エラー内容
- 原因
- 修正内容
- 未解決事項

---

## 15. Codex運用ルール

Codexでは、1タスクを小さく分けて実施します。

基本手順は次のとおりです。

1. 正とするドキュメントを読む
2. 対象RequirementとScreen仕様を読む
3. 現在の実装とテストを確認する
4. 変更対象と非対象を整理する
5. 小さな実装計画を提示する
6. 必要最小限の変更を行う
7. テストを追加または更新する
8. コード生成が必要なら実行する
9. `dart format`を実行する
10. `flutter analyze`を実行する
11. `flutter test`を実行する
12. Diffを確認する
13. 変更内容と未解決事項を報告する

一度に複数Featureを実装してはいけません。

---

## 16. 仕様判断ルール

仕様を推測してはいけません。

不明点がある場合は、次の順で確認します。

1. `/START_HERE.md`
2. `/AGENTS.md`
3. `/docs/09_AI_Context/`
4. 対象Feature Requirement
5. 対象Screen仕様
6. UXドキュメント
7. Design System
8. Flutter Architecture
9. Testドキュメント
10. Releaseドキュメント

それでも判断できない場合は、次を整理して報告します。

- 不明な仕様
- 関連するドキュメント
- 影響するFeatureまたはScreen
- 実装可能な選択肢
- 各選択肢の利点と欠点
- 推奨案

人間の判断を得る前に、仕様を独自に確定してはいけません。

---

## 17. 最初の作業順序

Flutterプロジェクト初期化より先に、監査を実施します。

### Step 1：開発環境・Repository・ドキュメント監査

1. 開発環境確認
2. Git Repository確認
3. Repository構成確認
4. 必須ドキュメントの存在確認
5. ドキュメント参照パス確認
6. AGENTS.mdの配置と役割確認
7. Flutter初期化条件の不足確認
8. Blockerと次タスクの整理

この段階では、次を行いません。

- `flutter create`
- パッケージ追加
- `pubspec.yaml`変更
- F001実装
- 画面実装
- Router実装
- Provider実装
- Drift実装
- Design System実装
- 自動的なドキュメント修正

### Step 2：監査結果に基づく修正

Step 1の監査結果を人間が確認した後、タスクを分割して実施します。

```text
Step 2A：参照パス修正
Step 2B：AGENTS.md整理
Step 2C：Flutter初期化パラメータ確定
Step 2D：Flutterプロジェクト初期化
Step 2E：初期状態のformat・analyze・test確認
```

### Step 3：開発基盤

- Folder構成
- App Shell
- GoRouter基盤
- Riverpod基盤
- Drift基盤
- Design Token
- Theme
- Error Handling
- Logging
- Test基盤
- CI

### Step 4以降：Feature実装

開発基盤が完了してから、Feature実装へ進みます。

---

## 18. 推奨実装順

```text
Milestone 0：開発基盤
Milestone 1：F001 Blood Pressure Recording
Milestone 2：History
Milestone 3：Graph
Milestone 4：Settings / Reminder / Export / Backup
Milestone 5：AI
```

Feature実装の順序は、Requirement、依存関係、Test計画により変更される場合があります。

---

## 19. F001 Blood Pressure Recording

最初に完成させる主要Featureは、F001 Blood Pressure Recordingです。

ただし、Step 1の監査、Flutter初期化、開発基盤が完了するまで実装を開始してはいけません。

F001の具体的な実装内容は、対象Feature Requirementと対象Screen仕様を正とします。

想定される完成確認には、次が含まれます。

- 血圧値入力
- 入力Validation
- 複数回測定への対応
- 採用値または平均値の決定
- 保存
- アプリ再起動後の保持
- 最新記録の表示
- Unit Test
- Widget Test
- Acceptance Criteriaの達成

この一覧より、RequirementとScreen仕様を優先します。

---

## 20. Step 1の完了条件

Step 1は、Flutterアプリが動くことではなく、安全に初期化へ進める状態になったことを完了条件とします。

次を満たした場合、Step 1完了とします。

- Flutter SDKのバージョンとChannelが確認されている
- `flutter doctor -v`の結果が確認されている
- Dart、Git、Editor、Android開発環境が確認されている
- Repositoryルートが確認されている
- 現在のBranchが確認されている
- 未コミット変更の有無が確認されている
- Repository全体の構成が確認されている
- Flutterプロジェクトが初期化済みか判定されている
- 必須ドキュメントの存在と正確なパスが確認されている
- Markdownの参照切れが一覧化されている
- パス表記の揺れが一覧化されている
- `/AGENTS.md`の配置と役割が確認されている
- `/docs/09_AI_Context/AGENTS.md`との役割分担が確認されている
- Flutter初期化パラメータの未決定事項が一覧化されている
- 初期化を妨げるBlockerが明確になっている
- 次に実施する小さなタスクが整理されている
- ファイルが変更されていない
- F001および画面実装が開始されていない

Step 1の監査レポートには、最低限、次を含めます。

```text
1. Executive Summary
2. Environment Audit
3. Repository Structure Audit
4. Required Document Audit
5. Broken Reference Report
6. AGENTS.md Placement and Priority
7. Flutter Initialization Blockers
8. Recommended Next Tasks
9. Commands Executed
10. Files Changed: None
```

---

## 21. Definition of Done

各実装タスクは、対象範囲に応じて次を満たす必要があります。

- Requirement準拠
- Acceptance Criteria達成
- Screen仕様準拠
- Design System準拠
- Architecture準拠
- Coding Rules準拠
- 必要なTest追加
- Generated Codeの正式な再生成
- `dart format`成功
- `flutter analyze`成功
- `flutter test`成功
- Documentation更新
- Diff確認
- 変更内容と未解決事項の報告

一部を実行できない場合は、その理由を明確に報告します。

---

## 22. 新しいAIセッション開始時

新しいAIセッションでは、最初に次を共有します。

```text
このRepositoryはBloodPressureAppです。

次の順番でドキュメントを確認してください。

1. /START_HERE.md
2. /AGENTS.md
3. /docs/09_AI_Context/PROJECT.md
4. /docs/09_AI_Context/AGENTS.md
5. /docs/09_AI_Context/DESIGN_RULES.md
6. /docs/09_AI_Context/CODING_RULES.md
7. /docs/09_AI_Context/SCREEN_CONTEXT.md
8. 対象Feature Requirement
9. 対象Screen仕様

Repository内のドキュメントを正として扱ってください。
仕様を推測しないでください。
今回は指定したStepとタスクのみ実施してください。
対象外のFeatureや画面へ作業範囲を広げないでください。
```

---

## 23. Codexへ最初に渡す依頼

Flutter実装開始前の最初のCodexタスクは、読み取り専用の監査とします。

```text
このRepositoryはBloodPressureAppです。

今回はStep 1の「開発環境・Repository・ドキュメント監査」のみを実施してください。

重要：
- ファイルを変更しないでください。
- flutter createを実行しないでください。
- pubspec.yamlを作成・変更しないでください。
- パッケージを追加しないでください。
- F001を実装しないでください。
- 画面、Widget、DB、Router、Providerを実装しないでください。
- 自動修正コマンドを実行しないでください。
- 仕様を推測しないでください。
- 今回は読み取り専用の監査です。

最初に、Repositoryルートから次の順番でドキュメントを確認してください。

1. /START_HERE.md
2. /AGENTS.md
3. /docs/09_AI_Context/PROJECT.md
4. /docs/09_AI_Context/AGENTS.md
5. /docs/09_AI_Context/DESIGN_RULES.md
6. /docs/09_AI_Context/CODING_RULES.md
7. /docs/09_AI_Context/SCREEN_CONTEXT.md

その後、次を実施してください。

## 1. Git・Repository確認

- Repositoryルート
- 現在のBranch
- git status
- 未コミット変更の有無
- Repository直下のファイル・ディレクトリ一覧
- 既存Flutterプロジェクトの有無
- pubspec.yaml、lib、test、integration_testの有無
- 重複ファイルや不自然なファイル名
- AGENTS.mdが配置されている全パス

## 2. 必須ドキュメント確認

以下の存在、正確なパス、ファイル名の大文字・小文字を確認してください。

- /START_HERE.md
- /AGENTS.md
- /docs/09_AI_Context/PROJECT.md
- /docs/09_AI_Context/AGENTS.md
- /docs/09_AI_Context/DESIGN_RULES.md
- /docs/09_AI_Context/CODING_RULES.md
- /docs/09_AI_Context/SCREEN_CONTEXT.md

さらに、次のディレクトリ内のMarkdownファイル一覧を確認してください。

- /docs/00_Project
- /docs/01_Requirements
- /docs/02_UX
- /docs/03_Screens
- /docs/04_DesignSystem
- /docs/05_AI
- /docs/06_Flutter
- /docs/07_Test
- /docs/08_Release
- /docs/09_AI_Context

## 3. Markdown参照パス監査

Repository内のMarkdownから、他のMarkdown、assets、Requirement、Screenへの参照を確認してください。

次を検出してください。

- 存在しない参照先
- パス表記の揺れ
- 大文字・小文字の不一致
- Repositoryルート基準か現在ファイル基準か不明な参照
- /AGENTS.mdと/docs/09_AI_Context/AGENTS.mdの取り違え
- 古いファイル名への参照
- RequirementとScreenの相互参照不整合

ファイルは修正せず、問題箇所を次の形式で報告してください。

- 参照元ファイル
- 行番号
- 現在の記述
- 想定される正しい参照先
- 問題の種類
- 推奨対応

## 4. AGENTS.md監査

- ルートAGENTS.mdの役割
- docs/09_AI_Context/AGENTS.mdの役割
- 内容の重複
- 内容の矛盾
- 優先順位が明記されているか
- Codexがどちらを先に読むべきか明確か
- サブディレクトリに別のAGENTS.mdがあるか

## 5. Flutter開発環境確認

安全な読み取り専用コマンドで、次を確認してください。

- flutter --version
- flutter channel
- flutter doctor -v
- dart --version
- git --version
- code --version
- VS CodeのFlutter拡張とDart拡張

各項目を以下に分類してください。

- OK
- Warning
- Blocked
- 未確認

## 6. Flutter初期化前の不足項目

次を「決定済み」「未決定」「ドキュメント確認待ち」に分類してください。

- Flutterプロジェクト名
- Android applicationId
- iOS bundle identifier
- 対象Platform
- Android minSdk
- iOS Deployment Target
- Repository直下でflutter createするか
- FVM使用有無
- Flavor使用有無
- Riverpod code generation使用有無
- Drift schema管理方針
- Lintルール
- CI導入時期

## 出力形式

以下の順で、Markdown形式で報告してください。

1. Executive Summary
2. Environment Audit
3. Repository Structure Audit
4. Required Document Audit
5. Broken Reference Report
6. AGENTS.md Placement and Priority
7. Flutter Initialization Blockers
8. Recommended Next Tasks
9. Commands Executed
10. Files Changed

Files Changedには必ず、次を記載してください。

Files Changed: None

問題が見つかっても、今回は修正しないでください。
不足情報を推測で補完しないでください。
F001や画面実装には進まないでください。
```

---

## 24. 禁止事項

明示的な指示がない限り、次を行ってはいけません。

- 仕様を推測して実装する
- 対象外Featureへ変更を広げる
- 複数の大きなタスクを同時に実装する
- UIへBusiness Logicを書く
- Domain層をFlutterへ依存させる
- WidgetからDBを直接操作する
- Generated Codeを直接編集する
- Design Tokenを無視して値を直接記述する
- テストなしで実装を完了扱いにする
- エラーがある状態を成功と報告する
- RequirementやScreen仕様を無視する
- 既存ファイルを確認せずに`flutter create .`を実行する
- 未コミット変更を確認せずに大きな変更を行う
- 人間の承認なしに破壊的操作を行う

---

## 25. このファイルの役割

`/START_HERE.md`は、BloodPressureApp開発の入口です。

このファイルだけで、最低限、次を把握できる状態を維持します。

- プロジェクトの目的
- 現在の進捗
- 正とするドキュメント
- ドキュメントの優先順位
- パス表記ルール
- AGENTS.mdの役割
- 採用技術
- アーキテクチャ原則
- Design System運用
- Generated Codeの扱い
- テスト方針
- Codex運用
- 最初の作業順序
- Step 1の完了条件
- Definition of Done
- 新しいAIセッションの開始方法

プロジェクト方針、Repository構成、ドキュメント配置、開発手順が変更された場合は、このファイルも更新してください。
