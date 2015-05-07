*Nemo-UI
eventProperty

	^ self assureExtension valueOfProperty: #eventListeners ifAbsentPut: [IdentityDictionary new]