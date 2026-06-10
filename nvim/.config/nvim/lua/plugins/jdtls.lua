return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        local home = os.getenv("HOME")
        local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"
        local workspace = home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        require("jdtls").start_or_attach({
            cmd = {
                "java",
                "-jar", mason_path .. "/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
                "-configuration", mason_path .. "/config_linux",
                "-data", workspace,
            },
            root_dir = vim.fs.dirname(
                vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" }, { upward = true })[1]
            ) or vim.fn.getcwd(),
            settings = { java = {} },
        })
    end,
}
