# Contributing

We love contributions to help keep these docker-alpine images maintained and up to date. New containers with new applications are also welcomed to the party.

## Requirements

You'll need the following to develop docker-alpine images:

- [Vagrant][vagrant]
- Virtualization software, either: [VMware Workstation][vmwareworkstation], [VMware Fusion][vmwarefusion] or [Virtual Box][virtualbox]
- [Git][git]

Once you've created the virtual machine you'll have an environment complete with:

- Docker
- Docker compose
- Git
- Node.js

There are files for editors that should keep the file formatting consistent with what already exists in the repository.

## Setup

- Fork the repository.
- Clone your fork locally.
- Start the vagrant machine by running `vagrant up`.
- Once everything has been setup, gain access to the VM with `vagrant ssh`.
- Update the OS with `sudo apt-get dist-upgrade`.
- Then restart the Vagrant VM.

## Issues and pull requests

If you're thinking of making an improvement or adding a new platform, it's best to raise an issue and start a discussion. Members of the community will respond to discuss.

From the issue, PRs are always welcomed. Through the PR process, the code will be reviewed. Once every one is happy, the project maintainer (Scott Mebberson) will merge into master and publish on Docker Hub.

Please make sure the following are included in your PR:

- Documentation updates (if required).
- Updates to the CHANGELOG.md and VERSION.md as required.
- Either updates to examples, or an example to demonstrate usage.

## Contributors

You can see a list of our [current contributors][contributors].

[vagrant]: https://www.vagrantup.com/
[vmwareworkstation]: https://www.vmware.com/au/products/workstation/
[vmwarefusion]: https://www.vmware.com/au/products/fusion/
[virtualbox]: https://www.virtualbox.org/
[git]: https://git-scm.com/
[contributors]: README.md#contributors
