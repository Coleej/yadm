// Configure CodeMirror Keymap
require([
  'nbextensions/vim_binding/vim_binding'
], function() {
  // Map jk to <Esc>
  CodeMirror.Vim.map("jk", "<Esc>", "insert");
  CodeMirror.Vim.map("jk", "<Esc>", "visual");
  // Map H and L to beginning and end of line
  CodeMirror.Vim.map("H", "0", "normal");
  CodeMirror.Vim.map("L", "$", "normal");
  CodeMirror.Vim.map("H", "0", "visual");
  CodeMirror.Vim.map("L", "$", "visual");
  CodeMirror.Vim.map("K", "<C-b>", "normal");
  CodeMirror.Vim.map("K", "<C-b>", "visual");
});

// Configure Jupyter Keymap
require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Allow Ctrl-2 to change the cell mode into Markdown in Vim normal mode
    km.edit_shortcuts.add_shortcut('ctrl-2', 'vim-binding:change-cell-to-markdown', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});

// Use :q to leave vim mode and enter jupyter mode
require([
	'base/js/namespace',
	'codemirror/keymap/vim',
	'nbextensions/vim_binding/vim_binding'
], function(ns) {
	CodeMirror.Vim.defineEx("quit", "q", function(cm){
		ns.notebook.command_mode();
		ns.notebook.focus_cell();
	});
});

// Run and select next cell
Jupyter.keyboard_manager.actions.register({
    'help': 'run selected cells',
    'handler': function(env, event) {
        env.notebook.command_mode();
        var actions = Jupyter.keyboard_manager.actions;
        actions.call('jupyter-notebook:run-cell', event, env);
        actions.call('jupyter-notebook:select-next-cell', event, env);
        env.notebook.edit_mode();
    }
}, 'run-and-next', 'vim-binding');

// Run and select previous cell
Jupyter.keyboard_manager.actions.register({
    'help': 'run selected cells',
    'handler': function(env, event) {
        env.notebook.command_mode();
        var actions = Jupyter.keyboard_manager.actions;
        actions.call('jupyter-notebook:run-cell', event, env);
        actions.call('jupyter-notebook:select-previous-cell', event, env);
        env.notebook.edit_mode();
    }
}, 'run-and-previous', 'vim-binding');

// Add two keyboard shortcuts for the new actions
require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Indicate the key combination to run the commans
    km.edit_shortcuts.add_shortcut('ctrl-j', 'vim-binding:run-and-next', true);
    km.edit_shortcuts.add_shortcut('ctrl-k', 'vim-binding:run-and-previous', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});
