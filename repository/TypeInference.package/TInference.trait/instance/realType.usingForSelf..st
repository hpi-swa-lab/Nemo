inference
realType: expression usingForSelf: anObject 
 	^(Compiler new evaluate: expression  in: nil to: anObject ) concreteType expandTypes 