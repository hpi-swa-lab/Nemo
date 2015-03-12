as yet unclassified
forClass: aClass
    | rslt  default | 

	default := [ self at:#default ].

	rslt := self at: aClass ifNotConfigured: [
		self loadPragmaConfigurationFrom: aClass ifNotConfiguration:[
			self at: aClass package ifNotConfigured: [
				Smalltalk at: ('ConfigurationOf',aClass  package packageName) asSymbol ifPresent: [
					: configurationOf | 
					self loadPragmaConfigurationFrom: configurationOf ifNotConfiguration: default.
				] ifAbsent: default.
			]
		]
	].
	^rslt.