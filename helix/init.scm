;; https://github.com/npupko/awesome-helix

;; SPLASH
(require "splash-hx/splash.scm")

(when (equal? (command-line) '("hx"))
  (show-splash))

;; NOTIFY
(require "notify/notify.scm")

(notify-config 'render 'default)

;; VIM
(require "vim-hx/init.scm")

(set-vim-keybindings!)

;; SCOOTER
;; search and replace
(require "scooter/scooter.scm")
;; :scooter

;; FOREST
(require "forest/forest.scm")
(forest-snack-circular-keybinds #t)
;; :forest-open

;; FILE-WATCHER
(require "helix-file-watcher/file-watcher.scm")
;; :spawn-watcher

;; PTY
(require "steel-pty/term.scm")
;; :open-term
;; :kill-active-terminal (close)
;; :hide-term (:open-term to reopen, will be the same)
;; Shift-Tab to exit

;; HETEX
(require "hetex/hetex.scm")
;; :hetex-run
