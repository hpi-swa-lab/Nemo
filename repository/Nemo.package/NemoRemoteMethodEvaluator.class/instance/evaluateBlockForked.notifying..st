remote
evaluateBlockForked: aBlock notifying: anEditor
	| remoteResult remoteTask |
	remoteTask := RemoteTask new
		task: aBlock;
		yourself.
	remoteResult := [ remoteTask value ] on: MessageNotUnderstood do: [ ^ nil ].
	remoteResult isString
		ifTrue: [ (remoteResult beginsWith: 'remote task execution failed')
			ifTrue: [ Transcript cr; show: remoteResult. 
				^ nil ] ].	
	^ remoteResult.
	