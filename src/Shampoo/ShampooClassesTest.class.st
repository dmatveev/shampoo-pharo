Class {
	#name : #ShampooClassesTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'classes'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooClassesTest >> classesSample [
	^'<request id="10" type="Classes" namespace="Shampoo-Tests" />'

]

{ #category : #'as yet unclassified' }
ShampooClassesTest >> setUp [
	classes := self requestFrom: self classesSample

]

{ #category : #'as yet unclassified' }
ShampooClassesTest >> testClasses [
	| r items |
            r := classes execute.
            items := r items at: 'class'.
            self should: [items includes: 'SampleClassA'];
                 should: [items includes: 'SampleClassB']

]
