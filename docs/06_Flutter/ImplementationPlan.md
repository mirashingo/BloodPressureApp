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
  P3-03-01   AppColors                       ✅ 完了
  P3-03-02   AppTypography                   ✅ 完了
  P3-03-03   AppSpacing                      ✅ 完了
  P3-03-04   AppRadius                       ✅ 完了
  P3-03-05   AppIconSizes                    ✅ 完了
  P3-03-06   AppDurations                    ✅ 完了
  P3-03-07   AppElevations                   ✅ 完了
  P3-03-08   AppComponentSizes               ✅ 完了
  P3-04-01   AppColorScheme                  ✅ 完了
  P3-04-02   AppTextTheme                    ✅ 完了
  P3-04-03   AppTheme（ThemeData）            ✅ 完了
  P3-04-04   ThemeExtension登録              ✅ 完了
  P3-04-05   MaterialAppへのTheme接続         ✅ 完了
  P3-05-01   Riverpod依存追加                ☐
  P3-05-02   ProviderScope導入               ☐
  P3-05-03   Bootstrap Override対応          ☐
  P3-05-04   Riverpod Smoke Test             ☐
  P3-06-01   GoRouter依存追加                ☐
  P3-06-02   Route定数作成                   ☐
  P3-06-03   AppRouter最小実装               ☐
  P3-06-04   MaterialApp.router移行          ☐
  P3-06-05   Router Smoke Test               ☐
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

P3-04では、P3-03で作成済みのDesign Tokenを参照して次のみ実装する。

-   ColorScheme
-   TextTheme
-   ThemeData
-   ThemeExtension
-   MaterialAppへの接続

P3-04では新しいColor、Typography、Spacing、Radius、Icon Size、Duration、Elevation、Component Size Tokenを追加しない。

### P3-04実装順

```text
P3-04-01 AppColorScheme
↓
P3-04-02 AppTextTheme
↓
P3-04-03 AppTheme（ThemeData）
↓
P3-04-04 ThemeExtension登録
↓
P3-04-05 MaterialAppへのTheme接続
```

### P3-04-01 AppColorScheme

対象ファイル:
`lib/app/theme/app_color_scheme.dart`

### P3-04-02 AppTextTheme

対象ファイル:
`lib/app/theme/app_text_theme.dart`

### P3-04-03 AppTheme（ThemeData）

対象ファイル:
`lib/app/theme/app_theme.dart`

### P3-04-04 ThemeExtension登録

対象ファイル:
-   `lib/design_system/extensions/` 配下
-   登録処理は `lib/app/theme/` 配下

### P3-04-05 MaterialAppへのTheme接続

対象ファイル:
`lib/app/app.dart`

------------------------------------------------------------------------

## P3-05 : Riverpod基盤

P3-05では、Riverpodの最小基盤を手書きProviderから開始する。

導入対象:

-   `flutter_riverpod`
-   `ProviderScope`
-   `Provider`
-   `FutureProvider`
-   `StreamProvider`
-   `NotifierProvider`
-   `AsyncNotifierProvider`
-   `ProviderContainer`
-   `ProviderScope overrides`

P3-05では次を導入しない。

-   `riverpod_annotation`
-   `riverpod_generator`
-   `build_runner`
-   `riverpod_lint`
-   `custom_lint`
-   `StateNotifierProvider` の新規標準採用

Code Generationは、Freezed、json_serializable、Drift生成などのコード生成基盤を導入する段階で再評価する。

`riverpod_lint` / `custom_lint` は、P3-12 CI基盤または専用Lint整備タスクで再評価する。

### ProviderScope配置

ProviderScopeの正式配置は `bootstrap.dart` とする。

起動フロー:

```text
main.dart
→ bootstrap()
→ ProviderScope
→ BloodPressureApp
→ MaterialApp
```

`app.dart` 内部にはProviderScopeを置かない。

理由:

-   `bootstrap.dart` をComposition Rootとする
-   Provider overrideを起動時に渡せる
-   Widget TestおよびEnvironment切替を行いやすい
-   MaterialAppの責務とDI Rootを分離できる

### Providerの標準方針

-   DIには `Provider` を使用する
-   単純な非同期取得には `FutureProvider` を使用する
-   Drift等の継続監視には `StreamProvider` を使用する
-   同期Controllerには `NotifierProvider` を使用する
-   非同期Controllerには `AsyncNotifierProvider` を使用する
-   `StateNotifierProvider` を新規実装の標準としない
-   Domain層はRiverpodへ依存しない
-   Providerは利用責務に近いFeatureまたはApp/Core層へ配置する

### AsyncValue / Result境界

-   `AsyncValue` はPresentationにおけるloading/data/error表現とする
-   Domain / Applicationの成功・失敗はP3-07 Result基盤で扱う
-   Exceptionをそのままユーザー表示へ使用しない
-   ユーザー向けMessageの変換は後続設計で扱う

### Lifecycle方針

アプリスコープ／常駐候補:

-   Repository
-   Database
-   ThemeMode
-   Router

autoDispose候補:

-   画面固有の検索条件
-   Preview
-   一時的な非同期取得
-   画面単位の一覧監視

入力途中Draftは、破棄時のUXを確認してからautoDispose / keepAliveを決定する。

RiverpodのCode Generationを使わないP3-05では、lifecycleをProvider定義時に明示する。

### P3-06との境界

P3-05:

-   `flutter_riverpod` 依存
-   ProviderScope
-   bootstrap override受け口
-   Riverpod Smoke Test
-   DI / Provider設計方針

P3-06:

-   GoRouter依存
-   Route定数
-   Router Provider
-   `MaterialApp.router`
-   Router Smoke Test

P3-05ではGoRouterを追加しない。

### P3-05実装順

```text
P3-05-01 Riverpod依存追加
↓
P3-05-02 ProviderScope導入
↓
P3-05-03 Bootstrap Override対応
↓
P3-05-04 Riverpod Smoke Test
```

### P3-05-01 Riverpod依存追加

目的:
Riverpodの最小ランタイム依存を導入する。

対象ファイル:

-   `pubspec.yaml`
-   `pubspec.lock`

導入対象:

-   `flutter_riverpod`

完了条件:

-   `flutter_riverpod` がdependenciesへ追加されている
-   `pubspec.lock` が更新されている
-   `riverpod_annotation` 等のCode Generation packageを追加していない
-   GoRouter、Drift、Feature Providerを追加していない

今回やらないこと:

-   ProviderScope導入
-   Provider実装
-   Code Generation
-   Lint package導入
-   GoRouter

### P3-05-02 ProviderScope導入

目的:
アプリ全体のRiverpod Containerを起動経路へ導入する。

対象ファイル:

-   `lib/app/bootstrap.dart`

完了条件:

-   ProviderScopeがBloodPressureAppを包んでいる
-   ProviderScopeが `bootstrap.dart` へ配置されている
-   `main.dart` と `app.dart` の責務を変更していない
-   実Providerを追加していない

想定起動フロー:

```dart
runApp(
  const ProviderScope(
    child: BloodPressureApp(),
  ),
);
```

今回やらないこと:

-   Provider override
-   ProviderObserver
-   Environment分岐
-   ThemeMode Provider
-   Router Provider
-   Feature Provider

### P3-05-03 Bootstrap Override対応

目的:
テストやEnvironment切替でProviderを差し替えられる最小の起動インターフェースを用意する。

対象ファイル:

-   `lib/app/bootstrap.dart`

検討・実装方針:

-   `bootstrap` がProvider override一覧を受け取れる構造にする
-   デフォルトは空のoverride一覧とする
-   ProviderObserverはまだ導入しない
-   EnvironmentやFlavor固有処理は追加しない

完了条件:

-   overrideなしで通常起動できる
-   テスト等からoverrideを渡せる
-   ProviderScopeの責務が `bootstrap.dart` に維持されている
-   実RepositoryやDatabase Providerは追加していない

注意:

現在使用する `flutter_riverpod` の正式APIを確認し、型を推測しないこと。

API仕様が確定できない場合は、P3-05-03を実装せず報告する。

今回やらないこと:

-   ProviderObserver
-   Flavor
-   Environment読込
-   Repository Provider
-   Database Provider
-   Clock / UUID Provider

### P3-05-04 Riverpod Smoke Test

目的:
ProviderScope導入後もBloodPressureAppが正常起動することを確認する。

対象ファイル:

-   `test/widget_test.dart`

完了条件:

-   ProviderScopeを含む起動構成でWidget Testが成功する
-   `Blood Pressure App` が1件表示される
-   Provider overrideを利用できる構成である
-   Feature固有Providerをテストしていない

現在のSmoke Testが変更なしで成立する場合は、不要な変更を行わない。

今回やらないこと:

-   Fake Repository
-   In-memory Database
-   AsyncNotifier Test
-   Feature Controller Test
-   GoRouter Test

------------------------------------------------------------------------

## P3-06 : GoRouter基盤

P3-06では、手書きGoRouterから開始する。

導入対象:

-   `go_router`
-   GoRouter
-   Route名とPathの一元管理
-   Router Provider
-   `MaterialApp.router`
-   Router Smoke Test

P3-06では次を導入しない。

-   `go_router_builder`
-   `TypedGoRoute`
-   `RouteData`
-   Code Generation
-   ShellRoute
-   StatefulShellRoute
-   `StatefulShellRoute.indexedStack`
-   Redirect本実装
-   Deep LinkのPlatform設定
-   Notification遷移
-   Feature画面
-   Bottom Navigation
-   Error / Result基盤
-   認証

Code Generationは、Riverpod、Freezed、json_serializable、Driftなどのコード生成基盤をまとめて導入する段階で再評価する。

### Router管理方式

GoRouterはRiverpod Providerで管理する。

理由:

-   将来のRedirectで状態を参照しやすい
-   ProviderScope overrideでRouterを差し替えられる
-   TestでRouterを差し替えやすい
-   Routerの再生成を防ぎやすい
-   `bootstrap.dart` へRouter生成責務を増やさずに済む

Router Providerはアプリスコープ／常駐扱いとする。

P3-06ではRedirectから `ref` を参照する実装は行わない。

### Router配置

正式配置:

```text
lib/app/router/
├─ app_router.dart
├─ route_names.dart
└─ route_paths.dart
```

P3-06では次を作成しない。

-   `route_redirect.dart`
-   `shell_scaffold.dart`
-   featureごとのRoute定義ファイル
-   `error_route.dart`
-   `deep_link.dart`

必要性が確定した後続タスクで追加する。

### 初期Route

P3-06時点では正式Home画面を作成しない。

現在の起動確認UIである `Blood Pressure App` を、GoRouter配下の暫定App Shell Routeとして表示する。

暫定Route:

-   Route name: `appShell`
-   Path: `/`

このRouteはP3-06のRouter基盤確認専用とする。

Feature実装開始時に正式Home Routeへ置き換える。

### Route命名・Path方針

-   Route名はlowerCamelCaseとする
-   Pathはlowercaseのkebab-caseまたは既存 `docs/02_UX/Navigation.md` のPathに従う
-   Widget内へPath文字列を直接記述しない
-   Route名は `route_names.dart` へ集約する
-   Pathは `route_paths.dart` へ集約する
-   named navigationを基本とする
-   `recordId` など永続的に再現すべき識別子はpath parameterを使用する
-   filterやgraph periodなど再現可能な表示条件はquery parameter候補とする
-   `extra` だけへ永続的な画面状態を依存させない

P3-06では暫定App Shell Routeだけを実装し、Navigation.mdにある全Routeはまだ実装しない。

### ShellRoute方針

P3-06ではShellRouteを実装しない。

Main 5タブ:

-   Home
-   History
-   Graph
-   Statistics
-   Settings

およびBottom Navigationが実装される段階で、次を比較して正式決定する。

-   ShellRoute
-   StatefulShellRoute
-   `StatefulShellRoute.indexedStack`

タブごとのNavigation Stack保持が必要なため、`StatefulShellRoute.indexedStack` を有力候補とするが、P3-06では確定・実装しない。

### Redirect方針

P3-06ではRedirect本実装を行わない。

次は状態基盤が整ってから追加する。

-   Onboarding
-   利用規約
-   権限
-   App Lock
-   Database初期化
-   Backup復元中
-   invalid recordId
-   Notification遷移

空のredirectや仮ロジックは追加しない。

### Error Route境界

Router Error:

-   未知Path
-   Route構造エラー
-   path parameter形式不正

Domain / Application Error:

-   recordIdの存在確認
-   Repository取得失敗
-   DBエラー
-   Business Rule違反

Domain / Application ErrorはP3-07 Result基盤またはFeature側で扱う。

P3-06最小実装では専用Error Routeを追加しない。

### MaterialApp.router移行方針

P3-06で次を変更する。

```text
MaterialApp
↓
MaterialApp.router
```

維持するもの:

-   `debugShowCheckedModeBanner`
-   `title`
-   `theme`
-   `darkTheme`
-   `themeMode`
-   AppTheme
-   AppChartColors ThemeExtension

削除するもの:

-   `home`

追加するもの:

-   `routerConfig`

Router Provider管理を採用するため、BloodPressureAppはConsumerWidget化する。

`bootstrap.dart` はP3-06では変更しない。

### P3-06実装順

```text
P3-06-01 GoRouter依存追加
↓
P3-06-02 Route定数作成
↓
P3-06-03 AppRouter最小実装
↓
P3-06-04 MaterialApp.router移行
↓
P3-06-05 Router Smoke Test
```

### P3-06-01 GoRouter依存追加

目的:
GoRouterの最小ランタイム依存を導入する。

対象ファイル:

-   `pubspec.yaml`
-   `pubspec.lock`

導入対象:

-   `go_router`

完了条件:

-   `go_router` がdependenciesへ追加されている
-   `pubspec.lock` が更新されている
-   `go_router_builder` を追加していない
-   Routeコードをまだ追加していない
-   Feature画面を追加していない

今回やらないこと:

-   Router Provider
-   Route定数
-   `MaterialApp.router`
-   Code Generation
-   ShellRoute
-   Redirect

### P3-06-02 Route定数作成

目的:
Route名とPathの直書きを防ぐ最小定数を用意する。

対象ファイル:

-   `lib/app/router/route_names.dart`
-   `lib/app/router/route_paths.dart`

実装対象:

Route name:

-   `appShell`

Path:

-   `/`

完了条件:

-   AppRouteNamesまたは既存Naming Ruleに従う正式クラスがある
-   AppRoutePathsまたは既存Naming Ruleに従う正式クラスがある
-   `appShell` と `/` だけが定義されている
-   Feature Routeを追加していない
-   Path文字列が他ファイルへ散在していない

今回やらないこと:

-   home
-   history
-   graph
-   statistics
-   settings
-   record
-   record detail
-   query parameter
-   path parameter

### P3-06-03 AppRouter最小実装

目的:
Riverpod Provider管理による最小GoRouterを定義する。

対象ファイル:

-   `lib/app/router/app_router.dart`

完了条件:

-   GoRouterがProviderとして定義されている
-   initialLocationが暫定App Shell Routeである
-   route nameとpathは定数を参照している
-   builderで既存の `Blood Pressure App` 表示をRoute配下へ表示する
-   Routerがアプリスコープで安定して保持される
-   ShellRoute、Redirect、Error Routeを追加していない

今回やらないこと:

-   Feature画面
-   Bottom Navigation
-   Redirect
-   Deep Link設定
-   errorBuilder
-   StatefulShellRoute
-   RouteData
-   Code Generation

注意:

Providerの型とlifecycleは、P3-05で導入した `flutter_riverpod` の正式APIに従う。

型を推測しないこと。

### P3-06-04 MaterialApp.router移行

目的:
BloodPressureAppをGoRouterへ接続する。

対象ファイル:

-   `lib/app/app.dart`

完了条件:

-   BloodPressureAppがConsumerWidgetになっている
-   Router Providerを `ref.watch` している
-   MaterialAppから `MaterialApp.router` へ移行している
-   `routerConfig` が設定されている
-   `home` が削除されている
-   `theme` / `darkTheme` / `themeMode` が維持されている
-   `title` と `debugShowCheckedModeBanner` が維持されている

今回やらないこと:

-   ThemeMode Provider
-   Redirect
-   ShellRoute
-   Feature画面
-   Navigation UI
-   `bootstrap.dart` 変更

### P3-06-05 Router Smoke Test

目的:
GoRouter経由でも初期Routeが正常表示されることを確認する。

対象ファイル:

-   `test/widget_test.dart`

完了条件:

-   ProviderScopeを含む構成でBloodPressureAppをpumpできる
-   GoRouter経由で `Blood Pressure App` が1件表示される
-   初期Routeが `/` である
-   `pumpAndSettle` の無限待機を避ける
-   Feature Routeをテストしていない

今回やらないこと:

-   push / pop Test
-   Redirect Test
-   ShellRoute Test
-   Deep Link Test
-   invalid path Test
-   recordId parameter Test

### Navigation API方針

後続Featureで次を標準とする。

-   `context.go`
    第一階層移動、タブ移動
-   `context.push`
    詳細、入力、Previewなど戻る前提の画面
-   `context.replace`
    保存後、編集完了後など履歴置換
-   `context.pop`
    戻る、キャンセル、Dialog / Bottom Sheet終了

基本はnamed navigationを使用する。

P3-06ではNavigation APIを使うFeature画面は実装しない。

### P3-05との境界

P3-05:

-   `flutter_riverpod`
-   ProviderScope
-   bootstrap override
-   Riverpod Smoke Test

P3-06:

-   `go_router`
-   Route定数
-   Router Provider
-   `MaterialApp.router`
-   Router Smoke Test

P3-06では `bootstrap.dart` を変更しない。

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
