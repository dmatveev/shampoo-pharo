"
My instances parse the header part of the message. The
main purpose is to extract the content length (""Content-Length"" header)
and then to switch the FSM to the ParseContentState state and to pass the
rest of the message and the expected content length to it.
"
Class {
	#name : #ParseHeaderState,
	#superclass : #MessageParserState,
	#category : #'Shampoo-Protocol'
}

{ #category : #'instance creation' }
ParseHeaderState class >> buffer: aString [
            ^(self new: aString)
                yourself

]

{ #category : #fsm }
ParseHeaderState >> canProcess [
            ^buffer lines size >= 2

]

{ #category : #private }
ParseHeaderState >> handleFail [
            self invalidateBuffer

]

{ #category : #private }
ParseHeaderState >> tryParse: aStream into: aCollection [
            | sz |
            aStream upToAll: 'Content-Length: '.
            aStream atEnd ifTrue: [self fail].
            sz := Integer readFrom: aStream.
            sz = 0 ifTrue: [self fail].
            2 timesRepeat:
            [(aStream next: 2) = String crlf ifFalse: [self fail]].
            self switchToContent: sz rest: aStream upToEnd

]
