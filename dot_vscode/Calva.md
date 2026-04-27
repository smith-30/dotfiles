# VSCode + Calva あなた専用ショートカット完全版（Mac）

---

# 記号の読み方

| 記号 | キー |
|---|---|
| `⌃` | Control |
| `⌥` | Option |
| `⇧` | Shift |
| `⌘` | Command |
| `↩` | Enter |

---

# ① 評価系（最重要）

| 操作 | キー |
|---|---|
| 現在の式を評価 | `⌥ ↩` |
| 現在の囲み式を評価 | `⌃ ⇧ ↩` |
| Top Level Form を評価 | `⌥ Space` |
| ファイル全体を Load / Evaluate | `⌃ ⌥ C ↩` |
| Start of List → Cursor 評価 | `⌃ ⌥ ↩` |
| Start of File → Cursor 評価 | `⌃ ⇧ ⌥ ↩` |
| 結果で置換 | `⌃ ⌥ C R` |

---

# ② テスト系（超重要）

| 操作 | キー |
|---|---|
| Current Test 実行 | `⌃ ⌥ C ⌥ T` |
| Current Namespace テスト | `⌃ ⌥ C T` |
| All Tests | `⌃ ⌥ C ⇧ T` |
| Failing Tests 再実行 | `⌃ ⌥ C ⌃ T` |

---

# ③ REPL 系

| 操作 | キー |
|---|---|
| Start Project REPL | `⌃ ⌥ C ⌃ J` |
| Connect Running REPL | `⌃ ⌥ C ⌃ C` |
| REPL Menu | `⌃ ⌥ C ⌃ R` |
| REPL Window | `⌃ ⌥ O R` |
| REPL Output View | `⌃ ⌥ O V` |
| Output Terminal | `⌃ ⌥ O T` |

---

# ④ 選択系（神）

| 操作 | キー |
|---|---|
| Expand Selection | `⌃ W` |
| Shrink Selection | `⌃ ⇧ W` |
| Current Form 選択 | `⌃ ⌥ C ⇧ S` |
| Current Top Level 選択 | `⌃ ⌥ W Space` |

---

# ⑤ 構造編集（Paredit）

## Slurp / Barf

| 操作 | キー |
|---|---|
| Slurp Forward | `⌃ ⌥ →` |
| Slurp Backward | `⌃ ⇧ ⌥ ←` |
| Barf Forward | `⌃ ⌥ ←` |
| Barf Backward | `⌃ ⇧ ⌥ →` |

---

## Raise / Splice / Split

| 操作 | キー |
|---|---|
| Raise Sexpr | `⌃ ⌥ P ⌃ ⌥ R` |
| Splice Sexpr | `⌃ ⌥ S` |
| Split Sexpr | `⌃ ⇧ S` |
| Join Sexpr | `⌃ ⇧ J` |

---

## Wrap Around

| 操作 | キー |
|---|---|
| Wrap `()` | `⌃ ⇧ ⌥ P` |
| Wrap `[]` | `⌃ ⇧ ⌥ S` |
| Wrap `{}` | `⌃ ⇧ ⌥ C` |
| Wrap `""` | `⌃ ⇧ ⌥ Q` |
| Wrap `#{}` | `⌃ ⇧ ⌥ E` |

---

# ⑥ 移動（式単位）

| 操作 | キー |
|---|---|
| 次の式へ | `⌃ →` |
| 前の式へ | `⌃ ←` |
| 子へ | `⌃ ↓` |
| 親へ | `⌃ ↑` |
| 行頭の括弧へ | `⌃ Home` |
| 行末の括弧へ | `⌃ End` |

---

# ⑦ 並び替え（超便利）

| 操作 | キー |
|---|---|
| Drag Forward | `⌃ ⇧ ⌥ F` |
| Drag Backward | `⌃ ⇧ ⌥ B` |
| Drag Up | `⌃ ⇧ ⌥ U` |
| Drag Down | `⌃ ⇧ ⌥ D` |

---

# ⑧ 削除系

| 操作 | キー |
|---|---|
| 構造維持 Backspace | `Backspace` |
| 構造維持 Delete | `Del` |
| Force Delete Backspace | `⌥ Backspace` |
| Force Delete Delete | `⌥ Del` |
| 左側まとめ削除 | `⌘ Backspace` |

---

# ⑨ 毎日使う神ショートカット TOP10

```text
⌥ ↩                現在式評価
⌥ Space            Top Level評価
⌃ W                Expand Selection
⌃ ⇧ W              Shrink Selection
⌃ ⌥ →              Slurp Forward
⌃ ⌥ ←              Barf Forward
⌃ ⌥ S              Splice
⌃ → / ←            式移動
⌃ ⌥ C T            Namespace Test
⌃ ⌥ C ⌥ T          Current Test