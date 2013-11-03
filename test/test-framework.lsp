(define *total-succeeded*  0)
(define *total-failed*     0)
(define *total-tests*      0)
(define *total-assertions* 0)
(define *test-docs*        '())

(define-macro (prepend-to lyst item)
  `(set! ,lyst (cons ,item ,lyst)))

(define-macro (make-report-pair var)
  `(cons ',var ,var))

(define (report-statistics)
  (list (make-report-pair *test-docs*)
        (make-report-pair *total-tests*)
        (make-report-pair *total-assertions*)
        (make-report-pair *total-succeeded*)
        (make-report-pair *total-failed*)))

(define-macro (incr var)
  `(set! ,var (1+ ,var)))

(define-macro (decr var)
  `(set! ,var (-1+ ,var)))

(define (testing doc . exprs)
  (prepend-to *test-docs* doc)
  (incr *total-tests*)
  exprs)

(define (expect expected actual)
  (incr *total-assertions*)
  (if (equal? expected actual)
      (begin
       (incr *total-succeeded*))
      (begin
       (incr *total-failed*))))
