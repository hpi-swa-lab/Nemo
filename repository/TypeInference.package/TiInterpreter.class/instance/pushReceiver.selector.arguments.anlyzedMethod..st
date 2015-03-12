accessing stack
pushReceiver: rcvrType selector: aSelector arguments: argTypes anlyzedMethod: anlyzedMethod
	| sender senderSelector senderArguments |

	sender := receiverStack lastOrNil.
	senderSelector := selectorStack lastOrNil.
	senderArguments  := argumentsStack lastOrNil.
	
	receiverStack addLast: rcvrType.
	selectorStack addLast: aSelector.
	argumentsStack addLast: argTypes.
	analyzedMethodStack addLast: anlyzedMethod.
	self announce: (StackPushed receptor: rcvrType selector: aSelector  arguments:  argTypes method: anlyzedMethod sender: sender  senderSelector: senderSelector senderArguments: senderArguments).
	