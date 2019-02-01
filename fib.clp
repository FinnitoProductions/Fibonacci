/* 
* Finn Frankis
* January 25, 2019
*
* Finds a list of the first ?n Fibonacci numbers using a loop with input validation.
*
* fibo - returns a list of the first ?n Fibonacci numbers without input validation
* isWholeNumber - determines whether a given input is a whole number
* fibonacci - returns a list of the first ?n Fibonacci numbers if ?n is a whole number; FALSE if ?n is invalid
* fib - prompts the user for the value which represents the size of the desired list of the first ?n Fibonacci numbers;
* returns the list if the input is a whole number; if the input is not a whole number, requests another value
* requestFib - requests the user for the desired number of Fibonacci numbers
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
    
    (for (bind ?i 0) (< ?i ?n) (++ ?i)
        (bind ?returnVal (insert$ ?returnVal (+ (length$ ?returnVal) 1) ?prevNum))

        (bind ?newPrevNum ?currentNum) 
        (bind ?currentNum (+ ?prevNum ?currentNum)) 
        (bind ?prevNum ?newPrevNum)
    )

    (return ?returnVal)
) ; fibo (?n)

/*
* Determines whether a given parameter is a whole number; returns TRUE if it is, and FALSE otherwise.
*/
(deffunction isWholeNumber (?n)
   (return (and (numberp ?n) (>= ?n 0) (= (integer ?n) ?n)))
) ; isWholeNumber (?n) 

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
) ; fibonacci (?n)

/*
* Helper method which asks the user for the number ?n which will be used to generate the list of the first ?n Fibonacci numbers.
* Returns FALSE if ?n is invalid and the list of the first ?n Fibonacci numbers otherwise.
*/
(deffunction requestFib ()
    (bind ?userInput (ask ?FIBONACCI_REQUEST_MESSAGE))
    (return (fibonacci ?userInput))
) ; requestFib ()

/*
* Determines a list of the first ?n Fibonacci numbers. ?n should be nonnegative;
* if not, the user will be prompted to input another value.
*/
(deffunction fib ()
    (bind ?fibVal (requestFib))

    (while (eq ?fibVal FALSE) 
        (printline ?INVALID_INPUT_ERROR_MESSAGE) 
        (bind ?fibVal (requestFib))
    )

    (return ?fibVal)
) ; fib ()

(printline (fib))