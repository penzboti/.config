; NOTE: info
; good language docs here: https://en.wikibooks.org/wiki/Scheme_Programming
; discord with helpful people https://discord.gg/EJ2jUQ9V
; git repos: https://github.com/mattwparas/helix-config https://github.com/mattwparas/helix (follow the build instructions in helix-config)
; https://github.com/mattwparas/steel (some documentation, but mostly insufficient)


; NOTE: TERMINAL
(require "steel-pty/term.scm")
; (set-default-shell! "nu.exe") ; defaults to pwsh on windows (good)

(provide open-term
         new-term
         kill-active-terminal
         switch-term
         term-resize
         ; (contract/out set-default-terminal-cols! (->/c int? void?))
         ; (contract/out set-default-terminal-rows! (->/c int? void?))
         ; (contract/out set-default-shell! (->/c string? void?))
         open-debug-window
         close-debug-window
         hide-terminal)
;

; NOTE: file-tree (disabled: don't know how to use it, no docs)
(require "mattwparas-helix-package/cogs/file-tree.scm")
; (provide fs
;          fold-directory
;          unfold-all-one-level
;          open-file-from-picker
;          create-file
;          create-directory
;          fold-all)

(define (fs)
  (create-file-tree)
  )
;

; NOTE: mattwparas config steals
(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static "helix/static.scm"))

(provide git-status
         open-helix-scm
         open-init-scm)

;;@doc
;; runs the git status command
(define (git-status)
  (helix.run-shell-command "git" "status")
  )

;;@doc
;; opens the helix.scm file
(define (open-helix-scm)
  (helix.open (helix.static.get-helix-scm-path))
  )
;;@doc
;; opens the init.scm file
(define (open-init-scm)
  (helix.open (helix.static.get-init-scm-path))
  )
;

; NOTE: messing around from here
(require (prefix-in helix.static. "helix/static.scm"))
(require (prefix-in helix. "helix/commands.scm"))

; (provide err)

(define (err msg)
  (displayln msg)
  (error msg))
