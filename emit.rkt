#lang racket
(provide Emit)
(define (Emit proc exp path)
  (with-output-to-file path
    (lambda () (proc exp))
    #:exists 'replace))