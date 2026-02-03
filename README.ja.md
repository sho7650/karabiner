# Karabiner-Elements 設定ファイル

macOS用 [Karabiner-Elements](https://karabiner-elements.pqrs.org/) のカスタムキーボード設定です。

## 機能

### Emacsキーバインド (`emacs.json`)

macOSアプリケーション向けの包括的なEmacs風キーボードショートカット:

- **C-x プレフィックスコマンド**: ファイル操作、ウィンドウ管理
  - `C-x 0` — ウィンドウを閉じる
  - `C-x C-c` — アプリケーション終了
  - `C-x C-f` — ファイルを開く
  - `C-x C-s` — ファイル保存
  - `C-x u` — 取り消し

- **マークモード & 選択**: Emacs風ナビゲーションによるテキスト選択
  - `C-@` (`C-Shift-2`) — マークモードの切り替え
  - マークモード中はナビゲーションキーで選択範囲を拡張

- **カーソル移動**:
  - `C-f/b/n/p` — 前後/上下の文字・行移動
  - `C-a/e` — 行頭/行末
  - `M-f/b` — 単語単位の前後移動
  - `M-</> ` — 文書の先頭/末尾

- **テキスト編集**:
  - `C-d` — 前方削除
  - `C-h` — 後方削除
  - `C-k` — 行末まで削除
  - `C-w` — リージョン削除
  - `M-w` — リージョンコピー
  - `C-y` — ヤンク（貼り付け）

- **その他**:
  - `C-g` — キャンセル / エスケープ
  - `C-m` — Return
  - `C-z` — 取り消し
  - `C-/` — 取り消し

ターミナルアプリ（Terminal.app、iTerm2、WezTerm、Alacritty等）やEmacsネイティブサポートのあるエディタは自動的に除外されます。

### IME連携 (`ime.json`)

日本語入力メソッド（IME）向けの特別な処理:

- 日本語入力中の `C-k` でReturnを送信し、マークモードをクリア
- Emacsバインドと IME 操作の競合を防止

### アプリケーション固有ショートカット (`cursor.json`)

メディアアプリ向けのシングルキーナビゲーション:

**VLC / Kindle:**
- `[` / `/` — 上下ナビゲーション
- `;` / `'` — 左右ナビゲーション
- `]` / `p` — 次/前のチャプター（VLC）

### Commandキーリマップ (`command.json`)

英語キーボードレイアウト向けの代替マッピング:

- `⌘W` → `⌘C` （英語入力時、ウィンドウを閉じる代わりにコピー）
- `⌘⇧⌥⌃W` → `⌘W` （元のウィンドウを閉じる機能にアクセス）

### マウスボタン制御 (`disable-mouse.json`)

日本語IME入力中のマウスボタンを無効化し、文字入力中の誤クリックを防止（Keyballキーボード向け）。

## インストール

1. [Karabiner-Elements](https://karabiner-elements.pqrs.org/) をインストール

2. 設定ファイルをKarabinerのcomplex modificationsディレクトリにコピー:
   ```bash
   cp assets/complex_modifications/*.json ~/.config/karabiner/assets/complex_modifications/
   ```

3. Karabiner-Elements を開く → Complex Modifications → Add Rule

4. 必要なルールを有効化

## ファイル構成

```
assets/complex_modifications/
├── emacs.json          # Emacsキーバインド（メイン設定）
├── ime.json            # 日本語IME連携
├── cursor.json         # アプリ固有ショートカット（VLC、Kindle）
├── command.json        # Commandキー代替
└── disable-mouse.json  # Keyball向けマウス制御
```

## バージョン管理

各ルールの説明にはリビジョン番号（例: `rev 12+4` または `Rev.1`）が含まれ、設定の履歴を追跡できます。

## ライセンス

MIT
