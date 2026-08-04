# PROJECT_INDEX.md

> BloodPressureApp ドキュメント索引
>
> このファイルは、新しいセッションで「どの資料を読めばよいか」を判断するためのインデックスです。

------------------------------------------------------------------------

# 基本ルール

新しいセッションでは、まず以下の4ファイルを読みます。

1.  START_HERE.md
2.  README.md
3.  AGENTS.md
4.  docs/06_Flutter/ImplementationPlan.md

これで現在地・開発ルール・次タスクを把握できます。

------------------------------------------------------------------------

# ドキュメント一覧

  --------------------------------------------------------------------------------------------------------
  フォルダ                主な内容                                            必要になる場面
  ----------------------- --------------------------------------------------- ----------------------------
  docs/01_Requirements    要件定義                                            機能仕様を確認するとき

  docs/02_UX              UX・画面遷移・ユーザーフロー                        UX改善・画面設計

  docs/03_Screens         画面仕様・Screen一覧                                UI実装

  docs/04_DesignSystem    Color・Typography・Spacing・Theme                   デザイン変更・新規UI

  docs/05_AI              AI機能関連資料                                      AI機能実装

  docs/06_Flutter         Architecture・FolderStructure・ImplementationPlan   Flutter実装全般

  docs/09_AI_Context      Screen Context等                                    AIへ画面文脈を共有する場合
  --------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------

# タスク別に読む資料

  やりたいこと         読む資料
  -------------------- -----------------------------------------
  Phaseの進捗確認      ImplementationPlan.md
  新しいFeature追加    Architecture.md / FolderStructure.md
  Route追加            Navigation関連資料・Architecture.md
  Theme変更            docs/04_DesignSystem
  新しい画面実装       docs/03_Screens
  Repository実装       Architecture.md
  Riverpod実装         Architecture.md / ImplementationPlan.md
  GoRouter実装         Architecture.md / ImplementationPlan.md
  AI機能               docs/05_AI
  プロンプト・AI運用   AGENTS.md

------------------------------------------------------------------------

# AIへの運用ルール

-   必要最小限の資料だけ読む。
-   不足する情報があれば、その時点で追加資料を参照する。
-   指定されていないファイルを前提に実装しない。
-   実装範囲を越える変更は提案し、勝手に実施しない。

------------------------------------------------------------------------

# 推奨セッション開始セット

通常は次の5ファイルを共有すれば十分です。

-   START_HERE.md
-   PROJECT_INDEX.md
-   README.md
-   AGENTS.md
-   docs/06_Flutter/ImplementationPlan.md

必要に応じて、DesignSystem・Architecture・Screen仕様などを追加で参照します。

------------------------------------------------------------------------

# 現在の開発フェーズ

-   最新タグ: **v0.4.0-app-foundation**
-   現在: **Phase 4**
-   次のタスク: **P4-01 Recording Feature Skeleton**
