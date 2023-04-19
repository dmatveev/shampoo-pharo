Extension { #name : #MD5 }

{ #category : #'*Shampoo-Convenience' }
MD5 class >> hash: aString [
	| hash output |
	hash := MD5 new hashStream: aString readStream.
	output := WriteStream on: String new.
	hash do: [:each | each printOn: output base: 16 nDigits: 2].
	^output contents asLowercase

]
