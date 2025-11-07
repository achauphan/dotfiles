# My Configs

## Tmux Plugins
Requires `$MYCONFIGS` environment variable pointing to the root of this project.

Tmux plugins are kepts as Git Submodules in `tmux-plugins`.

These get loaded by adding the following line to `.tmux.conf`:
```
run-shell ${MYCONFIGS}/tmux-plugins/<PLUGIN_NAME>.tmux
```



