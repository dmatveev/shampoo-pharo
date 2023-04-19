"
My subclasses represent various states of a user session on
the server. Yes, the server aims to look like as a finite state machine.
"
Class {
	#name : #ConnectionState,
	#superclass : #Object,
	#instVars : [
		'connection'
	],
	#category : #'Shampoo-Server'
}

{ #category : #'instance creation' }
ConnectionState class >> of: aConnection [
            ^(self new)
                connection: aConnection;
                yourself

]

{ #category : #private }
ConnectionState >> connection: aConnection [
            connection := aConnection

]

{ #category : #fsm }
ConnectionState >> echo: aString [
            "Do nothing by default. 'self subclassResponsibility' would be better?"

]

{ #category : #fsm }
ConnectionState >> process: aRequest [
            self subclassResponsibility

]

{ #category : #fsm }
ConnectionState >> switchTo: aConnectionStateClass [
            connection state: (aConnectionStateClass of: connection)

]
