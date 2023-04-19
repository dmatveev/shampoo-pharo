Class {
	#name : #ShampooCatsTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'cats',
		'emptyCats'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooCatsTest >> catsSample [
	^'<request id="500" type="Categories" namespace="ShampooSamples"
               class="SampleClassB" side="instance"/>'

]

{ #category : #'as yet unclassified' }
ShampooCatsTest >> emptyCatsSample [
	^'<request id="500" type="Categories" namespace="ShampooSamples"
               class="SampleClassA" side="instance"/>'

]

{ #category : #'as yet unclassified' }
ShampooCatsTest >> setUp [
	cats := self requestFrom: self catsSample.
            emptyCats := self requestFrom: self emptyCatsSample.

]

{ #category : #'as yet unclassified' }
ShampooCatsTest >> testCats [
	| r items |
            r := cats execute.
            items := r items at: 'category'.
            self should: [items includes: 'sample-category'];
                 should: [items includes: 'accessors']

]

{ #category : #'as yet unclassified' }
ShampooCatsTest >> testEmptyCats [
	| r items |
            r := emptyCats execute.
            items := r items at: 'category'.
            self should: [items isEmpty]

]
