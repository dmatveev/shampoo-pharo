Class {
	#name : #ShampooGenericMock,
	#superclass : #Object,
	#instVars : [
		'methods'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #behavior }
ShampooGenericMock >> doesNotUnderstand: aMessage [
            | block |
            block := methods
               at: aMessage selector
               ifAbsent: [^super doesNotUnderstand: aMessage].
            ^block ifNotNil:
            [block valueWithArguments: aMessage arguments].

]

{ #category : #'as yet unclassified' }
ShampooGenericMock >> forgetAbout: aMessageSelector [
	self methods removeKey: aMessageSelector ifAbsent: []

]

{ #category : #'as yet unclassified' }
ShampooGenericMock >> ignore: aMessageSelector [
	self on: aMessageSelector do: nil.

]

{ #category : #accessors }
ShampooGenericMock >> methods [
            ^methods ifNil: [methods := Dictionary new]

]

{ #category : #'as yet unclassified' }
ShampooGenericMock >> on: aMessageSelector do: aBlock [
	self methods at: aMessageSelector put: aBlock

]
