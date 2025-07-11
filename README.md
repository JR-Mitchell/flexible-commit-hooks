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

For now, as this repo is empty, there are no installation instructions.
I will update this section when there are!