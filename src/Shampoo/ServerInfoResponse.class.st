"
My instances hold information about the server (image). Actually,
the server can send me any time, even without an appropriate request
"
Class {
	#name : #ServerInfoResponse,
	#superclass : #Response,
	#category : #'Shampoo-Responses'
}

{ #category : #marshalling }
ServerInfoResponse >> asXML [
            ^(super asXML)
                addNode: (ShampooXMLText text: Smalltalk version);
                yourself

]

{ #category : #private }
ServerInfoResponse >> type [
            ^'Info'

]
