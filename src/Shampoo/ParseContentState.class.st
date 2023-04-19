"
My instances parse the content part of the message. When
there are enough bytes in the message (i.e. more than or equal to expected),
my instance will put the content into a collection and then will switch the
FSM to the ParseHeaderState state and will pass the rest of the buffer to it.
"
Class {
	#name : #ParseContentState,
	#superclass : #MessageParserState,
	#instVars : [
		'expected'
	],
	#category : #'Shampoo-Protocol'
}

{ #category : #'instance creation' }
ParseContentState class >> buffer: aString length: anInteger [
            ^(self new: aString)
                expected: anInteger;
                yourself

]

{ #category : #fsm }
ParseContentState >> canProcess [
            ^buffer size >= expected

]

{ #category : #accessors }
ParseContentState >> expected: anInteger [
            expected := anInteger

]

{ #category : #private }
ParseContentState >> handleFail [
            "Do nothing"

]

{ #category : #fsm }
ParseContentState >> tryParse: aStream into: aCollection [
            aCollection add: (aStream next: expected).
            self switchToHeader: aStream upToEnd

]
