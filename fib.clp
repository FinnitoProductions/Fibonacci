/* 
* Finn Frankis
* January 25, 2019
*
* Includes functionality for finding the nth Fibonacci number using a loop.
*/

(batch util/utilities.clp)

(bind ?FIRST_FIBONACCI_NUMBER 0l)
(bind ?SECOND_FIBONACCI_NUMBER 1l)

/*
* Determines the nth Fibonacci number, with ?n starting at zero. ?n must be a whole number; returns a warning string
* if invalid.
*/
(deffunction fib (?n)
    (bind ?prevNum ?FIRST_FIBONACCI_NUMBER)
    (bind ?currentNum ?SECOND_FIBONACCI_NUMBER)
    (bind ?returnVal "The fibonacci function must take in a whole number.") ; by default, return the invalid input sequence
    
    (if (isWholeNumber ?n) then
        (for (bind ?i 0) (< ?i ?n) (++ ?i)
            (bind ?newPrevNum ?currentNum) 
            (bind ?currentNum (+ ?prevNum ?currentNum)) 
            (bind ?prevNum ?newPrevNum)
        )
        (bind ?returnVal ?prevNum)
    )

    (return ?returnVal)
)

/*
* Determines whether a given parameter is a whole number; returns true if it is, and false otherwise.
*/
(deffunction isWholeNumber (?n)
   (return (and (numberp ?n) (>= ?n 0) (= (integer ?n) ?n)))
)

(printline (fib (askQuestion "What index would you like to view in the Fibonacci sequence")))