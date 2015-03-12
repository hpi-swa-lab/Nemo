variables
nodeSelfWith: aContextBuilder 
	self assertContext: aContextBuilder.
	^ aContextBuilder storeVariable: #self definedBy:[
			TiReceiverVariable new
		].