"
A collection of methods to manipulate a HOT model
"
Class {
	#name : #HOTDemo,
	#superclass : #Object,
	#instVars : [
		'dsm',
		'leafServices',
		'model',
		'tarjan'
	],
	#category : #'OpenStack-Generator'
}

{ #category : #private }
HOTDemo >> checkDependenciesFor: elements [
	| error |
	error := OrderedCollection new.
	elements do: [ :e |
		(e queryOutgoingDependencies atScope: e class)
			do: [ :opposite |
				((opposite queryIncomingDependencies atScope: e class) includes: e)
					ifFalse: [ error add: e -> opposite ]
			]
	].
	elements do: [ :e |
		(e queryIncomingDependencies atScope: e class)
			do: [ :opposite |
				((opposite queryOutgoingDependencies atScope: e class) includes: e)
					ifFalse: [ error add: opposite -> e]
			]
	].
	^error

]

{ #category : #api }
HOTDemo >> clearTags [
	model tags copy do: [ :t | t remove ]
]

{ #category : #private }
HOTDemo >> colorAt: i [
	"requires a bit of fidling because indices in Pharo start at 1"
	| colors |
	colors := self colorTheme.
	^ colors at: (((i - 1) \\ colors size) + 1)
]

{ #category : #private }
HOTDemo >> colorTheme [
	^{Color red . Color green . Color purple . Color orange . Color yellow . Color brown }
]

{ #category : #api }
HOTDemo >> computeCycles: elements [
	tarjan := MalTarjan new.
	tarjan nodes: elements.
	tarjan edges: elements from: #yourself toAll: [ :s | s queryOutgoingDependencies atScope: (s class)].
	tarjan run.
]

{ #category : #api }
HOTDemo >> computeResourceCycles [
	self computeCycles: (self model allWithType: FamixHOTResourceType).

]

{ #category : #api }
HOTDemo >> computeServiceCycles [
	self computeCycles: leafServices
]

{ #category : #api }
HOTDemo >> cycles [
	^tarjan circuits
]

{ #category : #api }
HOTDemo >> dsm [
	"dsm := OSDsm2 new.
	dsm objects: leafServices.
	dsm dependency: [ :s | s queryOutgoingDependencies atScope: FamixHOTService].
	^dsm"
	^OSDsm3 new
		elements: (self leafServices) ;
		draw
]

{ #category : #searching }
HOTDemo >> entity: aClass named: aString [
	^(model allWithType: aClass) detect: [ :s | s name = aString ]
]

{ #category : #api }
HOTDemo >> graphDepResources [
	| elts |
	elts := (model allWithType: FamixHOTResourceType) \ self lonelyResources.
	^OSDependencyGraph new
		elements: elts ;
		draw
]

{ #category : #api }
HOTDemo >> graphDepServices [
	| elts |
	elts := self leafServices
		reject: [:s | s mooseName beginsWith: 'AWS' ].
	^OSDependencyGraph new
		elements: elts ;
		draw
]

{ #category : #importing }
HOTDemo >> importModel: aFileName [
	model :=	(
		('/home/anquetil/Documents/RMod/Rech/OpenStack/MSEs/' , aFileName , '.mse')
			asFileReference
		readStreamDo: [ :st |
			(FamixHOTModel importFromMSEStream: st) name: aFileName ; yourself ]).
]

{ #category : #importing }
HOTDemo >> importModelAll [
	self importModel: 'all_HOT_resource_types'
]

{ #category : #importing }
HOTDemo >> importModelSchemasModified [
	self importModel: 'all_HOT_resource_types-schemas-modified'
]

{ #category : #importing }
HOTDemo >> importModelSchemasNotModified [
	self importModel: 'all_HOT_resource_types-schemas-not-modified'
]

{ #category : #accessing }
HOTDemo >> leafServices [
	^leafServices 
]

{ #category : #api }
HOTDemo >> lonelyResources [
	^(model allWithType: FamixHOTResourceType)
		select: [ :rt |
			rt queryOutgoingDependencies withoutSelfLoops isEmpty and:
			[ rt queryIncomingDependencies withoutSelfLoops isEmpty ] ]
]

{ #category : #api }
HOTDemo >> lonelyResourcesReport [
	^(self lonelyResources
	sorted: [ :a :b | a mooseName < b mooseName ]) toStringPrintingBlock: [ :st :e | st nextPutAll: (e mooseName) ; cr ] .
]

{ #category : #accessing }
HOTDemo >> model [
	^model
]

{ #category : #accessing }
HOTDemo >> model: aModel [
	model := aModel.
	leafServices := (model allWithType: FamixHOTService) select: [ :s | s subServices isEmpty].
]

{ #category : #searching }
HOTDemo >> resourceNamed: aString [
	^self entity: FamixHOTResourceType named: aString
]

{ #category : #searching }
HOTDemo >> serviceNamed: aString [
	^self entity: FamixHOTService named: aString
]

{ #category : #api }
HOTDemo >> tagCycles [
	| i |
	i := 1.
	self cycles do: [ :cycle || tag |
		self
			tagElements: cycle
			with: (self
				tagNamed: ('cycle-' , i asString)
				color: (self colorAt: i)).
		i := i + 1
	]
]

{ #category : #api }
HOTDemo >> tagElements: elements with: tag [
	elements do: [ :e | e model tagWith: tag ].

]

{ #category : #private }
HOTDemo >> tagNamed: aString color: aColorOrSymbol [
	^(model tagNamed: aString)
		color: (aColorOrSymbol isColor
			ifTrue: [ aColorOrSymbol ]
			ifFalse: [Color perform: aColorOrSymbol]) ;
		yourself.
	

]
