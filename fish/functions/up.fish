function up
  perl6 ~/.config/fish/functions/up.p6
  cd (cat ~/.config/fish/functions/.up.dir)
end
