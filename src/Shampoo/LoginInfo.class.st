"
My instances represent an authentification info provided by
a user. My instances come to the server via socket and are used to verify the
user's identity. See more info in the AuthInfo's class comment.
"
Class {
	#name : #LoginInfo,
	#superclass : #Object,
	#instVars : [
		'login',
		'magicHash'
	],
	#category : #'Shampoo-Auth'
}

{ #category : #'instance creation' }
LoginInfo class >> fromXML: anXML [
            ^(self new)
                login: (anXML attrMap at: 'login')
                magicHash: (anXML attrMap at: 'magic');
                yourself

]

{ #category : #testing }
LoginInfo >> = aLoginInfo [
            ^(aLoginInfo class = self class) and: [self hash = aLoginInfo hash]

]

{ #category : #testing }
LoginInfo >> hash [
            ^login hash bitXor: magicHash hash

]

{ #category : #private }
LoginInfo >> login: aString magicHash: aHash [
            login := aString.
            magicHash := aHash

]
