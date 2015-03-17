as yet unclassified
testPrefixRecognition

	"should recognize simple prefixes"
	self assert: 
		(BPMarkovFilter 
			testPrefix: {1. 2. 3} asOrderedCollection
			of: {1. 2. 3. 4} asOrderedCollection).
			
	"should not fail with incompatible lists but return false"
	self assert: 
		(BPMarkovFilter 
			testPrefix: {1. 2. 3. 4} asOrderedCollection
			of: {1. 2} asOrderedCollection) not.
			
	"should return false if no prefix"
	self assert: 
		(BPMarkovFilter 
			testPrefix: {1. 2. 3} asOrderedCollection
			of: {1. 2. 4. 5} asOrderedCollection) not.