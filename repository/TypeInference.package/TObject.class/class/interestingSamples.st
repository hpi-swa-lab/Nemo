ESUG
interestingSamples
	"
	TObject interestingSamples
	-- Totals
	 - Methods: 70
	 - Invocations: 233
	 - Types: 29
	" 

	Display boundingBox.   
	Display boundingBox isTall.
	Display height; yourself.  
	Display boundingBox truncated.
	Display boundingBox pointNearestTo: 100@100.

	(1@1) degrees.
	(1.0@1.0) theta. 
	((1@1) degrees + (1.0@1.0) theta) asInteger.
	(1@1 nearestPointAlongLineFrom: 1@1 to: 10@10).
	(1@1 nearestPointAlongLineFrom: 1@1 to: 10@10) degrees asInteger.

	(1.0 to: 2.0 by: 0.1).
	(1.0 to: 2.0 by: 0.1) size.

"
	1@1 onLineFrom: 0@0 to: 10@10 within: 0.5
	1@1 nearestPointOnLineFrom: 0@0 to: 10@10
"