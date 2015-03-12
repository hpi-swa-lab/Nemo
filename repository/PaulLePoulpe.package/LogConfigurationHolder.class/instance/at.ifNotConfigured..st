as yet unclassified
at:aConfigurationKey ifNotConfigured:aBlock
	^dict at:aConfigurationKey ifAbsent:aBlock.
	