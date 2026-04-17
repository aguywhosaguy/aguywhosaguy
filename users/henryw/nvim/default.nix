{ pkgs, config, inputs, ...}:

{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        lineNumberMode = "relNumber";
        lsp = {
          enable = true;
        };
        
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
          enableFormat = true;

          nix.enable = true;
          ts.enable = true;
          html.enable = true;
          css.enable = true;
          json.enable = true;
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
          smarttab = true;
        };

        ui = {
          colorful-menu-nvim.enable = true;
          noice.enable = true;
          modes-nvim.enable = true;
          nvim-ufo.enable = true;
        };

        theme = {
          enable = true;
          name = "mellow";
        };
      };
    };
  };
}
