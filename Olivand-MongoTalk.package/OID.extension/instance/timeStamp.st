*Olivand-MongoTalk
timeStamp	
	| buffer |
	buffer := ByteArray new: 4.
	buffer
		at: 4
		put: (value at: 4).
	buffer
		at: 3
		put: (value at: 3).
	buffer
		at: 2
		put: (value at: 2).
	buffer
		at: 1
		put: (value at: 1).
	^TimeStamp fromUnixTime: (buffer asInteger)