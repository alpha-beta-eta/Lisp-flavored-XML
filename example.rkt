#lang racket
(require "xml.rkt" "css.rkt" "html.rkt" "emit.rkt")
(define styles.css
  '(("code"
     (font-family "consolas, monaco, monospace")
     (color "white")
     (background-color "black"))
    ("pre:has(>code)"
     (background-color "black"))))
(define index.html
  (Prelude
   "foo"
   "styles.css"
   (H1 "foo")
   (P "The procedure " (Code "ext-gcd") " implements the extended Euclidean algorithm.")
   (Pre-code "(define (ext-gcd a b)
  (if (= b 0)
      (values a 1 0)
      (let ((q (quotient a b))
            (r (remainder a b)))
        (let-values (((d m n) (ext-gcd b r)))
          (values d n (- m (* q n)))))))")))
(Emit Css styles.css "styles.css")
(Emit Xml index.html "index.html")