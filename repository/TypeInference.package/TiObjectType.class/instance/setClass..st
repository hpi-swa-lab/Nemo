building
setClass: aClass
	exactClass := aClass.
	self isBasicType
		ifFalse: [instVarNames := self exactClass allInstVarNames.
				instVarTypes := Array new: self exactClass instSize.
				1 to: instVarTypes size 
					do: [:i | instVarTypes at: i put: nil concreteType]]

