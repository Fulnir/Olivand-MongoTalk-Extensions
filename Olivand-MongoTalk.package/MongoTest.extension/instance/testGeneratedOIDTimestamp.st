*Olivand-MongoTalk
testGeneratedOIDTimestamp
	| data selected  diff |
	data := Dictionary new at: 'key' put: 'value'; yourself.
	collection add: data.
	collection add: (Dictionary new 
		at: '_id' put:(OID newOID); 
		at: 'key2' put: 'value2'; 
		yourself).
	selected := collection select: { 'key2' -> 'value2'} asDictionary.
	self assert: selected size equals: 1.
	"MongoDB TimeStamp and Pharo TimeStamp were different."
	diff := ( TimeStamp now seconds - ((selected first at: '_id') timeStamp) seconds ).
	self assert: (  diff < 1 and:[ diff >= 0])