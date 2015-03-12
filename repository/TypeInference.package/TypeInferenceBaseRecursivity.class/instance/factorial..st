inference
factorial: n
	| rslt |
	
	(n = 0 or: [ n = 1])not ifTrue:[
		rslt := n * (self factorial: n-1).
	] ifFalse: [
		rslt := 1.
	].
	^rslt.
	