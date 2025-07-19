# Flexible Commit Hooks v0.0.1
A tool for managing multiple commit hooks both locally to a repository and globally.

Client-side commit hooks can be really useful things, right?
They can be used to do things like validating commit messages, running lint checks, and so much more.
But, there are *at least* a few drawbacks to them:

1. As hooks live in the `.git/hooks` directory, they are not checked into git themselves
2. This also means there's no way to enforce that someone cloning one of your repositories uses the hooks that you want them to
3. There is also only one hook per trigger

This tool aims to make these issues a bit easier to manage.

It was purpose-built by me in order to fix my problem of wanting to have three different `commit-msg` hooks at once:
- A local personal hook for integrating with my local task management system (tracking what tickets, projects etc. I am working on)
- A global hook that can be shared with my colleagues for validating the format of commit messages
- A hook for a specific repository which is checked into the repository itself

## Requirements
- git
- ruby (I don't know exactly what versions it is compatible with)

## Installation

Note that, as this repo is still in early development, you may have to reinstall quite a few times if you install now.

### For new repositories

There are two ways to set up so that all of your future repos will use flexible commit hooks.
Both involve first cloning this repo.

#### The do-it-yourself approach
If you want to know what you are doing, then follow these steps:
1. Set up a global git template directory using `git config --global init.templatedir` followed by the name of your template directory
2. Copy the contents of this repo's `src` directory to the `hooks` directory in the template directory

#### The do-it-for-me approach
Run `./scripts/global-template-setup` from the root directory of this repository.
This will do the above steps for you, with the template directory `~/.git_template`.

### For existing repositories

Unfortunately, for the moment, there is no tool to help you update existing repositories to use Flexible Commit Hooks.
You'll have to `cp` the contents of the `src` directory across yourself:
```bash
cp /path/to/flexible-commit-hooks/src/* /path/to/existing/repo/.git/hooks/
```

## Configuration

The directories to look for hooks in defaults to the `hooks` directory in the current repository.
This behaviour can be further configured through setting the `FLEXIBLE_COMMIT_HOOKS_DIRS` environment variable.
This variable can contain multiple paths where hooks will be looked for.
When specified as relative paths (e.g `./hooks`), the path will be calculated relative to the active git repository.
Absolute paths may also be used, such as `/home/me/hooks` or `~/default_hooks`.
When any hook can be found in more than one of the hooks directories, the hooks will be executed sequentially, in the order that their paths appear in the environment variable.