return {

  {

    "folke/snacks.nvim",

    opts = {

      dashboard = {

        sections = {

          { section = "header" },

          --{ section = "keys", gap = 1, padding = 1 },

          {

            section = "recent_files",

            title = "Recent Files",

            padding = 1,

            indent = 2,

            limit = 8,
          },

          {

            section = "projects",

            title = "Recent Projects",

            padding = 1,

            indent = 2,

            limit = 5,
          },

          { section = "startup" },
        },
      },
    },
  },
}
