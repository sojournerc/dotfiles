# dotfiles
- Install zshell, oh-my-zh
- Install nvm
`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash`


- Install Sublime3
license is encrypted with OpenSSL
decrypt with -> `openssl des3 -d -in sublime-license.encr -out sublime-license.txt`

// install package manager
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)


- Sublime Text snippets and themes
(standing in this repo)
`tar -xf User.zip; cp -rf User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages`
- Sublime Text plugins
  - gitgutter
  - sublime linter
  - babel (jsx)
  - trailing spaces
  - Sidebar enhancements

- setup ssh keys
  - openshift
  - github
  -

- Install postgreSQL
- Install f.lux (redshift)
`reshift -h`

Increase key repeat


//Link dot files
`ln -s ./.zshrc ~/`
`ln -s ./.profile ~/`

// Oh my zshell
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

// relink to customized .zshrc
`mv .zshrc.pre-oh-my-zsh .zshrc`
