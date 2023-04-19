Class {
	#name : #ShampooConnectionTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'conn',
		'sockMock',
		'srvMock'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooConnectionTest >> setUp [
	      sockMock := ShampooGenericMock new.
            sockMock ignore: #sendData:.

            srvMock := ShampooGenericMock new.
            conn := ClientConnection
               on: sockMock
               onDisconnect: [:cl | srvMock gotDisconnect]
               parent: srvMock.

]

{ #category : #'as yet unclassified' }
ShampooConnectionTest >> testDisconnect [
	| got |
            srvMock on: #gotDisconnect do: [got := true].
            sockMock
                on: #isConnected do: [true];
                on: #waitForData do: [ConnectionClosed new signal].
            conn go.
            self assert: got.

]

{ #category : #'as yet unclassified' }
ShampooConnectionTest >> testFetchMessages [
	| msg r |
            
            msg := 'Content-Length: 9', String crlf,
                String crlf,
                'Smalltalk'.
            
            sockMock
                on: #waitForData do: [];
                on: #receiveAvailableData do: [msg].
                
            r := conn fetchMessages.
            self should: [r first = 'Smalltalk'].

]

{ #category : #'as yet unclassified' }
ShampooConnectionTest >> testFetchMessagesFail [
	| caught |
            sockMock on: #waitForData do: [ConnectionClosed new signal].
            [conn fetchMessages]
            on: ClientDisconnected do: [:e | caught := true].
            self assert: caught.

]

{ #category : #'as yet unclassified' }
ShampooConnectionTest >> testSend [
	| packetMock packet |
   packetMock := ShampooGenericMock new.
   packetMock on: #asXML do: [ 'Shampoo' ].
   "I think that testing this thing by catching
    #nextPutAll is not a very good idea."
   sockMock on: #sendData: do: [:s | packet := s].
   conn send: packetMock.
   self
		assert: packet
		equals: ('Content-Length: 9', String crlf, String crlf, '''Shampoo''', String crlf)
	"Note: the above line has been adjusted to recent Pharo+XML specifics,
	This test may look quite different in other Smalltalk systems."
]
