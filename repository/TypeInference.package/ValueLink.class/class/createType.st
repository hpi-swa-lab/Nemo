*TypeInference
createType
	| type | 

	type := self concreteTypeClass new setClass: self.
	type instVarAt: #nextLink putType: super createType.
	^ TiSystem current addType: (type).