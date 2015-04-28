as yet unclassified
notifyForMethod: aMethodIdentifier withArguments: arguments

	(self interceptionBlocks at: aMethodIdentifier) value: arguments.