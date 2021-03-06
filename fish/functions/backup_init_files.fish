function backup_init_files
	cp ~/.vimrc ~/init_files
	cp ~/.spacemacs ~/init_files
	cp ~/.emacs.d/init.el ~/init_files/init.el
	cp -r ~/.config/fish ~/init_files
	pushd (pwd)
	cd ~/init_files
	git add *
	git add .*
	git commit -m "Updated files..."
	git push origin master
	popd
end
