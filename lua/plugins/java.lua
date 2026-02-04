return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Укажите полный путь к собранному вами файлу
      local bundle = vim.fn.glob(
        "/home/villainru/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", true)

      -- Добавляем этот файл в настройки JDTLS
      opts.jdtls = opts.jdtls or {}
      opts.jdtls.init_options = opts.jdtls.init_options or {}
      opts.jdtls.init_options.bundles = { bundle }

      -- Включаем интеграцию с DAP
      opts.dap = { hotcodereplace = 'auto' }
    end,
  },
}
