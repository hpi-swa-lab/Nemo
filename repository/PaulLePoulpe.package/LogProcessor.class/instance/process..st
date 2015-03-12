process
process: aLogEntity
	self filter ifAccept: aLogEntity do: [
		| log |
		log := self formatter format:aLogEntity.
		self writer write: log.
	]
