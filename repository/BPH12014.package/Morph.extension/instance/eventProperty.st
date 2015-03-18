*BPH12014-UI
eventProperty

	^ self assureExtension valueOfProperty: #eventListeners ifAbsentPut: [IdentityDictionary new]