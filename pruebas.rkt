(test-case
"Test 1"
(check-equal? (eval '(cons 1 (cons 2 (cons 3 '()))) env) '(1 2 3)))




(run-test test-cond-arithmetic)