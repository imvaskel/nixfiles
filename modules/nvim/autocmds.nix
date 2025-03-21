{ lib, ... }:
let
  inherit (lib.generators) mkLuaInline;

in
{
  vim.autocmds = [
    {
      event = [ "LspAttach" ];
      #group = "UserLspConfig";
      callback = mkLuaInline ''
        function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, nil, args.buf)
                vim.print "hi"
            end
        end
      '';
    }
  ];
}
