as yet unclassified
resolveRealPrimitiveFor: aCompiledMethod into: analyzedMethod
      | pragmas |

	pragmas := aCompiledMethod penultimateLiteral pragmas.
	
	pragmas do: [
		:pragma | 
		pragma keyword = #primitive:module: ifTrue:[
			| primitive module |
			primitive := pragma arguments at:1.
			module := pragma arguments at:2.
			analyzedMethod primitive: (self named: primitive at: module ).
		].
	]