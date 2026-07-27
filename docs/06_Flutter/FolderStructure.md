# FolderStructure.md

# BloodPressureApp Flutter設計

Version: 1.0

------------------------------------------------------------------------

# FolderStructure

## ドキュメントID

FLUTTER-FOLDER-001

------------------------------------------------------------------------

## 名称

Flutterフォルダ構成設計仕様

------------------------------------------------------------------------

## 目的

BloodPressureAppのFlutterプロジェクトにおける

フォルダ、ファイル、Feature、Layer、

共通部品、生成コード、Assets、Test、

Platform固有コード、ドキュメントの配置を統一し、

実装者やAIがファイルの責務を迷わず判断できる

プロジェクト構造を定義する。

本アプリは、

血圧記録、履歴、グラフ、統計、

リマインダー、出力、バックアップ、設定、

AI機能などを段階的に追加するため、

単純な画面別フォルダではなく、

Feature FirstとLayer分離を組み合わせた構成を採用する。

フォルダ構成自体を

アーキテクチャルールとして扱い、

Feature間の不要な依存、

sharedフォルダの肥大化、

巨大ファイル化、

責務不明のutils集約を防止する。

------------------------------------------------------------------------

## 適用範囲

-   Flutter Project Root
-   lib
-   features
-   app
-   core
-   design_system
-   shared
-   assets
-   test
-   integration_test
-   tool
-   scripts
-   docs
-   Android
-   iOS
-   Web
-   Desktop
-   Generated Files
-   AI Prompt Assets
-   CI/CD Files

------------------------------------------------------------------------

## 基本方針

-   Feature Firstを採用する
-   Feature内部でLayerを分ける
-   appはアプリ起動と全体構成を担当する
-   coreはFeature非依存の基盤を担当する
-   design_systemはColor、Typography、Spacing、Theme、Design Token、再利用可能なUI Componentを担当する
-   sharedは複数Featureで意味が共通するものに限定する
-   coreからfeaturesへ依存しない
-   Feature間の直接参照を最小化する
-   1ファイル1主要責務とする
-   巨大なutils.dartを作成しない
-   Barrel Fileを乱用しない
-   Generated Fileを手動編集しない
-   Assetを種類と用途で分類する
-   Test構成をProduction構成へ対応させる
-   Platform固有処理をAdapterで隔離する
-   PromptをDartコードへ直接埋め込まない
-   ドキュメントと実装の対応を明確にする
-   命名はsnake_caseへ統一する
-   フォルダ名に曖昧な略語を使用しない
-   一時ファイルをRepositoryへ追加しない

------------------------------------------------------------------------

## プロジェクト全体構成


blood_pressure_app/
├─ android/
├─ ios/
├─ web/
├─ macos/
├─ windows/
├─ linux/
│
├─ assets/
├─ docs/
├─ integration_test/
├─ lib/
├─ test/
├─ tool/
├─ scripts/
│
├─ .github/
├─ .vscode/
│
├─ analysis_options.yaml
├─ build.yaml
├─ l10n.yaml
├─ pubspec.yaml
├─ pubspec.lock
├─ README.md
├─ CHANGELOG.md
└─ LICENSE


MVPで未対応のPlatformフォルダは

Flutter生成時に存在してもよいが、

対応状況をREADMEへ明示する。

------------------------------------------------------------------------

# lib

------------------------------------------------------------------------

## 推奨構成


lib/
├─ app/
│  ├─ app.dart
│  ├─ bootstrap.dart
│  ├─ environment/
│  ├─ localization/
│  ├─ router/
│  └─ theme/
│
├─ core/
│  ├─ ai/
│  ├─ analytics/
│  ├─ backup/
│  ├─ config/
│  ├─ database/
│  ├─ error/
│  ├─ export/
│  ├─ extensions/
│  ├─ file/
│  ├─ logging/
│  ├─ notification/
│  ├─ permission/
│  ├─ result/
│  ├─ security/
│  ├─ storage/
│  ├─ time/
│  └─ validation/
│
├─ design_system/
│  ├─ colors/
│  ├─ typography/
│  ├─ spacing/
│  ├─ theme/
│  ├─ tokens/
│  └─ components/
│
├─ features/
│  ├─ splash/
│  ├─ onboarding/
│  ├─ home/
│  ├─ recording/
│  ├─ history/
│  ├─ graph/
│  ├─ statistics/
│  ├─ reminder/
│  ├─ export/
│  ├─ backup/
│  ├─ settings/
│  └─ ai_summary/
│
├─ shared/
│  ├─ domain/
│  └─ presentation/
│
├─ main_development.dart
├─ main_staging.dart
└─ main_production.dart


単一Flavorで開始する場合は

main.dartを使用してよい。

------------------------------------------------------------------------

# app

------------------------------------------------------------------------

## 目的

アプリ全体の起動、

Environment、Theme、Localization、

Router、Global Provider構成を管理する。

Feature固有処理を置かない。

------------------------------------------------------------------------

## app構成


app/
├─ app.dart
├─ bootstrap.dart
│
├─ environment/
│  ├─ app_environment.dart
│  ├─ development_environment.dart
│  ├─ staging_environment.dart
│  └─ production_environment.dart
│
├─ localization/
│  ├─ app_localizations_extension.dart
│  └─ locale_provider.dart
│
├─ router/
│  ├─ app_router.dart
│  ├─ app_route.dart
│  ├─ route_names.dart
│  ├─ route_paths.dart
│  ├─ route_redirect.dart
│  └─ shell_scaffold.dart
│
└─ theme/
   ├─ app_theme.dart
   ├─ app_theme_data.dart
   ├─ app_theme_mode_provider.dart
   └─ extensions/


------------------------------------------------------------------------

## app.dart

責務

-   MaterialApp.router
-   Theme
-   Locale
-   Router
-   App Title
-   Global Builder
-   Accessibility設定反映

Feature Controllerを

app.dartへ置かない。

------------------------------------------------------------------------

## bootstrap.dart

責務

-   Flutter Binding
-   Environment読込
-   Provider Override生成
-   Logging初期化
-   Error Handler初期化
-   runApp

------------------------------------------------------------------------

# core

------------------------------------------------------------------------

## 目的

全Featureから利用できる

Feature非依存の技術基盤と共通UIを配置する。

coreは

featuresをimportしない。

------------------------------------------------------------------------

## core/ai


core/ai/
├─ consent/
│  ├─ ai_consent.dart
│  ├─ ai_consent_repository.dart
│  └─ ai_consent_repository_impl.dart
│
├─ prompt/
│  ├─ prompt_definition.dart
│  ├─ prompt_catalog.dart
│  ├─ prompt_loader.dart
│  ├─ prompt_builder.dart
│  └─ prompt_validator.dart
│
├─ workflow/
│  ├─ ai_workflow.dart
│  ├─ ai_workflow_state.dart
│  ├─ ai_workflow_runner.dart
│  ├─ ai_preflight_checker.dart
│  └─ ai_fallback_resolver.dart
│
├─ safety/
│  ├─ ai_safety_validator.dart
│  ├─ medical_claim_detector.dart
│  └─ prohibited_phrase_policy.dart
│
├─ service/
│  ├─ ai_service.dart
│  ├─ ai_service_impl.dart
│  └─ ai_request.dart
│
├─ cache/
├─ metrics/
└─ providers/


Feature固有のAI画面や

AI Summary Domain Modelは

features側へ置く。

------------------------------------------------------------------------

## core/database


core/database/
├─ app_database.dart
├─ app_database.g.dart
├─ database_provider.dart
│
├─ tables/
│  ├─ blood_pressure_records_table.dart
│  ├─ measurement_sessions_table.dart
│  ├─ measurements_table.dart
│  ├─ reminder_schedules_table.dart
│  ├─ app_settings_table.dart
│  └─ backup_history_table.dart
│
├─ daos/
├─ converters/
└─ migrations/
   ├─ migration_strategy.dart
   └─ schema_versions.dart


TableがFeature固有で

Database全体から分離可能な場合は、

Featureのdata/databaseへ配置してもよい。

ただしAppDatabaseへの登録箇所を統一する。

------------------------------------------------------------------------

## core/error


core/error/
├─ app_error.dart
├─ app_exception.dart
├─ error_code.dart
├─ error_mapper.dart
└─ error_message_resolver.dart


Localized Stringは

Presentation側で解決する。

------------------------------------------------------------------------

## core/result


core/result/
├─ result.dart
└─ result_extensions.dart


------------------------------------------------------------------------

## core/storage


core/storage/
├─ key_value_storage.dart
├─ shared_preferences_storage.dart
├─ secure_storage.dart
├─ storage_keys.dart
└─ storage_providers.dart


------------------------------------------------------------------------

## core/notification


core/notification/
├─ notification_scheduler.dart
├─ local_notification_scheduler.dart
├─ notification_permission_service.dart
├─ notification_id_factory.dart
└─ notification_providers.dart


------------------------------------------------------------------------

## core/export


core/export/
├─ export_format.dart
├─ export_file.dart
├─ pdf/
├─ csv/
├─ preview/
└─ share/


Feature固有のExport UseCaseは

features/exportへ置く。

------------------------------------------------------------------------

## core/backup


core/backup/
├─ backup_codec.dart
├─ backup_encryption.dart
├─ backup_file_validator.dart
├─ backup_storage.dart
└─ backup_version.dart


------------------------------------------------------------------------

## core/widgets

core/widgetsはDesign Systemの基本Component置き場として使用しない。

Color、Typography、Spacing、Theme、Design Token、

および再利用可能なUI Componentは

design_system配下へ配置する。

core/widgetsを使用する場合は、

Design Systemに属さない技術的な基盤Widgetに限定する。

------------------------------------------------------------------------

# design_system

------------------------------------------------------------------------

design_systemは、

アプリ全体の見た目と操作感を一貫させるための

Design System要素を配置する。

対象は次のとおり。

-   Color
-   Typography
-   Spacing
-   Theme
-   Design Token
-   再利用可能なUI Component

例


design_system/
├─ colors/
│  └─ app_colors.dart
├─ typography/
│  └─ app_typography.dart
├─ spacing/
│  └─ app_spacing.dart
├─ theme/
│  ├─ app_theme.dart
│  └─ color_scheme.dart
├─ tokens/
│  ├─ app_radius.dart
│  ├─ app_duration.dart
│  └─ app_elevation.dart
└─ components/
   ├─ app_scaffold.dart
   ├─ app_app_bar.dart
   ├─ app_primary_button.dart
   ├─ app_secondary_button.dart
   ├─ app_text_field.dart
   ├─ app_dialog.dart
   ├─ app_bottom_sheet.dart
   ├─ app_snack_bar.dart
   ├─ app_empty_state.dart
   ├─ app_error_state.dart
   ├─ app_loading_state.dart
   └─ app_section_header.dart


血圧固有Widgetは

coreへ置かない。

------------------------------------------------------------------------

## core/extensions

用途

Flutter標準型や

Project共通型への小さなExtension。

例


build_context_extension.dart

date_time_extension.dart

iterable_extension.dart


Business Ruleを

Extensionへ隠さない。

------------------------------------------------------------------------

## core/utils禁止方針

原則


core/utils/


を作らない。

必要な処理は

意味のあるフォルダへ配置する。

非推奨


utils.dart

helpers.dart

common.dart

misc.dart


------------------------------------------------------------------------

# features

------------------------------------------------------------------------

## 目的

利用者価値単位の機能を配置する。

各Featureは

Presentation、Application、Domain、Dataを

必要な範囲で持つ。

------------------------------------------------------------------------

## Feature標準構成


features/
└─ feature_name/
   ├─ presentation/
   │  ├─ screens/
   │  ├─ widgets/
   │  ├─ controllers/
   │  ├─ states/
   │  └─ providers/
   │
   ├─ application/
   │  ├─ usecases/
   │  ├─ commands/
   │  ├─ queries/
   │  └─ services/
   │
   ├─ domain/
   │  ├─ entities/
   │  ├─ value_objects/
   │  ├─ repositories/
   │  ├─ services/
   │  ├─ policies/
   │  └─ exceptions/
   │
   └─ data/
      ├─ datasources/
      ├─ dtos/
      ├─ mappers/
      ├─ repositories/
      └─ providers/


小規模Featureは

空フォルダを事前作成しない。

必要になった時点で追加する。

------------------------------------------------------------------------

## recording Feature


features/recording/
├─ presentation/
│  ├─ screens/
│  │  ├─ blood_pressure_input_screen.dart
│  │  ├─ multiple_measurement_screen.dart
│  │  ├─ record_confirmation_screen.dart
│  │  ├─ record_detail_screen.dart
│  │  └─ record_edit_screen.dart
│  │
│  ├─ widgets/
│  │  ├─ blood_pressure_input_group.dart
│  │  ├─ measurement_row.dart
│  │  ├─ measurement_session_card.dart
│  │  ├─ pulse_input_field.dart
│  │  └─ recording_save_button.dart
│  │
│  ├─ controllers/
│  │  ├─ blood_pressure_input_controller.dart
│  │  └─ record_edit_controller.dart
│  │
│  ├─ states/
│  │  ├─ blood_pressure_input_state.dart
│  │  └─ record_edit_state.dart
│  │
│  └─ providers/
│
├─ application/
│  └─ usecases/
│     ├─ create_blood_pressure_record_use_case.dart
│     ├─ update_blood_pressure_record_use_case.dart
│     ├─ delete_blood_pressure_record_use_case.dart
│     └─ get_blood_pressure_record_use_case.dart
│
├─ domain/
│  ├─ entities/
│  │  ├─ blood_pressure_record.dart
│  │  ├─ measurement.dart
│  │  └─ measurement_session.dart
│  │
│  ├─ value_objects/
│  │  ├─ systolic_value.dart
│  │  ├─ diastolic_value.dart
│  │  ├─ pulse_value.dart
│  │  └─ record_id.dart
│  │
│  ├─ repositories/
│  │  └─ blood_pressure_repository.dart
│  │
│  ├─ services/
│  │  ├─ measurement_aggregation_service.dart
│  │  └─ time_period_classification_service.dart
│  │
│  └─ policies/
│     ├─ aggregation_policy.dart
│     └─ time_period_policy.dart
│
└─ data/
   ├─ datasources/
   │  └─ blood_pressure_local_data_source.dart
   ├─ dtos/
   │  └─ blood_pressure_record_dto.dart
   ├─ mappers/
   │  └─ blood_pressure_record_mapper.dart
   ├─ repositories/
   │  └─ drift_blood_pressure_repository.dart
   └─ providers/


------------------------------------------------------------------------

## home Feature


features/home/
├─ presentation/
│  ├─ screens/
│  │  └─ home_screen.dart
│  ├─ widgets/
│  │  ├─ latest_record_card.dart
│  │  ├─ today_status_card.dart
│  │  ├─ quick_summary_card.dart
│  │  └─ record_fab.dart
│  └─ providers/
│
└─ application/
   └─ queries/
      └─ get_home_dashboard_query.dart


Homeは

他FeatureのData Layerへ直接依存せず、

QueryまたはRepository Contractを利用する。

------------------------------------------------------------------------

## history Feature


features/history/
├─ presentation/
│  ├─ screens/
│  │  └─ history_screen.dart
│  ├─ widgets/
│  │  ├─ history_record_card.dart
│  │  ├─ history_filter_bar.dart
│  │  ├─ history_group_header.dart
│  │  └─ history_empty_state.dart
│  ├─ controllers/
│  │  └─ history_controller.dart
│  ├─ states/
│  │  └─ history_state.dart
│  └─ providers/
│
├─ application/
│  └─ queries/
│     └─ get_history_query.dart
│
└─ domain/
   └─ value_objects/
      ├─ blood_pressure_filter.dart
      └─ history_sort.dart


------------------------------------------------------------------------

## graph Feature


features/graph/
├─ presentation/
│  ├─ screens/
│  │  └─ graph_screen.dart
│  ├─ widgets/
│  │  ├─ blood_pressure_chart.dart
│  │  ├─ graph_legend.dart
│  │  ├─ graph_period_selector.dart
│  │  └─ graph_tooltip.dart
│  ├─ controllers/
│  ├─ states/
│  └─ providers/
│
├─ application/
│  └─ queries/
│     └─ get_graph_data_query.dart
│
└─ domain/
   ├─ entities/
   │  └─ graph_data_point.dart
   └─ value_objects/
      └─ graph_period.dart


------------------------------------------------------------------------

## settings Feature


features/settings/
├─ presentation/
│  ├─ screens/
│  │  ├─ settings_screen.dart
│  │  ├─ display_settings_screen.dart
│  │  ├─ recording_settings_screen.dart
│  │  └─ privacy_settings_screen.dart
│  ├─ widgets/
│  ├─ controllers/
│  ├─ states/
│  └─ providers/
│
├─ application/
│  └─ usecases/
│
├─ domain/
│  ├─ entities/
│  │  └─ app_settings.dart
│  └─ repositories/
│     └─ settings_repository.dart
│
└─ data/
   ├─ datasources/
   └─ repositories/


------------------------------------------------------------------------

## ai_summary Feature


features/ai_summary/
├─ presentation/
│  ├─ screens/
│  │  └─ ai_summary_screen.dart
│  ├─ widgets/
│  │  ├─ ai_summary_card.dart
│  │  ├─ ai_disclaimer.dart
│  │  └─ ai_source_data_sheet.dart
│  ├─ controllers/
│  │  └─ ai_summary_controller.dart
│  ├─ states/
│  │  └─ ai_summary_state.dart
│  └─ providers/
│
├─ application/
│  └─ usecases/
│     └─ generate_ai_summary_use_case.dart
│
├─ domain/
│  ├─ entities/
│  │  └─ ai_summary_result.dart
│  └─ repositories/
│     └─ ai_summary_repository.dart
│
└─ data/
   ├─ dtos/
   ├─ mappers/
   └─ repositories/


Prompt、Workflow、Safetyの共通基盤は

core/aiへ置く。

------------------------------------------------------------------------

# shared

------------------------------------------------------------------------

## 目的

sharedは、複数Featureで共有するが、

Design Systemには属さない共通処理を配置する。

対象は次のとおり。

-   複数Featureで共有するWidget
-   Extension
-   Formatter
-   Validator
-   Utility
-   デザインシステムに属さない共通処理

------------------------------------------------------------------------

## shared/domain

例


shared/domain/
├─ value_objects/
│  ├─ date_range.dart
│  ├─ page_request.dart
│  └─ sort_direction.dart
│
└─ entities/


BloodPressureRecordは

recording FeatureのDomainであるため、

安易にsharedへ移動しない。

------------------------------------------------------------------------

## shared/presentation

例


shared/presentation/
├─ widgets/
│  ├─ date_range_selector.dart
│  ├─ period_selector.dart
│  └─ confirmation_dialog.dart
│
└─ models/


Design Systemの基本Componentは

design_system/componentsを優先する。

------------------------------------------------------------------------

## shared昇格条件

次をすべて満たす場合に検討する。

-   2つ以上のFeatureで使用する
-   意味が同一である
-   Feature固有の命名を含まない
-   変更理由が共通である
-   依存方向を悪化させない

------------------------------------------------------------------------

# assets

------------------------------------------------------------------------

## 推奨構成


assets/
├─ fonts/
├─ icons/
├─ images/
│  ├─ onboarding/
│  ├─ empty_states/
│  └─ illustrations/
│
├─ animations/
├─ prompts/
│  ├─ ja/
│  └─ en/
│
├─ schemas/
│  └─ ai/
│
├─ sample_data/
└─ legal/


------------------------------------------------------------------------

## fonts

Font Licenseを確認し、

LICENSE情報を管理する。


assets/fonts/
├─ noto_sans_jp/
└─ licenses/


Font Fileを

不要に複数追加しない。

------------------------------------------------------------------------

## icons

App固有Iconだけを置く。

Material Iconで代替できるものを

重複Asset化しない。

------------------------------------------------------------------------

## images

用途別に分類する。

File名


onboarding_recording.webp

empty_history.webp

privacy_local_storage.webp


画面番号のみの名前を避ける。

非推奨


image1.png

img_002.png


------------------------------------------------------------------------

## prompts

Prompt.mdの規則に従う。


assets/prompts/ja/
├─ ai_summary_001_v1.0.0.txt
├─ ai_trend_001_v1.0.0.txt
└─ ai_search_001_v1.0.0.txt


Prompt Fileへ

秘密情報を含めない。

------------------------------------------------------------------------

## schemas

AI Structured Output用の

JSON Schemaを保存可能とする。


assets/schemas/ai/
├─ summary_v1.schema.json
├─ trend_v1.schema.json
└─ search_filter_v1.schema.json


------------------------------------------------------------------------

# test

------------------------------------------------------------------------

## 推奨構成

Productionのlib構造へ対応させる。


test/
├─ app/
├─ core/
├─ design_system/
├─ features/
├─ shared/
├─ fixtures/
├─ fakes/
├─ helpers/
└─ golden/


------------------------------------------------------------------------

## Feature Test例


test/features/recording/
├─ presentation/
│  ├─ screens/
│  ├─ widgets/
│  └─ controllers/
├─ application/
├─ domain/
└─ data/


------------------------------------------------------------------------

## fixtures


test/fixtures/
├─ blood_pressure_records.dart
├─ measurement_sessions.dart
├─ ai_responses/
└─ backup_files/


健康データFixtureは

架空データを使用する。

実利用者データを

Testへ含めない。

------------------------------------------------------------------------

## fakes


test/fakes/
├─ fake_blood_pressure_repository.dart
├─ fake_settings_repository.dart
├─ fake_notification_scheduler.dart
└─ fake_ai_service.dart


------------------------------------------------------------------------

## helpers


test/helpers/
├─ pump_app.dart
├─ provider_overrides.dart
├─ test_database.dart
└─ golden_test_helper.dart


------------------------------------------------------------------------

## golden


test/golden/
├─ home/
├─ recording/
├─ history/
├─ graph/
└─ settings/


Generated Golden画像は

Review対象とする。

------------------------------------------------------------------------

# integration_test

------------------------------------------------------------------------


integration_test/
├─ app_launch_test.dart
├─ record_create_flow_test.dart
├─ record_edit_flow_test.dart
├─ record_delete_flow_test.dart
├─ history_filter_flow_test.dart
├─ export_flow_test.dart
├─ backup_restore_flow_test.dart
└─ ai_fallback_flow_test.dart


Featureごとに分割してもよい。

------------------------------------------------------------------------

# tool

------------------------------------------------------------------------

Dartで実行する

開発補助Toolを配置する。

例


tool/
├─ generate_sample_data.dart
├─ validate_prompts.dart
├─ validate_ai_schemas.dart
├─ database_inspector.dart
└─ check_architecture.dart


Production Appから

toolをimportしない。

------------------------------------------------------------------------

# scripts

------------------------------------------------------------------------

Shell、PowerShell、

CI補助Scriptを配置する。


scripts/
├─ format.sh
├─ analyze.sh
├─ test.sh
├─ build_android.sh
├─ build_ios.sh
└─ verify_generated_files.sh


Windows開発を考慮する場合は

PowerShell版を用意する。

------------------------------------------------------------------------

# docs

------------------------------------------------------------------------

Project内ドキュメント構成


docs/
├─ 00_Project/
├─ 01_Requirements/
├─ 02_UX/
├─ 03_Screens/
├─ 04_DesignSystem/
├─ 05_AI/
├─ 06_Flutter/
├─ 07_Test/
├─ 08_Release/
└─ 09_AI_Context/


Flutterコード側から

docsをimportしない。

AI開発では

Feature実装前に

対応するRequirements、Screen、Design、Flutter文書を参照する。

------------------------------------------------------------------------

# 09_AI_Contextとの連携

------------------------------------------------------------------------

AIへ渡す実装Contextは

必要最小限に整理する。

例


docs/09_AI_Context/
├─ AGENTS.md
├─ CodingRules.md
├─ CurrentArchitecture.md
├─ CurrentFeatureMap.md
└─ PromptExamples.md


AGENTS.mdには

-   Architectureルール
-   Folder配置ルール
-   禁止事項
-   Test必須条件
-   参照ドキュメント

を記載する。

------------------------------------------------------------------------

# Platform Folder

------------------------------------------------------------------------

## android

Flutter標準構成を維持する。

追加例


android/app/src/
├─ main/
├─ debug/
├─ staging/
└─ production/


Platform固有処理は

MethodChannelまたはPlugin Adapterで隔離する。

------------------------------------------------------------------------

## ios


ios/
├─ Runner/
├─ RunnerTests/
└─ Flutter/


Entitlement、Permission文言、

Background Modeを管理する。

------------------------------------------------------------------------

## web・desktop

対応開始前は

不要な固有実装を追加しない。

Platform判定を

各Widgetへ散在させず、

AdapterまたはResponsive Layerへ集約する。

------------------------------------------------------------------------

# Naming Rules

------------------------------------------------------------------------

## フォルダ

snake_case。

例


blood_pressure

ai_summary

recording_settings


------------------------------------------------------------------------

## Dart File

snake_case。

例


blood_pressure_record.dart

create_record_use_case.dart

history_screen.dart


------------------------------------------------------------------------

## Class

UpperCamelCase。


BloodPressureRecord

CreateRecordUseCase

HistoryScreen


------------------------------------------------------------------------

## Variable・Function

lowerCamelCase。


measuredAt

createRecord

selectedDateRange


------------------------------------------------------------------------

## Provider

対象 + Provider。


bloodPressureRepositoryProvider

historyControllerProvider

appThemeModeProvider


------------------------------------------------------------------------

## Screen


{feature}_screen.dart


例


home_screen.dart

blood_pressure_input_screen.dart


------------------------------------------------------------------------

## Widget

意味を示す名前。


latest_record_card.dart

blood_pressure_value_pair.dart


非推奨


custom_card.dart

common_widget.dart


------------------------------------------------------------------------

## Controller


{feature}_controller.dart


------------------------------------------------------------------------

## State


{feature}_state.dart


------------------------------------------------------------------------

## UseCase


{verb}_{object}_use_case.dart


------------------------------------------------------------------------

## Repository

Interface


blood_pressure_repository.dart


Implementation


drift_blood_pressure_repository.dart


------------------------------------------------------------------------

## DataSource


blood_pressure_local_data_source.dart

ai_remote_data_source.dart


------------------------------------------------------------------------

## DTO


blood_pressure_record_dto.dart


------------------------------------------------------------------------

## Mapper


blood_pressure_record_mapper.dart


------------------------------------------------------------------------

# File Placement Decision

------------------------------------------------------------------------

## 判断順序


1. 特定Featureだけで使うか

2. Business Ruleか

3. UIか

4. 技術基盤か

5. 複数Featureで意味が共通か

6. Platform固有か


------------------------------------------------------------------------

## 配置例

BloodPressureInputField

血圧固有UI。


features/recording/presentation/widgets/


AppPrimaryButton

全Feature共通のDesign System Component。


design_system/components/


DateRange

複数Featureで共通のDomain Value。


shared/domain/value_objects/


PDF Generator

技術基盤。


core/export/pdf/


Export UseCase

Export Featureの処理。


features/export/application/usecases/


AI Summary Prompt Loader

全AI Feature共通。


core/ai/prompt/


AI Summary Screen

Feature固有。


features/ai_summary/presentation/screens/


------------------------------------------------------------------------

# Barrel File

------------------------------------------------------------------------

Barrel Fileは

公開APIを限定する場合のみ使用する。

例


features/recording/recording.dart


ただし

内部すべてをexportしない。

循環依存、

参照元不明、

Build時間増加を避ける。

MVPでは

直接importを基本とする。

------------------------------------------------------------------------

# Generated Files

------------------------------------------------------------------------

対象


*.g.dart

*.freezed.dart

*.mocks.dart


原則

-   手動編集しない
-   Source Fileと同じフォルダへ置く
-   Lint対象から適切に除外する
-   Git管理方針をProjectで統一する
-   CIで生成差分を検証する

------------------------------------------------------------------------

## Git管理

推奨

App Projectでは

Generated FileをGit管理する。

理由

-   CI再現性
-   Review
-   Build環境差
-   初回Setup簡略化

Project方針により除外する場合は

READMEへ明示する。

------------------------------------------------------------------------

# Import Rules

------------------------------------------------------------------------

推奨

package importを使用する。

dart
import 'package:blood_pressure_app/...';


同一フォルダ内の短い参照では

relative importを許可する方針も可能だが、

Project全体で統一する。

------------------------------------------------------------------------

## Import Order


1. Dart

2. Flutter

3. Third Party

4. Project


Group間を空行で分ける。

------------------------------------------------------------------------

## 禁止Import

-   coreからfeatures
-   domainからpresentation
-   domainからdata
-   Feature AからFeature Bのdata
-   testからProduction Private APIへの過度な依存
-   libからtest
-   libからtool

------------------------------------------------------------------------

# File Size

------------------------------------------------------------------------

目安

-   Widget：300行以内
-   Controller：300行以内
-   UseCase：200行以内
-   Entity：200行以内
-   Repository実装：400行以内

行数は絶対条件ではないが、

複数責務やReview困難が見られる場合は分割する。

------------------------------------------------------------------------

# Feature追加手順

------------------------------------------------------------------------

新しいFeature追加時


1. Feature ID確認

2. Screen ID確認

3. docs確認

4. features/{feature_name}作成

5. Domain Contract作成

6. Application UseCase作成

7. Data実装作成

8. Presentation作成

9. Router追加

10. Provider追加

11. Test追加

12. docs更新


------------------------------------------------------------------------

## 空フォルダ

Gitは空フォルダを管理しないため、

将来用の空フォルダを大量作成しない。

必要になった時点で追加する。

`.gitkeep`は

明確な理由がある場合のみ使用する。

------------------------------------------------------------------------

# Feature削除手順

------------------------------------------------------------------------


1. Route削除

2. Provider参照削除

3. Feature Directory削除

4. Sharedへ残った依存確認

5. Database Schema影響確認

6. Assets削除

7. Test削除

8. docs更新

9. Migration確認


Feature削除後に

coreへ不要コードを残さない。

------------------------------------------------------------------------

# Architecture Enforcement

------------------------------------------------------------------------

CIまたはCustom Lintで

次を検査する。

-   core → features import
-   domain → Flutter import
-   Feature A → Feature B data import
-   UI → Drift direct import
-   Forbidden File Name
-   Oversized File
-   Prompt direct embedding
-   Raw Health Logging
-   Generated File差分

------------------------------------------------------------------------

# README

------------------------------------------------------------------------

Root READMEへ記載する。

-   Project Purpose
-   Supported Platform
-   Flutter Version
-   Setup
-   Flavor
-   Code Generation
-   Test
-   Folder Structure概要
-   Architecture文書Link
-   AI機能注意
-   Privacy注意

------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   lib/screensへ全画面を集約する
-   lib/widgetsへ全Widgetを集約する
-   lib/modelsへEntityとDTOを混在させる
-   巨大なservicesフォルダを作る
-   巨大なutils.dartを作る
-   coreからFeatureを参照する
-   Feature間でDataSourceを直接参照する
-   WidgetへRepository実装を置く
-   PromptをControllerへ直書きする
-   Assetを用途不明の名前で保存する
-   Testへ実利用者データを含める
-   Generated Fileを編集する
-   Platform固有処理を各Screenへ書く
-   何でもsharedへ移動する
-   循環Importを作る
-   Backup FileをRepositoryへCommitする
-   Secret FileをGit管理する
-   Temporary Exportを残す

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Root

-   Root構成が定義通りである
-   docsがProject内に存在する
-   Assetsが種類別に分かれている
-   Secret FileがGit管理されていない
-   Temporary Fileが含まれていない

## lib

-   app、core、design_system、features、sharedが分離されている
-   main Entryが明確である
-   Feature First構成である
-   空フォルダを大量作成していない
-   曖昧なutilsがない

## Feature

-   Presentation、Application、Domain、Dataが必要に応じて分離されている
-   Screenがscreensへ配置されている
-   Controllerがcontrollersへ配置されている
-   UseCaseがapplicationへ配置されている
-   Repository Interfaceがdomainへ配置されている
-   Repository実装がdataへ配置されている

## Dependency

-   coreがfeaturesをimportしていない
-   domainがFlutterをimportしていない
-   domainがdataをimportしていない
-   Feature AがFeature Bのdataをimportしていない
-   UIがDriftを直接importしていない

## Naming

-   Folderがsnake_caseである
-   Dart Fileがsnake_caseである
-   ClassがUpperCamelCaseである
-   Provider名が統一されている
-   custom、common、miscなどの曖昧名がない

## Assets

-   Promptがassets/promptsへある
-   JSON Schemaがassets/schemasへある
-   Image名が意味を持つ
-   Font Licenseがある
-   不要な重複Assetがない

## Test

-   test構成がlibへ対応している
-   Fixtureが架空データである
-   Fake Repositoryがある
-   Integration Testが分離されている
-   Golden Testが整理されている

## AI

-   共通AI基盤がcore/aiへある
-   AI Feature画面がfeaturesへある
-   PromptがDartへ直書きされていない
-   Full PromptをLogへ保存していない
-   AI停止時にFeature構造が通常機能を妨げない

------------------------------------------------------------------------

## Acceptance Criteria

□ Project Root構成を定義できる

□ lib/appの責務を定義できる

□ lib/coreの責務を定義できる

□ lib/featuresの責務を定義できる

□ lib/design_systemの責務を定義できる

□ lib/sharedの責務を定義できる

□ Feature標準構成を定義できる

□ recording Feature構成を定義できる

□ home Feature構成を定義できる

□ history Feature構成を定義できる

□ graph Feature構成を定義できる

□ settings Feature構成を定義できる

□ AI Feature構成を定義できる

□ core/ai構成を定義できる

□ core/database構成を定義できる

□ design_system/components構成を定義できる

□ assets構成を定義できる

□ Prompt Asset配置を定義できる

□ AI Schema配置を定義できる

□ test構成を定義できる

□ integration_test構成を定義できる

□ toolとscriptsの役割を定義できる

□ docs構成を維持できる

□ 09_AI_Contextとの連携を定義できる

□ Naming Ruleを統一できる

□ File Placement判断基準を定義できる

□ coreからfeaturesへの依存を禁止できる

□ DomainからFlutterへの依存を禁止できる

□ Feature間のData直接参照を禁止できる

□ Generated Fileの管理方針を定義できる

□ Test Dataへ実利用者情報を含めない

□ PromptをDartコードへ直接埋め込まない

□ 新規Feature追加手順を定義できる

□ Feature削除手順を定義できる

□ CIでArchitecture Ruleを検査できる

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

F201 AI Summary

F202 AI Advice

F203 Natural Language Search

------------------------------------------------------------------------

## 優先度

★★★★★（Flutter実装前に必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap_日本語版.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/F001_BloodPressureRecording.md
-   02_UX/Navigation.md
-   02_UX/ScreenList.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Components.md
-   05_AI/Prompt.md
-   05_AI/AIWorkflow.md
-   06_Flutter/Architecture.md
-   06_Flutter/DataModel.md
-   06_Flutter/StateManagement.md
-   07_Test/
-   09_AI_Context/AGENTS.md

------------------------------------------------------------------------

## 将来拡張

-   Multi Package構成
-   Melos
-   Monorepo
-   Design System Package
-   Domain Package
-   Database Package
-   AI Package
-   Feature Module Package
-   Plugin Package
-   Web専用Feature
-   Desktop専用Feature
-   Wear OS
-   watchOS
-   Health Connect Module
-   Apple Health Module
-   Bluetooth Device Module
-   Cloud Sync Module
-   Architecture Lint自動化
-   Folder Generator
-   Feature Scaffold Generator
