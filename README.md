# My Configs

## Install

Some configs have needed `git submodules` that you will need to pull with:
```shell
git submodule update --init --recursive
```
> Only `--init` if it's your first time pulling.

Directory structure of this repository is setup to support `XDG_CONFIG_HOME`. Most of the directories could be copied or symlinked to the user's `XDG_CONFIG_HOME` path.

If you want to override some of the settings from the a particular config, you should source a particular config from here and override those settings under them in your local / "main" config file.






