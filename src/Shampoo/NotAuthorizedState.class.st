"
My instances represent a non-authorized state of a user
session. When entered, I send a magic string to a client. If the client will
prove his identity, I will switch the session to the AutiorizedState.
"
Class {
	#name : #NotAuthorizedState,
	#superclass : #ConnectionState,
	#instVars : [
		'magic'
	],
	#category : #'Shampoo-Server'
}

{ #category : #private }
NotAuthorizedState >> checkLogin: aRequest [
            "Really hates."
            (connection server authenticates: aRequest creds with: self magic)
                ifTrue: [self switchTo: AuthorizedState.
                         ^ServerInfoResponse id: aRequest id]
                ifFalse: [FatalError new signal]

]

{ #category : #private }
NotAuthorizedState >> magic [
            ^magic ifNil: [magic := Random new nextInteger: 16r7FFFFFFF]

]

{ #category : #fsm }
NotAuthorizedState >> process: aRequest [
            "Anti-If campaign probably hates me."
            aRequest class == LoginRequest
                ifTrue: [^self checkLogin: aRequest]
                ifFalse: [FatalError new signal]

]

{ #category : #other }
NotAuthorizedState >> register [
            "Send a magic number to a client"
            connection send: (MagicResponse number: self magic)

]
