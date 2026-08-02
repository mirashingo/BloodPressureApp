# Radius.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Radius

## ドキュメントID

DS-RADIUS-001

------------------------------------------------------------------------

## 名称

角丸デザインシステム

------------------------------------------------------------------------

## 1. 目的

本書は、BloodPressureApp 全体で使用する角丸の Token と用途を定義する。

Radius Token を統一することで、画面や Component ごとの見た目のばらつきを防ぎ、Material 3 を基盤とした一貫性のある UI を維持する。

本書は、P3-03 Design Tokens 実装における AppRadius の仕様正本とする。

------------------------------------------------------------------------

## 2. 基本原則

- 画面内で任意の角丸値を直接指定しない。
- Component ごとに独自の Radius Scale を作らない。
- `radiusFull` は Chip、Badge、円形・カプセル形状に限定する。
- 円形 Icon Button は `radiusFull` だけでなく、正方形の外形と適切なタップ領域を確認する。
- 角丸は情報階層を補助するものであり、装飾目的で過剰に使わない。
- Material 3 との整合性を保つ。
- Text Scale 拡大時に固定高さと組み合わせて文字を切らない。
- Border Radius と Component Size の責務を分離する。

------------------------------------------------------------------------

## 3. Token 一覧表

| Token | 値 | 主な用途 |
|---|---:|---|
| `radiusSmall` | 8dp | 小さな補助要素、控えめな角丸 |
| `radiusMedium` | 12dp | Input field、Button |
| `radiusLarge` | 16dp | Card、Dialog、Bottom Sheet |
| `radiusFull` | 999dp | Chip、Badge、円形・カプセル形状 |

------------------------------------------------------------------------

## 4. Component 対応表

| Component | 使用 Token |
|---|---|
| Input field | `radiusMedium` |
| Button | `radiusMedium` |
| Card | `radiusLarge` |
| Dialog | `radiusLarge` |
| Bottom Sheet | `radiusLarge` |
| Chip | `radiusFull` |
| Badge | `radiusFull` |

同じ Component Role では、画面ごとに Radius を変更しない。

------------------------------------------------------------------------

## 5. Button

Button は `radiusMedium` を標準とする。

Primary、Secondary、Tertiary、Destructive などの Button Variant で、Role が同じ場合は同じ Radius を使用する。

Button の高さ、内側余白、最小タップ領域は Radius ではなく、Spacing と Component Size の責務とする。

------------------------------------------------------------------------

## 6. Input Field

Input field は `radiusMedium` を標準とする。

通常、Focus、Error、Disabled などの状態変化で Radius を変更しない。

Error 表示では、角丸ではなく Border、Color、Label、Helper/Error Text によって状態を伝える。

------------------------------------------------------------------------

## 7. Card

Card は `radiusLarge` を標準とする。

Card の角丸は、まとまりのある情報ブロックを示すために使用する。

すべての情報を Card 化したり、装飾目的で過剰に角丸を強調したりしない。

------------------------------------------------------------------------

## 8. Dialog・Bottom Sheet

Dialog と Bottom Sheet は `radiusLarge` を標準とする。

Dialog、Bottom Sheet は一時的な Surface として扱い、Radius だけで階層を表現しない。必要に応じて Surface、Overlay、Elevation、Spacing と組み合わせて階層を表現する。

Text Scale 拡大時に、固定高さと Radius の組み合わせによって本文や Button Label が切れないようにする。

------------------------------------------------------------------------

## 9. Chip・Badge

Chip と Badge は `radiusFull` を標準とする。

`radiusFull` は、カプセル形状または円形の表現に限定して使用する。

選択状態や警告状態は、Radius だけで表現せず、Color、Icon、Label、Semantics を併用する。

------------------------------------------------------------------------

## 10. Accessibility

- Radius だけで状態や重要度を伝えない。
- 円形 Icon Button は、描画領域とタップ領域を分けて確認する。
- 最小タップ領域は Radius ではなく Component Size の責務とする。
- Text Scale 200% 時に、固定高さの Component で文字が切れないことを確認する。
- 角丸を強くしすぎて、Button、Chip、Badge の役割が判別しにくくならないようにする。

------------------------------------------------------------------------

## 11. Flutter 実装時の命名例

将来の Flutter 実装では、次の配置を使用する。

`lib/design_system/tokens/app_radius.dart`

命名例は次のとおりとする。

| 種別 | 命名例 |
|---|---|
| Class | `AppRadius` |
| Token | `AppRadius.radiusMedium` |

BorderRadius オブジェクトを Token として保持するか、double 値を保持して使用側で `BorderRadius.circular` を呼ぶかは、本書では確定しない。

この点は P3-03 実装設計時の判断事項とする。

------------------------------------------------------------------------

## 12. 禁止事項

以下を禁止する。

- 画面内で任意の角丸値を直接指定すること
- 本書にない Radius Token を独自追加すること
- Component ごとに独自の Radius Scale を作ること
- `radiusFull` を通常の Card、Dialog、Input field に使用すること
- 角丸だけで選択、警告、成功、失敗などの状態を伝えること
- Text Scale 拡大時に文字が切れる固定高さ Component を優先すること
- Border Radius と Component Size の責務を混同すること
- 装飾目的で過剰に角丸を使うこと

------------------------------------------------------------------------

## 13. チェックリスト

実装時は次を確認する。

- [ ] 使用している Radius 値は本書の Token に含まれている
- [ ] Input field は `radiusMedium` を使用している
- [ ] Button は `radiusMedium` を使用している
- [ ] Card は `radiusLarge` を使用している
- [ ] Dialog は `radiusLarge` を使用している
- [ ] Bottom Sheet は `radiusLarge` を使用している
- [ ] Chip は `radiusFull` を使用している
- [ ] Badge は `radiusFull` を使用している
- [ ] `radiusFull` を通常 Component に流用していない
- [ ] Text Scale 200% で文字が切れない
- [ ] タップ領域を Radius だけで判断していない
- [ ] Component Size と Border Radius の責務を分離している

------------------------------------------------------------------------

## 14. 受け入れ条件

- Radius Token が本書に定義されている
- Component ごとの標準 Radius が本書に定義されている
- Flutter 実装時の配置が `lib/design_system/tokens/app_radius.dart` として明記されている
- BorderRadius オブジェクトとして持つか double 値として持つかを、本書で確定していない
- 任意の角丸値を直接指定しない方針が明記されている
- Accessibility と Component Size との責務分離が明記されている

------------------------------------------------------------------------

## 15. 関連ドキュメント

- `docs/04_DesignSystem/Colors.md`
- `docs/04_DesignSystem/Typography.md`
- `docs/04_DesignSystem/Spacing.md`
- `docs/04_DesignSystem/Animation.md`
- `docs/06_Flutter/Architecture.md`
- `docs/06_Flutter/FolderStructure.md`
- `docs/09_AI_Context/DESIGN_RULES.md`
- `docs/09_AI_Context/SCREEN_CONTEXT.md`

