*olivand-mongotalk
generateValue
	| value processId count valueInt |
	processId := Processor activeProcess identityHash.
	count := self next.
	value := self generateInitialValue: TimeStamp now. "nowUTC"
	value
		at: 5
		put:  (HostHash basicAt: 1).
	value
		at: 6
		put:  (HostHash basicAt: 2).
	value
		at: 7
		put:  (HostHash basicAt: 3).
	value
		at: 8
		put: (processId digitAt: 1).
	value
		at: 9
		put: (processId digitAt: 2).
	value
		at: 10
		put: (count digitAt: 1).
	value
		at: 11
		put: (count digitAt: 2).
	value
		at: 12
		put: (count digitAt: 3).
		
	valueInt := LargePositiveInteger basicNew: 12.
	1 to: 12 do: [:each | valueInt basicAt: each put: (value at: each)].
	^(GratuitousIncompatibilities compressLargeInteger: valueInt)