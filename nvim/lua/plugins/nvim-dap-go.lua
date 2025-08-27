return {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        build_flags = "",
        detached = false,
      },
      dap_configurations = {
        {
          type = "go",
          name = "Debug API (cmd/api)",
          request = "launch",
          program = "${workspaceFolder}/cmd/api",
          args = { "--port", "8080" },
          cwd = "${workspaceFolder}",
        },
        {
          type = "go",
          name = "Debug API (ask program+args)",
          request = "launch",
          program = function()
            local cwd = vim.fn.getcwd()
            local candidates = {
              cwd .. "/cmd/api",
              cwd .. "/cmd/server",
              cwd .. "/cmd/app",
              cwd .. "/main.go",
            }
            for _, p in ipairs(candidates) do
              if vim.fn.isdirectory(p) == 1 and vim.fn.filereadable(p .. "/main.go") == 1 then
                return p
              end
              if vim.fn.filereadable(p) == 1 then
                return p
              end
            end
            return vim.fn.input("Entry (dir or file): ", cwd .. "/", "file")
          end,
          args = function()
            local input = vim.fn.input("Program args: ")
            local args, cur, q = {}, "", nil
            for c in (input or ""):gmatch(".") do
              if c == "'" or c == '"' then
                if q == c then
                  q = nil
                elseif not q then
                  q = c
                else
                  cur = cur .. c
                end
              elseif c == " " and not q then
                if #cur > 0 then
                  table.insert(args, cur)
                  cur = ""
                end
              else
                cur = cur .. c
              end
            end
            if #cur > 0 then
              table.insert(args, cur)
            end
            return args
          end,
          cwd = function()
            local cwd = vim.fn.getcwd()
            local picked = vim.fn.input("CWD (empty = workspace): ", cwd)
            return picked == "" and cwd or picked
          end,
          env = function()
            local line = vim.fn.input("Env (KEY=VAL ...): ")
            if not line or line:match("^%s*$") then
              return nil
            end
            local env = {}
            for token in line:gmatch("%S+") do
              local k, v = token:match("^([^=]+)=(.*)$")
              if k and v then
                env[k] = v
              end
            end
            return env
          end,
        },
      },
      tests = { flags = { "-v" } },
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      vim.keymap.set("n", "<leader>dgt", function()
        require("dap-go").debug_test()
      end, { desc = "DAP-Go: Debug Test" })
      vim.keymap.set("n", "<leader>dgl", function()
        require("dap-go").debug_last()
      end, { desc = "DAP-Go: Debug Last" })
      vim.keymap.set("n", "<leader>dga", function()
        require("dap").run({
          type = "go",
          name = "Debug API (ask program+args)",
          request = "launch",
          program = opts.dap_configurations[2].program,
          args = opts.dap_configurations[2].args,
          cwd = opts.dap_configurations[2].cwd,
          env = opts.dap_configurations[2].env,
        })
      end, { desc = "DAP-Go: Launch (ask)" })
    end,
  },
}
