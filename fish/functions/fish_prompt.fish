#function fish_prompt
#	if test $TERM = xterm-256color
#		fish_prompt_reg
#	else
#		fish_prompt_bas
#	end
#end

function fish_prompt
	fish_prompt_reg
end

function fish_prompt_bas
	set_color normal
	printf 'yonn@yonn-laptop [ '
	pwd | tr -d '\n'
	printf ' ]'
	printf '\n$ '
end

function fish_prompt_reg
	set_color green
	printf 'yonn@yonn-laptop [ '
	set_color brblue
	pwd | tr -d '\n'
	set_color green
	printf ' ]'
	set_color grey
	printf '\n$ '
end
