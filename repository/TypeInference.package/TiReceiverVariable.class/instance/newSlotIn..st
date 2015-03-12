accessing
newSlotIn: anInstanceVariable
	^ slots add: (TiReceiverSlot new 
					fromInstanceVariable: anInstanceVariable
					previous: self currentSlot)
