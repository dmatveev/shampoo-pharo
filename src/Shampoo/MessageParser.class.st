"
I am the main class to handle the incoming messages.
My instances take the received raw data and extract the contents from it.
"
Class {
	#name : #MessageParser,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Shampoo-Protocol'
}

{ #category : #'instance creation' }
MessageParser class >> new [
            ^(self basicNew)
                initialize;
                yourself

]

{ #category : #initialization }
MessageParser >> initialize [
            self switchTo: (ParseHeaderState buffer: '')

]

{ #category : #parsing }
MessageParser >> process: aString [
            | results |
            results := OrderedCollection new.
            state consume: aString.
            [state canProcess] whileTrue:
            [state processInto: results].
            ^results

]

{ #category : #fsm }
MessageParser >> switchTo: aState [
            state := aState.
            state parser: self.

]
