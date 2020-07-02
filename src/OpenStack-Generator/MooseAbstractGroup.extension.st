Extension { #name : #MooseAbstractGroup }

{ #category : #'*OpenStack-Generator' }
MooseAbstractGroup >> toString [ 
	^self toStringPrintingBlock: [ :st :e | e printOn: st. st cr ]
]

{ #category : #'*OpenStack-Generator' }
MooseAbstractGroup >> toStringPrintingBlock: aBlock [
	"aBlock accepts 2 arguments: the stream to print on and the element to print"
	^String streamContents: [ :st|
		self do: [ :e | aBlock value: st value: e ]
	]
]
