/* 
* Finn Frankis
* January 25, 2019
*
* Includes functionality for finding the nth Fibonacci number using a loop.
*/

(batch util/utilities.clp)

(bind ?FIRST_FIBONACCI_NUMBER 0)
(bind ?SECOND_FIBONACCI_NUMBER 1)

/*
* Determines the nth Fibonaccci number, with n starting at zero.
*/
(deffunction fib (?n) 
    (bind ?prevNum ?FIRST_FIBONACCI_NUMBER)
    (bind ?currentNum ?SECOND_FIBONACCI_NUMBER)
    
    (for (bind ?i 0) (< ?i ?n) (++ ?i)
        (bind ?newPrevNum ?currentNum)
        (bind ?currentNum (+ ?prevNum ?currentNum)) 
        (bind ?prevNum ?newPrevNum)
    )

    (return ?prevNum)
)

(printline (fib (askQuestion "What index would you like to view in the Fibonacci sequence")))