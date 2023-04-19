Class {
	#name : #ShampooTranscript,
	#superclass : #Object,
	#classVars : [
		'Servers',
		'ServersMutex'
	],
	#category : #'Shampoo-Server'
}

{ #category : #setup }
ShampooTranscript class >> add: aServer [
	self serversMutex critical: [self servers add: aServer]
]

{ #category : #'as yet unclassified' }
ShampooTranscript class >> echo: aString [
	self serversMutex critical: [self servers do: [:each | each echo: aString]]
]

{ #category : #installation }
ShampooTranscript class >> install [
	Transcript addDependent: self

]

{ #category : #setup }
ShampooTranscript class >> remove: aServer [
	self serversMutex critical:
	[self servers remove: aServer ifAbsent: []]
]

{ #category : #private }
ShampooTranscript class >> servers [
	^Servers ifNil: [Servers := Set new]
]

{ #category : #private }
ShampooTranscript class >> serversMutex [
	^ ServersMutex ifNil: [ServersMutex := Semaphore forMutualExclusion]
]

{ #category : #installation }
ShampooTranscript class >> uninstall [
	Transcript removeDependent: self

]

{ #category : #installation }
ShampooTranscript class >> update: aChange [
	aChange = #appendEntry ifTrue: [self echo: Transcript contents]
]
