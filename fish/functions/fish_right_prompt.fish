# mashup between
# https://github.com/nelsonjchen/omf-theme-nelsonjchen/blob/master/fish_right_prompt.fish
# https://github.com/smolijar/theme-pie/blob/master/fish_right_prompt.fish

function fish_right_prompt -d "Write out the right prompt"
	set -l last_status $status

	if test $last_status -ne 0
		set_color --bold red
		echo -ns $last_status ' :( '
		set_color normal
	end

	# tmux, screen title
	switch $TERM;
	case xterm'*' vte'*';
	printf '\033]0;['(prompt_pwd)']\007';
	case screen'*';
	printf '\033k['(prompt_pwd)']\033\\';
  end

  set -l cwd
  set -l cwd_color (set_color blue)
  set -l symbol_color (set_color blue)

  echo -n -s $cwd_color "$cwd"
  set_color --dim

  set -l S (math $CMD_DURATION/1000)
  set -l M (math $S/60)

  echo -n -s " "
  if test $M -gt 1
    echo -n -s $M m
  else if test $S -gt 1
    echo -n -s $S s
  else
    echo -n -s $CMD_DURATION ms
  end
  set_color normal
end
