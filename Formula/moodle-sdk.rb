require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MoodleSdk < Formula
  homepage 'https://github.com/FMCorz/mdk/'
  url 'https://github.com/FMCorz/mdk/archive/v1.5.0.zip'
  sha1 'f1492bf7725ba01f2f9747534af16708541eaa30'
  version '1.5.0'

  def install
      dir = (libexec+'moodle-sdk')
      dir.mkpath
      dir.install 'requirements.txt'
      dir.install 'mdk.py'
      dir.install Dir['mdk']
      bin.install_symlink dir+'mdk.py' => 'mdk'
      bash_completion.install  'extra/bash_completion'
  end

  def caveats; <<-EOS.undent
    You will need to install the some pip depdencies for example, keyring. To do this run:
      $ sudo pip install keyring

    Check for missing depencies by running:
      $ mdk doctor --dependencies

    EOS
  end
end
