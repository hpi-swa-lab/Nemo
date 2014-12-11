utilities
jsonFor: aQuery
	"Try get a JSON from a REST-API styled HTTP query."

	| webContent gzipContent |
	
	webContent := (WebClient httpGet: aQuery) content.
	gzipContent := (GZipReadStream on: webContent) contents.
	
	^Json readFrom: (gzipContent) readStream.