"
My instances represent an authorized state of a user session.
This state is also can be called ""active"". The most of Shampoo requests are
processed in this state.
"
Class {
	#name : #AuthorizedState,
	#superclass : #ConnectionState,
	#category : #'Shampoo-Server'
}

{ #category : #fsm }
AuthorizedState >> echo: aString [
            connection send: (EchoResponse id: -1 text: aString)

]

{ #category : #fsm }
AuthorizedState >> process: aRequest [
            ^aRequest execute

]
