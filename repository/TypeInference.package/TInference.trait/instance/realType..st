inference
realType: expression
 	^(Compiler new evaluate: expression  in: nil to: nil) concreteType expandTypes 