initialization
installMethods
	"
	TiSystem current installMethods
	"
	| analyzedMethod arg |
	self debugSender.
	analyzedMethod := TiAnalyzedMethod new.
	analyzedMethod setClass: SmallInteger selector: #highBit.
	(self classAt: SmallInteger) methodDict at: #highBit put: analyzedMethod.
	analyzedMethod resetInvocations.
	arg := Set with: 1 concreteType.
	analyzedMethod invocations
		at: arg asArray 
		put: (TiMessageResult new
				setReceiver: arg
				arguments: #()
				return: arg).

