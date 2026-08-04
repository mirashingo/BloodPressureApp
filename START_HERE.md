# START_HERE.md

**Version:** 4.0

## このドキュメントについて

本書はBloodPressureAppプロジェクトにおける最上位ドキュメントです。設計思想・AI運用・品質基準・開発フローを定義します。

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

標準添付: - START_HERE.md - PROJECT_INDEX.md - README.md - AGENTS.md -
docs.zip

必要に応じて追加: - lib/ - test/ - pubspec.yaml - analysis_options.yaml

# 4. 開発ルール

-   START_HERE.mdを最優先
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

-   Phase3 完了
-   次: Phase4
-   次タスク: P4-01 Recording Feature Skeleton

# 9. 新しいセッション開始

START_HERE.md→PROJECT_INDEX.mdを優先して読み、PROJECT_INDEXに従ってdocs.zip内の必要資料を参照する。ImplementationPlanに沿って1タスクずつ進める。
