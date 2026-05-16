---
description: Bump the package version, update CHANGELOG.md with a PR link and brief summary, commit both files, and push. Use when the user asks to update, bump, or change the version number.
disable-model-invocation: true
argument-hint: <new-version>
allowed-tools: Bash(git *) Edit Write Read
---

バージョンを $ARGUMENTS にバンプする。以下を**すべて確認なしで**実行する。

1. **`pubspec.yaml`** の `version:` フィールドを $ARGUMENTS に更新する
2. **`CHANGELOG.md`** の先頭に新バージョンのセクションを追記する
   - 形式: `## $ARGUMENTS` の見出しに続いて箇条書き
   - 各行末に対応する PR へのリンクを付ける（例: `([#1](https://github.com/noboru-i/kyouen_dart/pull/1))`）
   - PR 番号は GitHub MCP ツール（list_pull_requests）で確認する
   - 内容は詳細説明でなく **概要のみ**（1〜2行程度）にまとめる
3. 両ファイルをまとめて git commit する（メッセージ: `Bump version to $ARGUMENTS`）
4. 現在のブランチに git push する
