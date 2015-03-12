build
configuration
	self for:[ :builder | 
		builder forKey:#default useLevel:#warn into: LogStdoutWriter instance .
	] 
