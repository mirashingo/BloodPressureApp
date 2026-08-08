# AppConcept.md

**Project:** BloodPressureApp\
**Version:** 1.0\
**Status:** Draft (Phase 3.5)

## 1. このドキュメントについて

本書は BloodPressureApp
のUI/UX・Figma・Flutter実装の判断基準となるコンセプトを定義します。
他の設計資料の上位思想として利用します。

## 2. Mission

毎日の血圧測定を、「義務」ではなく「自然な習慣」にする。

## 3. Vision

血圧を診断するアプリではなく、生活に寄り添う健康記録アプリを目指します。

## 4. Target Users

### Primary

-   家庭で血圧を記録する人
-   高血圧が気になる人
-   継続的に健康管理したい人

### Secondary

-   高齢者
-   家族
-   医療機関へ記録を共有する人

## 5. UX Principles

-   毎日気持ちよく使える
-   数値の読みやすさを最優先
-   入力は短時間で完了
-   色だけに頼らない情報表現
-   Text Scale 200%対応
-   Light / Dark Mode対応
-   医療診断と誤解される表現は避ける

## 6. Design Keywords

-   Calm
-   Trust
-   Simple
-   Comfortable
-   Daily
-   Accessible

参考イメージ - Apple Health の読みやすさ - 穏やかで余白を活かしたUI -
温かさと安心感

## 7. Build

-   血圧記録
-   複数回測定
-   履歴
-   グラフ
-   統計
-   リマインダー
-   CSV/PDF出力
-   バックアップ
-   将来のAI振り返り支援

## 8. Do Not Build

-   医療診断
-   病気判定
-   恐怖を与えるUI
-   派手な演出
-   広告中心の体験

## 9. Information Priority

1.  血圧値
2.  日付・時間帯
3.  継続状況
4.  傾向
5.  補助情報

## 10. Accessibility

-   大きな文字
-   大きなタップ領域
-   十分なコントラスト
-   色以外でも状態を表現
-   高齢者にも使いやすい

## 11. AI Collaboration

-   ChatGPT：設計・レビュー
-   Codex：Flutter実装
-   開発者：検証・Git

## 12. Success Criteria

利用者が - 毎日迷わず入力できる - 履歴を振り返りやすい -
医師へ共有しやすい - 安心して継続利用できる

## 13. Future

本プロジェクトで確立したAI協調開発・Figma→Flutterワークフローは、
将来のAI Development Templateへ展開します。
