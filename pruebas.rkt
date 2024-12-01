#lang racket

(require rackunit "interpretador.rkt")

(define test-cond-list
  (test-suite "Test de cond"
    (test-case
      "Test restas"
      (check-equal? (evaluar-programa 
                      (scan&parse "cond
                                    -(1,2) ==> 1
                                    -(2,1) ==> 2
                                    -(3,3) ==> 3
                                    else ==> 4
                                    end"))
                    1))
    (test-case
      "Test sumas"
      (check-equal? (evaluar-programa 
                      (scan&parse "cond
                                    +(1,2) ==> 1
                                    +(2,1) ==> 2
                                    +(3,3) ==> 3
                                    else ==> 4
                                    end"))
                    1))   
    (test-case
      "Test division"
      (check-equal? (evaluar-programa 
                      (scan&parse "cond
                                    /(1,1) ==> 7
                                    /(2,1) ==> 2
                                    /(3,3) ==> 3
                                    else ==> 4
                                    end"))
                    7))
     (test-case
      "Test multiplicacion"
      (check-equal? (evaluar-programa 
                      (scan&parse "cond
                                    *(0,1) ==> 7
                                    *(2,0) ==> 2
                                    *(3,3) ==> 3
                                    else ==> 4
                                    end"))
                    3))    

    (test-case
      "Test else"
      (check-equal? (evaluar-programa 
                      (scan&parse "cond
                                    +(1, -2) ==> 1
                                    +(-2 , 1) ==> 2
                                    +(3,-3) ==> 3
                                    else ==> 4
                                    end"))
                    4))                                
    ))
  (test-suite "Test de listas"
    (test-case
      "Test vacio"
      (check-equal? (evaluar-programa 
                      (scan&parse "empty"))
                    '()))     
    (test-case
      "Test first"
      (check-equal? (evaluar-programa 
                      (scan&parse "first(cons(1 cons (2 empty))"))
                    1))
    (test-case
      "Test largo"
      (check-equal? (evaluar-programa 
                      (scan&parse "length(cons(9 cons(8 cons (3 empty))))"))
                    3))    
    (test-case
      "Test let"
      (check-equal? (evaluar-programa 
                      (scan&parse "cons(let x=6 in x cons(9 empty))"))
                    '(7 9)))

    (test-case
      "Test nth"
      (check-equal? (evaluar-programa 
                      (scan&parse "nth(cons(8 cons(9 cons (10 empty))),2)"))
                    10))    
    

(run-test test-cond-list)