# System Bootstrap Script for macOS

The goal of this project is to make it simple to restore your workflow from a base install of macOS.

Using this tool makes it easy to:
- Uninstall most bloatware included in macOS
- Install the Homebrew packages you need
- Install alternative shells (such as ZSH and Bash 5)
- Configure syncing your dotfiles
- Install applications
- Set user preferences

This tool uses [modules](./modules) to perform the above actions. These are all native bash scripts and rely only on
dependencies included in macOS or installed by a core module (e.g. Homebrew).

## Usage

```bash
bash -c "$(curl -sL https://raw.githubusercontent.com/lukiffer/macos-bootstrap/master/init.sh)"
```

The [`init.sh`](./init.sh) script will install macOS Command Line Tools (if they're not already installed), then clone
this repository to `~/.macos-bootstrap` and run [`bootstrap.sh`](./bootstrap.sh).

### Module Selection

By default, the bootstrap script will run through all modules in the prescribed order, providing a description of what
actions the module will perform and prompting you whether or not you want to execute the module.

After each module has run, it will drop a mutex file named `.macosbs-mutex--<module_name>` in the repository root
directory. You can `touch` a file of the same name to skip/ignore a specific module.

If you want to re-run a module, simply remove the mutex file – but be careful, not all modules are setup to gracefully
handle duplicate runs.

## Contributing

There's a lot that could be improved about this project. Pull requests are welcome, though it's likely most effective
to fork this repository and save your customizations in your own fork.
