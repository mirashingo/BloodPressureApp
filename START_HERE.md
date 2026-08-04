# START_HERE.md v3.0

> BloodPressureApp 開発憲章（Project Charter & AI Playbook）

このファイルは、新しいChatGPTセッションで同じ品質・設計思想・開発ルールを維持するための唯一の開始ガイドです。

------------------------------------------------------------------------

# 1. プロジェクト概要

## アプリ名

BloodPressureApp

## 目的

日本国内向けの血圧管理アプリを開発する。

設計方針 - シンプル - 高速 - 保守しやすい - 広告なし -
高齢者でも使いやすい - 長期間運用できる品質を重視

------------------------------------------------------------------------

# 2. 現在地

## 完了

-   Phase1：Flutter環境構築
-   Phase2：プロジェクト初期化
-   Phase3：App Foundation
    -   Material 3
    -   Design Token
    -   Theme
    -   ThemeExtension
    -   Riverpod
    -   GoRouter
    -   Feature First
    -   Router / Riverpod Smoke Test

## 次回開始

Phase4

最初のタスク： **P4-01 Recording Feature Skeleton**

------------------------------------------------------------------------

# 3. 採用技術

-   Flutter Stable
-   Material 3
-   Riverpod（手書きProvider）
-   GoRouter
-   Drift（後続）
-   Feature First Architecture

Feature名は **recording** を正式採用する。

------------------------------------------------------------------------

# 4. ディレクトリ構成

    lib/
    ├─ app/
    ├─ core/
    ├─ design_system/
    ├─ shared/
    └─ features/
       └─ recording/
          ├─ domain/
          ├─ application/
          ├─ data/
          └─ presentation/

空フォルダ・空ファイルは大量生成しない。

------------------------------------------------------------------------

# 5. 開発哲学

-   1タスク = 1目的
-   小さく実装
-   小さくレビュー
-   小さくコミット
-   設計変更は必ず理由を残す
-   既存品質を下げない
-   ドキュメントをコードと同じくらい重要視する

------------------------------------------------------------------------

# 6. AIの役割

AIは毎回以下を守る。

-   指定範囲のみ変更
-   Executive Summaryを提出
-   Boundaryを明確化
-   Validationを記載
-   Remaining Issuesを明示
-   勝手な設計変更をしない

------------------------------------------------------------------------

# 7. ユーザーの役割

各タスク後にローカルで実行する。

``` powershell
dart format
flutter analyze
flutter test
flutter run
```

成功後のみ

``` powershell
git add .
git commit -m "..."
git push
```

フェーズ完了時はGit Tagを作成する。

------------------------------------------------------------------------

# 8. AI禁止事項

AIは事前確認なしに実行しない。

-   flutter コマンド
-   dart コマンド
-   git操作
-   pub add
-   build_runner
-   package追加
-   Architecture変更
-   Feature追加

------------------------------------------------------------------------

# 9. コーディング規約

-   Feature First
-   DomainはFlutterへ依存しない
-   ControllerはBuildContextを保持しない
-   NavigationはScreen側
-   Repository InterfaceはDomain
-   Repository実装はData
-   Providerは責務ごとに配置
-   Theme値を直書きしない

------------------------------------------------------------------------

# 10. Git運用

Branch - main

最新Tag - v0.4.0-app-foundation

コミットは機能単位。

タグはフェーズ単位。

------------------------------------------------------------------------

# 11. Done条件

各タスク完了条件

-   実装
-   format
-   analyze
-   test
-   run
-   Git Commit
-   Push

フェーズ完了条件

-   ドキュメント更新
-   Git Tag
-   START_HERE更新

------------------------------------------------------------------------

# 12. トラブル時

analyzeエラー → 修正してから次へ進む

test失敗 → 原因を特定し修正

run失敗 → 実装を止めて原因を確認

Package追加 → 必ずユーザーへ確認

------------------------------------------------------------------------

# 13. Phase4予定

1.  Feature Skeleton
2.  Domain
3.  Repository Interface
4.  UseCase
5.  Presentation
6.  UI
7.  Drift
8.  Export
9.  AI機能

------------------------------------------------------------------------

# 14. 新しいセッション開始テンプレート

このプロジェクトを継続します。

以下を前提にしてください。

-   START_HERE.md
-   README.md
-   AGENTS.md
-   docs/06_Flutter/ImplementationPlan.md

現在は **Phase4** を開始します。

1タスクずつ実装してください。

私は毎回

-   dart format
-   flutter analyze
-   flutter test
-   flutter run

をローカルで実施し、成功後にGitへコミットします。

CLI・Package追加・Git操作が必要な場合は必ず事前確認してください。
