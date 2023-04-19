Class {
	#name : #ShampooMethodTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'method'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooMethodTest >> methodSample [
	^'<request id="123" type="MethodSource" namespace="ShampooSamples"
               class="SampleClassB" side="instance" method="doSomethingElse:withArg:"/>'

]

{ #category : #'as yet unclassified' }
ShampooMethodTest >> setUp [
	method := self requestFrom: self methodSample

]

{ #category : #'as yet unclassified' }
ShampooMethodTest >> testMethod [
	| r |
            "I am not sure about this test"
            r := method execute.
            self should: [r methodName = 'doSomethingElse:withArg:']

]
