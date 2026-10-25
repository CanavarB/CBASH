#!/usr/bin/env bash

#=============CONF===================

CLANG_FORMAT_CONTENT="BasedOnStyle: LLVM
IndentWidth: 4
ColumnLimit: 120
PointerAlignment: Left
AllowShortIfStatementsOnASingleLine: Always
AllowShortBlocksOnASingleLine: Always
AllowShortEnumsOnASingleLine: false
BreakBeforeBraces: Stroustrups"

GIT_IGNORE_CONTENT=".directory
.vscode/
build/
test/
*.o
*.out"

#=============CONF===================

alias get_clang_format_file='printf "%s" "$CLANG_FORMAT_CONTENT" > .clang-format'
alias get_git_ignore_file='printf "%s" "$GIT_IGNORE_CONTENT" > .gitignore'