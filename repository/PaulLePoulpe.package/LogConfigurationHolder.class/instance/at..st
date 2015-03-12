as yet unclassified
at:aConfigurationKey 
	^dict at:aConfigurationKey ifAbsent: [ self error:'there is no configuration related to ', aConfigurationKey asString].
	