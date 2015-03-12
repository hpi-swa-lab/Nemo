*TypeInference
createType
	| type | 
	type := self concreteTypeClass new setClass: self.
	type instVarAt: #seconds putType: SmallInteger createType.
	type instVarAt: #offset putType: Duration createType.
	type instVarAt: #jdn putType: SmallInteger createType.
	type instVarAt: #nanos putType: SmallInteger createType.
	^ TiSystem current addType: (type).