remote
evaluateBlockForked: aBlock
	| remoteResult remoteTask |
	remoteTask := RemoteTask new
		task: [
			NemoRemoteSecurityManager forceSandbox.
			aBlock value ];
		yourself.
	remoteResult := [ remoteTask value ] on: MessageNotUnderstood do: [ ^ nil ].
	remoteResult isString
		ifTrue: [ (remoteResult beginsWith: 'remote task execution failed')
			ifTrue: [ Transcript cr; show: remoteResult. 
				^ nil ] ].	
	^ remoteResult.
	