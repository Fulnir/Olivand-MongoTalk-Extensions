*olivand-mongotalk
initialize
	"self initialize"
	
	" classVariableNames: 'Counter HostHash Lock' "
	Counter := 1.
	(Smalltalk
		at: #MD5
		ifPresent: [:cls  | |a | 
			a :=  (cls new initialize hashStream: NetNameResolver localHostName asByteArray readStream).
			HostHash := a .
			] ).		
	Lock := Mutex new.
	