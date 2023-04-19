Class {
	#name : #ShampooDoItTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'doit',
		'locals'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooDoItTest >> doItSample [
	^'<request id="80" type="DoIt">Smalltalk at: #someUniqueKeyForDoIt put: 42</request>'

]

{ #category : #'as yet unclassified' }
ShampooDoItTest >> localsDoItSample [
	^'<request id="80" type="DoIt">
            | c d |
            c := OrderedCollection new.
            c add: 1; add: 2; add: 3.
            d := (c collect: [:e | e squared])
                inject: String new
                into: [:a :e | a, e asString].
            Smalltalk at: #someUniqueKeyForLocals put: d
            </request>'

]

{ #category : #'as yet unclassified' }
ShampooDoItTest >> setUp [
	Smalltalk at: #someUniqueKeyForDoIt put: nil.
            doit := self requestFrom: self doItSample.
            locals := self requestFrom: self localsDoItSample.

]

{ #category : #'as yet unclassified' }
ShampooDoItTest >> testDoIt [
	| r |
            r := doit execute.
            self should: [42 = (Smalltalk at: #someUniqueKeyForDoIt)];
                 should: [r statusString = 'success']

]

{ #category : #'as yet unclassified' }
ShampooDoItTest >> testWithLocals [
	| r |
            r := locals execute.
            self should: ['149' = (Smalltalk at: #someUniqueKeyForLocals)]

]
