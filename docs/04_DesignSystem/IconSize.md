# IconSize.md

# BloodPressureApp デザインシステム

Version: 1.0

------------------------------------------------------------------------

# Icon Size

## ドキュメントID

DS-ICON-SIZE-001

------------------------------------------------------------------------

## 名称

アイコンサイズデザインシステム

------------------------------------------------------------------------

## 1. 目的

本書は、BloodPressureApp 全体で使用するアイコンの描画サイズ Token と用途を定義する。

Icon Size Token を統一することで、Navigation、Button、Status、Feedback、Empty State などのアイコン表現を一貫させ、見やすく、意味が伝わる UI を維持する。

本書は、P3-03 Design Tokens 実装における AppIconSizes の仕様正本とする。

------------------------------------------------------------------------

## 2. 基本原則

- Icon Size はアイコンの描画サイズだけを定義する。
- タップ領域は Component Size の責務とする。
- 通常の IconButton は描画 24dp、タップ領域 48dp 以上を基準とする。
- 最小タップ領域は 44dp 以上、推奨は 48dp 以上とする。
- 色だけで状態を伝えず、ラベル、形状、Semantics を併用する。
- アイコンだけで意味が不明瞭な主要操作には Text Label を付ける。
- Material Icons を基本とする。
- Feature ごとの独自 Icon Scale を禁止する。
- Text Scale 拡大時も Icon だけが過度に小さく見えないようにする。
- Icon Size と Button Size を混同しない。

------------------------------------------------------------------------

## 3. Token 一覧表

| Token | 値 | 主な用途 |
|---|---:|---|
| `iconSmall` | 16dp | 補助情報、小さいステータス表示 |
| `iconMedium` | 24dp | 通常操作、Navigation、一般的な Icon |
| `iconLarge` | 32dp | 主要操作、強調表示 |
| `iconExtraLarge` | 40dp | 高齢者向け表示、空状態、重要な案内 |

------------------------------------------------------------------------

## 4. Semantic Usage 一覧

| Semantic | 使用 Token | 用途 |
|---|---|---|
| `supportingIcon` | `iconSmall` | 補助情報、小さいステータス表示 |
| `standardIcon` | `iconMedium` | 通常操作、Navigation、一般的な Icon |
| `primaryActionIcon` | `iconLarge` | 主要操作、強調表示 |
| `guidanceIcon` | `iconExtraLarge` | 高齢者向け表示、空状態、重要な案内 |

Semantic Usage は、画面実装時の判断基準とする。

------------------------------------------------------------------------

## 5. Navigation

Navigation で使用する通常の Icon は `iconMedium` を標準とする。

同じ Navigation Role では、画面ごとに Icon Size を変更しない。

選択状態は Icon Size の変更だけで伝えず、Color、Label、状態表現、Semantics を併用する。

------------------------------------------------------------------------

## 6. Button・Icon Button

通常の IconButton では、描画サイズは `iconMedium` を標準とする。

主要操作や強調が必要な場合は `iconLarge` を使用できる。

Icon Size は描画サイズであり、Button の高さ、内側余白、タップ領域は Component Size と Spacing の責務とする。

主要操作では、アイコンだけで意味が不明瞭な場合に Text Label を付ける。

------------------------------------------------------------------------

## 7. Status・Feedback

補助情報や小さいステータス表示では `iconSmall` を使用する。

保存完了、入力エラー、警告、成功などの Feedback では、Icon Size だけで重要度を表現しない。

状態表現では、Color、Label、説明文、Semantics を組み合わせる。

------------------------------------------------------------------------

## 8. Empty State・Important Guidance

Empty State や重要な案内では `iconExtraLarge` を使用できる。

高齢者向け表示や重要な案内で使用する場合も、アイコンだけで意味を完結させず、見出しや説明文を併用する。

装飾目的だけで大きい Icon を配置しない。

------------------------------------------------------------------------

## 9. Accessibility

- 最小タップ領域は 44dp 以上、推奨は 48dp 以上とする。
- Icon Size とタップ領域を混同しない。
- Icon だけで状態や操作内容を伝えない。
- Text Scale 拡大時も Icon と Text Label の関係が崩れないことを確認する。
- 色だけで状態を伝えず、Label、Shape、Semantics を併用する。
- 高齢者向け表示では、必要に応じて `iconLarge` または `iconExtraLarge` を使用する。

------------------------------------------------------------------------

## 10. Semantics とラベル

Icon だけの Button には、必ず意味が分かる Semantics Label を設定する。

主要操作では、アイコンだけで意味が伝わる一般的な Action に限定する。

意味が不明瞭な場合は、Text Label を併用する。

Decorative Icon は、読み上げ対象にする必要があるかを Component の責務として判断する。

------------------------------------------------------------------------

## 11. Flutter 実装時の命名例

将来の Flutter 実装では、次の配置を使用する。

`lib/design_system/tokens/app_icon_sizes.dart`

命名例は次のとおりとする。

| 種別 | 命名例 |
|---|---|
| Class | `AppIconSizes` |
| Token | `AppIconSizes.iconMedium` |
| Semantic 名 | `supportingIcon`, `standardIcon`, `primaryActionIcon`, `guidanceIcon` |

------------------------------------------------------------------------

## 12. 禁止事項

以下を禁止する。

- 画面内で任意の Icon Size 値を直接指定すること
- 本書にない Icon Size Token を独自追加すること
- Feature ごとに独自の Icon Scale を作ること
- Icon Size を Button Size やタップ領域の代替として扱うこと
- 主要操作を Icon Only にして意味が伝わらない状態にすること
- 色だけで状態を伝えること
- Material Icons を基本とする方針から、理由なく外れること
- 装飾目的で大きい Icon を多用すること

------------------------------------------------------------------------

## 13. チェックリスト

実装時は次を確認する。

- [ ] 使用している Icon Size は本書の Token に含まれている
- [ ] 補助情報・小さいステータス表示は `iconSmall` を基準にしている
- [ ] 通常操作・Navigation・一般的な Icon は `iconMedium` を基準にしている
- [ ] 主要操作・強調表示は `iconLarge` を基準にしている
- [ ] 高齢者向け表示・空状態・重要な案内は `iconExtraLarge` を基準にしている
- [ ] Icon Size とタップ領域を混同していない
- [ ] IconButton のタップ領域は 44dp 以上、推奨 48dp 以上で確認している
- [ ] Icon Only Button に Semantics Label がある
- [ ] 主要操作で意味が不明瞭な場合は Text Label を併用している
- [ ] 色だけで状態を伝えていない
- [ ] Text Scale 拡大時に Icon と Text Label の関係が崩れていない

------------------------------------------------------------------------

## 14. 受け入れ条件

- Icon Size Token が本書に定義されている
- Semantic Usage が本書に定義されている
- Flutter 実装時の配置が `lib/design_system/tokens/app_icon_sizes.dart` として明記されている
- Icon Size と Component Size の責務分離が明記されている
- 最小タップ領域 44dp 以上、推奨 48dp 以上が明記されている
- Icon Only Button の Semantics と Label 方針が明記されている

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

