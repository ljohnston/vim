# vim

My vim config/setup project.

TODO: Move contents of this project into mac-provision?

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

#### Chrome/Vivaldi

    - Install Surfingkeys.
    - Permissions:
        - Per browser:
            - Vivaldi: Tools > Extentions > Surfingkeys > Details.
            - Chrome: Window > Extentions > Surfingkeys > Details.
        - Enable "Allow access to file URLs"
    - Click on the Surfingkeys icon (browser toolbar) > Settings
    - Click "Advanced mode".
    - "Load settings from:": Specify the absolute path to .surfingkeysrc (~ is
      not supported). For example: file:///Users/lance.johnston/.surfingkeysrc
    - Click "Save".

    IMPORTANT!!! Changes to .surfingkeysrc won't automatically get picked up
    by the browser. To ensure they are, do the following in all applicable
    browsers:

    - Click on the Surfingkeys icon (browser toolbar) > Settings
    - Click "Save".

#### Firefox

    At this time, Firefox does not have a File API, so it cannot load
    Surfingkeys configuration from .surfingkeysrc. After installing the
    Surfingkeys extension, install the configuration via the following:

    - Click on the Surfingkeys icon (browser toolbar) > Settings
    - Copy and paste the content of .surfingkeysrc into the textfield.
    - Click "Save".

    IMPORTANT!!! The above steps must be done after every change to the
    .surfingkeysrc file to keep things in sync.

#### Browser Key Mappings

Since the advent of the WebExtensions API standard, browser plugins can't take
total control of the browser (the way Firefox could prior to their adoption of
the WebExtensions API). As a result, there are some pages where Surfingkeys
won't work. That makes the mapping of browser-level key shortcuts rather
important. Ideally, we'd like to set the browser-level shortcuts to match the
Surfingkeys mappings, so that even if we're on a page where Surfingkeys can't
operate, we still have at least some of the same mappings available (e.g. close
the current tab, or fwd/bkwd history).

Unfortunately, on OS X, neither Chrome or Firefox offer extensive key mapping
capabilities. As a result, I tend to prefer alternative browsers that _do_
support custom key mappings (and Surfingkeys). Vivaldi to the rescue... it
supports all kinds of custom key mappings. Refer to comments in
vimfiles/surfingkeysrc in this repo for key mapping details.

### Vimballs

There don't seem to be a lot of plugins that are distributed as vimballs, but
there are a few, including netrw which always seems to be introducing and
fixing bugs. We can install a vimball as follows:

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
