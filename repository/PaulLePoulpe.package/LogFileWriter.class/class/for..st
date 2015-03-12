constructor
for: aPath
	| i |
	i := self instances at:aPath ifAbsent: [
   	    i := super new.
          i path: aPath.	
	    instances at:aPath put:i.
	    i.
	].
	i open.
	^i.
	
	