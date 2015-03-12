cartesian product
canMakeCartesianProduct
	receiver typeSet isEmptyOrNil ifTrue: [^ false].
	arguments do: [:each | each typeSet isEmptyOrNil 
							ifTrue: [^ false]].
	^ true