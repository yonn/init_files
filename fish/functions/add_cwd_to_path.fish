function add_cwd_to_path
	set -U fish_user_paths (pwd) $fish_user_paths
end
