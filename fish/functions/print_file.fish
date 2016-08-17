function print_file
	set i 1
	for l in (cat $argv[1])
		printf "%3s|%s\n" $i $l
		set i (math "$i + 1")
	end
end
