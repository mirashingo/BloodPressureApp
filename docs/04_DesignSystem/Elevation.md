# Elevation.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Elevation

## ドキュメントID

DS-ELEVATION-001

------------------------------------------------------------------------

## 名称

Elevationデザインシステム

------------------------------------------------------------------------

## 1. 目的

本書は、BloodPressureApp全体で使用するElevation Tokenと用途を定義する。

Elevation Tokenを統一することで、画面やComponentごとの影表現のばらつきを防ぎ、Material 3を基盤とした一貫性のある情報階層を維持する。

本書は、P3-03 Design Tokens実装におけるAppElevationsの仕様正本とする。

------------------------------------------------------------------------

## 2. 基本原則

- Material 3を基盤とする。
- Elevationだけで階層を表現しない。
- Color、Surface、Spacing、Overlayを組み合わせて階層を表現する。
- 影を装飾目的で多用しない。
- Featureごとの独自Elevationを禁止する。
- Dark ModeではMaterial 3方針に従う。
- 高齢者向けUIでは、過剰な影より可読性を優先する。
- Cardをすべて浮かせず、BorderやSurface差で十分な場合はElevationを使用しない。

------------------------------------------------------------------------

## 3. Token一覧

| Token | 値 | 主な用途 |
|---|---:|---|
| `elevationNone` | 0 | Background |
| `elevationSmall` | 1 | Card |
| `elevationMedium` | 3 | Dialog |
| `elevationLarge` | 6 | Bottom Sheet |

------------------------------------------------------------------------

## 4. Component対応

| Component | 使用Token |
|---|---|
| Background | `elevationNone` |
| Card | `elevationSmall` |
| Dialog | `elevationMedium` |
| Bottom Sheet | `elevationLarge` |

同じComponent Roleでは、画面ごとにElevationを変更しない。

------------------------------------------------------------------------

## 5. Card

Cardは `elevationSmall` を標準とする。

ただし、Cardの分離がSurface、Border、Spacingで十分に表現できる場合は、`elevationNone` を使用できる。

Cardを装飾目的で過剰に浮かせない。Cardの階層は、情報のまとまり、Surface、Border、Spacingとあわせて判断する。

------------------------------------------------------------------------

## 6. Dialog

Dialogは `elevationMedium` を標準とする。

Dialogは一時的にユーザーの注意を集めるSurfaceとして扱う。Elevationだけで重要度を表現せず、Overlay、Title、本文、Action配置、Semanticsと組み合わせて状態を伝える。

------------------------------------------------------------------------

## 7. Bottom Sheet

Bottom Sheetは `elevationLarge` を標準とする。

Bottom Sheetは現在の画面の上に表示される一時的なSurfaceとして扱う。階層はElevationだけでなく、Overlay、Radius、Spacing、Drag Handle、Action配置とあわせて表現する。

------------------------------------------------------------------------

## 8. Accessibility

- Elevationだけで状態や重要度を伝えない。
- 色だけ、影だけに依存せず、Label、Icon、説明文、Semanticsを併用する。
- 高齢者向けUIでは、影の強さよりも文字の読みやすさ、Componentの分離、十分な余白を優先する。
- Dark Modeでは、影だけに頼らずSurface差やOverlayを確認する。
- Text Scale 200%でも、影やSurfaceが文字の可読性を妨げないことを確認する。

------------------------------------------------------------------------

## 9. Flutter実装時の命名例

将来のFlutter実装では、次の配置を使用する。

`lib/design_system/tokens/app_elevations.dart`

命名例は次のとおりとする。

| 種別 | 命名例 |
|---|---|
| Class | `AppElevations` |
| Token | `AppElevations.elevationMedium` |

P3-03ではToken定義を実装し、P3-04ではThemeDataや各Componentから参照する。

------------------------------------------------------------------------

## 10. 禁止事項

以下を禁止する。

- 画面内で任意のElevation値を直接指定すること
- 本書にないElevation Tokenを独自追加すること
- Featureごとに独自のElevation Scaleを作ること
- Elevationだけで階層、選択、警告、成功、失敗を伝えること
- Cardをすべて浮かせること
- 装飾目的で影を多用すること
- Dark Modeで影だけに依存してSurface階層を表現すること

------------------------------------------------------------------------

## 11. チェックリスト

実装時は次を確認する。

- [ ] 使用しているElevation値は本書のTokenに含まれている
- [ ] Backgroundは `elevationNone` を基準にしている
- [ ] Cardは `elevationSmall` を基準にしている
- [ ] Dialogは `elevationMedium` を基準にしている
- [ ] Bottom Sheetは `elevationLarge` を基準にしている
- [ ] Elevationだけで階層や状態を伝えていない
- [ ] Color、Surface、Spacing、Overlayと組み合わせて階層を表現している
- [ ] Featureごとの独自Elevationを作っていない
- [ ] Dark ModeでSurface階層が確認できる
- [ ] 高齢者向けUIで可読性を損なっていない

------------------------------------------------------------------------

## 12. 受け入れ条件

- Elevation Tokenが本書に定義されている
- Componentごとの標準Elevationが本書に定義されている
- Flutter実装時の配置が `lib/design_system/tokens/app_elevations.dart` として明記されている
- Class名が `AppElevations` として明記されている
- 任意のElevation値を直接指定しない方針が明記されている
- AccessibilityとDark Modeの確認観点が明記されている

------------------------------------------------------------------------

## 13. 関連ドキュメント

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
