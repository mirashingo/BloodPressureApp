# CanonicalSources.md

**Project:** BloodPressureApp  
**Version:** 1.0  
**Status:** Active

---

# 1. Purpose

本ドキュメントは、BloodPressureAppプロジェクトにおける**Canonical Source（正本）**を定義します。

複数のドキュメントに同じ情報が存在する場合や、AI（ChatGPT・Codex）および開発者が判断に迷った場合は、本書で定義する正本を最優先とします。

---

# 2. Source of Truth Policy

- 各カテゴリには必ず正本（Canonical Source）を定義する。
- 二次資料は正本を参照する。
- 矛盾を発見した場合は推測で補完せず報告する。
- 新しい設計資料を追加した場合は最初に本書を更新する。

---

# 3. Canonical Sources

| Category | Canonical Source | Purpose |
|-----------|------------------|---------|
| Development Rules | START_HERE.md | 開発ルール・AI運用 |
| Product Concept | docs/00_Project/AppConcept.md | Mission / Vision / UX思想 |
| Documentation Index | PROJECT_INDEX.md | ドキュメント案内 |
| Requirements | docs/01_Requirements/ | 要件定義 |
| Feature ID | docs/01_Requirements/FeatureIndex.md | Feature IDの正本 |
| Information Architecture | docs/02_UX/InformationArchitecture.md | 情報構造 |
| Navigation | docs/02_UX/Navigation.md | 画面遷移 |
| User Flow | docs/02_UX/UserFlow.md | 利用フロー |
| Screen List | docs/02_UX/ScreenList.md | 画面一覧 |
| Screen ID | docs/09_AI_Context/SCREEN_CONTEXT.md *(暫定)* | Screen IDの正本 |
| Screen Specification | docs/03_Screens/ | 各画面仕様 |
| Design System | docs/04_DesignSystem/ | UIデザイン仕様 |
| Flutter Architecture | docs/06_Flutter/Architecture.md | Flutter設計 |
| Folder Structure | docs/06_Flutter/FolderStructure.md | ディレクトリ構成 |
| Implementation Plan | docs/06_Flutter/ImplementationPlan.md | 開発ロードマップ |
| AI Context | docs/09_AI_Context/ | AIコンテキスト |
| Test | docs/07_Test/ | テスト方針 |
| Release | docs/08_Release/ | リリース関連 |

> **注記:** Screen IDは現時点では `SCREEN_CONTEXT.md` を正本とします。

---

# 4. Priority Rules

AIおよび開発者は次の順序で判断します。

1. START_HERE.md
2. CanonicalSources.md
3. AppConcept.md
4. PROJECT_INDEX.md
5. 各カテゴリのCanonical Source

---

# 5. Conflict Resolution

| Information | Canonical Source |
|-------------|------------------|
| Feature ID | FeatureIndex.md |
| Screen ID | SCREEN_CONTEXT.md *(暫定)* |
| Navigation | Navigation.md |
| User Flow | UserFlow.md |
| Information Architecture | InformationArchitecture.md |
| Requirements | docs/01_Requirements/ |
| Flutter Architecture | Architecture.md |

矛盾を発見した場合は推測で修正せず報告します。

---

# 6. AI Development Rules

- 正本以外を基準に仕様変更しない。
- 正本へ反映されていない内容を正式仕様としない。
- 判断できない場合は停止し確認する。

---

# 7. Maintenance Policy

以下の場合は本書を更新します。

- 新しいカテゴリ追加
- 新しい設計資料追加
- 正本変更
- Feature ID変更
- Screen ID変更

---

# 8. Future

将来的には以下も追加予定です。

- Product Vision
- Branding
- Design Tokens
- Figma Library
- Widget Catalog
- API Specification
- Database Schema
- Analytics Specification

---

# Revision History

| Version | Date | Description |
|---------|------|-------------|
| 1.0 | 2026-08 | 初版作成 |
