Class {
	#name : #ShampooConnectionMock,
	#superclass : #ShampooGenericMock,
	#instVars : [
		'state'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooConnectionMock >> server [
	^self

]

{ #category : #'as yet unclassified' }
ShampooConnectionMock >> state [
	^state

]

{ #category : #'as yet unclassified' }
ShampooConnectionMock >> state: aState [
	state := aState

]
