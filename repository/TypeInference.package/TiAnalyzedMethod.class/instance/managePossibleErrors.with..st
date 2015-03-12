type propagation
managePossibleErrors: rcvrType with: argTypes


	selector = #subclassResponsibility ifTrue:[ 
		self error: ' method: subclassResponsibility! ', rcvrType asString.
	].
	" There are many errors caused by argument check. If an error is in a conditional context ill just avoid it, cause i dont have real data. "
	
	(self isAKindOfConditionalError: rcvrType) ifTrue: [
		^self emptyResult: rcvrType with: argTypes using: 'Error on conditional context'
	].

	" There are many vm stats cheks on run time, like OutOfMemory. "
	(self isAVmError: rcvrType ) ifTrue: [
		^self emptyResult: rcvrType with: argTypes using: 'VM Common error'
	].
	
	(self imAnError: rcvrType ) ifTrue: [
		^self emptyResult: rcvrType with: argTypes using: 'Implementation error.'	
	].

	 ^nil.