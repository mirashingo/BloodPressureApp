# ComponentSize.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Component Size

## ドキュメントID

DS-COMPONENT-SIZE-001

------------------------------------------------------------------------

## 名称

Component Sizeデザインシステム

------------------------------------------------------------------------

## 1. 目的

本書は、BloodPressureApp全体で使用するComponent Sizeと用途を定義する。

Component Sizeを統一することで、Button、Input Field、List Item、Navigation、Dialog、Bottom Sheet、Chip、Badgeなどの操作性と可読性を保ち、高齢者を含む利用者が迷わず操作できるUIを維持する。

本書は、P3-03 Design Tokens実装におけるAppComponentSizesの仕様正本とする。

------------------------------------------------------------------------

## 2. 基本原則

- Component SizeとSpacingを混同しない。
- Component SizeとRadiusを混同しない。
- Component SizeとIcon Sizeを混同しない。
- Text Scale 200%で文字が切れない構成を優先する。
- 固定高さが原因で可読性を損なわない。
- Material 3基準をベースにする。
- 高齢者向け表示を優先する。
- Textを含むComponentでは、固定Heightではなくminimum heightとして扱うことを優先する。

------------------------------------------------------------------------

## 3. Component Size一覧

| Component | 定義 | 値 |
|---|---|---:|
| Primary Button | height | 48dp |
| Secondary Button | height | 48dp |
| Text Button | tap target | 44dp以上 |
| Input Field | minimum height | 48dp |
| Icon Button | tap target | 48dp以上 |
| List Item | minimum height | 56dp |
| Navigation Bar Item | minimum touch area | 48dp |
| Dialog Action Button | minimum height | 48dp |
| Bottom Sheet Action | minimum height | 48dp |
| Chip | minimum height | 32dp |
| Badge | minimum height | 24dp |

------------------------------------------------------------------------

## 4. Button

Primary ButtonとSecondary Buttonは、height 48dpを標準とする。

Dialog Action ButtonとBottom Sheet Actionは、minimum height 48dpを標準とする。

Text Buttonは、tap target 44dp以上を確保する。

Text Scale 200%でButton Labelが切れる場合は、文字を切る固定高さを優先せず、minimum height、Padding、折り返し、縦方向の拡張を検討する。

------------------------------------------------------------------------

## 5. Input Field

Input Fieldは、minimum height 48dpを標準とする。

入力欄の高さは、Label、Helper Text、Error Text、Text Scale拡大の影響を考慮する。固定高さによって入力値、単位、Error Textが切れないようにする。

------------------------------------------------------------------------

## 6. List Item

List Itemは、minimum height 56dpを標準とする。

一覧項目では、日付、血圧値、補助情報、Status表示がText Scale 200%でも欠けないことを優先する。必要に応じて縦方向に拡張できる構成とする。

------------------------------------------------------------------------

## 7. Navigation

Navigation Bar Itemは、minimum touch area 48dpを標準とする。

Navigation内のIcon描画サイズはIcon Size Tokenの責務とし、Component Sizeではタップ領域と操作可能領域を扱う。

------------------------------------------------------------------------

## 8. Dialog

Dialog Action Buttonは、minimum height 48dpを標準とする。

Dialogでは、Action Buttonの高さだけでなく、本文、説明文、Action配置、Text Scale拡大時の折り返しを確認する。

------------------------------------------------------------------------

## 9. Bottom Sheet

Bottom Sheet Actionは、minimum height 48dpを標準とする。

Bottom Sheetでは、画面下端、SafeArea、Gesture Area、Keyboard表示を考慮し、Actionが押しにくくならないようにする。

------------------------------------------------------------------------

## 10. Chip

Chipは、minimum height 32dpを標準とする。

Chipの角丸はRadius Token、内部余白はSpacing Token、Icon描画サイズはIcon Size Tokenの責務とする。Component Sizeでは、最小高さと操作可能性を扱う。

------------------------------------------------------------------------

## 11. Badge

Badgeは、minimum height 24dpを標準とする。

Badgeは補助的な状態表示として扱う。Badgeだけで重要な状態を伝えず、必要に応じてLabel、Icon、説明文、Semanticsを併用する。

------------------------------------------------------------------------

## 12. Accessibility

- 最小タップ領域は44dp以上、主要操作では48dp以上を確保する。
- Text Scale 200%で文字が切れないことを確認する。
- 高齢者向けUIでは、操作しやすいButton、読みやすいInput、押しやすいNavigationを優先する。
- Icon Sizeとタップ領域を混同しない。
- 固定高さによってLabel、値、Error Text、Button Labelが欠けないようにする。
- 色だけ、Iconだけに依存せず、Text LabelとSemanticsを併用する。

------------------------------------------------------------------------

## 13. Flutter実装時の命名例

将来のFlutter実装では、次の配置を使用する。

`lib/design_system/tokens/app_component_sizes.dart`

命名例は次のとおりとする。

| 種別 | 命名例 |
|---|---|
| Class | `AppComponentSizes` |
| Token | `AppComponentSizes.primaryButtonHeight` |
| Token | `AppComponentSizes.inputFieldMinHeight` |
| Token | `AppComponentSizes.iconButtonMinTapTarget` |

P3-03ではToken定義を実装し、P3-04以降でThemeDataやDesign System Componentから参照する。

------------------------------------------------------------------------

## 14. 禁止事項

以下を禁止する。

- 画面内で任意のComponent Size値を直接指定すること
- 本書にないComponent Sizeを独自追加すること
- Featureごとに独自のComponent Size Scaleを作ること
- Component SizeをSpacing、Radius、Icon Sizeの代替として扱うこと
- Icon描画サイズをComponent Sizeとして扱うこと
- タップ領域をIcon Sizeだけで判断すること
- Text Scale拡大時に文字が切れる固定高さを優先すること
- 小さなTouch Targetを主要操作に使用すること

------------------------------------------------------------------------

## 15. チェックリスト

実装時は次を確認する。

- [ ] 使用しているComponent Sizeは本書の定義に含まれている
- [ ] Primary Buttonはheight 48dpを基準にしている
- [ ] Secondary Buttonはheight 48dpを基準にしている
- [ ] Text Buttonはtap target 44dp以上を確保している
- [ ] Input Fieldはminimum height 48dpを基準にしている
- [ ] Icon Buttonはtap target 48dp以上を確保している
- [ ] List Itemはminimum height 56dpを基準にしている
- [ ] Navigation Bar Itemはminimum touch area 48dpを確保している
- [ ] Dialog Action Buttonはminimum height 48dpを基準にしている
- [ ] Bottom Sheet Actionはminimum height 48dpを基準にしている
- [ ] Chipはminimum height 32dpを基準にしている
- [ ] Badgeはminimum height 24dpを基準にしている
- [ ] Component SizeとSpacing、Radius、Icon Sizeの責務を分離している
- [ ] Text Scale 200%で文字が切れていない
- [ ] 高齢者向けUIとして押しやすさと読みやすさを確認している

------------------------------------------------------------------------

## 16. 受け入れ条件

- Component Sizeが本書に定義されている
- Button、Input Field、List Item、Navigation、Dialog、Bottom Sheet、Chip、Badgeの標準サイズが明記されている
- Flutter実装時の配置が `lib/design_system/tokens/app_component_sizes.dart` として明記されている
- Class名が `AppComponentSizes` として明記されている
- Component SizeとSpacing、Radius、Icon Sizeの責務分離が明記されている
- Text Scale 200%とタップ領域の確認観点が明記されている

------------------------------------------------------------------------

## 17. 関連ドキュメント

- `docs/04_DesignSystem/Colors.md`
- `docs/04_DesignSystem/Typography.md`
- `docs/04_DesignSystem/Spacing.md`
- `docs/04_DesignSystem/Radius.md`
- `docs/04_DesignSystem/IconSize.md`
- `docs/04_DesignSystem/Animation.md`
- `docs/06_Flutter/Architecture.md`
- `docs/06_Flutter/FolderStructure.md`
- `docs/09_AI_Context/DESIGN_RULES.md`
- `docs/09_AI_Context/SCREEN_CONTEXT.md`
