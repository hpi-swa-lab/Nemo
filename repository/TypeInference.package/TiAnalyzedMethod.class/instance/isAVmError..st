type propagation
isAVmError: rcvrType 
	| stackData |
	
       ((selector = #signal or: [ selector = #error: or: [ selector = #signal: ]]) 
       and:  ( ( rcvrType isOfClassOrSubClass:  OutOfMemory ) 
                  or: [ (rcvrType isOfClassOrSubClass: OutOfMemory class)  
			or: [ (rcvrType isOfClassOrSubClass: ZeroDivide class ) 
			or: [ (rcvrType isOfClassOrSubClass: ZeroDivide )] ] ] 
        )) ifTrue: [^true].
	
       ((selector = #errorNoFreeSpace ) 
       and:  ( ( rcvrType isOfClassOrSubClass:  HashedCollection  ) 
                  or: [ rcvrType isOfClassOrSubClass: HashedCollection  class ] 
        )) ifTrue: [^true].

		
	^false.