# ReleaseChecklist.md

# BloodPressureApp リリース設計

Version: 1.0

------------------------------------------------------------------------

# ReleaseChecklist

## ドキュメントID

RELEASE-CHECKLIST-001

------------------------------------------------------------------------

## 名称

リリース前後確認チェックリスト

------------------------------------------------------------------------

## 目的

BloodPressureAppを安全かつ再現可能に

Android・iOSへリリースするため、

仕様、コード、テスト、データベース、

プライバシー、セキュリティ、AI、

Store申請、監視、ロールバック、

リリース後確認までの必須項目を統一する。

本アプリは血圧記録を扱うため、

一般的なアプリのリリース確認に加え、

記録値の正確性、データ消失防止、

Database Migration、Backup・Restore、

PDF・CSV出力、通知、健康データ保護、

AI出力の安全性をRelease Gateとして扱う。

チェックが完了していない項目を

暗黙に承認済みとせず、

未完了、対象外、例外承認を

明確に記録する。

------------------------------------------------------------------------

## 適用範囲

-   Development Release
-   Internal Test
-   Staging
-   Closed Beta
-   Open Beta
-   Production Release
-   Android
-   iOS
-   Smartphone
-   Tablet
-   Flutter Build
-   Database Migration
-   Notification
-   Export
-   Backup・Restore
-   Privacy
-   Security
-   AI Feature
-   App Store Submission
-   Google Play Submission
-   Post Release Monitoring

------------------------------------------------------------------------

## 基本方針

-   Release Candidateを固定して検証する
-   検証後にコードや設定を変更しない
-   Critical・High Defectを残してReleaseしない
-   未解決Issueを明示する
-   Database Migrationを必ず検証する
-   Backup・Restoreを必ず検証する
-   Android・iOSの実機Testを行う
-   Store用BuildをDebug Buildで代替しない
-   Production Configurationを確認する
-   API KeyやSecretをClientへ含めない
-   健康データをLogへ出力しない
-   Privacy説明と実装を一致させる
-   AI機能は通常機能の必須依存にしない
-   AI停止手段をRelease前に確認する
-   RollbackまたはHotfix手順を準備する
-   Release後の監視担当を明確にする
-   Release Evidenceを保存する
-   例外承認は責任者と期限を記録する

------------------------------------------------------------------------

## チェック状態

各項目は

次のいずれかで記録する。


[ ] 未確認

[x] 完了

[N/A] 対象外

[EX] 例外承認


例外承認時の必須情報

-   理由
-   Risk
-   Workaround
-   承認者
-   期限
-   Follow Up Issue

------------------------------------------------------------------------

# Release情報

------------------------------------------------------------------------

-   [ ] Release Nameを確定した
-   [ ] Semantic Versionを確定した
-   [ ] Build Numberを確定した
-   [ ] Release Typeを確定した
-   [ ] Target Platformを確定した
-   [ ] Release Dateを確定した
-   [ ] Release Ownerを確定した
-   [ ] QA Ownerを確定した
-   [ ] Store Submission Ownerを確定した
-   [ ] Monitoring Ownerを確定した
-   [ ] Rollback Decision Ownerを確定した

------------------------------------------------------------------------

## Version形式

推奨


MAJOR.MINOR.PATCH+BUILD


例


1.0.0+1


変更例

MAJOR

互換性のない重大変更。

MINOR

後方互換のFeature追加。

PATCH

不具合修正。

BUILD

Storeへ提出するBuild識別子。

------------------------------------------------------------------------

# Release Scope

------------------------------------------------------------------------

-   [ ] 対象Feature IDを一覧化した
-   [ ] 対象Screenを一覧化した
-   [ ] 対象Bug Fixを一覧化した
-   [ ] 対象Database変更を一覧化した
-   [ ] 対象Package変更を一覧化した
-   [ ] 対象Prompt変更を一覧化した
-   [ ] 対象Privacy変更を一覧化した
-   [ ] 対象外Featureを明示した
-   [ ] Known Issuesを明示した
-   [ ] Release Notesの元情報を確定した

------------------------------------------------------------------------

# Branch・Source Control

------------------------------------------------------------------------

-   [ ] Release Branchを作成した
-   [ ] Release Commitを固定した
-   [ ] Commit Hashを記録した
-   [ ] 未Commit変更がない
-   [ ] Untracked Secret Fileがない
-   [ ] Main Branchとの差分を確認した
-   [ ] Release Branchへの直接変更を制限した
-   [ ] Tag命名規則を確認した
-   [ ] Release Tagを作成する準備がある
-   [ ] Source Archiveを再現できる

------------------------------------------------------------------------

## Tag例


v1.0.0

v1.0.1

v1.1.0


------------------------------------------------------------------------

# Documentation

------------------------------------------------------------------------

-   [ ] VisionとRelease Scopeが矛盾していない
-   [ ] FeatureIndexを更新した
-   [ ] 対象Feature仕様を更新した
-   [ ] Screen仕様を更新した
-   [ ] Navigation仕様を更新した
-   [ ] Design Systemを更新した
-   [ ] AI Prompt文書を更新した
-   [ ] AI Workflow文書を更新した
-   [ ] Architectureを更新した
-   [ ] FolderStructureを更新した
-   [ ] Packagesを更新した
-   [ ] TestPlanを更新した
-   [ ] Release Notesを作成した
-   [ ] Known Issuesを作成した
-   [ ] Support向け情報を作成した

------------------------------------------------------------------------

# Code Quality

------------------------------------------------------------------------

-   [ ] dart formatが成功した
-   [ ] flutter analyzeが成功した
-   [ ] Lint Errorが0件
-   [ ] WarningをReviewした
-   [ ] TODOをReviewした
-   [ ] FIXMEをReviewした
-   [ ] Debug Codeを削除した
-   [ ] Test用Backdoorを削除した
-   [ ] Feature Flag初期値を確認した
-   [ ] Dead Codeを確認した
-   [ ] Generated Codeを更新した
-   [ ] Generated Code差分をReviewした
-   [ ] Architecture Rule違反がない
-   [ ] coreからfeaturesへの依存がない
-   [ ] DomainからFlutterへの依存がない
-   [ ] WidgetからDatabaseを直接呼んでいない

------------------------------------------------------------------------

# Package・Dependency

------------------------------------------------------------------------

-   [ ] pubspec.yamlをReviewした
-   [ ] pubspec.lockをCommitした
-   [ ] flutter pub getが成功した
-   [ ] flutter pub outdatedを確認した
-   [ ] 未使用Packageがない
-   [ ] 類似Packageの重複がない
-   [ ] Git DependencyをCommit Hashへ固定した
-   [ ] dependency_overridesをReviewした
-   [ ] Package Licenseを確認した
-   [ ] Native Plugin設定を確認した
-   [ ] Minimum OS変更を確認した
-   [ ] Package Major Updateを個別検証した
-   [ ] Known Vulnerabilityを確認した
-   [ ] Third Party License表示を確認した

------------------------------------------------------------------------

# Build Configuration

------------------------------------------------------------------------

-   [ ] Flutter Stable Versionを固定した
-   [ ] Dart Versionを確認した
-   [ ] Development Flavorを確認した
-   [ ] Staging Flavorを確認した
-   [ ] Production Flavorを確認した
-   [ ] Production API Base URLを確認した
-   [ ] Debug Loggingを無効化した
-   [ ] Analytics設定を確認した
-   [ ] Crash Reporting設定を確認した
-   [ ] AI Enabled初期値を確認した
-   [ ] Remote Config初期値を確認した
-   [ ] Database Nameを確認した
-   [ ] App Display Nameを確認した
-   [ ] Package Name・Bundle IDを確認した

------------------------------------------------------------------------

# Secret・Credential

------------------------------------------------------------------------

-   [ ] API KeyをSourceへ含めていない
-   [ ] AI Provider KeyをClientへ含めていない
-   [ ] Signing SecretをRepositoryへ含めていない
-   [ ] `.env`をGit管理していない
-   [ ] Secret Scanを実行した
-   [ ] CI Secretを確認した
-   [ ] Production Credentialを確認した
-   [ ] Staging Credentialと混在していない
-   [ ] Credential Rotation手順がある
-   [ ] 退職者・不要AccountのAccessを削除した

------------------------------------------------------------------------

# Automated Test

------------------------------------------------------------------------

-   [ ] Unit Testが成功した
-   [ ] Domain Testが成功した
-   [ ] UseCase Testが成功した
-   [ ] Repository Testが成功した
-   [ ] Database Testが成功した
-   [ ] Migration Testが成功した
-   [ ] Provider・Controller Testが成功した
-   [ ] Widget Testが成功した
-   [ ] Golden Testが成功した
-   [ ] Integration Testが成功した
-   [ ] AI Prompt Testが成功した
-   [ ] AI Schema Testが成功した
-   [ ] AI Safety Testが成功した
-   [ ] Backup Codec Testが成功した
-   [ ] CI Quality Gateが成功した

------------------------------------------------------------------------

# Manual Test

------------------------------------------------------------------------

-   [ ] Smoke Testを完了した
-   [ ] Full Regression Testを完了した
-   [ ] Exploratory Testを完了した
-   [ ] UATを完了した
-   [ ] Android実機Testを完了した
-   [ ] iPhone実機Testを完了した
-   [ ] Tablet Testを完了した
-   [ ] Offline Testを完了した
-   [ ] Low Storage Testを完了した
-   [ ] Background・Foreground Testを完了した
-   [ ] App強制終了Testを完了した
-   [ ] Timezone変更Testを完了した
-   [ ] Date変更Testを完了した

------------------------------------------------------------------------

# Defect Gate

------------------------------------------------------------------------

-   [ ] Critical Defectが0件
-   [ ] High Defectが0件
-   [ ] Medium DefectをReviewした
-   [ ] Low DefectをReviewした
-   [ ] Known Issuesへ反映した
-   [ ] Workaroundを準備した
-   [ ] 未修正Defectの承認者を記録した
-   [ ] Defect再発防止Testを追加した
-   [ ] Release Blocking判定を完了した

------------------------------------------------------------------------

# F001 Blood Pressure Recording

------------------------------------------------------------------------

-   [ ] SYSを正しく入力できる
-   [ ] DIAを正しく入力できる
-   [ ] Pulseを入力・未入力にできる
-   [ ] 日付を正しく入力できる
-   [ ] 時刻を正しく入力できる
-   [ ] Time Periodを正しく分類できる
-   [ ] Memoを保存できる
-   [ ] Tagを保存できる
-   [ ] Validationが仕様通りである
-   [ ] 1回測定を保存できる
-   [ ] 複数回測定を保存できる
-   [ ] Averageを正しく算出できる
-   [ ] Lastを正しく保存できる
-   [ ] Lowestを正しく保存できる
-   [ ] User Selectedを正しく保存できる
-   [ ] 保存がTransactionで行われる
-   [ ] 編集できる
-   [ ] 削除確認がある
-   [ ] 削除後に関連データが整合する
-   [ ] App再起動後も保持される

------------------------------------------------------------------------

# Home・History・Graph・Statistics

------------------------------------------------------------------------

## Home

-   [ ] 最新記録が正しい
-   [ ] 記録なしStateが正しい
-   [ ] 本日の記録状態が正しい
-   [ ] Record Buttonが動作する

## History

-   [ ] 日付順が正しい
-   [ ] Filterが正しい
-   [ ] Sortが正しい
-   [ ] Detailへ遷移できる
-   [ ] 大量データを表示できる

## Graph

-   [ ] SYSが正しい
-   [ ] DIAが正しい
-   [ ] Pulseが正しい
-   [ ] Tooltipが正しい
-   [ ] Missing Dataを誤補完しない
-   [ ] 期間変更が正しい

## Statistics

-   [ ] 平均が正しい
-   [ ] 最小が正しい
-   [ ] 最大が正しい
-   [ ] 件数が正しい
-   [ ] Pulse nullを0として扱わない
-   [ ] Export値と一致する

------------------------------------------------------------------------

# Database・Migration

------------------------------------------------------------------------

-   [ ] Schema Versionを確認した
-   [ ] 新規InstallでDatabaseを作成できる
-   [ ] 直前VersionからMigrationできる
-   [ ] サポート対象の旧VersionからMigrationできる
-   [ ] Record Countが保持される
-   [ ] SYS・DIA・Pulseが保持される
-   [ ] DateTimeが保持される
-   [ ] Measurement Session関係が保持される
-   [ ] Tagsが保持される
-   [ ] Settingsが保持される
-   [ ] Reminderが保持される
-   [ ] Migration失敗時にDataを破壊しない
-   [ ] Migration Evidenceを保存した
-   [ ] 破壊的MigrationをReviewした
-   [ ] Database Backupを準備した

------------------------------------------------------------------------

# Backup・Restore

------------------------------------------------------------------------

## Backup

-   [ ] Backup Fileを作成できる
-   [ ] Backup Versionを含む
-   [ ] Recordを含む
-   [ ] Settingsを含む
-   [ ] Reminderを含む
-   [ ] Hashを含む
-   [ ] Encryptionを適用できる
-   [ ] Backupを共有できる

## Restore

-   [ ] File Typeを検証する
-   [ ] File Sizeを検証する
-   [ ] Versionを検証する
-   [ ] Hashを検証する
-   [ ] 改ざんを検出する
-   [ ] Previewを表示する
-   [ ] Cancelできる
-   [ ] Transactionで復元する
-   [ ] 失敗時に元データを保持する
-   [ ] Restore後にIntegrity Checkを行う
-   [ ] 旧Backup Versionを復元できる
-   [ ] Zip Slipを防止する
-   [ ] Path Traversalを防止する

------------------------------------------------------------------------

# Notification

------------------------------------------------------------------------

-   [ ] Permission前説明を表示する
-   [ ] Permission許可時に設定できる
-   [ ] Permission拒否時に復旧案内がある
-   [ ] 朝Reminderが動作する
-   [ ] 夜Reminderが動作する
-   [ ] 曜日指定が動作する
-   [ ] 編集が動作する
-   [ ] 削除が動作する
-   [ ] App再起動後も保持される
-   [ ] Timezone変更へ対応する
-   [ ] DSTを検証した
-   [ ] Notification Tapが正しく遷移する
-   [ ] Android実機で通知される
-   [ ] iOS実機で通知される
-   [ ] Exact Alarm要件を確認した

------------------------------------------------------------------------

# Export・Share

------------------------------------------------------------------------

-   [ ] PDFを生成できる
-   [ ] CSVを生成できる
-   [ ] 対象期間が正しい
-   [ ] 対象項目が正しい
-   [ ] Database値と一致する
-   [ ] 日本語が文字化けしない
-   [ ] 英語表示を確認した
-   [ ] PDF Previewできる
-   [ ] Shareできる
-   [ ] Share Cancelできる
-   [ ] Temporary Fileを削除する
-   [ ] AIなしでExportできる
-   [ ] AI生成表示がある
-   [ ] Disclaimerがある

------------------------------------------------------------------------

# Accessibility

------------------------------------------------------------------------

-   [ ] Screen Readerで主要画面を操作できる
-   [ ] Button Labelがある
-   [ ] Input Labelがある
-   [ ] Errorが読み上げられる
-   [ ] Focus Orderが正しい
-   [ ] Graph代替情報がある
-   [ ] Text Scale 130%で崩れない
-   [ ] Text Scale 160%で崩れない
-   [ ] Text Scale 200%で操作できる
-   [ ] Touch Targetが十分
-   [ ] Light Mode Contrastを確認した
-   [ ] Dark Mode Contrastを確認した
-   [ ] High Contrastを確認した
-   [ ] Reduce Motionが動作する
-   [ ] Animationなしでも意味が伝わる

------------------------------------------------------------------------

# Localization

------------------------------------------------------------------------

-   [ ] ja-JPの未翻訳Keyがない
-   [ ] enの未翻訳Keyがない
-   [ ] Date Formatが正しい
-   [ ] Number Formatが正しい
-   [ ] Long TextでOverflowしない
-   [ ] Button Textが収まる
-   [ ] Dialog Textが収まる
-   [ ] Notification Textを確認した
-   [ ] PDF Textを確認した
-   [ ] Error Messageを確認した
-   [ ] AI Disclaimerを確認した
-   [ ] Store Descriptionの各言語を確認した

------------------------------------------------------------------------

# Performance

------------------------------------------------------------------------

-   [ ] Cold Startを測定した
-   [ ] Warm Startを測定した
-   [ ] Record保存時間を測定した
-   [ ] History 1,000件を確認した
-   [ ] History 10,000件を確認した
-   [ ] Graph 1年表示を確認した
-   [ ] Graph全期間表示を確認した
-   [ ] PDF 1,000件生成を確認した
-   [ ] Backup Large Dataを確認した
-   [ ] Restore Large Dataを確認した
-   [ ] 継続的Jankがない
-   [ ] Memory Leakを確認した
-   [ ] Battery消費を確認した
-   [ ] App Sizeを確認した

------------------------------------------------------------------------

# Security

------------------------------------------------------------------------

-   [ ] Secret Scanを実施した
-   [ ] API KeyがBundleにない
-   [ ] TokenをSecure Storageへ保存する
-   [ ] Raw Health DataをLogへ出さない
-   [ ] MemoをLogへ出さない
-   [ ] Full PromptをLogへ出さない
-   [ ] Full AI ResponseをLogへ出さない
-   [ ] SQL Parameter Queryを使用する
-   [ ] File ImportをValidationする
-   [ ] Path Traversalを防ぐ
-   [ ] Zip Slipを防ぐ
-   [ ] Deep LinkをValidationする
-   [ ] Temporary Fileを削除する
-   [ ] Backup Encryptionを確認した
-   [ ] Biometric失敗時のFallbackがある
-   [ ] Production EndpointがHTTPSである

------------------------------------------------------------------------

# Privacy

------------------------------------------------------------------------

-   [ ] Privacy Policyを更新した
-   [ ] Privacy Policy URLが有効
-   [ ] Data Collection説明が実装と一致する
-   [ ] Health Dataの保存場所を説明している
-   [ ] Backup Fileの扱いを説明している
-   [ ] AI外部送信を説明している
-   [ ] AI送信項目を明示している
-   [ ] AI同意を取得する
-   [ ] AI同意を撤回できる
-   [ ] AIなしでも利用できる
-   [ ] Analyticsへ血圧値を送らない
-   [ ] Crash ReportへMemoを送らない
-   [ ] Delete Allが動作する
-   [ ] Support時のData取扱手順がある
-   [ ] Store Privacy Labelと一致する
-   [ ] Google Play Data Safetyと一致する

------------------------------------------------------------------------

# AI Release Gate

------------------------------------------------------------------------

## Feature

-   [ ] AI機能が任意である
-   [ ] AI無効時も主要機能を利用できる
-   [ ] AI同意前に送信しない
-   [ ] 送信データを最小化している
-   [ ] 数値集計をLocalで行う
-   [ ] AI Resultが生成物と明示される
-   [ ] Disclaimerを表示する
-   [ ] User Review後に適用する
-   [ ] AI結果を自動で記録へ反映しない

## Prompt

-   [ ] Prompt IDを確認した
-   [ ] Prompt Versionを確認した
-   [ ] System Instructionを確認した
-   [ ] Medical Limitを確認した
-   [ ] Privacy Instructionを確認した
-   [ ] Output Schemaを確認した
-   [ ] Prompt Injection対策を確認した
-   [ ] Prompt AssetがProductionへ含まれる

## Workflow

-   [ ] Consent Checkが動作する
-   [ ] Preflight Checkが動作する
-   [ ] Timeoutが動作する
-   [ ] Cancelが動作する
-   [ ] Retry上限がある
-   [ ] Schema Validationが動作する
-   [ ] Safety Validationが動作する
-   [ ] Grounding Validationが動作する
-   [ ] Fallbackが動作する
-   [ ] Feature Flagで停止できる

## Safety

-   [ ] 診断断定をBlockする
-   [ ] 薬変更指示をBlockする
-   [ ] 根拠のない安心表現をBlockする
-   [ ] 存在しない症状を追加しない
-   [ ] 存在しない日付を追加しない
-   [ ] 数値がLocal Dataと一致する
-   [ ] Safety Regression Datasetに合格する
-   [ ] Provider障害時にFallbackする

## Backend

-   [ ] AI Provider KeyをBackendで管理する
-   [ ] Authenticationがある
-   [ ] Rate Limitがある
-   [ ] Request Size Limitがある
-   [ ] Server Side Validationがある
-   [ ] Provider Modelを確認した
-   [ ] Model Policyを確認した
-   [ ] Data Retention設定を確認した
-   [ ] Regionを確認した
-   [ ] Cost Alertを設定した

------------------------------------------------------------------------

# Analytics・Crash Reporting

------------------------------------------------------------------------

-   [ ] Analyticsの利用目的を確認した
-   [ ] 不要なAnalyticsを無効化した
-   [ ] Event名をReviewした
-   [ ] Health DataをParameterへ含めない
-   [ ] Personal Identifierを最小化した
-   [ ] Crash ReportingをProductionで確認した
-   [ ] Screenshot送信設定を確認した
-   [ ] Breadcrumbへ健康データを含めない
-   [ ] Source Map・SymbolをUploadした
-   [ ] Alert通知先を確認した
-   [ ] Opt Out方針を確認した

------------------------------------------------------------------------

# Android Release

------------------------------------------------------------------------

## App Configuration

-   [ ] applicationIdを確認した
-   [ ] versionNameを確認した
-   [ ] versionCodeを確認した
-   [ ] minSdkを確認した
-   [ ] targetSdkを確認した
-   [ ] compileSdkを確認した
-   [ ] App Nameを確認した
-   [ ] App Iconを確認した
-   [ ] Adaptive Iconを確認した
-   [ ] Splash Screenを確認した
-   [ ] Notification Iconを確認した
-   [ ] Deep Link設定を確認した

## Permission

-   [ ] AndroidManifestをReviewした
-   [ ] 不要Permissionがない
-   [ ] Notification Permissionを確認した
-   [ ] Exact Alarm要件を確認した
-   [ ] File Accessを確認した
-   [ ] Biometric Permissionを確認した
-   [ ] Permission説明と機能が一致する

## Signing

-   [ ] Release Keystoreを確認した
-   [ ] Key Aliasを確認した
-   [ ] Signing Configを確認した
-   [ ] Keystore Backupがある
-   [ ] Password管理が安全
-   [ ] Play App Signingを確認した
-   [ ] Upload Key Recovery手順がある

## Build

-   [ ] Release AABを生成できる
-   [ ] Release APKを必要に応じて生成した
-   [ ] Build ArtifactのHashを記録した
-   [ ] ProGuard・R8設定を確認した
-   [ ] Obfuscation設定を確認した
-   [ ] Native Symbolを保存した
-   [ ] Release Buildを実機Installした
-   [ ] Upgrade Installを確認した
-   [ ] Uninstall・Reinstallを確認した

------------------------------------------------------------------------

# Google Play Console

------------------------------------------------------------------------

-   [ ] App Nameを確認した
-   [ ] Short Descriptionを確認した
-   [ ] Full Descriptionを確認した
-   [ ] App IconをUploadした
-   [ ] Feature GraphicをUploadした
-   [ ] Phone ScreenshotをUploadした
-   [ ] Tablet ScreenshotをUploadした
-   [ ] Categoryを確認した
-   [ ] Contact Informationを確認した
-   [ ] Privacy Policy URLを確認した
-   [ ] Data Safetyを更新した
-   [ ] Content Ratingを確認した
-   [ ] Target Audienceを確認した
-   [ ] Ads有無を確認した
-   [ ] Health関連申告を確認した
-   [ ] App Access情報を確認した
-   [ ] Internal Testingを完了した
-   [ ] Closed Testingを完了した
-   [ ] Pre Launch Reportを確認した
-   [ ] Production Rollout率を決定した
-   [ ] Review Notesを準備した

------------------------------------------------------------------------

# iOS Release

------------------------------------------------------------------------

## App Configuration

-   [ ] Bundle Identifierを確認した
-   [ ] Versionを確認した
-   [ ] Build Numberを確認した
-   [ ] Minimum iOSを確認した
-   [ ] Display Nameを確認した
-   [ ] App Iconを確認した
-   [ ] Launch Screenを確認した
-   [ ] URL Schemeを確認した
-   [ ] Universal Linkを確認した
-   [ ] Entitlementを確認した
-   [ ] Background Modeを確認した

## Permission

-   [ ] Info.plistをReviewした
-   [ ] Notification説明を確認した
-   [ ] Face ID説明を確認した
-   [ ] File Access説明を確認した
-   [ ] 不要Permission説明がない
-   [ ] Privacy Manifestを確認した
-   [ ] Required Reason APIを確認した
-   [ ] Third Party SDK Privacy Manifestを確認した

## Signing

-   [ ] Apple Developer Accountを確認した
-   [ ] Distribution Certificateを確認した
-   [ ] Provisioning Profileを確認した
-   [ ] App Store Connect Appを確認した
-   [ ] Team IDを確認した
-   [ ] Keychain Accessを確認した
-   [ ] Certificate期限を確認した

## Build

-   [ ] Release Archiveを作成した
-   [ ] Archive Validationが成功した
-   [ ] dSYMを保存した
-   [ ] SymbolをUploadした
-   [ ] TestFlightへUploadした
-   [ ] TestFlight実機Testを完了した
-   [ ] Upgrade Installを確認した
-   [ ] Uninstall・Reinstallを確認した

------------------------------------------------------------------------

# App Store Connect

------------------------------------------------------------------------

-   [ ] App Nameを確認した
-   [ ] Subtitleを確認した
-   [ ] Descriptionを確認した
-   [ ] Keywordsを確認した
-   [ ] Promotional Textを確認した
-   [ ] Support URLを確認した
-   [ ] Marketing URLを確認した
-   [ ] Privacy Policy URLを確認した
-   [ ] App Iconを確認した
-   [ ] iPhone ScreenshotをUploadした
-   [ ] iPad ScreenshotをUploadした
-   [ ] Age Ratingを確認した
-   [ ] App Privacyを更新した
-   [ ] Health Data取扱を確認した
-   [ ] Encryption申告を確認した
-   [ ] Content Rightsを確認した
-   [ ] Review Contactを確認した
-   [ ] Review Notesを準備した
-   [ ] Demo Account情報を準備した
-   [ ] TestFlight External Testを完了した
-   [ ] Release方式を決定した
-   [ ] Phased Releaseを検討した

------------------------------------------------------------------------

# Store Assets

------------------------------------------------------------------------

-   [ ] Screenshotが現行UIと一致する
-   [ ] Screenshotへ実データを使用していない
-   [ ] Health Dataが架空である
-   [ ] Status Bar情報を確認した
-   [ ] App Nameが正しい
-   [ ] 文言誤字がない
-   [ ] 日本語Assetを確認した
-   [ ] 英語Assetを確認した
-   [ ] Tablet Assetを確認した
-   [ ] AI機能の表現が誤解を招かない
-   [ ] 医療診断アプリと誤認させない
-   [ ] 誇大表現がない
-   [ ] Privacy説明と矛盾しない

------------------------------------------------------------------------

# Medical・Health Expression

------------------------------------------------------------------------

-   [ ] 診断を提供すると表現していない
-   [ ] 治療を提供すると表現していない
-   [ ] 薬変更を勧めると表現していない
-   [ ] 医療者の代替と表現していない
-   [ ] 不安を煽る表現がない
-   [ ] 必ず改善すると断定していない
-   [ ] AI Adviceの限界を説明している
-   [ ] Emergency機能の有無を正確に説明している
-   [ ] Store文言とApp内Disclaimerが一致する

------------------------------------------------------------------------

# Release Notes

------------------------------------------------------------------------

-   [ ] User向け変更内容を記載した
-   [ ] Technical Detailを詰め込みすぎていない
-   [ ] Bug Fixを記載した
-   [ ] Privacy変更を記載した
-   [ ] AI変更を必要に応じて記載した
-   [ ] Breaking Changeを記載した
-   [ ] Known Issueを記載した
-   [ ] Support窓口を確認した
-   [ ] 日本語版を確認した
-   [ ] 英語版を確認した

------------------------------------------------------------------------

# Release Approval

------------------------------------------------------------------------

必須承認

-   [ ] Product Owner
-   [ ] Engineering Owner
-   [ ] QA Owner
-   [ ] Design Owner
-   [ ] Privacy・Security Owner
-   [ ] AI Safety Owner
-   [ ] Store Submission Owner

条件付き承認

-   [ ] Medical・Safety Reviewer
-   [ ] Legal
-   [ ] Customer Support
-   [ ] Operations

------------------------------------------------------------------------

# Go・No Go判定

------------------------------------------------------------------------

## Go条件

-   [ ] Exit Criteriaを満たす
-   [ ] Critical Defect 0
-   [ ] High Defect 0
-   [ ] Migration合格
-   [ ] Backup・Restore合格
-   [ ] Android Release Build合格
-   [ ] iOS Release Build合格
-   [ ] Privacy Review合格
-   [ ] Security Review合格
-   [ ] AI Safety Review合格
-   [ ] Monitoring準備完了
-   [ ] Rollback準備完了
-   [ ] 必須承認完了

## No Go条件

-   Data Lossの可能性
-   記録値不整合
-   Migration失敗
-   Backup Restore失敗
-   Privacy Leak
-   Secret漏えい
-   Unsafe AI Output
-   Release Build起動不能
-   Store Metadata重大不整合
-   Monitoring不能
-   Rollback不能

------------------------------------------------------------------------

# Rollout Plan

------------------------------------------------------------------------

-   [ ] Internal Release順序を決定した
-   [ ] Beta Release順序を決定した
-   [ ] Production Rollout率を決定した
-   [ ] Android Staged Rolloutを設定した
-   [ ] iOS Phased Releaseを検討した
-   [ ] Country・Regionを確認した
-   [ ] Release時刻を決定した
-   [ ] Support対応可能時間を選択した
-   [ ] Monitoring強化期間を決定した
-   [ ] Rollout停止条件を決定した

------------------------------------------------------------------------

## Rollout例


Internal

Closed Beta 5%

Production 10%

Production 25%

Production 50%

Production 100%


Metricが悪化した場合は

次段階へ進めない。

------------------------------------------------------------------------

# Monitoring準備

------------------------------------------------------------------------

-   [ ] Crash Dashboardを確認した
-   [ ] Error Dashboardを確認した
-   [ ] Performance Dashboardを確認した
-   [ ] AI Dashboardを確認した
-   [ ] Backend Health Checkを確認した
-   [ ] Database Error監視を確認した
-   [ ] Backup Error監視を確認した
-   [ ] Notification Error監視を確認した
-   [ ] Alert Thresholdを設定した
-   [ ] Alert通知先を設定した
-   [ ] On Call担当を確認した
-   [ ] Support問い合わせ導線を確認した
-   [ ] Status Communication手順がある

------------------------------------------------------------------------

# Rollback・Hotfix

------------------------------------------------------------------------

-   [ ] 直前安定Versionを確認した
-   [ ] Rollback可能範囲を確認した
-   [ ] Database Downgrade不可を理解している
-   [ ] Forward Fix方針を準備した
-   [ ] Feature Flag停止手段がある
-   [ ] AI Feature停止手段がある
-   [ ] Backend Endpoint停止手段がある
-   [ ] Store Rollout停止手順がある
-   [ ] Android Rollout停止権限がある
-   [ ] iOS Release停止権限がある
-   [ ] Hotfix Branch手順がある
-   [ ] Emergency Contactを確認した

------------------------------------------------------------------------

## Rollback注意

Database Migration済み端末へ

旧Appを戻すと

旧Appが新Schemaを読めない可能性がある。

そのため

Database変更を含むReleaseでは、

単純なBinary Rollbackではなく

Forward Fixを基本とする。

------------------------------------------------------------------------

# Release Execution

------------------------------------------------------------------------

-   [ ] Release Candidate Buildを再確認した
-   [ ] Artifact Hashを再確認した
-   [ ] Storeへ正しいBuildを選択した
-   [ ] Release Notesを設定した
-   [ ] Review Notesを設定した
-   [ ] Privacy情報を確認した
-   [ ] Release方式を確認した
-   [ ] Submissionを実行した
-   [ ] Submission時刻を記録した
-   [ ] Review Statusを監視した
-   [ ] Storeからの質問対応担当を決めた

------------------------------------------------------------------------

# Post Release Smoke Test

------------------------------------------------------------------------

Store公開後

-   [ ] Store Pageを確認した
-   [ ] 正しいVersionが表示される
-   [ ] Fresh Installできる
-   [ ] Upgrade Installできる
-   [ ] App起動できる
-   [ ] Record保存できる
-   [ ] History表示できる
-   [ ] Graph表示できる
-   [ ] Statistics表示できる
-   [ ] Reminder設定できる
-   [ ] PDFを生成できる
-   [ ] Backupを作成できる
-   [ ] AI無効時に通常機能が動作する
-   [ ] AI有効時に安全に動作する
-   [ ] Support URLが開く
-   [ ] Privacy Policy URLが開く

------------------------------------------------------------------------

# Post Release Monitoring

------------------------------------------------------------------------

## 最初の1時間

-   [ ] Crash Rateを確認した
-   [ ] App Launch Errorを確認した
-   [ ] API Errorを確認した
-   [ ] AI Errorを確認した
-   [ ] Authentication Errorを確認した
-   [ ] Store Review状況を確認した

## 最初の24時間

-   [ ] Crash Free Userを確認した
-   [ ] Record保存失敗を確認した
-   [ ] Migration Errorを確認した
-   [ ] Backup Errorを確認した
-   [ ] Export Errorを確認した
-   [ ] Notification Errorを確認した
-   [ ] AI Safety Blockを確認した
-   [ ] Support問い合わせを確認した
-   [ ] Rollout継続を判断した

## 最初の7日

-   [ ] Stability Trendを確認した
-   [ ] Performance Trendを確認した
-   [ ] Feature利用状況を確認した
-   [ ] DefectをTriageした
-   [ ] Store Reviewを確認した
-   [ ] Known Issueを更新した
-   [ ] Retrospectiveを実施した

------------------------------------------------------------------------

# Incident Trigger

------------------------------------------------------------------------

Rollout停止またはHotfix検討条件

-   Crash Rate急増
-   App起動不能
-   Data Loss報告
-   Record値不整合
-   Migration失敗
-   Backup Restore失敗
-   Privacy Incident
-   Secret Leak
-   Unsafe AI Output
-   Backend広範囲障害
-   Store説明と実装の重大不一致

------------------------------------------------------------------------

# Release Evidence

------------------------------------------------------------------------

保存対象

-   Release Commit
-   Tag
-   Build Artifact
-   Artifact Hash
-   CI Result
-   Test Report
-   Migration Result
-   Backup Restore Result
-   Android実機Evidence
-   iOS実機Evidence
-   Accessibility Result
-   Privacy Review
-   Security Review
-   AI Safety Result
-   Store Submission Screenshot
-   Approval Record
-   Post Release Report

健康データを

Evidenceへ含めない。

------------------------------------------------------------------------

# Release Record

------------------------------------------------------------------------

保存項目


Release ID

Version

Build Number

Commit Hash

Release Date

Platform

Scope

Known Issues

Approvals

Artifacts

Store Submission ID

Rollout

Monitoring Result

Incidents

Rollback・Hotfix

Retrospective


保存先例


docs/08_Release/Releases/


------------------------------------------------------------------------

# 禁止事項

------------------------------------------------------------------------

-   Debug BuildをProductionへ提出する
-   検証後にRelease Candidateを変更する
-   Critical Defectを例外承認だけでReleaseする
-   Migration TestなしでDatabase変更を出す
-   Backup Restore未検証でReleaseする
-   SecretをClientへ含める
-   Raw Health DataをLogへ出す
-   Privacy Policy未更新でData取扱を変更する
-   AI Safety TestなしでPromptを変更する
-   AI停止手段なしでProductionへ出す
-   Store Screenshotへ実利用者データを使う
-   Release Notesへ未提供機能を書く
-   Store Privacy回答と実装を不一致にする
-   Monitoring担当不在でReleaseする
-   Rollback方針なしでReleaseする
-   Failed Testを無視する
-   pubspec.lock未CommitでReleaseする
-   Signing Keyを個人端末だけに保管する

------------------------------------------------------------------------

# テスト項目

------------------------------------------------------------------------

## Release Management

-   Versionを管理できる
-   Build Numberを管理できる
-   Scopeを固定できる
-   Commit Hashを記録できる
-   Release Ownerを明確にできる
-   Approvalを記録できる

## Quality

-   Format・Analyzeが成功する
-   Automated Testが成功する
-   Regression Testが成功する
-   Defect Gateを適用できる
-   Android・iOS実機で確認できる

## Data

-   Record値を正しく保存できる
-   Migrationできる
-   Backupできる
-   Restoreできる
-   Data Integrityを確認できる
-   失敗時にDataを保持できる

## Privacy・Security

-   Secretを含めない
-   Health DataをLogへ出さない
-   Privacy Policyと一致する
-   Store Privacy申告と一致する
-   File Importを安全に扱える
-   Backupを保護できる

## AI

-   AI同意を検証できる
-   Prompt Versionを固定できる
-   Safety・Groundingを検証できる
-   AIなしFallbackを検証できる
-   Feature Flagで停止できる
-   Backend Keyを保護できる

## Store

-   Android Store情報を準備できる
-   iOS Store情報を準備できる
-   Screenshotを準備できる
-   Privacy回答を準備できる
-   Review Notesを準備できる
-   Staged・Phased Releaseを設定できる

## Operations

-   Monitoringを準備できる
-   Alertを設定できる
-   Rolloutを停止できる
-   Hotfixを作成できる
-   Post Release Smoke Testを実施できる
-   Release Recordを保存できる

------------------------------------------------------------------------

## Acceptance Criteria

□ Release情報を管理できる

□ VersionとBuild Numberを確定できる

□ Release Scopeを固定できる

□ Release CandidateをCommit Hashで特定できる

□ Documentationを更新できる

□ Code Quality Gateを通過できる

□ Package・Licenseを確認できる

□ Production Configurationを確認できる

□ SecretをClientへ含めない

□ Automated Testを完了できる

□ Manual・Regression Testを完了できる

□ Critical・High Defectを0件にできる

□ F001の主要操作をRelease Buildで確認できる

□ Home、History、Graph、Statisticsを確認できる

□ Database Migrationを確認できる

□ Backup・Restoreを確認できる

□ NotificationをAndroid・iOS実機で確認できる

□ PDF・CSV Exportを確認できる

□ Accessibilityを確認できる

□ Localizationを確認できる

□ Performanceを確認できる

□ Securityを確認できる

□ Privacy Policyと実装を一致させられる

□ AI同意を確認できる

□ AI Prompt Versionを確認できる

□ AI Safety・Groundingを確認できる

□ AI停止時も主要機能を利用できる

□ AI Featureを緊急停止できる

□ Android Release AABを作成できる

□ Google Play申請情報を準備できる

□ iOS Release Archiveを作成できる

□ App Store申請情報を準備できる

□ Health関連表現を適切にできる

□ Go・No Goを判断できる

□ Staged・Phased Rolloutを実施できる

□ MonitoringとAlertを準備できる

□ Rollback・Hotfix手順を準備できる

□ Post Release Smoke Testを実施できる

□ Release EvidenceとRecordを保存できる

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

F204 AI Memo Assistance

------------------------------------------------------------------------

## 優先度

★★★★★（すべてのProduction Releaseで必須）

------------------------------------------------------------------------

## 関連ドキュメント

-   00_Project/Vision.md
-   00_Project/Roadmap_日本語版.md
-   01_Requirements/FeatureIndex.md
-   01_Requirements/F001_BloodPressureRecording.md
-   02_UX/UserFlow.md
-   02_UX/Navigation.md
-   03_Screens/Home.md
-   03_Screens/Input.md
-   03_Screens/History.md
-   03_Screens/Graph.md
-   03_Screens/Settings.md
-   04_DesignSystem/Components.md
-   04_DesignSystem/Animation.md
-   04_DesignSystem/Emotion.md
-   05_AI/Prompt.md
-   05_AI/AIWorkflow.md
-   06_Flutter/Architecture.md
-   06_Flutter/FolderStructure.md
-   06_Flutter/Packages.md
-   07_Test/TestPlan.md
-   07_Test/TestCases.md
-   07_Test/Regression.md
-   07_Test/UAT.md
-   08_Release/ReleaseNotes.md
-   08_Release/Rollback.md
-   09_AI_Context/AGENTS.md

------------------------------------------------------------------------

## 将来拡張

-   Automated Release Checklist
-   Fastlane
-   Codemagic
-   GitHub Actions Release
-   Store Metadata as Code
-   Automated Screenshot
-   Automated License Report
-   Automated Privacy Manifest Check
-   Automated Data Safety Diff
-   Automated App Privacy Diff
-   Automated Migration Matrix
-   Device Farm Release Test
-   Crash Free Release Gate
-   AI Safety Release Gate
-   Feature Flag Dashboard
-   Progressive Delivery
-   Automated Rollback Signal
-   Release Quality Dashboard
-   Compliance Sign Off Workflow
