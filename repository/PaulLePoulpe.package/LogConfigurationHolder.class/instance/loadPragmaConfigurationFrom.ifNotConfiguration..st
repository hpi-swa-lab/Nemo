as yet unclassified
loadPragmaConfigurationFrom: aClass ifNotConfiguration: aBlock
	| register  rslt |


   aClass = ProtoObject ifTrue: [ ^aBlock value ].
" Pragma load configuration rules. "
	register := {
		#logConfiguration -> [  :method :arguments | 
				 (method numArgs = 1) ifTrue:[ 
					aClass perform: (method selector) with: LogConfiguration 
				  ]  ifFalse: [ 
					LogConfiguration for: (aClass perform: method selector) 
				  ] 
		].
		#logConfigurationAsClass: -> [ :method :arguments |   
			self at: aClass package ifNotConfigured: [	
				self loadPragmaConfigurationFrom: (Smalltalk at: (arguments at:1)) ifNotConfiguration: [ 
						self error: ' Error loading log configuration: There is not configuration defined on ',  (arguments at:1) asString .
				].
			]
				
		] 
		
		.
		
		#logConfigurationAs: -> [ :method :arguments |   
			| configuration | 
			(arguments at:1) = #metacelloConfiguration ifTrue: [
				
				
				self at: aClass package ifNotConfigured: [
						Smalltalk at: ('ConfigurationOf',aClass  package packageName) asSymbol ifPresent: [
							: configurationOf | 
								configuration := self loadPragmaConfigurationFrom: configurationOf ifNotConfiguration: [ 
									
									self installTraitInto: configurationOf.
									configuration := self loadPragmaConfigurationFrom: configurationOf ifNotConfiguration: [ 
										self error: ' Error loading log configuration: There is not configuration defined on ', 'ConfigurationOf',aClass package packageName 
									].
								].
						].
						 Smalltalk at: ('ConfigurationOf',aClass  package packageName) asSymbol ifAbsent: [  
									self error: ' Error loading log configuration: There is not class ', 'ConfigurationOf',aClass package packageName, ' using metacello configuration' 
						].
						configuration.
				]	.
			] ifFalse: [
				self at:(arguments at:1) ifNotConfigured: [self error: 'there is not default configuration! ' ] 
			]
		]  .
	
	} as: Dictionary.

" Pragma load configuration rules apply "	
	register associationsDo: [ :assoc | 
		| array |
		array := Pragma allNamed:assoc key in: aClass class.
		array size > 0 ifTrue:[
			rslt := assoc value value: ((array at:1 )method ) value:((array at:1 )arguments).
			rslt ifNotNil: [
				^rslt.	
			]
		].
	].
	^self loadPragmaConfigurationFrom: aClass superclass ifNotConfiguration: aBlock.
	
	



