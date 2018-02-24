# vim

My vim config/setup project.

## PREREQUISITES

On linux, may need additional build tools installed:

    $ sudo apt-get install build-essential

TODO: non-debian linux OS requirements?

## SETUP

To setup a new vim:

$ git clone git@github.com:ljohnston/vim.git ~/.vim
$ ~/.vim/bin/setup install

Done.

## NOTES

### cVim

NOTE: As described below, the .cvimrc file must be referenced as an absolute
path. This is a pain in the ass if used on multiple computers iwith a different
user account name (i.e. a different absolute path). One way to manage this is
by updating the absolute path for non 'lance.johnston' accounts, and then doing
the following to update from remote repository:

    $ git stash 
    $ git pull
    $ git stash pop

cVim is a Vim extension for Google Chrome. It can support an external file for
specifying configuration, much like a .vimrc file. Getting this to work,
however, is a pain in the ass. 

The .cvimrc file (or actually, whatever you want to call it) doesn't support
comment characters or else I'd have documented it there. At any rate, here's
how to get cVim working with a config file:

- Install cVim in Chrome.
- In Chrome, type :settings, which should take you to the configuration page
  for cVim, where you can add the following to the "cVimrc" section:

  let configpath = '<absolutepath>/.cvimrc'
  set localconfig

  NOTE that the above two lines should also be in the '.cvimrc' file iteslf as
  this makes managing changes to it easier. See below for more.

- Hit "Save".
- Browse to 'chrome://extensions/'.
- Click "Allow access to file URLs" for the cVim extension.
- Restart Chrome.
- Type :settings. You should see the contents of your cvimrc file there.

Note that if there is change to the .cvimrc file, it won't automatically be
reloaded by cVim. This is where putting the 'configpath' and 'localconfig' in
the .cvimrc file becomes important, as after a change we can simply do the
following to load up its new content:

:settings

Also, because of the way Chrome works, there are some pages where cVim can't
work and is disabled. That makes the mapping of browser-level keys (to do
things like close tabs for example) rather important. See the Opera section
below for more.

### Opera

Lately I've been using Opera (which is Chromium-based like Chrome) because
Vimperator no longer works in Firefox and Chrome's keyboard customization
capabilities on OS X are non-existent (which somewhat defeats the purpose of
using an extension like cVim).

In Opera, configure the following keys:

Focus page: Ctrl-Command-J
Focus address bar: Ctrl-Command-K
Close the current tab: Ctrl-D ***

*** Oddly enough, the Opera preferences page has a cVim section where we can
configure keyboard shortcuts.

### eclim

If this vim needs eclim (and what doesn't?), that has to be installed
separately. See TODOs below for more info.

### Vimballs

There don't seem to be a lot of plugins that are distributed as vimballs, but
some, including netrw which always seems to be introducing and fixing bugs. We
can install a vimball as follows:

$ vim somevimball.vba[.gz]
:so %
:q

We can automate the above via:

$ vim -c 'so %' -c 'q' somevimball.vba[.gz]

In the specific case of netrw, when we find one that works, we may want to
commit it to this project's vimballs directory, after which we can run the
following:

$ vim -c 'so %' -c 'q' vimballs/netrw.vba.gz

## TODO

- Automate eclim install. This is non-trivial but via some command-line
calls to wget to get the right eclim jar, java to execute it, etc. we
can do it. By default, eclim, runs a gui installer, that, in addition
to installing the eclim vim plugin, will make sure eclipse dependencies
are satisfied. The eclim installer can be run in an automated fashion,
but then it doesn't install the eclipse stuff. Which I think we can
simply do separately.

Seems possbile we can even automate the eclipse install, however, via 
something like the following:

  ```
  $ java -Xmx256m -XX:MaxPermSize=128m \
        -Dhttp.nonProxyHosts=local|*.local|169.254/16|*.169.254/16 \
        -jar /Applications/eclipse/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar \
        -clean -application org.eclipse.equinox.p2.director \
        -repository file:///var/folders/61/nffj87kj3tl3k6f6j58wt6dckc09k1/T/formic_73396882/update \
        -uninstallIU org.eclim.installer.feature.group
  ```

I got the above from the console after running the gui installer.
Seems it would take some serious doin', however, to figure out what to
install and what the actual arguments in something like the above
would need to be.

- Automate vimball installs? Not sure about that one...
