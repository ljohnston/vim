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

### Surfingkeys

Surfingkeys is a (awesome!) Vim extension for Chrome and Firefox. In Chrome, it
can support an external file for specifying configuration, much like a .vimrc
file. Getting this to work, however, is not entirely straighforward.

#### Chrome

    - Install Surfingkeys.
    - Permissions:
        - Per browser:
            - Vivaldi: Tools > Extentions > Surfingkeys > Details.
            - Chrome: Window > Extentions > Surfingkeys > Details.
        - Enable "Allow access to file URLs"
    - Click on the Surfingkeys icon (browser toolbar) > Settings
    - "Load settings from:": Specify the absolute path to .surfingkeysrc (~ is
      not supported).
    - Click "Save".

    IMPORTANT!!! Changes to .surfingkeysrc won't automatically get picked up
    the the browser. When making a change, do the following to ensure the
    changes get picked up:

    - Click on the Surfingkeys icon (browser toolbar) > Settings
    - Click "Save".

#### Firefox

    At this time, Firefox does not have a File API, so it cannot load
    Surfingkeys configuration from .surfingkeysrc.

    - Install Surfingkeys.
    - Click on the Surfingkeys icon (browser toolbar) > Settings
    - Copy and paste the content of .surfingkeysrc into the textfield.
    - Click "Save".

    IMPORTANT!!! Note that the settings in Firefox must be copy and pasted from
    .surfingkeysrc on every change to that file to keep them in sync.

#### Browser Key Mappings

Since the advent of the WebExtensions API standard, browser plugins can't take
total control of the browser (the way Firefox could prior to their adoption of
the WebExtensions API). As a result, there are some pages where Surfingkeys
won't work. That makes the mapping of browser-level key shortcuts rather
important. Ideally, we'd like to set the browser-level shortcuts to match the
Surfingkeys mappings, so that even if we're on a page where Surfingkeys can't
operate, we still have at least some of the same mappings available (e.g. close
the current tab, or navigate history).

Unfortunately, on OS X, neither Chrome or Firefox offer extensive key mapping
capabilities. As a result, I tend to prefer alternative browsers that _do_
support cutome key mappings (and Surfingkeys). For a while, this was Opera, but
recent releases have really hosed up Surfingkeys behavior. Vivaldi to the
rescue... it supports all kinds of custom key mappings. Refer to comments in
.surfingkeysrc for key mapping details.

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

This definitely looks doable. See here:  http://eclim.org/install.html#installer-automated

- Automate vimball installs? Not sure about that one...
