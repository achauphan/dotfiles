# tmux configuration

- `tmux` verions `>=3.1` supports a configuration files located in `~/.config/tmux/tmux.conf`
- `tmux` versions `>=3.2` supports configuration files located in `$XDG_CONFIG_HOME/tmux/tmux.conf`
- `tmux` versions `<3.1` only support configuration files located at `~/.tmux.conf`

## Requirements
- `$MYCONFIGS` environment variable pointing to the root of this project.

## Intended Structure
Dependent upon the version of tmux running, the default `tmux.conf` file should source the main `tmux.conf` in this directory.
This will allow there to be system specific configuration to live in the default `tmux.conf`

## tmux Plugins

tmux plugins are kepts as Git Submodules in `tmux-plugins`.

These get loaded by adding the following line to `.tmux.conf`:
```
run-shell ${MYCONFIGS}/tmux/tmux-plugins/<PLUGIN_NAME>.tmux
```
