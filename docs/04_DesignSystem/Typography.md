# Typography.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Typography

## ドキュメントID

DS-TYPO-001

------------------------------------------------------------------------

## 名称

タイポグラフィデザインシステム

------------------------------------------------------------------------

## 目的

BloodPressureApp全体で使用する文字の

フォント、サイズ、ウェイト、行間、字間、役割、

数値表示、アクセシビリティ対応を統一し、

画面ごとの可読性と情報階層を一貫させること。

特に血圧値、脈拍、測定日時、入力項目などの

重要な健康情報を誤読しにくくし、

高齢者や視力に配慮が必要な利用者でも

毎日気持ちよく利用できることを設計目標とする。

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
-   Figma Text Styles
-   Flutter TextTheme

------------------------------------------------------------------------

## 基本方針

-   文字は意味と役割で管理する
-   画面内へ個別の文字サイズを直接指定しない
-   日本語と英数字の見え方を揃える
-   数値は誤読しにくい書体と間隔を使用する
-   血圧値は大きく明確に表示する
-   小さい補助文字を多用しない
-   行間を確保して読みやすくする
-   文字拡大時にレイアウトが崩れないようにする
-   色だけで文字の重要度を表現しない
-   太字だけに依存せず余白とサイズも併用する
-   医療診断と誤解される強い表現を避ける
-   将来の多言語対応を前提とする

------------------------------------------------------------------------

## タイポグラフィ構造


Typography
├─ Font Family
│   ├─ Japanese
│   ├─ Latin
│   └─ Numeric
│
├─ Display
│   ├─ Large
│   ├─ Medium
│   └─ Small
│
├─ Headline
│   ├─ Large
│   ├─ Medium
│   └─ Small
│
├─ Title
│   ├─ Large
│   ├─ Medium
│   └─ Small
│
├─ Body
│   ├─ Large
│   ├─ Medium
│   └─ Small
│
├─ Label
│   ├─ Large
│   ├─ Medium
│   └─ Small
│
└─ Domain Specific
    ├─ Blood Pressure Value
    ├─ Pulse Value
    ├─ Unit
    ├─ Date Time
    ├─ Graph Axis
    └─ Input Number


------------------------------------------------------------------------

## フォント選定

### 日本語

推奨

Noto Sans JP。

理由

-   日本語の可読性が高い
-   多くの文字ウェイトを利用できる
-   Android、Web、PDFで統一しやすい
-   数字と日本語のバランスがよい
-   多言語展開に対応しやすい

代替

端末標準の日本語サンセリフ。

### 英数字

推奨

Roboto。

理由

-   Flutter・Materialとの親和性が高い
-   数字の視認性が高い
-   英字UIで安定している

### iOS

端末標準フォントを使用する場合は

SF Proおよびヒラギノ角ゴシックを許可する。

ただし、

Figma、Flutter、PDF間で大きな差が出ないことを確認する。

------------------------------------------------------------------------

## フォントフォールバック


Noto Sans JP
Roboto
Hiragino Sans
Yu Gothic
Meiryo
sans-serif


Flutter例

dart
fontFamilyFallback: const [
  'Noto Sans JP',
  'Roboto',
  'Hiragino Sans',
  'Yu Gothic',
  'Meiryo',
],


------------------------------------------------------------------------

## 数字フォント

血圧値、脈拍、日時、統計値は

等幅数字を使用する。

推奨設定


FontFeature.tabularFigures()


目的

-   桁位置を揃える
-   数値変化時の揺れを防ぐ
-   一覧やグラフで比較しやすくする
-   1、7、0、8などの誤読を減らす

血圧値には

斜体、装飾書体、細すぎるウェイトを使用しない。

------------------------------------------------------------------------

## フォントウェイト

使用ウェイト

-   Regular 400
-   Medium 500
-   SemiBold 600
-   Bold 700

原則

-   本文は400
-   ラベルは500
-   見出しは600
-   血圧値は600または700
-   ボタンは600
-   警告文は500または600

禁止

-   300以下の細い文字
-   800以上の過度に太い文字の多用
-   同一画面で多数のウェイトを混在させること

------------------------------------------------------------------------

## 文字サイズ基準

単位

Flutterではsp相当のlogical pixel。

Figmaではpx。

基準


12
14
16
18
20
22
24
28
32
36
40
48
56


原則として

4pxまたは2px単位のスケールを使用する。

------------------------------------------------------------------------

## 文字スタイル一覧

### Display Large

用途

-   特別な大数値
-   完了画面
-   強調された統計結果

サイズ

56

行間

64

ウェイト

600

字間

-0.5

### Display Medium

用途

-   大きな血圧サマリー
-   主要統計値

サイズ

48

行間

56

ウェイト

600

字間

-0.25

### Display Small

用途

-   Homeの主要血圧値
-   Inputの入力済み数値

サイズ

40

行間

48

ウェイト

600

字間

0

------------------------------------------------------------------------

### Headline Large

用途

-   大画面タイトル
-   主要セクション見出し

サイズ

32

行間

40

ウェイト

600

字間

0

### Headline Medium

用途

-   画面タイトル
-   Dialogタイトル

サイズ

28

行間

36

ウェイト

600

字間

0

### Headline Small

用途

-   カード見出し
-   Bottom Sheetタイトル
-   セクションタイトル

サイズ

24

行間

32

ウェイト

600

字間

0

------------------------------------------------------------------------

### Title Large

用途

-   AppBarタイトル
-   主要カードタイトル

サイズ

22

行間

28

ウェイト

600

字間

0

### Title Medium

用途

-   リスト項目タイトル
-   入力セクションタイトル
-   設定項目タイトル

サイズ

18

行間

24

ウェイト

600

字間

0.1

### Title Small

用途

-   小型カードタイトル
-   チップグループ見出し

サイズ

16

行間

22

ウェイト

600

字間

0.1

------------------------------------------------------------------------

### Body Large

用途

-   主要本文
-   重要な説明
-   入力内容

サイズ

18

行間

28

ウェイト

400

字間

0.1

### Body Medium

用途

-   標準本文
-   設定説明
-   記録メモ

サイズ

16

行間

24

ウェイト

400

字間

0.1

### Body Small

用途

-   補足説明
-   短い注釈
-   2次情報

サイズ

14

行間

20

ウェイト

400

字間

0.2

------------------------------------------------------------------------

### Label Large

用途

-   ボタン
-   入力ラベル
-   タブ
-   Bottom Navigation

サイズ

16

行間

22

ウェイト

600

字間

0.2

### Label Medium

用途

-   チップ
-   小型ボタン
-   グラフ凡例

サイズ

14

行間

20

ウェイト

500

字間

0.2

### Label Small

用途

-   補助ラベル
-   バッジ
-   単位
-   グラフ軸

サイズ

12

行間

16

ウェイト

500

字間

0.3

------------------------------------------------------------------------

## 専用文字スタイル

### Blood Pressure Large

用途

Homeの最新血圧値。

サイズ

48

行間

56

ウェイト

700

数字

等幅。

例


128


### Blood Pressure Medium

用途

History、Record Detail、Statistics。

サイズ

36

行間

44

ウェイト

700

数字

等幅。

### Blood Pressure Small

用途

一覧、カード内の補助値。

サイズ

28

行間

36

ウェイト

600

数字

等幅。

------------------------------------------------------------------------

### Pulse Large

サイズ

32

行間

40

ウェイト

600

### Pulse Medium

サイズ

24

行間

32

ウェイト

600

### Pulse Small

サイズ

18

行間

24

ウェイト

500

------------------------------------------------------------------------

### Unit

用途

-   mmHg
-   bpm
-   回
-   日

サイズ

14

行間

20

ウェイト

500

数字との間隔

4dp以上。

単位を数値より小さくしても、

読めないサイズへ縮小しない。

------------------------------------------------------------------------

### Date Time

用途

-   測定日時
-   更新日時
-   リマインダー時刻

サイズ

14

行間

20

ウェイト

500

数字

等幅。

### Input Number

用途

血圧入力欄。

サイズ

40

行間

48

ウェイト

600

配置

原則中央または右揃え。

数字

等幅。

------------------------------------------------------------------------

### Graph Axis

サイズ

12

行間

16

ウェイト

500

最大文字拡大時

14以上へ拡大可能とする。

### Graph Tooltip

サイズ

14

行間

20

ウェイト

500

### Statistics Value

サイズ

32

行間

40

ウェイト

600

数字

等幅。

------------------------------------------------------------------------

## 文字スタイル命名規則


typography.{category}.{size}


例


typography.display.large

typography.headline.medium

typography.body.medium

typography.label.large

typography.value.bloodPressure.large


Flutter


AppTypography.displayLarge

AppTypography.headlineMedium

AppTypography.bodyMedium

AppTypography.labelLarge

AppTypography.bloodPressureLarge


Figma


Typography/Display/Large

Typography/Headline/Medium

Typography/Body/Medium

Typography/Label/Large

Typography/Value/BloodPressure/Large


------------------------------------------------------------------------

## 行間

基本ルール

-   本文は文字サイズの1.4〜1.6倍
-   見出しは1.2〜1.4倍
-   大数値は1.1〜1.25倍
-   日本語本文は詰めすぎない
-   複数行ボタンを避ける

本文


14 → 20
16 → 24
18 → 28


見出し


22 → 28
24 → 32
28 → 36
32 → 40


------------------------------------------------------------------------

## 字間

日本語

原則0〜0.2。

英字ラベル

0.2〜0.5。

大数値

0または負の小さい値。

全角日本語へ過度な字間を設定しない。

すべて大文字の英語は

原則使用しない。

------------------------------------------------------------------------

## 段落

本文段落間

8〜12dp。

セクション間

16〜24dp。

長文

1段落3〜5行を目安とする。

注意文

本文と分離し、

アイコン、見出し、背景を併用する。

------------------------------------------------------------------------

## 改行

-   数値と単位を分離しない
-   SYSと値を不自然に分割しない
-   日付と時刻の途中で改行しない
-   ボタンラベルは原則1行
-   見出しは最大2行
-   長い設定項目は説明文へ分離する

例

推奨


128 mmHg


非推奨


128
mmHg


------------------------------------------------------------------------

## 省略表示

省略記号

…。

使用可能

-   長いメモ
-   ファイル名
-   バックアップ名
-   タグ一覧

使用不可

-   血圧値
-   脈拍
-   日時
-   エラーメッセージの主要部分
-   ボタンの意味
-   設定の現在値

------------------------------------------------------------------------

## 数値表示ルール

血圧

整数。

例


128 / 78


Pulse

整数。

例


64 bpm


平均値

原則整数へ丸める。

詳細表示で必要な場合のみ

小数第1位まで。

小数点

端末ロケールに従う。

桁区切り

統計件数などはロケールに従う。

------------------------------------------------------------------------

## SYS・DIA表示

推奨


SYS
128

DIA
78


または


128 / 78 mmHg


使用ルール

-   SYSとDIAのラベルを省略しない選択肢を用意する
-   スラッシュのみで意味を伝えない
-   高齢者向け表示では縦配置を優先可能とする
-   数値とラベルの対応を明確にする
-   色だけでSYS・DIAを区別しない

------------------------------------------------------------------------

## 日本語表記

-   簡潔で自然な日本語を使用する
-   専門用語には説明を付ける
-   「収縮期血圧」と「SYS」を必要に応じて併記する
-   「拡張期血圧」と「DIA」を必要に応じて併記する
-   命令形を避け、案内形を使用する
-   責める表現を使用しない

推奨


血圧を記録しましょう


非推奨


血圧を入力してください


状況によっては

明確な操作指示として「入力してください」を許可する。

------------------------------------------------------------------------

## 英語表記

-   Sentence caseを使用する
-   Title Caseを多用しない
-   略語は初回説明する
-   医療用語の誤訳を避ける
-   日本語版と意味を一致させる

------------------------------------------------------------------------

## ボタン文字

Primary Button

Label Large。

Secondary Button

Label Large。

Small Button

Label Medium。

ルール

-   動詞から始める
-   具体的な操作を示す
-   「OK」を多用しない
-   「はい」「いいえ」だけにしない
-   削除操作は「削除する」と明示する

例


記録を保存する

期間を変更する

削除する

キャンセル


------------------------------------------------------------------------

## 入力欄文字

ラベル

Label MediumまたはLabel Large。

入力値

Body LargeまたはInput Number。

補助説明

Body Small。

エラー

Body Small、Medium 500。

プレースホルダー

Body Medium。

プレースホルダーだけで項目名を伝えない。

------------------------------------------------------------------------

## エラーメッセージ

-   原因を簡潔に示す
-   修正方法を示す
-   利用者を責めない
-   色だけで示さない
-   技術的な例外文字列を表示しない

推奨


収縮期血圧を入力してください



開始日は終了日より前の日付を選択してください


非推奨


Invalid value


------------------------------------------------------------------------

## 注意・警告文

注意

Body Medium。

見出し

Title Small。

危険操作

Title MediumまたはLabel Large。

全データ削除などは

文字サイズ、ウェイト、アイコン、余白を併用する。

赤色だけに依存しない。

------------------------------------------------------------------------

## コンポーネント別使用例

### AppBar

Title Large。

最大2行まで。

### Bottom Navigation

Label SmallまたはLabel Medium。

文字拡大時はLabel Medium以上。

### Card Title

Title Medium。

### Card Body

Body Medium。

### List Tile Title

Title SmallまたはBody Large Medium 500。

### List Tile Subtitle

Body Small。

### Dialog Title

Headline SmallまたはTitle Large。

### Dialog Body

Body Medium。

### SnackBar

Body Medium。

### Chip

Label Medium。

### Badge

Label Small。

### Tooltip

Body SmallまたはLabel Medium。

------------------------------------------------------------------------

## Home画面

主要血圧値

Blood Pressure Large。

SYS・DIAラベル

Label Medium。

測定日時

Date Time。

単位

Unit。

主要ボタン

Label Large。

サマリー

Title Small + Body Medium。

------------------------------------------------------------------------

## Input画面

入力値

Input Number。

入力ラベル

Title MediumまたはLabel Large。

単位

Unit。

補助説明

Body Small。

バリデーション

Body Small Medium 500。

保存ボタン

Label Large。

------------------------------------------------------------------------

## History画面

日付見出し

Title Medium。

血圧値

Blood Pressure Small。

時刻

Date Time。

Pulse

Pulse Small。

タグ

Label Small。

メモ

Body Small。

------------------------------------------------------------------------

## Graph画面

サマリー値

Statistics Value。

グラフ軸

Graph Axis。

凡例

Label Medium。

Tooltip

Graph Tooltip。

期間選択

Label Large。

注意文

Body Small。

------------------------------------------------------------------------

## Statistics画面

主要統計値

Statistics Value。

統計ラベル

Label Medium。

補助説明

Body Small。

セクション見出し

Title Medium。

------------------------------------------------------------------------

## Settings画面

カテゴリ見出し

Label MediumまたはTitle Small。

設定項目タイトル

Title Small。

現在値

Body Medium。

説明

Body Small。

危険操作

Title Small SemiBold。

------------------------------------------------------------------------

## Dialog・Bottom Sheet

タイトル

Headline Small。

本文

Body Medium。

選択肢

Body Large。

主要操作

Label Large。

補助操作

Label Large。

------------------------------------------------------------------------

## PDF出力

本文

10〜12pt。

見出し

14〜18pt。

主要血圧値

18〜24pt。

注釈

9pt以上。

印刷時に

文字が細くなりすぎないこと。

日本語フォントを埋め込む場合は

ライセンスとファイルサイズを確認する。

------------------------------------------------------------------------

## レスポンシブ対応

小画面

-   DisplayをHeadlineへ縮小可能
-   カード内を縦配置に変更
-   数値と単位を同一グループで保持

大画面

-   文字を無制限に拡大しない
-   コンテンツ幅を制限する
-   情報階層を維持する

タブレット

-   Body Mediumを基準とする
-   大数値はDisplay Mediumまで使用可能

------------------------------------------------------------------------

## 文字サイズ設定

ユーザー設定

-   小
-   標準
-   大
-   特大

倍率例


小       0.90
標準     1.00
大       1.15
特大     1.30


OSの文字サイズ設定も尊重する。

アプリ設定とOS設定を組み合わせる場合は

過度な拡大にならないよう

表示確認を行う。

------------------------------------------------------------------------

## Dynamic Type・Text Scale

対応範囲

最低1.0。

推奨試験範囲

1.0〜2.0。

主要機能は

2.0でも利用できること。

大数値は

必要に応じて段階的に縮小または折り返すが、

読み取れないサイズへ縮小しない。

------------------------------------------------------------------------

## アクセシビリティ

-   本文は原則16以上
-   補助文字は原則12未満にしない
-   主要操作は16以上
-   血圧値は28以上
-   文字拡大時に横切れしない
-   行間を確保する
-   文字と背景のコントラストを確保する
-   画面読み上げ順序と視覚順序を一致させる
-   略語へ読み上げラベルを設定する
-   数値と単位をまとめて読み上げる

読み上げ例


収縮期血圧 128 ミリメートル水銀柱



拡張期血圧 78 ミリメートル水銀柱



脈拍 64 回毎分


------------------------------------------------------------------------

## 高齢者向け表示

高齢者向けモードでは

-   Body Largeを標準本文にする
-   Label Largeを主要ラベルにする
-   Blood Pressure Largeを使用する
-   補助説明を14未満にしない
-   行間を広げる
-   ボタン文字を16以上にする
-   省略表示を減らす
-   SYS・DIAを縦配置する
-   英語略語へ日本語を併記する

------------------------------------------------------------------------

## 認知負荷への配慮

-   1画面内の文字スタイルを増やしすぎない
-   同じ役割には同じスタイルを使う
-   強調箇所を限定する
-   長文を分割する
-   選択肢を簡潔にする
-   数値と説明を近くに配置する
-   必要以上に英語略語を使用しない

------------------------------------------------------------------------

## 禁止事項

-   Widget内へ任意のfontSizeを直接記述する
-   12未満の文字を通常UIで使用する
-   細いウェイトを本文に使用する
-   文字を画像として配置する
-   血圧値に装飾フォントを使用する
-   長文を中央揃えする
-   全文を太字にする
-   全文を大文字英語にする
-   プレースホルダーだけでラベルを代用する
-   エラー内容を色だけで示す
-   文字拡大を固定値で無効化する
-   省略表示で重要情報を隠す

------------------------------------------------------------------------

## Figma実装

Text Styles


Typography/Display/Large

Typography/Display/Medium

Typography/Display/Small

Typography/Headline/Large

Typography/Headline/Medium

Typography/Headline/Small

Typography/Title/Large

Typography/Title/Medium

Typography/Title/Small

Typography/Body/Large

Typography/Body/Medium

Typography/Body/Small

Typography/Label/Large

Typography/Label/Medium

Typography/Label/Small

Typography/Value/BloodPressure/Large

Typography/Value/BloodPressure/Medium

Typography/Value/BloodPressure/Small

Typography/Value/Pulse/Large

Typography/Value/InputNumber

Typography/Graph/Axis

Typography/Graph/Tooltip


すべてのText Layerは

Text Styleを参照する。

直接fontSize、lineHeight、fontWeightを

個別指定しない。

------------------------------------------------------------------------

## Figma Variables

数値Variable例


Typography/Size/12

Typography/Size/14

Typography/Size/16

Typography/Size/18

Typography/Size/22

Typography/Size/28

Typography/Size/40

Typography/Size/48


Mode

-   Default
-   Large Text
-   Extra Large Text

ただし、

Figma Text Stylesとの運用方法を統一する。

------------------------------------------------------------------------

## Flutter実装

クラス

AppTypography

AppTextTheme

AppTextStyles

ファイル例


lib/
└─ core/
   └─ theme/
      ├─ app_typography.dart
      ├─ app_text_theme.dart
      ├─ app_text_styles.dart
      └─ text_scale_provider.dart


実装方針

-   ThemeData.textThemeを使用する
-   Material 3 TextThemeへ対応させる
-   専用数値スタイルはThemeExtensionで管理する
-   BuildContext経由で取得する
-   MediaQueryのtextScalerを尊重する
-   Widget内へ固定文字サイズを直接記述しない
-   Riverpodでアプリ独自文字サイズ設定を管理する

------------------------------------------------------------------------

## Material 3対応


displayLarge

displayMedium

displaySmall

headlineLarge

headlineMedium

headlineSmall

titleLarge

titleMedium

titleSmall

bodyLarge

bodyMedium

bodySmall

labelLarge

labelMedium

labelSmall


本ドキュメントのスタイル名は

Material 3 TextThemeと対応させる。

------------------------------------------------------------------------

## Flutter ThemeExtension例

dart
@immutable
class AppValueTextStyles
    extends ThemeExtension<AppValueTextStyles> {
  const AppValueTextStyles({
    required this.bloodPressureLarge,
    required this.bloodPressureMedium,
    required this.bloodPressureSmall,
    required this.pulse,
    required this.inputNumber,
    required this.statisticsValue,
  });

  final TextStyle bloodPressureLarge;
  final TextStyle bloodPressureMedium;
  final TextStyle bloodPressureSmall;
  final TextStyle pulse;
  final TextStyle inputNumber;
  final TextStyle statisticsValue;

  @override
  AppValueTextStyles copyWith({
    TextStyle? bloodPressureLarge,
    TextStyle? bloodPressureMedium,
    TextStyle? bloodPressureSmall,
    TextStyle? pulse,
    TextStyle? inputNumber,
    TextStyle? statisticsValue,
  }) {
    return AppValueTextStyles(
      bloodPressureLarge:
          bloodPressureLarge ?? this.bloodPressureLarge,
      bloodPressureMedium:
          bloodPressureMedium ?? this.bloodPressureMedium,
      bloodPressureSmall:
          bloodPressureSmall ?? this.bloodPressureSmall,
      pulse: pulse ?? this.pulse,
      inputNumber: inputNumber ?? this.inputNumber,
      statisticsValue:
          statisticsValue ?? this.statisticsValue,
    );
  }

  @override
  AppValueTextStyles lerp(
    covariant AppValueTextStyles? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return AppValueTextStyles(
      bloodPressureLarge: TextStyle.lerp(
        bloodPressureLarge,
        other.bloodPressureLarge,
        t,
      )!,
      bloodPressureMedium: TextStyle.lerp(
        bloodPressureMedium,
        other.bloodPressureMedium,
        t,
      )!,
      bloodPressureSmall: TextStyle.lerp(
        bloodPressureSmall,
        other.bloodPressureSmall,
        t,
      )!,
      pulse: TextStyle.lerp(
        pulse,
        other.pulse,
        t,
      )!,
      inputNumber: TextStyle.lerp(
        inputNumber,
        other.inputNumber,
        t,
      )!,
      statisticsValue: TextStyle.lerp(
        statisticsValue,
        other.statisticsValue,
        t,
      )!,
    );
  }
}


------------------------------------------------------------------------

## 数字用TextStyle例

dart
const bloodPressureLarge = TextStyle(
  fontSize: 48,
  height: 56 / 48,
  fontWeight: FontWeight.w700,
  fontFeatures: [
    FontFeature.tabularFigures(),
  ],
);


------------------------------------------------------------------------

## Provider例


textScaleProvider

appTypographyProvider

accessibilityTypographyProvider

highReadabilityModeProvider


------------------------------------------------------------------------

## 多言語対応

-   日本語と英語で同一サイズを固定しない
-   言語ごとに行間を調整可能とする
-   ドイツ語など長いラベルで確認する
-   数字・単位の語順をロケール対応する
-   右から左の言語を将来考慮する
-   CJKフォントフォールバックを定義する

------------------------------------------------------------------------

## PDF・共有画像対応

-   アプリ画面と同じ意味階層を維持する
-   PDF専用Text Styleを定義可能とする
-   重要数値を画像化しない
-   フォント欠落時の代替を確認する
-   印刷時の最小文字サイズを9pt以上とする
-   白黒印刷でも太さで階層を識別できるようにする

------------------------------------------------------------------------

## パフォーマンス

-   必要なFont Weightのみバンドルする
-   不要なフォントファイルを含めない
-   文字スタイルを毎Buildで生成しない
-   const TextStyleを活用する
-   ThemeExtensionを再利用する
-   PDF生成時のフォント読み込みをキャッシュする

------------------------------------------------------------------------

## テスト項目

基本

-   全Text Styleが定義されている
-   画面内で役割に合ったスタイルを使用している
-   日本語が正しく表示される
-   英数字が正しく表示される
-   数字が等幅表示される
-   単位を正しく表示できる

文字拡大

-   1.0で表示できる
-   1.3で表示できる
-   1.5で表示できる
-   2.0で主要機能を利用できる
-   ボタン文字が切れない
-   AppBarタイトルが切れない
-   血圧値が読める
-   Dialog操作が可能

画面

-   Homeの主要血圧値が読みやすい
-   Inputの数値入力が読みやすい
-   Historyの一覧を比較しやすい
-   Graphの軸と凡例を読める
-   Statisticsの値を識別できる
-   Settingsの説明を読める

アクセシビリティ

-   本文が16以上である
-   補助文字が12以上である
-   画面読み上げで数値と単位を確認できる
-   略語を正しく読み上げられる
-   高齢者向け表示へ切り替えできる
-   省略で重要情報が隠れない

実装

-   Widget内に任意のfontSizeがない
-   ThemeData.textThemeから取得できる
-   ThemeExtensionから数値スタイルを取得できる
-   FigmaとFlutterのスタイル名が対応する
-   文字サイズ変更が全画面へ反映される
-   フォントフォールバックが機能する

------------------------------------------------------------------------

## Acceptance Criteria

□ 日本語フォントを定義できる

□ 英数字フォントを定義できる

□ フォントフォールバックを定義できる

□ 等幅数字を使用できる

□ Display、Headline、Title、Body、Labelを定義できる

□ 血圧値専用スタイルを定義できる

□ Pulse専用スタイルを定義できる

□ 入力数値専用スタイルを定義できる

□ グラフ軸・Tooltip用スタイルを定義できる

□ フォントサイズ、ウェイト、行間、字間を管理できる

□ 本文を原則16以上で表示できる

□ 補助文字を12以上で表示できる

□ 血圧値を28以上で表示できる

□ 文字拡大1.0〜2.0で主要機能を利用できる

□ 数値と単位を正しく表示できる

□ SYS・DIAを色だけに依存せず識別できる

□ 重要情報を省略表示しない

□ Figma Text Stylesとして管理できる

□ Flutter TextThemeへ実装できる

□ 専用数値スタイルをThemeExtensionで管理できる

□ Widget内へ任意のfontSizeを直接記述しない

□ 文字サイズ設定を全画面へ反映できる

□ 高齢者向け表示に対応できる

□ 画面読み上げで数値と単位を確認できる

□ 医療診断と誤認される文字表現を使用しない

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

★★★★★（MVP必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   01_Requirements/Features/F001_BloodPressureRecording.md
-   02_UX/UserFlow.md
-   02_UX/Navigation.md
-   02_UX/ScreenList.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Colors.md
-   04_DesignSystem/Spacing.md
-   04_DesignSystem/Components.md
-   06_Flutter/

------------------------------------------------------------------------

## 将来拡張

-   多言語別タイポグラフィ
-   読字支援フォント
-   弱視向け超大型表示
-   Dyslexia Friendly Font
-   PDF専用Typography
-   印刷専用Typography
-   ウェアラブル向け文字体系
-   タブレット専用文字スケール
-   Web版レスポンシブTypography
-   ユーザー選択フォント
