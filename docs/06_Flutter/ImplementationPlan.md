# ImplementationPlan.md

# BloodPressureApp 実装計画（Implementation Plan）

## 目的

本ドキュメントは、Flutter実装を小さなタスク単位に分割し、設計書・Git・Codex・レビューを同期させるための実装計画書です。

## 開発ルール

-   1タスク = 1レビュー = 1コミット
-   設計書を先に更新し、実装は設計に従う
-   `dart format` / `flutter analyze` / `flutter test`
    はローカルPowerShellでの成功を完了条件とする
-   UIまたは起動経路を変更した場合は、ローカルPowerShellで `flutter run` を確認する
-   Feature実装を始める前にアプリ基盤を完成させる

------------------------------------------------------------------------

## Phase 3 : Application Foundation

  ID         タスク                          状態
  ---------- ------------------------------- ---------
  P3-00      現状確認                        ✅ 完了
  P3-00A     Flutter環境確認                 ✅ 完了
  P3-01      App Shell設計確認               ✅ 完了
  P3-02-01   app.dart 作成（lib/app/app.dart） ✅ 完了
  P3-02-02   bootstrap.dart 作成（lib/app/bootstrap.dart） ✅ 完了
  P3-02-03   main.dart 差し替え              ✅ 完了
  P3-02-04   App Smoke Test                  ✅ 完了
  P3-03-01   AppColors                       ☐
  P3-03-02   AppTypography                   ☐
  P3-03-03   AppSpacing                      ☐
  P3-03-04   AppRadius                       ☐
  P3-03-05   AppIconSizes                    ☐
  P3-03-06   AppDurations                    ☐
  P3-03-07   AppElevations                   ☐
  P3-03-08   AppComponentSizes               ☐
  P3-04-01   ThemeData                       ☐
  P3-04-02   ColorScheme                     ☐
  P3-04-03   TextTheme                       ☐
  P3-04-04   ThemeExtension登録              ☐
  P3-04-05   MaterialAppへのTheme接続         ☐
  P3-05      Riverpod基盤                    ☐
  P3-06      GoRouter基盤                    ☐
  P3-07      Error / Result基盤              ☐
  P3-08      Logging基盤                     ☐
  P3-09      Drift設計                       ☐
  P3-10      Drift基盤                       ☐
  P3-11      Test基盤                        ☐
  P3-12      CI基盤                          ☐

------------------------------------------------------------------------

## P3-03 : Design Tokens

P3-03ではDesign Tokenのみ実装する。

各タスクの実装前に、対応するDesign System仕様書を必ず確認する。

仕様書を実装の正本とし、仕様書にない値やTokenを独自追加しない。

不足や矛盾がある場合は、実装を止めて報告する。

### P3-03仕様書対応表

| Task ID | Token | 正本仕様書 |
|---|---|---|
| P3-03-01 | AppColors | docs/04_DesignSystem/Colors.md |
| P3-03-02 | AppTypography | docs/04_DesignSystem/Typography.md |
| P3-03-03 | AppSpacing | docs/04_DesignSystem/Spacing.md |
| P3-03-04 | AppRadius | docs/04_DesignSystem/Radius.md |
| P3-03-05 | AppIconSizes | docs/04_DesignSystem/IconSize.md |
| P3-03-06 | AppDurations | docs/04_DesignSystem/Animation.md |
| P3-03-07 | AppElevations | docs/04_DesignSystem/Elevation.md |
| P3-03-08 | AppComponentSizes | docs/04_DesignSystem/ComponentSize.md |

実装対象は次のとおり。

-   const
-   static const
-   EdgeInsets
-   BorderRadius
-   Duration
-   Icon Size
-   double定数

P3-03では次を実装しない。

-   ThemeData
-   ColorScheme
-   TextTheme
-   ThemeExtension
-   MaterialApp
-   Router
-   Riverpod

### P3-03実装順

```text
P3-03-01 AppColors
↓
P3-03-02 AppTypography
↓
P3-03-03 AppSpacing
↓
P3-03-04 AppRadius
↓
P3-03-05 AppIconSizes
↓
P3-03-06 AppDurations
↓
P3-03-07 AppElevations
↓
P3-03-08 AppComponentSizes
```

### P3-03-01 AppColors

目的:
アプリ全体で使用するColor Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_colors.dart`

完了条件:
-   `AppColors` が定義されている
-   `docs/04_DesignSystem/Colors.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-02 AppTypography

目的:
アプリ全体で使用するTypography Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_typography.dart`

完了条件:
-   `AppTypography` が定義されている
-   `docs/04_DesignSystem/Typography.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-03 AppSpacing

目的:
アプリ全体で使用するSpacing Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_spacing.dart`

完了条件:
-   `AppSpacing` が定義されている
-   `docs/04_DesignSystem/Spacing.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-04 AppRadius

目的:
アプリ全体で使用するRadius Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_radius.dart`

完了条件:
-   `AppRadius` が定義されている
-   `docs/04_DesignSystem/Radius.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-05 AppIconSizes

目的:
アプリ全体で使用するIcon Size Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_icon_sizes.dart`

完了条件:
-   `AppIconSizes` が定義されている
-   `docs/04_DesignSystem/IconSize.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-06 AppDurations

目的:
アプリ全体で使用するDuration Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_durations.dart`

完了条件:
-   `AppDurations` が定義されている
-   `docs/04_DesignSystem/Animation.md` のDuration Tokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-07 AppElevations

目的:
アプリ全体で使用するElevation Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_elevations.dart`

完了条件:
-   `AppElevations` が定義されている
-   `docs/04_DesignSystem/Elevation.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

### P3-03-08 AppComponentSizes

目的:
アプリ全体で使用するComponent Size Tokenを定義する。

対象ファイル:
`lib/design_system/tokens/app_component_sizes.dart`

完了条件:
-   `AppComponentSizes` が定義されている
-   `docs/04_DesignSystem/ComponentSize.md` のTokenに準拠している
-   ThemeData、ColorScheme、TextTheme、ThemeExtension、MaterialApp、Router、Riverpodを実装していない

------------------------------------------------------------------------

## P3-04 : Theme

P3-04では次のみ実装する。

-   ThemeData
-   ColorScheme
-   TextTheme
-   ThemeExtension
-   MaterialAppへの接続

P3-04では新しいTokenを追加しない。

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
-   ChatGPTレビューが完了している
-   `dart format` がローカルPowerShellで成功している
-   `flutter analyze` がローカルPowerShellで成功している
-   `flutter test` がローカルPowerShellで成功している
-   UIまたは起動経路を変更した場合は `flutter run` で確認している
-   不要コードなし
-   TODOを残さない（意図的なものを除く）
-   Git commit / pushは、ChatGPTレビュー完了後、ローカルPowerShellで必要な検証が成功後、タスクの論理単位が完了した時点で実施する

------------------------------------------------------------------------

## Codex 作業テンプレート

CodexではFlutter/Dart CLIを原則実行しない。

Format、Analyze、Test、RunはローカルPowerShellで実施する。

### 作業内容

-   対象タスク
-   対象ファイル
-   変更範囲
-   今回やらないこと

### Codex担当

-   実装
-   Files Changed確認
-   指示範囲との整合確認
-   Remaining Issues報告

### ローカルPowerShell担当

-   `dart format`
-   `flutter analyze`
-   `flutter test`
-   必要なタスクでは `flutter run`

### 完了後レポート

1.  Executive Summary
2.  Files Changed
3.  Implementation Details
4.  Validation
5.  Remaining Issues

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
-   Codex：実装・リファクタリング・Files Changed確認・指示範囲との整合確認・Remaining Issues報告
-   ローカルPowerShell：dart format・flutter analyze・flutter test・必要に応じたflutter run
-   Git：ChatGPTレビュー完了後、ローカルPowerShellで必要な検証が成功後、タスクの論理単位完了後にcommit / pushする
-   設計変更が必要な場合は、実装より先にドキュメントを更新する

### 運用フロー

1.  ChatGPTがタスク設計
2.  Codexが実装
3.  ChatGPTがレビュー
4.  ローカルPowerShellで検証
5.  Git commit
6.  Git push
