# Colors.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Colors

## ドキュメントID

DS-COLOR-001

------------------------------------------------------------------------

## 名称

カラーデザインシステム

------------------------------------------------------------------------

## 目的

BloodPressureApp全体で使用する色の役割、

命名規則、ライトテーマ、ダークテーマ、

状態表現、血圧情報、グラフ、アクセシビリティを統一し、

画面ごとの色のばらつきを防ぐこと。

色は装飾ではなく、

情報の優先順位、操作可能性、状態、警告を

利用者へ伝えるための意味を持つものとして定義する。

特に高齢者や視認性に配慮が必要な利用者でも、

色だけに依存せず、安全かつ快適に利用できることを

設計目標とする。

------------------------------------------------------------------------

## 適用範囲

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
-   Notification
-   PDF出力
-   Flutter Theme
-   Figma Variables

------------------------------------------------------------------------

## 基本方針

-   色は役割名で管理する
-   画面から直接HEX値を参照しない
-   ライトテーマとダークテーマを同一トークンで切り替える
-   色だけで状態や意味を伝えない
-   文字と背景のコントラストを確保する
-   医療診断と誤解される色分けを行わない
-   警告色を過度に使用しない
-   血圧値の強調と危険度判定を分離する
-   グラフ系列は色と線種・マーカーを併用する
-   将来のブランド変更に対応できる構造とする

------------------------------------------------------------------------

## カラー構造


Color System
├─ Brand Colors
│   ├─ Primary
│   ├─ Secondary
│   └─ Accent
│
├─ Surface Colors
│   ├─ Background
│   ├─ Surface
│   ├─ Surface Variant
│   └─ Overlay
│
├─ Content Colors
│   ├─ Text Primary
│   ├─ Text Secondary
│   ├─ Text Disabled
│   └─ Icon
│
├─ Border Colors
│   ├─ Border Default
│   ├─ Border Strong
│   └─ Divider
│
├─ State Colors
│   ├─ Success
│   ├─ Warning
│   ├─ Error
│   └─ Information
│
├─ Blood Pressure Colors
│   ├─ SYS
│   ├─ DIA
│   └─ Pulse
│
└─ Interaction Colors
    ├─ Hover
    ├─ Focus
    ├─ Pressed
    ├─ Selected
    └─ Disabled


------------------------------------------------------------------------

## 命名規則

カラー名は

意味と役割を示すSemantic Tokenを使用する。


color.{category}.{role}.{state}


例


color.brand.primary.default

color.surface.background.default

color.text.primary.default

color.state.error.container

color.chart.systolic.default


Flutterでは

camelCaseを使用する。

例


AppColors.primary

AppColors.background

AppColors.textPrimary

AppColors.errorContainer

AppColors.chartSystolic


------------------------------------------------------------------------

## ブランドカラー

BloodPressureAppのブランドカラーは、

安心感、清潔感、継続しやすさを表現する。

### Primary

用途

-   主要ボタン
-   選択状態
-   アクティブなBottom Navigation
-   フォーカス
-   主要リンク
-   重要な操作導線

ライトテーマ

#2F6FED

ダークテーマ

#8AB4FF

### Primary Container

用途

-   選択カード背景
-   補助的な強調
-   アクティブ状態の背景
-   情報チップ

ライトテーマ

#DCE7FF

ダークテーマ

#1D3A68

### On Primary

用途

Primary背景上の文字・アイコン。

ライトテーマ

#FFFFFF

ダークテーマ

#0A1B35

### Secondary

用途

-   補助ボタン
-   タグ
-   セカンダリアクション
-   Pulse系列候補

ライトテーマ

#4D7C73

ダークテーマ

#84C9BB

### Accent

用途

-   記録完了
-   継続状況
-   前向きな補助強調
-   軽い注目表示

ライトテーマ

#7A5AF8

ダークテーマ

#B6A5FF

------------------------------------------------------------------------

## サーフェスカラー

### Background

アプリ全体の背景。

ライトテーマ

#F7F9FC

ダークテーマ

#101318

### Surface

カード、ダイアログ、Bottom Sheetの背景。

ライトテーマ

#FFFFFF

ダークテーマ

#181C22

### Surface Variant

入力欄、補助カード、選択前領域。

ライトテーマ

#EEF2F7

ダークテーマ

#232933

### Surface Elevated

浮いたカード、モーダル、選択中パネル。

ライトテーマ

#FFFFFF

ダークテーマ

#282F3A

### Overlay

ダイアログ表示時の背面。

ライトテーマ

#000000 40%

ダークテーマ

#000000 60%

------------------------------------------------------------------------

## テキストカラー

### Text Primary

用途

-   見出し
-   本文
-   血圧値
-   主要ラベル

ライトテーマ

#1A1D24

ダークテーマ

#F4F6F8

### Text Secondary

用途

-   補助説明
-   日時
-   単位
-   サブタイトル

ライトテーマ

#5C6470

ダークテーマ

#B7BEC8

### Text Tertiary

用途

-   補足情報
-   プレースホルダー
-   非強調情報

ライトテーマ

#7B8491

ダークテーマ

#8F98A5

### Text Disabled

用途

無効な操作・非活性表示。

ライトテーマ

#AAB1BB

ダークテーマ

#666F7C

### Text Inverse

用途

濃色背景上の文字。

ライトテーマ

#FFFFFF

ダークテーマ

#101318

------------------------------------------------------------------------

## アイコンカラー

### Icon Primary

ライトテーマ

#353B45

ダークテーマ

#E3E7EC

### Icon Secondary

ライトテーマ

#6C7581

ダークテーマ

#AAB2BD

### Icon Disabled

ライトテーマ

#B8BEC6

ダークテーマ

#626B77

### Icon On Primary

ライトテーマ

#FFFFFF

ダークテーマ

#0A1B35

------------------------------------------------------------------------

## ボーダー・区切り線

### Border Default

用途

-   入力欄
-   カード境界
-   非選択チップ

ライトテーマ

#D5DAE1

ダークテーマ

#39414D

### Border Strong

用途

-   フォーカス
-   強調枠
-   選択中入力欄

ライトテーマ

#7E8793

ダークテーマ

#8791A0

### Divider

用途

-   設定一覧
-   履歴グループ
-   セクション区切り

ライトテーマ

#E6E9EE

ダークテーマ

#2C333E

------------------------------------------------------------------------

## 状態カラー

### Success

用途

-   保存完了
-   バックアップ成功
-   記録完了
-   有効状態

ライトテーマ

#247A52

ダークテーマ

#66C995

Success Container

ライトテーマ

#DDF4E8

ダークテーマ

#183D2D

On Success Container

ライトテーマ

#145337

ダークテーマ

#B9F2D4

### Warning

用途

-   注意
-   権限不足
-   未完了設定
-   復元前確認

ライトテーマ

#A05A00

ダークテーマ

#F2B35D

Warning Container

ライトテーマ

#FFF0D8

ダークテーマ

#4A3218

On Warning Container

ライトテーマ

#6A3B00

ダークテーマ

#FFE1B5

### Error

用途

-   入力エラー
-   保存失敗
-   削除確認
-   重大な操作失敗

ライトテーマ

#C43D45

ダークテーマ

#FF8A91

Error Container

ライトテーマ

#FFE1E3

ダークテーマ

#51262A

On Error Container

ライトテーマ

#7E2026

ダークテーマ

#FFD2D5

### Information

用途

-   操作説明
-   AI利用説明
-   権限説明
-   補足案内

ライトテーマ

#2F6FED

ダークテーマ

#8AB4FF

Information Container

ライトテーマ

#E3ECFF

ダークテーマ

#1D365F

------------------------------------------------------------------------

## 血圧表示カラー

血圧値の色は

診断分類ではなく、

情報の識別に使用する。

### SYS

用途

-   収縮期血圧
-   GraphのSYS系列
-   履歴・詳細のSYSラベル

ライトテーマ

#D14B58

ダークテーマ

#FF8C96

### DIA

用途

-   拡張期血圧
-   GraphのDIA系列
-   履歴・詳細のDIAラベル

ライトテーマ

#2F6FED

ダークテーマ

#8AB4FF

### Pulse

用途

-   脈拍
-   GraphのPulse系列
-   履歴・詳細のPulseラベル

ライトテーマ

#4D7C73

ダークテーマ

#84C9BB

### 使用ルール

-   数値本文は原則Text Primaryを使用する
-   系列名、アイコン、マーカーに専用色を使用する
-   高値・低値を赤や青だけで表現しない
-   値の意味は文字、アイコン、説明を併用する
-   医療上の正常・異常を色だけで断定しない

------------------------------------------------------------------------

## 時間帯カラー

### Morning

ライトテーマ

#D98A24

ダークテーマ

#FFC46B

### Daytime

ライトテーマ

#4D7C73

ダークテーマ

#84C9BB

### Evening

ライトテーマ

#6750A4

ダークテーマ

#B9A7F5

### Other

ライトテーマ

#6C7581

ダークテーマ

#AAB2BD

### 使用ルール

-   色と文字を併記する
-   アイコンまたは形状も併用する
-   時間帯の識別以外に意味を持たせない
-   フィルター選択時もラベルを表示する

------------------------------------------------------------------------

## グラフカラー

### SYS Line

ライトテーマ

#D14B58

ダークテーマ

#FF8C96

### DIA Line

ライトテーマ

#2F6FED

ダークテーマ

#8AB4FF

### Pulse Line

ライトテーマ

#4D7C73

ダークテーマ

#84C9BB

### Grid Line

ライトテーマ

#E1E5EA

ダークテーマ

#303844

### Axis

ライトテーマ

#6C7581

ダークテーマ

#AAB2BD

### Selected Point

ライトテーマ

#7A5AF8

ダークテーマ

#B6A5FF

### Missing Data

ライトテーマ

#B8BEC6

ダークテーマ

#626B77

### 使用ルール

-   SYSは実線
-   DIAは破線または別マーカー
-   Pulseは点線または別グラフ
-   色だけに依存しない
-   データ点に形状差をつける
-   凡例を常に確認可能にする
-   白黒印刷でも識別できる構成とする

------------------------------------------------------------------------

## インタラクションカラー

### Hover

Primaryの8%オーバーレイ。

### Focus

Primary。

フォーカスリング幅

2dp以上。

### Pressed

Primaryの16%オーバーレイ。

### Selected

Primary Container。

### Disabled Background

ライトテーマ

#E6E9EE

ダークテーマ

#2C333E

### Disabled Content

Text Disabled。

------------------------------------------------------------------------

## コンポーネント別使用例

### Primary Button

背景

Primary。

文字

On Primary。

Pressed

Primary + 16% Overlay。

Disabled Background

Disabled Background。

Disabled Text

Text Disabled。

### Secondary Button

背景

TransparentまたはSurface。

枠

Primary。

文字

Primary。

### Text Field

背景

Surface。

枠

Border Default。

フォーカス枠

Primary。

エラー枠

Error。

ラベル

Text Secondary。

入力文字

Text Primary。

### Card

背景

Surface。

枠

Border Defaultまたはなし。

見出し

Text Primary。

補助文字

Text Secondary。

### Chip

未選択背景

Surface Variant。

未選択文字

Text Secondary。

選択背景

Primary Container。

選択文字

Primary。

### Dialog

背景

Surface Elevated。

タイトル

Text Primary。

本文

Text Secondary。

危険操作

Error。

------------------------------------------------------------------------

## ライトテーマ一覧


primary                 #2F6FED
primaryContainer        #DCE7FF
onPrimary               #FFFFFF
secondary               #4D7C73
accent                  #7A5AF8

background              #F7F9FC
surface                 #FFFFFF
surfaceVariant          #EEF2F7
surfaceElevated         #FFFFFF

textPrimary             #1A1D24
textSecondary           #5C6470
textTertiary            #7B8491
textDisabled            #AAB1BB

borderDefault           #D5DAE1
borderStrong            #7E8793
divider                 #E6E9EE

success                 #247A52
warning                 #A05A00
error                   #C43D45
information             #2F6FED

chartSystolic           #D14B58
chartDiastolic          #2F6FED
chartPulse              #4D7C73


------------------------------------------------------------------------

## ダークテーマ一覧


primary                 #8AB4FF
primaryContainer        #1D3A68
onPrimary               #0A1B35
secondary               #84C9BB
accent                  #B6A5FF

background              #101318
surface                 #181C22
surfaceVariant          #232933
surfaceElevated         #282F3A

textPrimary             #F4F6F8
textSecondary           #B7BEC8
textTertiary            #8F98A5
textDisabled            #666F7C

borderDefault           #39414D
borderStrong            #8791A0
divider                 #2C333E

success                 #66C995
warning                 #F2B35D
error                   #FF8A91
information             #8AB4FF

chartSystolic           #FF8C96
chartDiastolic          #8AB4FF
chartPulse              #84C9BB


------------------------------------------------------------------------

## コントラスト要件

本文文字

背景に対して4.5:1以上。

大きな文字

背景に対して3:1以上。

アイコン・UI部品

背景に対して3:1以上。

無効状態

操作不可であることを

色以外でも示す。

フォーカス

背景に対して明確に識別できること。

コントラスト確認は

ライトテーマ、ダークテーマ、

高コントラストテーマで実施する。

------------------------------------------------------------------------

## 高コントラスト対応

高コントラスト設定が有効な場合は

-   Text Primaryと背景の差を拡大
-   Border DefaultをBorder Strongへ変更
-   フォーカスリングを太くする
-   グラフ線を太くする
-   マーカーサイズを大きくする
-   補助文字の明度差を拡大
-   半透明表現を減らす

こと。

------------------------------------------------------------------------

## 禁止事項

-   画面内へHEX値を直接記述する
-   色だけでエラーを示す
-   赤をすべて危険判定として使用する
-   緑をすべて正常判定として使用する
-   SYS・DIAを同じ色・同じ線種で表示する
-   薄いグレー文字を小さいサイズで使用する
-   ダークテーマで純黒背景と純白文字を多用する
-   医療基準を根拠なく色分けする
-   ユーザー設定を無視してテーマを固定する
-   グラデーションを情報表現の必須条件にする

------------------------------------------------------------------------

## Figma実装

Figma Variables


Color/Brand/Primary

Color/Brand/PrimaryContainer

Color/Surface/Background

Color/Surface/Default

Color/Text/Primary

Color/Text/Secondary

Color/State/Success

Color/State/Warning

Color/State/Error

Color/Chart/Systolic

Color/Chart/Diastolic

Color/Chart/Pulse


Mode

-   Light
-   Dark
-   High Contrast Light
-   High Contrast Dark

すべてのComponentは

Variableを参照し、

直接HEX値を指定しない。

------------------------------------------------------------------------

## Flutter実装

クラス

AppColors

AppColorScheme

AppTheme

配置

AppColorsはDesign Tokenとして次へ配置する。

lib/design_system/tokens/app_colors.dart

AppColorScheme、AppThemeはP3-04 Theme実装で扱う。

### Flutter実装時の命名規則

Flutter実装では、Light Theme用とDark Theme用のColor Tokenを、

単一の`AppColors`クラスへ定義する。

Light Theme用Tokenには`light`接頭辞を付ける。

Dark Theme用Tokenには`dark`接頭辞を付ける。

すべてのTokenについて、次の変換規則を適用する。

Light:

`AppColors.light{TokenName}`

Dark:

`AppColors.dark{TokenName}`

`{TokenName}`は、Colors.mdに記載されたlowerCamelCaseのToken名の

先頭をUpperCamelCase相当へ接続する。

定数はlowerCamelCaseとする。

想定形式は次のとおり。

-   Class: `AppColors`
-   Token: `AppColors.lightPrimary`
-   Token: `AppColors.darkPrimary`

### 命名例

| Theme | Semantic Token | Flutter Token |
|---|---|---|
| Light | primary | AppColors.lightPrimary |
| Dark | primary | AppColors.darkPrimary |
| Light | primaryContainer | AppColors.lightPrimaryContainer |
| Dark | primaryContainer | AppColors.darkPrimaryContainer |
| Light | textPrimary | AppColors.lightTextPrimary |
| Dark | textPrimary | AppColors.darkTextPrimary |
| Light | surfaceVariant | AppColors.lightSurfaceVariant |
| Dark | surfaceVariant | AppColors.darkSurfaceVariant |
| Light | chartSystolic | AppColors.lightChartSystolic |
| Dark | chartSystolic | AppColors.darkChartSystolic |
| Light | chartDiastolic | AppColors.lightChartDiastolic |
| Dark | chartDiastolic | AppColors.darkChartDiastolic |


実装方針

-   Color Tokenは`AppColors`へ定義する
-   Light Theme用とDark Theme用を同一クラス内で接頭辞により区別する
-   ThemeData、ColorScheme、TextThemeへの接続はP3-04で行う
-   ThemeDataを使用する
-   ColorSchemeを基本とする
-   独自色はThemeExtensionで管理する
-   BuildContext経由で色を取得する
-   Widget内へ固定色を直接記述しない
-   Riverpodでテーマ設定を管理する

### Material 3 ColorScheme生成方針

P3-04では、Material 3の`ColorScheme`を

`ColorScheme.fromSeed`でLight / Darkそれぞれ生成し、

`copyWith`で`AppColors`の正式Tokenを上書きする。

Light:

```dart
ColorScheme.fromSeed(
  seedColor: AppColors.lightPrimary,
  brightness: Brightness.light,
)
```

Dark:

```dart
ColorScheme.fromSeed(
  seedColor: AppColors.darkPrimary,
  brightness: Brightness.dark,
)
```

`ColorScheme.fromSeed`で生成された値は、

Material 3の役割を満たすための生成値として扱う。

生成値を既存の正式Color Tokenとして扱わない。

### AppColorsによるColorScheme上書き

`AppColorScheme`では、次のColorScheme Roleを

`AppColors`の正式Tokenで上書きする。

Light / Darkの各Themeでは、それぞれ対応する

`AppColors.light*` / `AppColors.dark*` を参照する。

| ColorScheme Role | Light | Dark |
|---|---|---|
| primary | AppColors.lightPrimary | AppColors.darkPrimary |
| onPrimary | AppColors.lightOnPrimary | AppColors.darkOnPrimary |
| primaryContainer | AppColors.lightPrimaryContainer | AppColors.darkPrimaryContainer |
| secondary | AppColors.lightSecondary | AppColors.darkSecondary |
| tertiary | AppColors.lightAccent | AppColors.darkAccent |
| surface | AppColors.lightSurface | AppColors.darkSurface |
| surfaceContainerHighest | AppColors.lightSurfaceVariant | AppColors.darkSurfaceVariant |
| error | AppColors.lightError | AppColors.darkError |
| onSurface | AppColors.lightTextPrimary | AppColors.darkTextPrimary |
| onSurfaceVariant | AppColors.lightTextSecondary | AppColors.darkTextSecondary |
| outline | AppColors.lightBorderDefault | AppColors.darkBorderDefault |
| outlineVariant | AppColors.lightDivider | AppColors.darkDivider |
| surfaceTint | AppColors.lightPrimary | AppColors.darkPrimary |

上記以外のColorScheme Roleへ、

独自判断で既存Tokenを割り当てない。

### ColorScheme生成値として扱うRole

AppColors側に正式Tokenが存在しないColorScheme Roleは、

`ColorScheme.fromSeed`が生成した値を使用する。

対象例は次のとおり。

-   onPrimaryContainer
-   onSecondary
-   secondaryContainer
-   onSecondaryContainer
-   onTertiary
-   tertiaryContainer
-   onTertiaryContainer
-   onError
-   errorContainer
-   onErrorContainer
-   inverseSurface
-   onInverseSurface
-   inversePrimary
-   surfaceContainerLowest
-   surfaceContainerLow
-   surfaceContainer
-   surfaceContainerHigh
-   scrim
-   shadow

これらをP3-04で新しい`AppColors` Tokenとして追加しない。

将来、Figmaとの完全一致が必要になった場合は、

Colors.mdとAppColorsを先に更新する別設計タスクで

明示Token化する。

### Background Tokenの扱い

Colors.mdには`background` Tokenが存在する。

ただし、Material 3 ColorSchemeでは

新しいSurface系Roleを優先する。

`AppColors.lightBackground` / `AppColors.darkBackground` は削除しない。

ただし、ColorSchemeのdeprecatedなbackground系Roleへ

新規実装を依存させない。

画面全体の背景への具体的な適用は、

P3-04-03 AppThemeで扱う。

### Chart Colorの境界

次のChart ColorはColorSchemeへ割り当てない。

-   chartSystolic
-   chartDiastolic
-   chartPulse

これらはP3-04-04 ThemeExtension登録で扱う。

### Flutter実装時の禁止事項

-   Light/Darkで同名のDart定数を作らない
-   `primaryLight` / `primaryDark` の後置形式を使用しない
-   `AppLightColors` / `AppDarkColors` へクラス分割しない
-   Token名を省略しない
-   Colors.mdにないColor Tokenを追加しない
-   HEX値を変更しない
-   Chart ColorをColorSchemeへ割り当てない
-   fromSeedの生成結果を既存の正式Tokenとして扱わない

### Flutter実装時の受け入れ条件

□ `lib/design_system/tokens/app_colors.dart`へ配置されている

□ `AppColors`クラスへLight Theme用とDark Theme用のColor Tokenが定義されている

□ Light Theme用Tokenが`light{TokenName}`形式で定義されている

□ Dark Theme用Tokenが`dark{TokenName}`形式で定義されている

□ Colors.mdのToken名とHEX値が変更されていない

□ Colors.mdに存在しないColor Tokenが追加されていない

□ `primaryLight` / `primaryDark` の後置形式を使用していない

□ `AppLightColors` / `AppDarkColors` へクラス分割していない

------------------------------------------------------------------------

## Flutter Token例

### AppChartColors

`AppChartColors`は、ColorSchemeへ割り当てないグラフ系列色を

ThemeExtensionとして扱うための拡張である。

配置

`lib/design_system/extensions/app_chart_colors.dart`

対象フィールド

-   systolic
-   diastolic
-   pulse

Light Theme対応

| Field | Design Token |
|---|---|
| systolic | AppColors.lightChartSystolic |
| diastolic | AppColors.lightChartDiastolic |
| pulse | AppColors.lightChartPulse |

Dark Theme対応

| Field | Design Token |
|---|---|
| systolic | AppColors.darkChartSystolic |
| diastolic | AppColors.darkChartDiastolic |
| pulse | AppColors.darkChartPulse |

AppChartColorsへ含めないもの

-   grid
-   axis
-   selectedPoint
-   missingData
-   success
-   warning
-   information
-   時間帯カラー

これらはP3-03-01で正式なAppColors Tokenとして実装されていないため、

P3-04では新しいDesign Tokenを追加しない。

将来必要になった場合は、Colors.mdとAppColorsを先に更新する別設計タスクで追加する。

P3-04-04では、AppThemeのLight / Dark ThemeDataへ

AppChartColorsをextensionsとして登録する。

Lightでは、`AppColors.lightChartSystolic`、

`AppColors.lightChartDiastolic`、

`AppColors.lightChartPulse`を参照する。

Darkでは、`AppColors.darkChartSystolic`、

`AppColors.darkChartDiastolic`、

`AppColors.darkChartPulse`を参照する。

dart
@immutable
class AppChartColors extends ThemeExtension<AppChartColors> {
  const AppChartColors({
    required this.systolic,
    required this.diastolic,
    required this.pulse,
  });

  final Color systolic;
  final Color diastolic;
  final Color pulse;

  @override
  AppChartColors copyWith({
    Color? systolic,
    Color? diastolic,
    Color? pulse,
  }) {
    return AppChartColors(
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      pulse: pulse ?? this.pulse,
    );
  }

  @override
  AppChartColors lerp(
    covariant AppChartColors? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return AppChartColors(
      systolic: Color.lerp(systolic, other.systolic, t)!,
      diastolic: Color.lerp(diastolic, other.diastolic, t)!,
      pulse: Color.lerp(pulse, other.pulse, t)!,
    );
  }
}


------------------------------------------------------------------------

## テスト項目

ライトテーマ

-   Primaryが正しく適用される
-   Backgroundが正しく適用される
-   Text Primaryが正しく表示される
-   状態色が正しく表示される
-   グラフ系列を識別できる

ダークテーマ

-   ダークテーマへ切り替えできる
-   文字と背景のコントラストを確保できる
-   カード境界を識別できる
-   状態色を識別できる
-   グラフ系列を識別できる

アクセシビリティ

-   色だけに依存せず状態を理解できる
-   高コントラスト設定を適用できる
-   色覚特性シミュレーションで系列を識別できる
-   フォーカス状態を識別できる
-   無効状態を識別できる

実装

-   Widget内に直接HEX値がない
-   ThemeDataから色を取得できる
-   ThemeExtensionからグラフ色を取得できる
-   FigmaとFlutterのトークン名が対応する
-   テーマ変更後に全画面へ反映される

------------------------------------------------------------------------

## Acceptance Criteria

□ カラーを役割名で管理できる

□ ライトテーマを定義できる

□ ダークテーマを定義できる

□ Primary、Secondary、Accentを定義できる

□ Background、Surfaceを定義できる

□ Text Primary、Secondary、Disabledを定義できる

□ Success、Warning、Error、Informationを定義できる

□ SYS、DIA、Pulseの系列色を定義できる

□ 朝・昼・夜の時間帯色を定義できる

□ 色だけに依存せず系列を識別できる

□ 色だけに依存せず状態を識別できる

□ 本文文字で4.5:1以上のコントラストを確保できる

□ UI部品で3:1以上のコントラストを確保できる

□ 高コントラスト設定に対応できる

□ Figma Variablesとして管理できる

□ Flutter ThemeDataへ実装できる

□ 独自色をThemeExtensionで管理できる

□ Widget内へ固定HEX値を直接記述しない

□ テーマ変更を全画面へ反映できる

□ 医療診断と誤認される色分けを使用しない

------------------------------------------------------------------------

## 依存機能

F001 Blood Pressure Recording

F002 Home Dashboard

F003 History

F004 Graph

F005 Statistics

F009 Settings

F011 Time Period Classification

F107 Multiple Measurement Aggregation

------------------------------------------------------------------------

## 優先度

★★★★★（MVP必須）

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
-   04_DesignSystem/Typography.md
-   04_DesignSystem/Spacing.md
-   04_DesignSystem/Components.md
-   06_Flutter/

------------------------------------------------------------------------

## 将来拡張

-   ブランドテーマ切替
-   複数カラーテーマ
-   医療機関向けテーマ
-   印刷専用カラー
-   白黒印刷最適化
-   色覚特性プリセット
-   ユーザー選択アクセントカラー
-   家族プロフィール別カラー
-   季節テーマ
-   Dynamic Color対応
