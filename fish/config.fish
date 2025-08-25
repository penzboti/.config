# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_vi_key_bindings.fish
fish_vi_key_bindings --no-erase

bind --mode insert ctrl-h accept-autosuggestion
bind --mode insert ctrl-j down-or-search
bind --mode insert ctrl-k up-or-search
bind --mode insert ctrl-l execute
# bind --mode insert ctrl-h 'set fish_bind_mode default' repaint-mode

# fish_greeting
function fish_greeting
    echo Welcome, (whoami)
    echo The time is (set_color yellow)(date +%T)(set_color normal)
end
