{ pkgs, config, inputs, ...}:

{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        lineNumberMode = "relNumber";
        lsp.enable = true;

        statusline.lualine = {
          enable = true;
          theme = "horizon";
        };

        filetree.neo-tree = {
          enable = true;
        };

        mini = {
          icons.enable = true;
          pairs.enable = true;
          starter.enable = true;
        };

        autocomplete.nvim-cmp = {
          enable = true;
        };

        treesitter = {
          enable = true;
          
          highlight.enable = true;
          indent.enable = true;
          context.enable = true;
        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
          smarttab = true;
        };
      };
    };
  };
}
