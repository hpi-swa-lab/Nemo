type propagation
imAnError: rcvrType 
	
       ((selector = #signal or: [ selector = #error: or: [ selector = #signal: ]]) and:  ( ( rcvrType isOfClassOrSubClass:  Exception  ))) ifTrue: [ 
		^true
       ].
	(selector = #error: and: (rcvrType isOfClassOrSubClass: Object)) ifTrue:[
			^true.
	].
		
	^false.