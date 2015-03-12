cartesian product
refreshCartesianProductWith: aType forArgument: anInteger
	| new |

	cartesianProduct isNil ifTrue: [
			self canMakeCartesianProduct ifTrue: [
				cartesianProduct := self argumentTypesArray cartesianProduct asSet
			].
		]
		ifFalse: [
			cartesianProduct addAll: (cartesianProduct 	collect: [ :each | 
												new := each copy.
												new at: anInteger put: aType.
												new
										]
									)
		].
		
		cartesianProduct ifNotNil: [self debug:[ 'new cartesianProduct:', (cartesianProduct collect: #asString) asString ].] ifNil: [ self debug: [ ' has not cartesianProduct ']].
		
		
	