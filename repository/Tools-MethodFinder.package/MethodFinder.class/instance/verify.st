initialize
verify
	"Test a bunch of examples
		MethodFinder new verify 
"
| ex |
Approved ifNil: [self initialize].	"Sets of allowed selectors"
ex := (MethodFinder new load: #( (0) 0  (30) 0.5  (45) 0.707106  (90) 1)) searchAFewExpressions. 
	ex = #('data1 degreeSin') ifFalse: [self error: 'should have found it'].
ex := (MethodFinder new load:  { { true. [3]. [4]}. 3.  { false. [0]. [6]}. 6}) searchAFewExpressions.
	ex = #('data1 ifTrue: data2 ifFalse: data3') ifFalse: [
		self error: 'should have found it'].
ex := (MethodFinder new load: {#(1). true. #(2). false. #(5). true. #(10). false}) searchAFewExpressions.
	ex = #('data1 odd') ifFalse: [self error: 'should have found it'].
		"will correct the data type of #true"
ex := (MethodFinder new load: #((4 2) '2r100'   (255 16) '16rFF'    (14 8) '8r16')) searchAFewExpressions.
	ex = #('data1 storeStringBase: data2') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((4 2) '100'   (255 16) 'FF'    (14 8) '16')) searchAFewExpressions.
	ex = #('data1 printStringBase: data2' 'data1 radix: data2') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: {{Point x: 3 y: 4}. 4.  {Point x: 1 y: 5}. 5}) searchAFewExpressions.
	ex = #('data1 y') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #(('abcd') $a  ('TedK') $T)) searchAFewExpressions.
	(ex includes: 'data1 first' ) ifFalse: [self error: 'should have found it'].	

ex := (MethodFinder new load: #(('abcd' 1) $a  ('Ted ' 3) $d )) searchAFewExpressions.
	ex = #('data1 at: data2' 'data1 atPin: data2' 'data1 atWrap: data2')
		ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #(((12 4 8)) 24  ((1 3 6)) 10 )) searchAFewExpressions.
	ex = #('data1 sum') ifFalse: [self error: 'should have found it'].	
		"note extra () needed for an Array object as an argument"

ex := (MethodFinder new load: #((14 3) 11  (-10 5) -15  (4 -3) 7)) searchAFewExpressions.
	ex = #('data1 - data2') ifFalse: [self error: 'should have found it'].
ex := (MethodFinder new load: #((4) 4  (-10) 10 (-3) 3 (2) 2 (-6) 6 (612) 612)) searchAFewExpressions.
	ex = #('data1 abs') ifFalse: [self error: 'should have found it'].
ex := (MethodFinder new load: {#(4 3). true.  #(-7 3). false.  #(5 1). true.  #(5 5). false}) searchAFewExpressions.
	ex = #('data1 > data2') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((5) 0.2   (2) 0.5)) searchAFewExpressions.
	ex = #('data1 reciprocal') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((12 4 8) 2  (1 3 6) 2  (5 2 16) 8)) searchAFewExpressions.
	ex = #()     " '(data3 / data2) ' want to be able to leave out args"  
		ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((0.0) 0.0  (1.5) 0.997495  (0.75) 0.681639)) searchAFewExpressions.
	ex = #('data1 sin') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((7 5) 2   (4 5) 4   (-9 4) 3)) searchAFewExpressions.
	ex = #('data1 \\ data2') ifFalse: [self error: 'should have found it'].	

ex := (MethodFinder new load: #((7) 2   (4) 2 )) searchAFewExpressions.
	ex = #('^ 2')  ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: {#(7). true.   #(4.1).  true.   #(1.5). false}) searchAFewExpressions.
	ex = #('data1 >= 4.1') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((35) 3   (17) 1   (5) 5)) searchAFewExpressions.
	ex = #('data1 \\ 8') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((36) 7   (50) 10 )) searchAFewExpressions.
	ex = #('data1 // 5' 'data1 quo: 5') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #( ((2 3) 2) 8   ((2 3) 5) 17 )) searchAFewExpressions.
	ex = #('data1 polynomialEval: data2') ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #((2) 8   (5) 17 )) searchAFewExpressions.
	ex = #('#(2 3) polynomialEval: data1') ifFalse: [self error: 'should have found it'].	

ex := (MethodFinder methodFor: #( (4 3) 8  (0 5) 6  (5 5) 11)).
	ex = '((data1 + data2) + 1) ' ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder methodFor: #( (4 3) 14  (0 5) 10  (5 5) 20)).
	ex = '((data1 + data2) * 2) ' ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder methodFor: #( ('12' '34') 4  ('123' '456') 6  ('1' '2345') 5)).
	ex = '((data1 , data2) size) ((data1 union: data2) size) ' ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder new load: #( (9 ) 1  (57) 2  (310) 3)) findResults.
	(ex includes: #(printString  '(data1 printString) size' (9))) ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder methodFor: { #((5 (size) 'stuff' #size ('d')) ).  #((size)  ('d')) }).
	ex =  '(data1 select: [ :ele | ele isArray ]) ' ifFalse: [self error: 'should have found it'].	
ex := (MethodFinder methodFor: { #((1 2 3)). #('one' 'two' 'three') }).
	ex =  '(data1 collect: [ :ele | ele threeDigitName ]) ' ifFalse: [self error: 'should have found it'].
ex := (MethodFinder methodFor: {{ true. 3. 4}. 3.  { false. 0. 6}. 6}).
	ex =   '(data1 ifTrue: [data2] ifFalse: [data3]) ' ifFalse: [self error: 'should have found it'].
