require("neo-tree").setup({
    window = {
        mappings = {
          ["l"] = {
            "open"
          },
          ["h"] = function(state)
            local node = state.tree:get_node()
              if node.type == 'directory' and node:is_expanded() then
                require'neo-tree.sources.filesystem'.toggle_directory(state, node)
              else
                require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
              end
            end,
        }
    }
})
