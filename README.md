Vagrant Linux sample
====================

Requirements
------------

* [vagrant](https://www.vagrantup.com/) 1.9.0
* [virtualbox](https://www.virtualbox.org/) 5.1.10
* under *windows host* :
  * a terminal with SSH client like [cygwin](https://www.cygwin.com/) or git bash from [git for windows](https://git-for-windows.github.io/)


Usage
-----

copy `config.yml.dist` to `config.yml` and edit config values if needed
then :

```bash
vagrant up --provision
```
