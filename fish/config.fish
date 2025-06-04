# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_vi_key_bindings.fish
fish_vi_key_bindings --no-erase

bind j 'backward-char'
bind k 'down-or-search'
bind l 'up-or-search'
bind é 'forward-char'

bind --mode insert ctrl-j accept-autosuggestion
bind --mode insert ctrl-k 'down-or-search'
bind --mode insert ctrl-l 'up-or-search'
bind --mode insert ctrl-é execute
# bind --mode insert ctrl-h 'set fish_bind_mode default' repaint-mode

bind --mode visual j 'backward-char'
bind --mode visual k 'down-or-search'
bind --mode visual l 'up-or-search'
bind --mode visual é 'forward-char'

# fish_greeting
function fish_greeting
  echo Welcome, (whoami)
  echo The time is (set_color yellow)(date +%T)(set_color normal)
end
