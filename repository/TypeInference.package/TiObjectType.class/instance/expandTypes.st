private
expandTypes
	(object isNil or: expanded )ifTrue: [^ self].
	expanded := true.
	instVarNames := self exactClass allInstVarNames collect: [:each | each asSymbol].
	instVarTypes := Array new: self exactClass instSize.
	1 to: instVarTypes size 
		do: [:i | instVarTypes at: i put: (object instVarAt: i) concreteType ].
	object := nil.
^self.