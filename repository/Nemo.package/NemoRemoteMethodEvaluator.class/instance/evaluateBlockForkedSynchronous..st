remote
evaluateBlockForkedSynchronous: aBlock
	| remoteResult sandboxedTask |
	sandboxedTask :=  [
		NemoRemoteSecurityManager forceSandbox.
		aBlock value ].
	remoteResult := RemoteTask do: sandboxedTask.
	^ (self processFailureResult: remoteResult)
		ifTrue: [ nil ]
		ifFalse: [ remoteResult ]