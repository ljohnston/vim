vim
===

My vim config/setup project.

To setup a new vim:

$ git clone git@github.com:ljohnston/vim.git ~/.vim
$ ~/.vim/bin/config.sh

Done.

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
