*olivand-mongotalk
generateInitialValue: aTimeStamp	
	| value time |
	value := ByteArray new: 12.
	time := aTimeStamp asSeconds - self unixEpoch.
	value
		at: 1
		put: (time basicAt: 4).
	value
		at: 2
		put: (time basicAt: 3).
	value
		at: 3
		put: (time basicAt: 2).
	value
		at: 4
		put: (time basicAt: 1).
	^value