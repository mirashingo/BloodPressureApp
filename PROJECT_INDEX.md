# PROJECT_INDEX.md

> BloodPressureApp ドキュメント索引
>
> このファイルは、新しいセッションで「どの資料を読めばよいか」を判断するためのインデックスです。

------------------------------------------------------------------------

# Project Core Documents

プロジェクト開始時は、まず次のCore Documentsを確認します。

1.  START_HERE.md
    -   開発ルール
    -   AI運用
    -   開発フロー
2.  docs/00_Project/CanonicalSources.md
    -   Canonical Source管理
    -   Source of Truth
    -   Feature ID正本
    -   Screen ID正本
    -   ドキュメント優先順位
    -   Conflict Resolution
    -   AI判断ルール
3.  docs/00_Project/AppConcept.md
    -   Mission
    -   Vision
    -   UX思想
    -   デザインコンセプト
    -   プロダクト判断基準
4.  PROJECT_INDEX.md
    -   ドキュメント構成
    -   必要資料への案内
5.  docs/06_Flutter/ImplementationPlan.md
    -   開発ロードマップ
    -   実装順序
    -   現在のタスク

------------------------------------------------------------------------

# 基本ルール

新しいセッションでは、まず以下の5ファイルを読みます。

1.  START_HERE.md
2.  docs/00_Project/CanonicalSources.md
3.  docs/00_Project/AppConcept.md
4.  PROJECT_INDEX.md
5.  docs/06_Flutter/ImplementationPlan.md

これで現在地・開発ルール・次タスクを把握できます。

------------------------------------------------------------------------

# ドキュメント一覧

  --------------------------------------------------------------------------------------------------------
  フォルダ                主な内容                                            必要になる場面
  ----------------------- --------------------------------------------------- ----------------------------
  docs/00_Project         CanonicalSources・AppConcept                        正本確認・UI/UX・Figma・Flutter実装前のプロダクト判断

  docs/01_Requirements    要件定義                                            機能仕様を確認するとき

  docs/02_UX              UX・画面遷移・ユーザーフロー                        UX改善・画面設計

  docs/03_Screens         画面仕様・Screen一覧                                UI実装

  docs/04_DesignSystem    Color・Typography・Spacing・Theme                   デザイン変更・新規UI

  docs/05_AI              AI機能関連資料                                      AI機能実装

  docs/06_Flutter         Architecture・FolderStructure・ImplementationPlan   Flutter実装全般

  docs/09_AI_Context      Screen Context等                                    AIへ画面文脈を共有する場合
  --------------------------------------------------------------------------------------------------------

docs/00_Project/AppConcept.mdは、アプリ全体の目的、Mission / Vision、UX思想、デザインコンセプト、プロダクト全体の判断基準を定義します。UI/UX・Figma・Flutter実装前に確認するドキュメントです。

docs/00_Project/CanonicalSources.mdは、Canonical Source管理、Source of Truth、Feature ID正本、Screen ID正本、Conflict Resolution、AI開発ルールを定義します。ドキュメント間の矛盾や判断に迷う場合に確認するドキュメントです。

------------------------------------------------------------------------

# タスク別に読む資料

  やりたいこと         読む資料
  -------------------- -----------------------------------------
  Phaseの進捗確認      ImplementationPlan.md
  UI/UX設計            docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/02_UX
  Information Architecture docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/02_UX
  Navigation設計       docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/02_UX
  User Flow            docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/02_UX
  Screen List          docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/02_UX
  Screen Specification docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/03_Screens
  Wireframe            docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/03_Screens
  Figma UI Design      docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/04_DesignSystem
  Flutter画面実装      docs/00_Project/CanonicalSources.md / docs/00_Project/AppConcept.md / docs/03_Screens / docs/04_DesignSystem
  新しいFeature追加    docs/00_Project/CanonicalSources.md / docs/01_Requirements/FeatureIndex.md / Architecture.md / FolderStructure.md
  Route追加            Navigation関連資料・Architecture.md
  Theme変更            docs/04_DesignSystem
  新しい画面実装       docs/03_Screens
  Repository実装       Architecture.md
  Riverpod実装         Architecture.md / ImplementationPlan.md
  GoRouter実装         Architecture.md / ImplementationPlan.md
  AI機能               docs/05_AI
  プロンプト・AI運用   AGENTS.md
  Test                 docs/00_Project/CanonicalSources.md / docs/07_Test
  Release              docs/00_Project/CanonicalSources.md / docs/08_Release

------------------------------------------------------------------------

# AIへの運用ルール

-   START_HERE.mdを最初に読む。
-   CanonicalSources.mdで正本を確認する。
-   AppConcept.mdでプロダクト思想を確認する。
-   PROJECT_INDEX.mdから必要資料へ移動する。
-   必要最小限の資料だけ読む。
-   不足する情報があれば、その時点で追加資料を参照する。
-   指定されていないファイルを前提に実装しない。
-   実装範囲を越える変更は提案し、勝手に実施しない。
-   矛盾時は推測で補完しない。

------------------------------------------------------------------------

# 推奨セッション開始セット

通常は次の5ファイルを共有すれば十分です。

-   START_HERE.md
-   docs/00_Project/CanonicalSources.md
-   docs/00_Project/AppConcept.md
-   PROJECT_INDEX.md
-   docs/06_Flutter/ImplementationPlan.md

必要に応じて、DesignSystem・Architecture・Screen仕様などを追加で参照します。

------------------------------------------------------------------------

# 現在の開発フェーズ

-   最新タグ: **v0.4.0-app-foundation**
-   現在: **Phase 3.5 UI / UX Design**
-   次のタスク: **P3.5-02 Navigation Flow**
