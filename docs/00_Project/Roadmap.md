# BloodPressureApp 開発ロードマップ

- ドキュメント名：Roadmap.md
- バージョン：1.1
- ステータス：Draft

---

# 1. プロジェクトの目的

BloodPressureAppは、「毎日、気持ちよく血圧を記録できるアプリ」を目指します。

Flutter・Figma・AIを活用し、保守性・拡張性・AIとの親和性を重視した開発を行います。

## 成果物

1. 本番品質のFlutterアプリ
2. 再利用可能なAI開発フロー
3. 設計・開発ドキュメント一式

---

# 2. 開発フェーズ

## Phase 0：プロジェクト定義
- Vision.md
- Roadmap.md

目的：ビジョン・ターゲット・開発方針を明確化する。

## Phase 1：要件定義
- FeatureIndex.md
- Feature.md
- F001〜F009 個別機能仕様書

目的：MVP・機能仕様・非機能要件を確定する。

## Phase 2：UX設計
- UserFlow.md
- Navigation.md
- ScreenList.md

目的：ユーザー体験と画面遷移を設計する。

## Phase 3：デザインシステム
- Colors.md
- Typography.md
- Components.md
- Animation.md
- Emotion.md

目的：統一されたUIルールを策定する。

## Phase 4：Figmaデザイン
ホーム、入力、履歴、グラフ、設定画面を設計し、プロトタイプを作成する。

## Phase 5：Flutter設計
Riverpod、GoRouter、Drift、Repository Patternを用いたアーキテクチャを構築する。

## Phase 6：Flutter実装
Theme → 共通部品 → 入力 → ホーム → 履歴 → グラフ → 設定 → 出力 → バックアップ

## Phase 7：AI機能
週間・月間要約、傾向分析を実装する。
※AIは医療診断を行わない。

## Phase 8：テスト
Unit Test、Widget Test、Integration Test、UATを実施する。

## Phase 9：リリース
Android/iOS公開、ストア素材、プライバシーポリシーを整備する。

---

# 3. ドキュメント構成

docs/
- 00_Project
- 01_Requirements
- 02_UX
- 03_Screens
- 04_DesignSystem
- 05_AI
- 06_Flutter
- 07_Test
- 08_Release

---

# 4. 成功指標

- 10秒以内で血圧を記録できる
- 毎日継続して使いたくなるUX
- Design Systemに沿ったFlutter実装
- AIが仕様書から実装支援できる
- 他プロジェクトへ再利用できるドキュメント資産
