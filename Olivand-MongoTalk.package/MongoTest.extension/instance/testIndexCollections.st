*Olivand-MongoTalk
testIndexCollections
	| new data |
	new := database addCollection: 'indexcollection'.	
	data := Dictionary new at: 'name' put: 'a name'; yourself.
	new createIndex: 'name'.
	collection add: data.
	self assert: (collection includes: data).
	new createIndex: 'name'.
	[self assert: (database collections contains: [:each | each name = 'indexcollection'])]
		ensure: ["new drop"].