initialize
greatExamples
	"What the MethodFInder can do.  Besides the 850 approved selectors, the MethodFinder can discover some special constructs."

"What it discovers, and an executable example that discovers that.
data1 odd
		(MethodFinder new load: {#(1). true. #(2). false. #(5). true. #(10). false}) searchAFewExpressions.
data1 y
		(MethodFinder new load: {{Point x: 3 y: 4}. 4.  {Point x: 1 y: 5}. 5}) searchAFewExpressions.
data1 first
		(MethodFinder new load: #( ('abcd') $a  ('TedK') $T )) searchAFewExpressions.
data1 at: data2
		MethodFinder new load: #(('abcd' 1) $a  ('Ted ' 3) $d )) searchAFewExpressions.
data1 sum
		(MethodFinder new load: #(((12 4 8)) 24  ((1 3 6)) 10 )) searchAFewExpressions.
data1 degreeSin
		 (MethodFinder new load: #( (0) 0  (30) 0.5  (45) 0.707106  (90) 1)) searchAFewExpressions. 
data1 ifTrue: data2 ifFalse: data3
		(MethodFinder new load:  { { true. [3]. [4]}. 3.  { false. [0]. [6]}. 6}) searchAFewExpressions.
data1 storeStringBase: data2
		(MethodFinder new load: #((4 2) '2r100'   (255 16) '16rFF'    (14 8) '8r16')) searchAFewExpressions.
data1 radix: data2
		(MethodFinder new load: #((4 2) '100'   (255 16) 'FF'    (14 8) '16' )) searchAFewExpressions.
data1 - data2
		(MethodFinder new load: #((14 3) 11  (-10 5) -15  (4 -3) 7)) searchAFewExpressions.
data2 < data1
		(MethodFinder methodFor: {#(4 3). true.  #(-7 3). false.  #(5 1). true.  #(5 5). false}). 
data1 reciprocal
		(MethodFinder new load: #((5) 0.2   (2) 0.5)) searchAFewExpressions.

Harder Examples
^ 2
		(MethodFinder new load: #((7) 2   (4) 2 )) searchAFewExpressions.
data1 >= 4.1
		(MethodFinder new load: {#(7). true.   #(4.1).  true.   #(1.5). false}) searchAFewExpressions.
		Note that it chose 4.1 as an extra argument.
data1 \\ 8
		(MethodFinder new load: #((35) 3   (17) 1   (5) 5)) searchAFewExpressions.
		Note that it discovered the value 8.
data1 // 5
		(MethodFinder new load: #((36) 7   (50) 10 )) searchAFewExpressions.
data1 polynomialEval: data2
		(MethodFinder new load: #( ((2 3) 2) 8   ((2 3) 5) 17 )) searchAFewExpressions.
		Discover that data1 is an array of coefficients of a poynomial that is being evaluated.
#(2 3) polynomialEval: data1
		(MethodFinder new load: #((2) 8   (5) 17 )) searchAFewExpressions.
		Discover a linear relationship.
(data1 + data2) + 1
		(MethodFinder methodFor: #( (4 3) 8  (0 5) 6  (5 5) 11)).
		Discover a needed constant
(data1 + data2) * 2
	(MethodFinder methodFor: #( (4 3) 14  (0 5) 10  (5 5) 20)).
(data1 , data2) size
		(MethodFinder methodFor: #( ('12' '34') 4  ('123' '456') 6  ('1' '2345') 5)).
		Discover both concatination and a unary method on the result.
(data1 printString) size
		(MethodFinder new load: #( (9 ) 1  (57) 2  (310) 3)) findResults.
data1 collect: [ :ele | ele threeDigitName ] 
		(MethodFinder methodFor: { #((1 2 3)). #('one' 'two' 'three') }).
		Write a block for collect:
data1 select: [ :ele | ele isArray ] 
		(MethodFinder methodFor: { #((5 (size) 'stuff' #size ('d')) ).  #((size)  ('d')) }).
data1 ifTrue: [data2] ifFalse: [data3] 
		(MethodFinder methodFor: {{ true. 3. 4}. 3.  { false. 0. 6}. 6}).
		Conditional without supplying blocks.
Array with: data1 with: data2 with: data3
		MethodFinder methodFor: #( (1 3 4)  (1 3 4)  )  
		Supply the class to construct an instance
data1 instVarNamed: #floatPrecision
		MethodFinder methodFor: { {SlotInformation new}.  0.1  } 
		Tell you about an instance variable, whose getter is not in the Approved selectors list.
"