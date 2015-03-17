as yet unclassified
testChildEventNotBubbling

	|  ownerCalled |
	ownerCalled := false.
	childMorph on: #testEvent do: [
		false.
	].
	ownerMorph on: #testEvent do: [
		ownerCalled := true.
	].
	childMorph emit: #testEvent.
	self deny: ownerCalled.