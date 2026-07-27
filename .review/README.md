# AI Review Workspace

このフォルダは ChatGPT / Codex のレビュー専用ワークスペースです。

## 差分作成

cmd /c "git --no-pager diff > .review\current.diff"

## レビュー

1. current.diff を ChatGPT に添付
2. レビューを受ける
3. 修正
4. current.diff を削除
5. git commit
