(define (vector-incr! vec slot)
  (vector-set! vec slot (1+ (vector-ref vec slot))))

(define (vector-decr! vec slot)
  (vector-set! vec slot (-1+ (vector-ref vec slot))))

(define a (vector 1 2 3))
(vector-set! a 1 4)

(testing "modifying a slot in a vector." (expect a (vector 1 4 3)))
