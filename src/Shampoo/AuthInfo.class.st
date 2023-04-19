"
My instances represent an authentification info stored on
server. My instances live on the server side permamently (as long as the server
does) and are used to verify the user's identity.

The authentification scheme used in the Shampoo is a classical PSK (Pre-Shared
Key). When you start a server, you have to define a login and a password (see
ShampooServer>>startOn:login:pass:). Obviously the same login and password
should be specified by a client then.

When a client connects to the server, the server generates a pseudo-random magic
string (a number) and sends it to the client. The client then should calculate
an MD5 hash of a password, concatenate it with the magic string and then take
a hash of the concatenation again. This hash is then sent back to the server.

Server performs the same operations and then compares the hashes. So the password
is not transmitted across the network, and the server also does not store it
in the plain form in the memory.
"
Class {
	#name : #AuthInfo,
	#superclass : #Object,
	#instVars : [
		'login',
		'passHash'
	],
	#category : #'Shampoo-Auth'
}

{ #category : #'instance creation' }
AuthInfo class >> login: aLogin pass: aPass [
            ^(self new)
                login: aLogin pass: aPass;
                yourself

]

{ #category : #private }
AuthInfo >> login: aLogin pass: aPass [
            login := aLogin.
            passHash := MD5 hash: aPass
]

{ #category : #psk }
AuthInfo >> with: aMagic [
            ^(LoginInfo new)
                login: login
                magicHash: (MD5 hash: (aMagic printString, passHash))

]
