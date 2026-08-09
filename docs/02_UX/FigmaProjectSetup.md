# FigmaProjectSetup.md

## 1. Purpose

本ドキュメントは、BloodPressureAppのFigmaプロジェクトを開始するための構成、命名規則、Variables、Components、Prototype、Dev Mode運用を定義する。

Figmaは、BloodPressureAppの正式なUI設計資産として扱う。Figma上の設計は、`docs/00_Project/AppConcept.md`、`docs/02_UX/InformationArchitecture.md`、`docs/02_UX/NavigationStructure.md`、`docs/02_UX/NavigationFlow.md`、`docs/04_DesignSystem/`を前提に、Flutter実装へスムーズにつなげることを目的とする。

本タスクでは、実際のUIデザイン、Wireframe、画面レイアウト、Route、Flutter Widgetは作成しない。

## 2. Design Goals

Figmaプロジェクトは、AppConceptのMission、Vision、UX Principlesを具体化するための設計基盤とする。

-   毎日の血圧測定を自然な習慣として続けられるUIにする。
-   血圧値、日付、時間帯、継続状況、傾向を読みやすく整理する。
-   シンプルで迷いにくい構造を優先する。
-   高齢者、Large Text、片手操作、Screen Readerを考慮する。
-   医療診断と誤解される表現、色、ラベル、画面構造を避ける。
-   Light / Dark Modeに対応できる設計にする。
-   Design TokenとFigma Variablesを対応させ、Flutter実装時の解釈差を減らす。
-   ComponentとVariantを整理し、同じ役割のUIを画面ごとに作り直さない。
-   Dev ModeからFlutter実装へ参照しやすい構造にする。

## 3. Figma Project Structure

Figmaファイル名は次を基本とする。

```text
BloodPressureApp.fig
```

Figmaプロジェクト全体は、次のPage構成を基本とする。

```text
BloodPressureApp.fig
├─ 00_Cover
├─ 01_Foundations
├─ 02_Components
├─ 03_Patterns
├─ 04_Wireframes
├─ 05_Screens
├─ 06_Prototype
└─ 07_Dev
```

| Page | 役割 |
|---|---|
| 00_Cover | プロジェクト概要、Version、更新履歴、参照ドキュメントを管理する |
| 01_Foundations | Color、Typography、Spacing、Radius、Elevationなどの基盤を管理する |
| 02_Components | Button、Input、Card、Dialogなどの再利用Componentを管理する |
| 03_Patterns | Form、List、Empty State、Error Stateなど複数Componentの組み合わせを管理する |
| 04_Wireframes | 低忠実度の画面構成を管理する |
| 05_Screens | 高忠実度の画面デザインを管理する |
| 06_Prototype | 画面遷移と操作感確認用のPrototypeを管理する |
| 07_Dev | Flutter実装参照用の確定画面、注釈、Export対象を管理する |

## 4. Page Structure

### 00_Cover

-   Project name
-   AppConcept要約
-   Version
-   Status
-   Owner / Reviewer
-   更新履歴
-   参照ドキュメント
-   Figma運用ルールへのリンク

### 01_Foundations

-   Color
-   Typography
-   Spacing
-   Radius
-   Elevation
-   Icon Size
-   Component Size
-   Animation / Duration
-   Accessibility notes

Foundationは`docs/04_DesignSystem/`を正本とし、Figma上で独自値を追加しない。

### 02_Components

-   Button
-   Icon Button
-   FAB候補
-   Text Field / Number Input
-   Card
-   Dialog
-   Bottom Sheet
-   Navigation Bar
-   List Item
-   Section Header
-   Chip / Filter
-   Empty State
-   Error State
-   Loading State

Componentは、Flutter Widget化を想定して責務を小さく保つ。

### 03_Patterns

-   Blood Pressure Value Display
-   Record Summary
-   Record List
-   Graph Summary
-   Statistics Summary
-   Settings Section
-   Form Group
-   Confirmation Pattern
-   Permission Prompt Pattern
-   Export / Backup Pattern

Patternは、複数Componentを組み合わせた再利用可能な画面部分として扱う。

### 04_Wireframes

-   Entry / System
-   Home
-   Recording
-   History
-   Graph
-   Statistics
-   Settings
-   Supporting

Wireframeは画面構成と情報優先度の確認用とし、最終UI表現や色、詳細なComponent仕様を確定しない。

### 05_Screens

-   Splash
-   Onboarding
-   Home
-   Blood Pressure Input
-   Multiple Measurement
-   Record Confirmation
-   History
-   Record Detail
-   Record Edit
-   Graph
-   Statistics
-   Settings
-   Reminder
-   Export
-   Backup / Restore
-   Privacy

ScreenはScreen ID、画面名、状態、Deviceを分かる形で整理する。

### 06_Prototype

-   Entry Flow
-   Primary Navigation Flow
-   Recording Flow
-   History Flow
-   Graph Flow
-   Statistics Flow
-   Settings Flow
-   Exception Flow

Prototypeは操作感と移動の理解を確認するために使用し、Flutter Route定義の代替にはしない。

### 07_Dev

-   実装対象画面
-   Dev Mode参照用Frame
-   Component usage note
-   Design Token mapping note
-   Flutter実装時の注意
-   未確定事項

Dev Pageには、Flutter実装者が参照する最終候補のみを置く。

## 5. Naming Convention

命名は、FigmaとFlutterの対応が追いやすいことを優先する。

### Page

形式:

```text
00_Cover
01_Foundations
02_Components
```

Pageは番号付きで固定順を維持する。

### Section

形式:

```text
Section / Primary Navigation
Section / Recording
Section / Settings
```

Sectionは情報領域または作業領域を表す。

### Frame

形式:

```text
SCR-010 / Home / Mobile / Light
SCR-020 / Blood Pressure Input / Mobile / Light
SCR-030 / History / Mobile / Empty
```

Screen IDは`docs/09_AI_Context/SCREEN_CONTEXT.md`を暫定正本とする。Screen IDの表記揺れが解消されるまでは、Figma上でも`SCR-*`を優先候補とする。

### Component

形式:

```text
Component / Button / Primary
Component / Input / Number
Component / Card / RecordSummary
Component / Navigation / BottomBar
```

Component名は役割を表し、画面名だけに依存させない。

### Variant

形式:

```text
State=Default
State=Pressed
State=Disabled
Size=Medium
Tone=Primary
Theme=Light
```

Variantは状態、サイズ、役割、Themeなどを分けて管理する。

### Variables

形式:

```text
Color/Brand/Primary
Typography/Body/Medium
Spacing/16
Radius/Medium
Elevation/Level1
Duration/Standard
```

VariablesはDesign System文書のToken分類に合わせる。

## 6. Frame Rules

MVPではスマートフォン縦画面を前提とする。

### Device

-   Android smartphone portraitを主な確認対象とする。
-   iPhone portraitも破綻しない前提で確認する。
-   Tablet、Landscape、DesktopはOpen Issuesとして扱い、MVPのFrame基準にはしない。

### Safe Area

-   Status Bar、Navigation Bar、Gesture Areaを考慮する。
-   主要ActionはSafe AreaやGesture Areaと干渉させない。
-   Bottom Navigationがある画面では下部余白を明確にする。

### Grid

-   Mobile portrait用のシンプルなGridを使用する。
-   Gridは情報整理の補助であり、Spacing Tokenを上書きする目的では使わない。
-   画面ごとに任意のGridを増やさない。

### Frame Size

-   MVPでは代表的なスマートフォン縦サイズを基準Frameとする。
-   大きな文字、長い日本語、空状態、エラー状態で破綻しないことを確認する。
-   Fixed Heightに依存しすぎず、Auto Layoutで伸縮可能にする。

### Screen Naming

-   Screen ID
-   Screen name
-   Device
-   Theme
-   State

をFrame名に含める。

## 7. Auto Layout Rules

Figma上の画面、Component、Patternは原則としてAuto Layoutを使用する。

-   Absolute Positionは、装飾や特殊な重なりが必要な場合に限定する。
-   PaddingはSpacing Tokenに対応する値を使用する。
-   GapはSpacing Tokenに対応する値を使用する。
-   Text Scaleや長文で破綻しないよう、縦方向の伸縮を優先する。
-   Button、Input、Card、List ItemはComponent Sizeと最小Tap Targetを考慮する。
-   Fill Container、Hug Contents、Fixedの使い分けを明確にする。
-   Scrollが必要な画面は、Scrollable領域と固定Action領域を分ける。
-   状態表示やError Textが増えても、前後の要素が重ならないようにする。

Auto LayoutはFlutterのColumn、Row、Padding、ListView、SingleChildScrollViewなどへ対応しやすい構造を目指す。

## 8. Variables Strategy

Figma Variablesでは、Design SystemとFlutter Design Tokensへ対応する対象だけを管理する。

今回、実際の値は登録しない。

| Variable Group | 対象 | 正本 |
|---|---|---|
| Color | Brand、Surface、Text、Border、State、Chart | `docs/04_DesignSystem/Colors.md` |
| Typography | Display、Headline、Title、Body、Label、Value | `docs/04_DesignSystem/Typography.md` |
| Spacing | Padding、Gap、Section spacing | `docs/04_DesignSystem/Spacing.md` |
| Radius | Button、Input、Card、Dialog | `docs/04_DesignSystem/Radius.md` |
| Elevation | Surface階層、Card、Dialog | `docs/04_DesignSystem/Elevation.md` |
| Icon Size | Navigation、Action、Guidance | `docs/04_DesignSystem/IconSize.md` |
| Component Size | Button、Input、Tap Target | `docs/04_DesignSystem/ComponentSize.md` |
| Duration | Motion、Feedback、Transition | `docs/04_DesignSystem/Animation.md` |
| Opacity | Disabled、Overlay、Scrim | Design Systemで正式化された範囲 |
| Shadow | Elevation表現 | `docs/04_DesignSystem/Elevation.md` |

Variables運用ルール:

-   Figma上で任意のColor、Spacing、Radius、Typographyを追加しない。
-   Light / Dark ModeをVariables Modeで管理できる構造にする。
-   Chart ColorはColorSchemeへ混ぜず、Chart用Variablesとして分ける。
-   Variables名はFlutter Token名と対応しやすいSemantic名にする。
-   未定義の値が必要になった場合は、Figmaで先に増やさずDesign System更新タスクへ戻す。

## 9. Component Strategy

Figma Componentは、Flutter Widgetへ対応しやすい単位で管理する。

Component化する対象:

-   Button
-   Icon Button
-   FAB候補
-   Text Field
-   Number Input
-   Card
-   Dialog
-   Bottom Sheet
-   Navigation Bar
-   List Item
-   Section Header
-   Chip / Filter
-   Switch / Toggle
-   Empty State
-   Error View
-   Loading Indicator
-   Record Summary
-   Blood Pressure Value
-   Graph Legend
-   Statistics Card
-   Settings Tile

Component運用ルール:

-   同じ役割のUIをScreenごとに作り直さない。
-   Variantで状態差分を管理する。
-   Text、Icon、Colorだけを変えた複製Componentを増やさない。
-   ComponentはDesign TokenとVariablesを使用する。
-   Feature固有の業務表示は、最初はPatternまたはScreen内で扱い、複数画面で再利用が確定したらComponent化を検討する。
-   Component名はFlutter実装時のWidget名と対応しやすい名前にする。

## 10. Prototype Strategy

Prototypeでは、画面遷移と操作感を確認する。

確認対象:

-   Entry Flow
-   Primary Navigation
-   Blood Pressure Input開始
-   Recording Flow
-   Record Detail / Edit
-   Graph / Statistics確認
-   Settings配下の移動
-   Modal / Dialog表示
-   Empty / Error状態からの回復導線

Prototypeで確認しないもの:

-   Flutter Route Path
-   GoRouter設定
-   State Management
-   Database保存
-   実際のValidationロジック
-   AI生成結果

Prototypeはユーザーが迷わず移動できるかを確認するためのものであり、実装仕様の完全な代替にはしない。

## 11. Flutter Mapping

FigmaとFlutterの対応は、次の概要で整理する。

```text
Figma Variables
↓
Flutter Design Tokens

Figma Component
↓
Flutter Widget

Figma Variant
↓
Widget State

Figma Prototype
↓
GoRouterによるNavigation設計

Figma Dev Mode
↓
Flutter実装参照
```

対応方針:

-   Variablesは`AppColors`、`AppTypography`、`AppSpacing`、`AppRadius`などのDesign Tokenと対応させる。
-   ComponentはFlutter Widgetへ対応しやすい粒度にする。
-   VariantはWidgetの状態やRoleへ対応させる。
-   PrototypeはNavigation Flowの確認に使用し、GoRouterのRoute定義そのものにはしない。
-   Dev Modeでは寸法、余白、Text Style、Color、Component構造を参照する。
-   Flutter実装ではDesign Tokenを優先し、Figma上の見た目値を直接写経しない。

## 12. Dev Mode Strategy

Dev ModeはFlutter実装時の正式な参照手段として扱う。

-   実装対象は`07_Dev` Pageに整理する。
-   Dev Modeで参照するFrameは、未確定の探索Frameと分ける。
-   Design TokenとVariablesを優先して確認する。
-   Auto Layoutの構造をFlutter Layoutへ読み替える。
-   Padding、Gap、Radius、Typography、ColorはDesign System正本と照合する。
-   Component名、Variant名、Screen ID、状態名をFlutter実装者が追えるようにする。
-   実装時にFigmaとDesign Systemが矛盾する場合は、Design SystemとCanonicalSourcesを優先し、推測で補完しない。
-   Dev Modeの数値がDesign Tokenと一致しない場合は、FigmaまたはDesign Systemのどちらを修正するか確認する。

## 13. Working Rules

Figma作業では次を守る。

-   まず`00_Cover`で対象VersionとStatusを確認する。
-   Foundationは`docs/04_DesignSystem/`を正本とする。
-   画面を直接編集する前に、必要なComponentまたはPatternを確認する。
-   ComponentとVariablesを優先し、Screen上で任意の色、余白、文字スタイルを直接作らない。
-   Pageの役割を跨いで管理しない。
-   Draft、Exploration、Dev参照用Frameを混在させない。
-   命名規則に従い、Screen ID、画面名、Device、Theme、Stateを明確にする。
-   Component変更は影響範囲を確認してから行う。
-   医療診断と誤認される表現やラベルをFigma上で追加しない。
-   Large Text、長い日本語、空状態、エラー状態を考慮して確認する。
-   Flutter実装に不要な装飾や再現困難な効果を増やさない。
-   未確定事項はOpen Issuesまたは注釈に残し、確定仕様として扱わない。

## 14. Open Issues

| Issue | 状態 | 後続で確認すること |
|---|---|---|
| Tablet対応 | 未決定 | Tablet用PageやNavigation Rail Frameを作るか |
| Landscape対応 | 未決定 | 横画面をMVPで扱うか |
| Desktop対応 | 未決定 | Desktop / Web用Frameを分けるか |
| Material 3 Component採用範囲 | 未決定 | Figma上でMaterial 3 Kitを参照する範囲 |
| Icon Library | 未決定 | Material Iconsを基本としつつ、Figma上の管理方法をどうするか |
| Illustration管理 | 未決定 | Empty StateやOnboarding用Illustrationを作るか |
| Chart Component | 未決定 | Graph表現を独自Component化する範囲 |
| FAB採用 | 未決定 | Primary ActionをFAB、Home内Button、Navigation Bar中央ボタンのどれで表現するか |
| Screen ID表記揺れ | 未解消 | `SCR-*`と`SC*`の統一完了後にFrame名を調整する |
| Dev Mode運用開始時期 | 未決定 | Wireframe後、High Fidelity後、Flutter実装前のどこでDev Pageを確定するか |

