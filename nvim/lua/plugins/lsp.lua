return {
  "neovim/nvim-lspconfig",
  opts = {
    -- 1. サーバーの自動インストール設定
    -- LazyVimは mason-lspconfig と連携しているため、serversに書くだけで自動インストール対象になります
    servers = {
      -- 2. Python用LSP (pyright) の設定
      pyright = {
        settings = {
          python = {
            analysis = {
              -- pybricks等のローカルライブラリを認識させる設定
              extraPaths = { "./" },
              typeCheckingMode = "basic",
            },
          },
        },
      },
    },
    -- 3. その他のLSP設定をここに追加可能
    setup = {
      -- 特定のサーバーに対して独自のセットアップが必要な場合のみここに書きます
      -- pyrightについては標準で動作するため、通常は不要です
    },
  },
}
