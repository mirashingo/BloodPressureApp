# START_HERE.md

**Version:** 4.2

## このドキュメントについて

本書はBloodPressureAppプロジェクトにおける最上位ドキュメントです。設計思想・AI運用・品質基準・開発フローを定義します。

## 最初に読むドキュメント

1.  START_HERE.md
    -   開発ルール、AI運用ルール、開発フロー、現在のフェーズを確認する。
2.  docs/00_Project/CanonicalSources.md
    -   Canonical Source（正本）の一覧、Feature IDの正本、Screen IDの正本、ドキュメント間の優先順位、Conflict Resolution、AI判断ルールを確認する。
3.  docs/00_Project/AppConcept.md
    -   Mission、Vision、UX思想、デザインコンセプトを確認する。
4.  PROJECT_INDEX.md
    -   ドキュメント構成と、現在のタスクに必要な資料への案内を確認する。

AIはSTART_HERE.md、docs/00_Project/CanonicalSources.md、docs/00_Project/AppConcept.md、PROJECT_INDEX.mdの順に確認する。
CanonicalSources.mdで定義された正本を最優先とする。
PROJECT_INDEX.mdを参照し、現在のタスクに必要なドキュメントのみ確認する。
添付されていないファイルを読める前提にしない。
ドキュメント間に矛盾や不足がある場合は、推測で補完せず、実装・設計作業の前に報告する。

# 1. プロジェクト概要

-   Flutter / Material 3
-   Riverpod
-   GoRouter
-   Drift
-   Feature First
-   ドキュメント駆動開発
-   AIと人の協調開発

# 2. AI開発体制

## ChatGPT

-   設計レビュー
-   Architecture確認
-   ImplementationPlan管理
-   Codexへの実装指示作成
-   実装レビュー
-   ドキュメント改善

原則として推測で実装せず、ドキュメントを根拠に判断する。

## Codex

-   Flutter/Dart実装
-   指定ファイルのみ編集
-   Executive Summary作成

## 開発者

-   Codexへの依頼
-   dart format
-   flutter analyze
-   flutter test
-   flutter run
-   Git運用

# 3. AI開発パック

## 標準添付

-   START_HERE.md
-   docs/00_Project/CanonicalSources.md
-   docs/00_Project/AppConcept.md
-   PROJECT_INDEX.md
-   README.md
-   AGENTS.md
-   docs.zip

## 必要に応じて追加

-   lib/
-   test/
-   pubspec.yaml
-   analysis_options.yaml

# 4. 開発ルール

-   START_HERE.mdを最優先
-   CanonicalSources.mdを各カテゴリの正本確認に使用する
-   AppConcept.mdをプロダクト判断・UI/UX判断の基準とする
-   PROJECT_INDEX.mdで現在のタスクに必要な資料を確認する
-   ImplementationPlanに沿って1タスクずつ進める
-   勝手な設計変更・仕様追加を行わない
-   実装前に設計確認
-   不明点や矛盾は実装前に報告
-   CLI・Gitは開発者指示まで実行しない

# 5. 開発フロー

設計確認 → Codex実装 → ローカル検証 → レビュー → Git Commit/Push

# 6. セッション運用

現在のセッションが快適なら継続する。
応答遅延・文脈保持低下・添付読込不安定などが発生したらAI開発パックで新セッションへ移行する。

# 7. 品質基準

-   ドキュメントを根拠に判断
-   変更範囲を最小化
-   Feature First維持
-   DomainへFlutter依存を持ち込まない

# 8. 現在地

## 完了

-   Phase 1
-   Phase 2
-   Phase 3
-   P3.5-00 Project Documentation Alignment
-   P3.5-01A Information Architecture事前調査
-   P3.5-01B InformationArchitecture.md作成
-   P3.5-01C Screen ID / Feature ID整合確認
-   P3.5-01D Canonical Sources導入
-   P3.5-01E START_HERE Quality Improvement

## 現在

-   Phase3.5 UI / UX Design

## 次タスク

-   P3.5-02 Navigation Flow

# 9. 新しいセッション開始

START_HERE.md→docs/00_Project/CanonicalSources.md→docs/00_Project/AppConcept.md→PROJECT_INDEX.mdを優先して読み、PROJECT_INDEXに従ってdocs.zip内の必要資料を参照する。ImplementationPlanに沿って1タスクずつ進める。
