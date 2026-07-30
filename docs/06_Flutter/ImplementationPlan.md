# ImplementationPlan.md

# BloodPressureApp 実装計画（Implementation Plan）

## 目的

本ドキュメントは、Flutter実装を小さなタスク単位に分割し、設計書・Git・Codex・レビューを同期させるための実装計画書です。

## 開発ルール

-   1タスク = 1レビュー = 1コミット
-   設計書を先に更新し、実装は設計に従う
-   `dart format .` / `flutter analyze` / `flutter test`
    を完了条件とする
-   Feature実装を始める前にアプリ基盤を完成させる

------------------------------------------------------------------------

## Phase 3 : Application Foundation

  ID         タスク                          状態
  ---------- ------------------------------- ---------
  P3-00      現状確認                        ✅ 完了
  P3-00A     Flutter環境確認                 ✅ 完了
  P3-01      App Shell設計確認               ☐
  P3-02-01   app.dart 作成（lib/app/app.dart） ☐
  P3-02-02   bootstrap.dart 作成（lib/app/bootstrap.dart） ☐
  P3-02-03   main.dart 差し替え              ☐
  P3-02-04   App Smoke Test                  ☐
  P3-03-01   AppColors                       ☐
  P3-03-02   AppTypography                   ☐
  P3-03-03   AppSpacing                      ☐
  P3-03-04   Token（Radius/Icon/Duration）   ☐
  P3-04-01   ThemeData                       ☐
  P3-04-02   ColorScheme                     ☐
  P3-04-03   TextTheme                       ☐
  P3-05      Riverpod基盤                    ☐
  P3-06      GoRouter基盤                    ☐
  P3-07      Error / Result基盤              ☐
  P3-08      Logging基盤                     ☐
  P3-09      Drift設計                       ☐
  P3-10      Drift基盤                       ☐
  P3-11      Test基盤                        ☐
  P3-12      CI基盤                          ☐

------------------------------------------------------------------------

## Phase 4 : Feature Development

  ID     Feature                    状態
  ------ -------------------------- ------
  F001   Blood Pressure Recording   ☐
  F002   History                    ☐
  F003   Graph                      ☐
  F004   Statistics                 ☐
  F005   Reminder                   ☐
  F006   Export                     ☐
  F007   Backup                     ☐
  F008   Settings                   ☐
  F009   AI Summary                 ☐

------------------------------------------------------------------------

## Definition of Done

-   設計書との整合性確認
-   コードレビュー完了
-   `dart format .`
-   `flutter analyze`
-   `flutter test`
-   不要コードなし
-   TODOを残さない（意図的なものを除く）

------------------------------------------------------------------------

## Codex 作業テンプレート

### 作業内容

-   対象タスク
-   対象ファイル
-   変更範囲
-   今回やらないこと

### 完了後レポート

1.  Executive Summary
2.  Files Changed
3.  Commands Executed
4.  analyze結果
5.  test結果
6.  残課題

------------------------------------------------------------------------

## 推奨コミットメッセージ

    Phase 3: bootstrap.dart を追加
    Phase 3: app.dart を追加
    Phase 3: main.dart を更新
    Phase 3: Design Token を追加
    Phase 3: Material3 Theme を追加

------------------------------------------------------------------------

## 運用方針

-   ChatGPT：設計・レビュー・タスク設計
-   Codex：実装・リファクタリング・テスト
-   Git：1タスク＝1コミット
-   設計変更が必要な場合は、実装より先にドキュメントを更新する
