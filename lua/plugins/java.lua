return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- 1. Добавляем проверку системы
      local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

      -- 2. Заворачиваем Linux-специфичный код в условие
      if not is_windows then
        local bundle = vim.fn.glob(
          "/home/villainru/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", true)

        -- Проверяем, нашлся ли файл, чтобы не передавать пустую строку
        if bundle ~= "" then
          opts.jdtls = opts.jdtls or {}
          opts.jdtls.init_options = opts.jdtls.init_options or {}
          opts.jdtls.init_options.bundles = { bundle }
        end
      end

      -- Включаем интеграцию с DAP (это безопасно)
      opts.dap = { hotcodereplace = 'auto' }
    end,
  },
}
