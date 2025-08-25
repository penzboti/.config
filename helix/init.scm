(require "mattwparas-helix-package/splash.scm")

(define (includes s list)
  (displayln s (string-join list " "))
  (if (null? list)
    #f
    (if (equal? s (car list))
      #t
      (includes s (cdr list)))))

(define (GOOD_STRING_LIST)
  (list "/home/penzboti/.cargo/bin/hx"
        "C:\\Users\\penzboti\\.cargo\\bin\\hx.exe"))

(when (includes (string-join (command-line) " ") (GOOD_STRING_LIST)) ; on windows, it is the whole path; so this doesn't work.
  (show-splash))
