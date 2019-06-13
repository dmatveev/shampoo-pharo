"
My instances represent a login request and transfer
authentication data from a client to the server. I am the one of the
few requests than do not understand an #execute message.
"
Class {
	#name : #LoginRequest,
	#superclass : #Request,
	#instVars : [
		'creds'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
LoginRequest class >> is: aString [
            ^aString = 'Login'

]

{ #category : #accessors }
LoginRequest >> creds [
            ^creds

]

{ #category : #private }
LoginRequest >> init: anXML [
            creds := LoginInfo fromXML: (anXML elementsNamed: 'creds') first.

]
