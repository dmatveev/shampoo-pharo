"
I am not actually a response, I am like a request that
goes from the server to a client. My instances hold a magic number used by
a client for password encryption during the authentication.
"
Class {
	#name : #MagicResponse,
	#superclass : #Response,
	#instVars : [
		'number'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
MagicResponse class >> number: anInteger [
            ^(self id: 0)
                number: anInteger;
                yourself

]

{ #category : #marshalling }
MagicResponse >> asXML [
            ^(super asXML)
                addNode: (ShampooXMLText text: number printString);
                yourself

]

{ #category : #private }
MagicResponse >> number: anInteger [
            number := anInteger

]

{ #category : #private }
MagicResponse >> type [
            ^'Magic'

]
