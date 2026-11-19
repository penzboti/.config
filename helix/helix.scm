; good language docs here: https://en.wikibooks.org/wiki/Scheme_Programming


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

(require (prefix-in helix.static. "helix/static.scm"))

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
