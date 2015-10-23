vim
===

My vim config/setup project.

To setup a new vim:

$ git clone git@github.com:ljohnston/vim.git ~/.vim
$ ~/.vim/bin/config.sh

Done.

NOTES
=====

- If this vim needs eclim (and what doesn't?), that has to be installed
separately. See TODOs below for more info.

TODO
====

- gradlew clean|build|updateBundles

  How do build and updateBundles differ?

- gradlew installFonts

  ... and wire into bin/config.sh?

  Installing fonts in os x:

  ```
  # cp <project_root>/fonts/powerline-fonts-SourceCodePro/*.otf /Library/Fonts
  ```

  Installing fonts in ubuntu:

  ```
  # cp -r <project_root>/fonts/powerline-fonts-SourceCodePro/*.otf /usr/local/share/fonts/truetype
  # fc-cache /usr/local/share/fonts/truetype/
  ```

- Automate eclim install. This is non-trivial but via some command-line
calls to wget to get the right eclim jar, java to execute it, etc. we
can do it. By default, eclim, runs a gui installer, that, in addition
to installing the eclim vim plugin, will make sure eclipse dependencies
are satisfied. The eclim installer can be run in an automated fashion,
but then it doesn't install the eclipse stuff. We can even automate
that, however, via something like the following:

  ```
  $ java -Xmx256m -XX:MaxPermSize=128m \
        -Dhttp.nonProxyHosts=local|*.local|169.254/16|*.169.254/16 \
        -jar /Applications/eclipse/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar \
        -clean -application org.eclipse.equinox.p2.director \
        -repository file:///var/folders/61/nffj87kj3tl3k6f6j58wt6dckc09k1/T/formic_73396882/update \
        -uninstallIU org.eclim.installer.feature.group
  ```

I got the above from the console after running the gui installer.
Seems it would take some serious doin' to figure out what to
install and what the actual arguments in something liek the above
would need to be.
