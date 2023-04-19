Class {
	#name : #ShampooMethodsTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'methods',
		'asterisk'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooMethodsTest >> asteriskSample [
	^'<request id="500" type="Methods" namespace="ShampooSamples"
               class="SampleClassB" side="instance" category="*"/>'

]

{ #category : #'as yet unclassified' }
ShampooMethodsTest >> methodsSample [
	^'<request id="500" type="Methods" namespace="ShampooSamples"
               class="SampleClassB" side="instance" category="sample-category"/>'

]

{ #category : #'as yet unclassified' }
ShampooMethodsTest >> setUp [
	methods := self requestFrom: self methodsSample.
            asterisk := self requestFrom: self asteriskSample.

]

{ #category : #'as yet unclassified' }
ShampooMethodsTest >> testAsterisk [
	| r items |
            r := asterisk execute.
            items := r items at: 'method'.
            self should: [items includes: 'doSomethingElse:withArg:'];
                 should: [items includes: 'doSomething'];
                 should: [items includes: 'foo'];
                 should: [items includes: 'bar']

]

{ #category : #'as yet unclassified' }
ShampooMethodsTest >> testMethods [
	| r items |
            r := methods execute.
            items := r items at: 'method'.
            self should: [items includes: 'doSomethingElse:withArg:'];
                 should: [items includes: 'doSomething'];
                 shouldnt: [items includes: 'foo'];
                 shouldnt: [items includes: 'bar']

]
