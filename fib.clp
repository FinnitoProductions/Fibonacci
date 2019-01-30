/* 
* Finn Frankis
* January 25, 2019
*
* Includes functionality for finding a list of the first ?n Fibonacci numbers using a loop with input validation.
*
* fibo - returns a list of the first ?n Fibonacci numbers without input validation
* isWholeNumber - determines whether a given input is a whole number
* fibonacci - returns a list of the first ?n Fibonacci numbers if ?n is a whole number; FALSE if ?n is invalid
* fib - prompts the user for the value which represents the size of the desired list of the first ?n Fibonacci numbers;
* returns the list if the input is a whole number; if the input is not a whole number, requests another value
*/

(batch util/utilities.clp)

(bind ?FIRST_FIBONACCI_NUMBER 1l)
(bind ?SECOND_FIBONACCI_NUMBER 1l)

(bind ?FIBONACCI_REQUEST_MESSAGE "Enter the number of values in the Fibonacci sequence you'd like to see: ")
(bind ?INVALID_INPUT_ERROR_MESSAGE "The input must be a whole number >= 0.")

/*
* Returns a list of the first ?n Fibonacci numbers. For an acceptable output,
* ?n should be a nonnegative integer value.
*/
(deffunction fibo (?n)
    (bind ?prevNum ?FIRST_FIBONACCI_NUMBER)
    (bind ?currentNum ?SECOND_FIBONACCI_NUMBER)
    (bind ?returnVal (create$))
    
    (while (< (length$ ?returnVal) ?n)
        (bind ?returnVal (insert$ ?returnVal (+ (length$ ?returnVal) 1) ?prevNum))

        (bind ?newPrevNum ?currentNum) 
        (bind ?currentNum (+ ?prevNum ?currentNum)) 
        (bind ?prevNum ?newPrevNum)
    )

    (return ?returnVal)
)

/*
* Determines whether a given parameter is a whole number; returns TRUE if it is, and FALSE otherwise.
*/
(deffunction isWholeNumber (?n)
   (return (and (numberp ?n) (>= ?n 0) (= (integer ?n) ?n)))
)

/*
* Determines a list of the first ?n Fibonacci numbers by first validating the parameter ?n.
* ?n should be nonnegative; if not, will return FALSE.
*/
(deffunction fibonacci (?n)
    (bind ?isValid (isWholeNumber ?n))

    (if ?isValid then (bind ?returnVal (fibo ?n))
     else (bind ?returnVal FALSE)
    )

    (return ?returnVal)
)

/*
* Determines a list of the first ?n Fibonacci numbers. ?n should be nonnegative;
* if not, the user will be prompted to input another value.
*/
(deffunction fib ()
    (bind ?userInput (ask ?FIBONACCI_REQUEST_MESSAGE))
    (bind ?fibVal (fibonacci ?userInput)) ; will be FALSE if ?n is invalid, list of the first ?n Fibonacci numbers otherwise

    (if (eq ?fibVal FALSE) then (printline ?INVALID_INPUT_ERROR_MESSAGE) (bind ?returnVal (fib))
     else (bind ?returnVal ?fibVal)
    )

    (return ?returnVal)
)

(printline (fib))