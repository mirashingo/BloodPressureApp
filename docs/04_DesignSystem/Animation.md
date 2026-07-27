# Animation.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Animation

## ドキュメントID

DS-ANIM-001

------------------------------------------------------------------------

## 名称

アニメーションデザインシステム

------------------------------------------------------------------------

## 目的

BloodPressureApp全体で使用する

アニメーション、トランジション、モーションフィードバックの

時間、イージング、方向、距離、使用条件、

アクセシビリティ対応を統一し、

画面ごとの動きのばらつきと過剰な演出を防ぐこと。

アニメーションは装飾ではなく、

画面遷移、状態変化、操作結果、情報の関連性を

利用者へ分かりやすく伝えるために使用する。

血圧記録アプリとして、

毎日の入力を妨げず、数値の読み取りを邪魔せず、

高齢者や動きに敏感な利用者でも

安心して利用できることを設計目標とする。

------------------------------------------------------------------------

## 適用範囲

-   Splash
-   Onboarding
-   Home
-   Input
-   History
-   Graph
-   Statistics
-   Reminder
-   Export
-   Backup
-   Settings
-   Dialog
-   Bottom Sheet
-   SnackBar
-   Banner
-   Loading
-   Figma Prototype
-   Flutter Animation

------------------------------------------------------------------------

## 基本方針

-   アニメーションは意味のある状態変化に使用する
-   操作結果をすぐに理解できる動きにする
-   画面操作を待たせない
-   数値入力中に不要な動きを発生させない
-   血圧値を過度に跳ねさせない
-   点滅や高速反復を使用しない
-   同時に多くの要素を動かさない
-   方向と画面遷移の関係を統一する
-   Reduce Motion設定に対応する
-   アニメーションなしでも意味が伝わるようにする
-   FigmaとFlutterで時間・カーブ・名称を対応させる
-   60fpsを維持できる実装を優先する

------------------------------------------------------------------------

## アニメーション構造


Animation System
├─ Duration
│   ├─ Instant
│   ├─ Fast
│   ├─ Standard
│   ├─ Emphasized
│   └─ Long
│
├─ Easing
│   ├─ Standard
│   ├─ Enter
│   ├─ Exit
│   ├─ Emphasized
│   └─ Linear
│
├─ Transition
│   ├─ Fade
│   ├─ Slide
│   ├─ Scale
│   ├─ Shared Axis
│   └─ Container Transform
│
├─ Feedback
│   ├─ Press
│   ├─ Focus
│   ├─ Selection
│   ├─ Success
│   ├─ Error
│   └─ Loading
│
└─ Domain Specific
    ├─ Record Save
    ├─ Measurement Add
    ├─ Graph Update
    ├─ History Insert
    ├─ Reminder Toggle
    └─ Backup Progress


------------------------------------------------------------------------

## 命名規則

Motion Token


motion.{category}.{role}


例


motion.duration.fast

motion.duration.standard

motion.easing.enter

motion.transition.page

motion.feedback.press


Flutter


AppMotion.fast

AppMotion.standard

AppMotion.enterCurve

AppMotion.pageTransition


Figma


Motion/Duration/Fast

Motion/Duration/Standard

Motion/Easing/Enter

Motion/Transition/Page


------------------------------------------------------------------------

## Duration

### Instant

時間

0〜50ms。

用途

-   状態の即時切替
-   色変更
-   非表示設定
-   Reduce Motion時の代替

原則

ユーザーが動きを認識する必要がない場合に使用する。

### Fast

時間

100〜150ms。

推奨値

120ms。

用途

-   ボタン押下
-   Chip選択
-   Switch
-   Focus
-   Icon変化
-   小さなHover

### Standard

時間

180〜250ms。

推奨値

220ms。

用途

-   カード展開
-   Bottom Navigation切替
-   入力エラー表示
-   SnackBar
-   小規模なレイアウト変化

### Emphasized

時間

280〜400ms。

推奨値

320ms。

用途

-   画面遷移
-   Dialog
-   Bottom Sheet
-   保存完了
-   重要な状態変化

### Long

時間

450〜700ms。

推奨値

500ms。

用途

-   Onboarding
-   Splash終了
-   グラフ初回描画
-   大きなコンテナ変形

通常操作では

Longを多用しない。

------------------------------------------------------------------------

## Duration一覧


instant       0ms

fast          120ms

fastAlt       150ms

standard      220ms

standardAlt   250ms

emphasized    320ms

emphasizedAlt 400ms

long          500ms


------------------------------------------------------------------------

## Easing

### Standard

用途

要素の位置・サイズ変更。

Flutter

Curves.easeInOutCubic。

Figma

Ease In And Out。

### Enter

用途

新しい要素が画面へ入る。

Flutter

Curves.easeOutCubic。

特徴

開始を早くし、終了を穏やかにする。

### Exit

用途

要素が画面外へ出る。

Flutter

Curves.easeInCubic。

特徴

開始を穏やかにし、終了を早くする。

### Emphasized

用途

重要な画面遷移やコンテナ変形。

Flutter

Curves.easeInOutCubicEmphasized相当。

独自Curveを定義する場合は

Figmaと値を共有する。

### Linear

用途

-   Progress
-   連続回転
-   時間経過表示

Flutter

Curves.linear。

位置移動や画面遷移には

原則使用しない。

------------------------------------------------------------------------

## イージング一覧


standard

enter

exit

emphasized

linear


カスタムBezier例


standard     0.2, 0.0, 0.0, 1.0

enter        0.0, 0.0, 0.2, 1.0

exit         0.4, 0.0, 1.0, 1.0

emphasized   0.2, 0.0, 0.0, 1.0


------------------------------------------------------------------------

## 移動距離

Small

4dp。

用途

Icon、Label、押下。

Medium

8〜16dp。

用途

Card、List Item、Tooltip。

Large

24〜40dp。

用途

Page、Bottom Sheet、Dialog。

原則

-   不要に長い距離を移動させない
-   小さい画面で大きな横移動を避ける
-   数値は位置を大きく動かさない
-   Reduce Motionでは距離を0または短縮する

------------------------------------------------------------------------

# Page Transition

------------------------------------------------------------------------

## Push Transition

### 目的

現在画面から詳細画面へ移動する。

### 使用例

-   Home → Input
-   History → Record Detail
-   Settings → Display Settings
-   Graph → Record Detail

### 動き

新しい画面

右から左へ移動。

旧画面

わずかに左へ移動または静止。

### Duration

320ms。

### Easing

Enter。

### 戻る操作

逆方向へ移動する。

### Flutter

GoRouter CustomTransitionPage。

------------------------------------------------------------------------

## Tab Transition

### 目的

Bottom Navigationで主要画面を切り替える。

### 動き

原則Fade。

必要に応じて

8dp以下の小さな移動を併用する。

### Duration

220ms。

### 注意

-   大きな横Slideを使用しない
-   タブ状態を保持する
-   再読み込みに見えないようにする
-   Reduce Motionでは即時切替可能とする

------------------------------------------------------------------------

## Modal Transition

### 目的

Dialog、Bottom Sheetを表示する。

### Dialog

Fade + Scale。

初期Scale

0.96。

最終Scale

1.0。

Duration

220〜320ms。

### Bottom Sheet

下から上へSlide。

Duration

320ms。

### 背景Overlay

Fade。

Duration

220ms。

------------------------------------------------------------------------

## Full Screen Modal

### 使用例

-   PDF Preview
-   Restore Preview
-   Onboarding

### 動き

下から上またはFade。

iOSでは

Platform Conventionを考慮する。

------------------------------------------------------------------------

# Feedback Animation

------------------------------------------------------------------------

## Button Press

### 目的

押したことを即時に伝える。

### 動き

-   Overlay表示
-   Scale 0.98を許可
-   Elevation減少
-   Ripple

### Duration

120ms。

### 注意

-   血圧入力の主要ボタンを大きく縮小しない
-   Scaleは0.97未満にしない
-   Reduce MotionではOverlayのみとする

------------------------------------------------------------------------

## Icon Button Press

### 動き

-   Overlay
-   小さなScale
-   Icon Color変化

### Duration

100〜120ms。

------------------------------------------------------------------------

## Switch

### 動き

ThumbがTrack内を移動する。

### Duration

150〜220ms。

### 注意

-   ON・OFFを文字や状態でも示す
-   重大な設定では移動後に確認を表示する
-   Loading中は操作不能とする

------------------------------------------------------------------------

## Checkbox・Radio

### 動き

-   Check描画
-   Fill変化
-   Border変化

### Duration

120〜180ms。

チェックマークの描画を

過度に遅くしない。

------------------------------------------------------------------------

## Chip Selection

### 動き

-   背景色変化
-   Check表示
-   Padding変化なし
-   Scale 1.0維持を推奨

### Duration

120ms。

選択時にChip幅が急変しないようにする。

------------------------------------------------------------------------

## Focus

### 動き

-   Focus Ring Fade
-   Border Color変化
-   Label位置変化

### Duration

120ms。

Keyboard操作で

Focus位置が明確に分かること。

------------------------------------------------------------------------

# Input Animation

------------------------------------------------------------------------

## Text Field Focus

### 動き

-   Border変化
-   Label移動
-   Helper Text表示

### Duration

120〜180ms。

### 注意

数値入力中に

入力欄全体を移動させない。

------------------------------------------------------------------------

## Validation Error

### 動き

推奨

-   Error Text Fade
-   Border Color変化
-   軽いVertical Expand

禁止

-   強いShake
-   高速点滅
-   長時間の振動
-   血圧値の左右揺れ

Shakeを使用する場合でも

2〜4dp以内、

1回のみ、

Reduce Motionでは無効とする。

------------------------------------------------------------------------

## Keyboard Transition

Keyboard表示時に

入力欄が隠れないよう

ScrollまたはInsetを調整する。

レイアウト移動は

OSのKeyboard Animationと同期させる。

------------------------------------------------------------------------

# Domain Specific Animation

------------------------------------------------------------------------

## Record Save

### 目的

記録保存の完了を伝える。

### フロー


Save Button Press
    ↓
Button Loading
    ↓
Save Success
    ↓
Success Feedback
    ↓
Home or Detail


### Loading

Button内Progress。

### Success

-   Check Icon
-   Success Message
-   軽いFade
-   必要に応じてScale 0.95 → 1.0

### Duration

Success

320ms。

保持

500〜900ms以内。

### 注意

-   長い祝福演出を使用しない
-   ConfettiをMVPでは使用しない
-   保存結果を文字でも表示する
-   保存完了前に画面を閉じない

------------------------------------------------------------------------

## Measurement Add

### 目的

複数回測定へ1件追加されたことを示す。

### 動き

-   新規行Fade In
-   8〜16dp Slide
-   測定回数Badge更新
-   代表値再計算

### Duration

220ms。

### 数値更新

Cross Fadeまたは

AnimatedSwitcher。

数値を大きく跳ねさせない。

------------------------------------------------------------------------

## Measurement Delete

### 動き

-   行Collapse
-   Fade Out
-   集約値更新

### Duration

220ms。

### 注意

Undoを提供できる場合は

SnackBarを表示する。

------------------------------------------------------------------------

## Blood Pressure Value Update

### 目的

保存後や期間変更後の数値変化を伝える。

### 推奨

Cross Fade。

### Duration

220ms。

### 禁止

-   数字が回転する演出
-   Slot Machine表現
-   高速Count Up
-   色の点滅

統計値のCount Upを使う場合は

500ms以内、

Reduce Motionでは即時表示とする。

------------------------------------------------------------------------

## History Insert

### 目的

新規保存記録が履歴へ追加されたことを示す。

### 動き

新規Cardを

Fade + 8dp Slideで表示する。

### Duration

220ms。

### 注意

一覧全体を再アニメーションしない。

------------------------------------------------------------------------

## History Delete

### 動き

CardをFade Outし、

高さをCollapseする。

### Duration

220ms。

削除後の一覧位置を

大きく移動させない。

------------------------------------------------------------------------

## Graph Initial Draw

### 目的

系列と期間の関係を理解しやすくする。

### 推奨

-   Line Reveal
-   Point Fade
-   Axisは先に表示

### Duration

400〜500ms。

### 注意

-   毎回再生しない
-   初回表示または大きな期間変更時のみ
-   1系列ずつ長く遅延させない
-   Reduce Motionでは即時表示

------------------------------------------------------------------------

## Graph Period Change

### 推奨

Cross FadeまたはMorph。

### Duration

220〜320ms。

### 注意

-   データ点の位置を過度に飛ばさない
-   選択Tooltipを閉じる
-   Axis変更を分かりやすくする
-   Loading時はSkeletonまたはProgressを表示する

------------------------------------------------------------------------

## Graph Data Point Selection

### 動き

-   Marker拡大
-   Tooltip Fade
-   Focus Ring

### Duration

120〜180ms。

Marker Scale

最大1.2程度。

------------------------------------------------------------------------

## Statistics Update

期間変更後に

Card ValueをCross Fadeする。

複数Cardは

同時または短いStaggerで表示する。

Stagger間隔

20〜40ms。

合計遅延

150ms以内。

------------------------------------------------------------------------

## Reminder Toggle

Switch移動後、

状態説明をFadeで更新する。

通知権限が必要な場合は

DialogまたはBannerへ遷移する。

過度なSuccess Animationは使用しない。

------------------------------------------------------------------------

## Backup Progress

### 状態

-   Preparing
-   In Progress
-   Success
-   Failed

### Progress

Linear Progress。

進捗率が不明な場合は

Indeterminate。

### 注意

-   進捗を偽装しない
-   長時間処理では状態文を更新する
-   Screenを閉じても処理継続するか明示する
-   Success・Failedを文字で表示する

------------------------------------------------------------------------

## Restore Progress

復元中は

破壊的な追加操作を無効化する。

進捗を表示し、

完了後に結果件数を表示する。

アニメーションより

状態の正確さを優先する。

------------------------------------------------------------------------

## AI Result Display

AI機能を使用する場合、

回答文字を1文字ずつ表示する演出は

原則使用しない。

理由

-   読み上げとの不整合
-   待ち時間増加
-   読みづらさ
-   動きへの負担

推奨

段落単位または全体Fade。

------------------------------------------------------------------------

# Loading Animation

------------------------------------------------------------------------

## Circular Progress

用途

-   Button
-   小さなInline処理
-   初期読み込み

### サイズ

Small

16〜20dp。

Medium

24〜32dp。

Large

40〜48dp。

### 注意

-   連続回転はLinear
-   Reduce Motionでも進捗状態は必要
-   代替として静的Progress Iconを許可する

------------------------------------------------------------------------

## Linear Progress

用途

-   Backup
-   Restore
-   Export
-   Download
-   Upload

進捗率が分かる場合は

Determinateを使用する。

------------------------------------------------------------------------

## Skeleton

用途

-   Home初期読み込み
-   History一覧
-   Statistics Card

### 動き

Subtle Shimmer。

### Duration

1000〜1600ms。

### 注意

-   Shimmerのコントラストを弱くする
-   高速移動させない
-   長時間表示しない
-   Reduce Motionでは静的Skeleton

------------------------------------------------------------------------

## Refresh Indicator

Pull to Refresh時に使用する。

血圧記録アプリの主要機能が

ローカルデータ中心の場合は

不用意に多用しない。

------------------------------------------------------------------------

# Feedback Surface

------------------------------------------------------------------------

## SnackBar

### Enter

下から8〜16dp Slide + Fade。

### Exit

Fadeまたは下方向。

### Duration

220ms。

### 表示時間

標準

3〜4秒。

Undoあり

5〜6秒。

画面読み上げ時は

十分な時間を確保する。

------------------------------------------------------------------------

## Banner

### Enter

Vertical Expand + Fade。

### Exit

Collapse + Fade。

### Duration

220〜320ms。

レイアウトの急激なJumpを防ぐ。

------------------------------------------------------------------------

## Tooltip

### Enter

Fade + Scale 0.98 → 1.0。

### Duration

120ms。

### Exit

100ms。

------------------------------------------------------------------------

## Dialog

### Enter

Overlay Fade。

Dialog Fade + Scale。

### Exit

逆方向。

### Duration

220〜320ms。

------------------------------------------------------------------------

## Bottom Sheet

### Enter

下からSlide。

### Exit

下へSlide。

### Duration

320ms。

Drag操作中は

ユーザー操作へ追従する。

------------------------------------------------------------------------

# Expand・Collapse

------------------------------------------------------------------------

## Accordion

用途

-   複数回測定詳細
-   設定説明
-   AI説明
-   Backup詳細

### 動き

Height + Fade。

### Duration

220ms。

### 注意

-   Header位置を保持する
-   開閉状態を読み上げる
-   大量のAccordionを同時に開かない

------------------------------------------------------------------------

## Card Expansion

Container Transformまたは

Size Transition。

Duration

320ms。

共有要素が明確な場合のみ使用する。

------------------------------------------------------------------------

# Navigation Direction

------------------------------------------------------------------------

階層が深くなる

右から左。

戻る

左から右。

Bottom Sheet

下から上。

閉じる

上から下。

同階層タブ

Fade。

選択変更

位置移動なしまたは小さな移動。

方向を画面ごとに変更しない。

------------------------------------------------------------------------

# Stagger

------------------------------------------------------------------------

使用可能

-   Onboarding
-   初回Dashboard表示
-   Statistics Card
-   Empty State

間隔

20〜50ms。

最大要素数

5〜6個。

合計時間

500ms以内。

一覧全件へ

長いStaggerを使用しない。

------------------------------------------------------------------------

# Haptic Feedback

------------------------------------------------------------------------

使用可能

-   Switch変更
-   Segmented Control選択
-   保存完了
-   破壊的操作確認
-   Date Picker選択

強さ

軽いFeedbackを基本とする。

禁止

-   文字入力ごとの振動
-   スクロールごとの振動
-   エラー時の強い連続振動
-   ユーザー設定を無視する

Flutter

HapticFeedback.selectionClick。

HapticFeedback.lightImpact。

------------------------------------------------------------------------

# Reduce Motion

------------------------------------------------------------------------

## 目的

動きに敏感な利用者、

めまい、前庭障害、集中困難などがある利用者でも

安全に利用できるようにする。

## 検出

-   OSのReduce Motion設定
-   アプリ独自のアニメーション軽減設定

## 軽減ルール

-   SlideをFadeへ変更
-   Scaleを無効化
-   Parallaxを無効化
-   Long AnimationをInstantまたはFastへ変更
-   Count Upを即時表示
-   Graph Line Revealを無効化
-   Shimmerを静的表示
-   Confettiを使用しない
-   Staggerを無効化
-   自動反復Animationを停止または最小化

## 維持するもの

-   状態変化
-   Loading表示
-   Focus表示
-   選択表示
-   Success・Errorの文字情報

アニメーションを減らしても

操作結果が分からなくならないこと。

------------------------------------------------------------------------

# Accessibility

------------------------------------------------------------------------

-   点滅を使用しない
-   3回/秒を超える明滅を使用しない
-   自動再生Animationを停止可能にする
-   Motionなしでも意味を理解できる
-   Focus移動とVisual Motionを一致させる
-   Screen Readerの読み上げをAnimation完了まで不必要に待たせない
-   SnackBarやSuccess表示を読み上げる
-   Loading状態を読み上げる
-   Reduce Motionへ対応する
-   Animation中も操作対象が予測不能に移動しない
-   大きな文字でレイアウトAnimationが破綻しない

------------------------------------------------------------------------

# Performance

------------------------------------------------------------------------

目標

60fps。

高Refresh Rate端末では

可能な範囲で滑らかに表示する。

推奨

-   TransformとOpacityを優先する
-   不要なLayout Animationを避ける
-   RepaintBoundaryを適切に使用する
-   大きなBlurを多用しない
-   Graph全体を毎Frame再計算しない
-   AnimationControllerを適切にdisposeする
-   Offscreen Animationを停止する
-   const Widgetを活用する
-   Implicit Animationを適切に使用する

禁止

-   大量のShadowをFrameごとに変更する
-   大きな画像を毎FrameScaleする
-   複数の無限Animationを同時実行する
-   一覧全件を同時Animationする

------------------------------------------------------------------------

# Figma実装

------------------------------------------------------------------------

## Prototype設定

Transition名


Instant

Fast Fade

Standard Fade

Page Push

Modal Open

Bottom Sheet Open

Expand

Success


Duration


Fast       120ms

Standard   220ms

Emphasized 320ms

Long       500ms


Easing

-   Ease Out
-   Ease In
-   Ease In And Out
-   Linear
-   Custom Bezier

Smart Animateは

同一要素の関係が明確な場合のみ使用する。

------------------------------------------------------------------------

## Figma Variant

状態変化例


state=default

state=pressed

state=selected

state=loading

state=success

state=error


Prototypeでは

Component Variant間の遷移時間を

本ドキュメントへ合わせる。

------------------------------------------------------------------------

## Figma命名


Motion/Page/Push

Motion/Page/TabFade

Motion/Modal/Dialog

Motion/Modal/BottomSheet

Motion/Feedback/Press

Motion/Feedback/Success

Motion/Data/GraphUpdate


------------------------------------------------------------------------

# Flutter実装

------------------------------------------------------------------------

## ファイル構成


lib/
└─ core/
   └─ motion/
      ├─ app_motion.dart
      ├─ app_durations.dart
      ├─ app_curves.dart
      ├─ app_page_transitions.dart
      ├─ reduce_motion_provider.dart
      └─ motion_extensions.dart


------------------------------------------------------------------------

## AppDurations例

dart
abstract final class AppDurations {
  static const instant = Duration.zero;
  static const fast = Duration(milliseconds: 120);
  static const fastAlt = Duration(milliseconds: 150);
  static const standard = Duration(milliseconds: 220);
  static const standardAlt = Duration(milliseconds: 250);
  static const emphasized = Duration(milliseconds: 320);
  static const emphasizedAlt = Duration(milliseconds: 400);
  static const long = Duration(milliseconds: 500);
}


------------------------------------------------------------------------

## AppCurves例

dart
abstract final class AppCurves {
  static const standard = Cubic(0.2, 0.0, 0.0, 1.0);
  static const enter = Cubic(0.0, 0.0, 0.2, 1.0);
  static const exit = Cubic(0.4, 0.0, 1.0, 1.0);
  static const emphasized = Cubic(0.2, 0.0, 0.0, 1.0);
  static const linear = Curves.linear;
}


------------------------------------------------------------------------

## Reduce Motion判定例

dart
bool shouldReduceMotion(BuildContext context) {
  final mediaQuery = MediaQuery.maybeOf(context);

  return mediaQuery?.disableAnimations ?? false;
}


アプリ独自設定と組み合わせる場合は

Providerから取得する。

------------------------------------------------------------------------

## AnimatedSwitcher例

dart
class AnimatedValueText extends StatelessWidget {
  const AnimatedValueText({
    super.key,
    required this.value,
    required this.style,
    this.reduceMotion = false,
  });

  final String value;
  final TextStyle style;
  final bool reduceMotion;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: reduceMotion
          ? Duration.zero
          : AppDurations.standard,
      switchInCurve: AppCurves.enter,
      switchOutCurve: AppCurves.exit,
      transitionBuilder: (child, animation) {
        if (reduceMotion) {
          return child;
        }

        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Text(
        value,
        key: ValueKey(value),
        style: style,
      ),
    );
  }
}


------------------------------------------------------------------------

## Page Transition例

dart
CustomTransitionPage<void>(
  key: state.pageKey,
  transitionDuration: AppDurations.emphasized,
  reverseTransitionDuration: AppDurations.emphasized,
  child: const RecordDetailScreen(),
  transitionsBuilder: (
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    final reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    if (reduceMotion) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }

    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0.08, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: AppCurves.enter,
        reverseCurve: AppCurves.exit,
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: offsetAnimation,
        child: child,
      ),
    );
  },
);


------------------------------------------------------------------------

## 推奨Widget

Implicit Animation

-   AnimatedContainer
-   AnimatedOpacity
-   AnimatedSwitcher
-   AnimatedSize
-   AnimatedAlign
-   TweenAnimationBuilder

Explicit Animation

-   AnimationController
-   FadeTransition
-   SlideTransition
-   ScaleTransition
-   SizeTransition

原則

単純な状態変化は

Implicit Animationを使用する。

------------------------------------------------------------------------

## Provider例


reduceMotionProvider

animationEnabledProvider

motionPreferenceProvider


------------------------------------------------------------------------

# 状態管理

Animation状態と

Business状態を分離する。

Business状態例

-   saving
-   saved
-   failed
-   loading

Animation状態例

-   visible
-   expanded
-   selected
-   transitionProgress

保存成功をAnimation完了に依存させない。

Animationが停止しても

Business処理が完了すること。

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Duration

-   Fastが120msである
-   Standardが220msである
-   Emphasizedが320msである
-   Longが500msである
-   画面ごとに任意時間を直接指定していない

## Easing

-   Enter Curveを使用している
-   Exit Curveを使用している
-   Linearを画面遷移に使用していない
-   FigmaとFlutterのCurveが一致する

## Page

-   Push方向が統一されている
-   Back方向が逆である
-   Tab切替がFadeである
-   DialogがFade + Scaleである
-   Bottom Sheetが下から表示される

## Input

-   Focus Animationが短い
-   Error表示が読める
-   強いShakeを使用していない
-   Keyboard表示時に入力欄が隠れない
-   数値入力中にレイアウトが大きく動かない

## Domain

-   保存中にButton Loadingを表示できる
-   保存成功を文字で確認できる
-   複数回測定追加を確認できる
-   History追加が過度に動かない
-   Graph初回描画を無効化できる
-   Backup進捗を正しく表示できる

## Reduce Motion

-   OS設定を検出できる
-   アプリ設定を反映できる
-   SlideをFadeへ変更できる
-   Scaleを無効化できる
-   Count Upを即時表示できる
-   Graph Revealを無効化できる
-   Shimmerを静的表示にできる
-   主要機能を問題なく使用できる

## Accessibility

-   点滅がない
-   無限Animationを停止できる
-   Loading状態を読み上げられる
-   Success状態を読み上げられる
-   Animationなしでも状態を理解できる
-   Focus位置が予測不能に移動しない

## Performance

-   60fpsを維持できる
-   Offscreen Animationを停止できる
-   AnimationControllerをdisposeできる
-   一覧全件を同時Animationしていない
-   Graph更新で不要な再描画がない

------------------------------------------------------------------------

## Acceptance Criteria

□ Duration Tokenを定義できる

□ Fast、Standard、Emphasized、Longを定義できる

□ Easing Tokenを定義できる

□ Enter、Exit、Standard、Linearを定義できる

□ Page Push Transitionを定義できる

□ Tab Transitionを定義できる

□ Dialog Transitionを定義できる

□ Bottom Sheet Transitionを定義できる

□ Button Press Feedbackを定義できる

□ Input Focus Animationを定義できる

□ Validation Error Animationを定義できる

□ Record Save Animationを定義できる

□ Measurement Add・Delete Animationを定義できる

□ Blood Pressure Value Updateを定義できる

□ History Insert・Delete Animationを定義できる

□ Graph Initial Draw・Updateを定義できる

□ Reminder Toggle Animationを定義できる

□ Backup・Restore Progressを定義できる

□ Loading Animationを定義できる

□ SnackBar・Banner Animationを定義できる

□ Reduce Motionへ対応できる

□ Animationなしでも状態を理解できる

□ 点滅や過度な反復Animationを使用しない

□ Figma Prototypeへ反映できる

□ Flutter Duration・Curve Tokenへ実装できる

□ GoRouter Page Transitionへ実装できる

□ Widget内へ任意のDurationを直接記述しない

□ 60fpsを目標に実装できる

□ 医療情報の読み取りを妨げるAnimationを使用しない

------------------------------------------------------------------------

## 依存機能

F001 Blood Pressure Recording

F002 Home Dashboard

F003 History

F004 Graph

F005 Statistics

F006 Reminder

F007 Export

F008 Backup

F009 Settings

F011 Time Period Classification

F107 Multiple Measurement Aggregation

------------------------------------------------------------------------

## 優先度

★★★★☆（MVP重要）

------------------------------------------------------------------------

## 関連ドキュメント

-   01_Requirements/F001_BloodPressureRecording.md
-   02_UX/UserFlow.md
-   02_UX/Navigation.md
-   02_UX/ScreenList.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Colors.md
-   04_DesignSystem/Typography.md
-   04_DesignSystem/Components.md
-   04_DesignSystem/Spacing.md
-   06_Flutter/

------------------------------------------------------------------------

## 将来拡張

-   Shared Element Transition
-   Advanced Container Transform
-   Wear OS Motion
-   Apple Watch Motion
-   Tablet Adaptive Transition
-   Desktop Hover Motion
-   Web Page Transition
-   Voice Input Feedback
-   Bluetooth Device Connection Motion
-   Health Connect Sync Motion
-   AI Processing Feedback
-   Personalized Motion Intensity
-   Device Performance別Motion設定
-   Motion Catalog
-   Golden Animation Test
