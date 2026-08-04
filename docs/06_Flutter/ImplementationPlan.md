# ImplementationPlan.md

**Version:** 2.0 (Official) **Status:** Phase 3 Complete / Phase 3.5
Added

# Purpose

本書は BloodPressureApp の実装計画を管理する正式ドキュメントです。
すべての実装は本計画に従って1タスクずつ進めます。

## 開発ルール

-   1タスクずつ実装する
-   実装前に設計確認を行う
-   ドキュメントを根拠に判断する
-   実装後は Executive Summary を提出する
-   CLI・Git は開発者指示時のみ実行

# Phase 1 Project Setup

Status: Complete

# Phase 2 Design Foundation

Status: Complete

# Phase 3 App Foundation

Status: Complete

完了項目 - P3-01 Project Bootstrap - P3-02 App Shell - P3-03 Theme
Foundation - P3-04 Design Tokens - P3-05 Riverpod Foundation - P3-06
GoRouter Foundation

------------------------------------------------------------------------

# Phase 3.5 UI / UX Design

## Goal

Flutter実装前に画面設計・UX・情報設計を確定する。

### P3.5-01 Information Architecture

Goal: - アプリ全体の情報構造整理 Files: -
docs/02_UX/InformationArchitecture.md Done: - 機能一覧・情報構造が確定

### P3.5-02 Navigation Flow

Goal: - 画面遷移確定 Files: - docs/02_UX/NavigationFlow.md Done: -
全画面の遷移が定義済み

### P3.5-03 Screen List Review

Goal: - Screen一覧確定 Files: - docs/03_Screens/ScreenList.md

### P3.5-04 Screen Specification

Goal: 各画面について以下を定義 - Purpose - Layout - Display Items -
Input - Validation - Navigation - Providers - UseCases - Loading -
Empty - Error Files: - docs/03_Screens/ScreenSpecification.md

### P3.5-05 Wireframe Design

Goal: - 全画面ワイヤーフレーム Files: - docs/03_Screens/Wireframes.md

### P3.5-06 Figma UI Design

Goal: - Figma完成 - Design System整合

### P3.5-07 Flutter Readiness Review

Goal: Flutter実装可能か最終確認

Validation: - Architecture OK - DesignSystem OK - Navigation OK -
ScreenSpec OK

## Design Freeze

以下を満たしたらUI仕様を凍結する。 - UXレビュー完了 - Screen
Specification完成 - Wireframe完成 - Figma完成 - Flutter実装可能

------------------------------------------------------------------------

# Phase 4 Feature Implementation

## Recording Feature

-   P4-01 Recording Feature Skeleton
-   P4-02 Domain
-   P4-03 Repository Interface
-   P4-04 Application / UseCase
-   P4-05 Drift Table / DAO
-   P4-06 Repository Implementation
-   P4-07 Providers / Controllers
-   P4-08 Presentation
-   P4-09 Widget Tests
-   P4-10 Feature Review

各タスク共通 Goal: - 最小変更で実装 Boundary: - 指定範囲のみ変更
Validation: - format - analyze - test - run Done: - Executive
Summary確認 - Git Commit

------------------------------------------------------------------------

# Phase 5+

機能追加・最適化・AI・Export・Release準備

# 全体フロー

Requirements ↓ UX ↓ Screens ↓ Design System ↓ Flutter Foundation ↓ UI/UX
Design (Phase3.5) ↓ Design Freeze ↓ Feature Implementation ↓ Testing ↓
Release

# Change Management

-   勝手な仕様変更禁止
-   ドキュメント矛盾時は停止して報告
-   Architecture変更はレビュー必須
