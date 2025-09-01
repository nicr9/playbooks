lua << EOF
  require("codecompanion").setup({
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "https://ollama.bespin.co",
            api_key = "OLLAMA_API_KEY",
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          parameters = {
            sync = true,
          },
        })
      end,
    },

    log_level = "DEBUG",

    strategies = {
        chat = {
            adapter = "ollama",
            keymaps = {
              send = {
                modes = { n = "<C-s>", i = "<C-s>" },
                opts = {},
              },
              close = {
                modes = { n = "<C-c>", i = "<C-c>" },
                opts = {},
              },
              -- Add further custom keymaps here
            },
        },
        inline = {
            adapter = "ollama",
        },
    },
  })
EOF
