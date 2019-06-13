Extension { #name : #Collection }

{ #category : #'*shampoo-hacks' }
Collection >> elementsString [
        ^self inject: '' into: [:acc :each | acc, each asString, ' ']

]
