search
insertConstants
	"see if one of several known expressions will do it. C is the constant we discover here. Only return (data1 + 3.5), not every selector that works (i.e. bitOr:)"
	"C  data1+C  data1*C  data1//C  (data1*C1 + C2) (data1 = C) (data1 ~= C) (data1 <= C) (data1 >= C) 
 (data1 mod C)"
	resultsList isEmpty ifFalse: [^ true]. 	"only try this with nothing else works"

	self constWithWith ifTrue: [^ true].
	self arrayCollect ifTrue: [^ true].
	self arraySelect ifTrue: [^ true].
	self instanceVariable ifTrue: [^ true].

	thisData size >= 2 ifFalse: [^ false]. 	"need 2 examples"
	self ifThen ifTrue: [^ true].

	(thisData at: 1) size = 1 ifFalse: [^ false]. 	"Want only one arg, data1"
	self constAllTheSame ifTrue: [^ true].
	self constUsingData1Value ifTrue: [^ true].
		"(data1 ?? const), where const is one of the values of data1"
		" == ~~ ~= = <= >= "
	self constAt ifTrue: [^ true].
	self constFirstPart ifTrue: [^ true].
	self constLastPart ifTrue: [^ true].

	self allNumbers ifFalse: [^ false].
	thisData do: [:list | 
		list first isInfinite ifTrue: [^ false].
		list first isNaN ifTrue: [^ false]].
	self constMod ifTrue: [^ true].
	self constPlus ifTrue: [^ true].
	self constMult ifTrue: [^ true].
	self constDiv ifTrue: [^ true].
	self constLinear ifTrue: [^ true].
	^ false