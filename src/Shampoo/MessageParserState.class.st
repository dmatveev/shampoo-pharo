"
My subclasses represent various states of the message parser
FSM. I contain the most common methods for all states and define the state
interface (see the ""fsm"" category).
"
Class {
	#name : #MessageParserState,
	#superclass : #Object,
	#instVars : [
		'parser',
		'buffer'
	],
	#category : #'Shampoo-Protocol'
}

{ #category : #'instance creation' }
MessageParserState class >> new: aString [
            ^self basicNew
                initialize: aString;
                yourself

]

{ #category : #fsm }
MessageParserState >> canProcess [
            self subclassResponsibility

]

{ #category : #accessors }
MessageParserState >> consume: aString [
            buffer := buffer, aString

]

{ #category : #private }
MessageParserState >> fail [
            self error: 'Error occured during parsing'

]

{ #category : #private }
MessageParserState >> handleFail [
            self subclassResponsibility

]

{ #category : #initialization }
MessageParserState >> initialize: aString [
            buffer := aString

]

{ #category : #private }
MessageParserState >> invalidateBuffer [
            buffer := String new.

]

{ #category : #accessors }
MessageParserState >> parser: aParser [
            parser := aParser.

]

{ #category : #fsm }
MessageParserState >> processInto: aCollection [
            [self tryParse: buffer readStream into: aCollection
            ] on: Error do: [:e | e inspect. self handleFail]

]

{ #category : #fsm }
MessageParserState >> switchToContent: aLength rest: aString [
            | st |
            st := ParseContentState buffer: aString length: aLength.
            parser switchTo: st

]

{ #category : #fsm }
MessageParserState >> switchToHeader: aString [
            parser switchTo: (ParseHeaderState buffer: aString)

]

{ #category : #private }
MessageParserState >> tryParse: aStream into: aCollection [
            self subclassResponsibility

]
