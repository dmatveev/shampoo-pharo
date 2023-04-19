"
I am an abstract class. My instances represent various requests
sent (usually) from a client to the server. Each request knows how to deserialize
from an XML and what action to perform on the server side. Each request usually
has an appropriate Response subclass, and returns a Response object on #execute.
"
Class {
	#name : #Request,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #'instance creation' }
Request class >> from: anXML [
            | attrs class |
            attrs := anXML attrMap.
            class := Request allSubclasses detect:
                [:each | (each respondsTo: #is:) and: [each is: (attrs at: 'type')]].
            ^(class new: (attrs at: 'id') asInteger)
                init: anXML;
                yourself

]

{ #category : #'instance creation' }
Request class >> new: anInteger [
            ^(self new)
                id: anInteger;
                yourself

]

{ #category : #execution }
Request >> execute [
            ^self subclassResponsibility

]

{ #category : #accessors }
Request >> id [
            ^id

]

{ #category : #accessors }
Request >> id: anInteger [
            id := anInteger

]

{ #category : #private }
Request >> init: anXML [
            "Default implementation, do nothing"

]
