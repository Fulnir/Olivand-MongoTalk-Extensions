*olivand-mongotalk
createIndex: aNameOrQuery unique: isUnique	
	| direction query index |
	direction := '1'.	
	query := aNameOrQuery isString
		ifTrue: [aNameOrQuery -> direction]
		ifFalse: [aNameOrQuery].
	index := String new writeStream
		nextPutAll:
			('_<1s>_<2s>'
				expandMacrosWith: query key
				with: query value).
	database
		createCollectionIndex:
			((Dictionary new)
				at: 'name' put: index;
				at: 'ns'
					put: self fullName;
				at: 'key'
					put: (Dictionary with: query);
				at: 'unique' put: isUnique;
				yourself).
	^index