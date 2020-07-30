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
	#category : #'OpenStack-Analysis'
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

{ #category : #tags }
HOTDemo >> clearTags [
	model tags copy do: [ :t | t remove ]
]

{ #category : #visualization }
HOTDemo >> colorAt: i [
	"requires a bit of fidling because indices in Pharo start at 1"
	| colors |
	colors := self colorTheme.
	^ colors at: (((i - 1) \\ colors size) + 1)
]

{ #category : #visualization }
HOTDemo >> colorTheme [
	^{Color red . Color green . Color purple . Color orange . Color yellow . Color brown }
]

{ #category : #cycles }
HOTDemo >> computeCycles: elements [
	tarjan := MalTarjan new.
	tarjan nodes: elements.
	tarjan edges: elements from: #yourself toAll: [ :s | s queryOutgoingDependencies atScope: (s class)].
	tarjan run.
]

{ #category : #cycles }
HOTDemo >> computeResourceCycles [
	self computeCycles: (self model allWithType: FamixHOTResourceType).

]

{ #category : #cycles }
HOTDemo >> computeServiceCycles [
	self computeCycles: leafServices
]

{ #category : #cycles }
HOTDemo >> cycles [
	^tarjan circuits
]

{ #category : #visualization }
HOTDemo >> dsmResources [
	"dsm := OSDsm2 new.
	dsm objects: leafServices.
	dsm dependency: [ :s | s queryOutgoingDependencies atScope: FamixHOTService].
	^dsm"
	^OSDsm3 new
		elements: (model allWithType: FamixHOTResourceType) ;
		draw
]

{ #category : #visualization }
HOTDemo >> dsmServices [
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

{ #category : #visualization }
HOTDemo >> fanDistribution: direction [
	| b ds sortedResources |
	sortedResources :=
		(((model allWithType: FamixHOTResourceType)
			collect: [:r | (r perform: direction) -> r ]) 
			asOrderedCollection 
			sort: [ :a1 :a2 | a1 key < a2 key ])
			collect: #value.
	
	b := RTGrapher new.

	"We define the size of the charting area"
	b extent: 500 @ 100.
	ds := RTData new.

	ds points: sortedResources .

	"The height of a bar will be the number of methods (defined in the instance side)"
	ds y: [ :c | (c perform: direction) ].

	ds barShape
		color: Color blue;
		width: 5.
	b add: ds.
	b axisX.
	b axisYWithNumberOfTicks: 4.
	^ b
]

{ #category : #visualization }
HOTDemo >> fanInDistribution [
	^self fanDistribution: #fanIn
]

{ #category : #visualization }
HOTDemo >> fanOutDistribution [
	^self fanDistribution: #fanOut
]

{ #category : #visualization }
HOTDemo >> graphDepResources [
	| elts |
	elts := (model allWithType: FamixHOTResourceType) \ self lonelyResources.
	^OSDependencyGraph new
		elements: elts ;
		draw
]

{ #category : #visualization }
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
HOTDemo >> lonelyElements: aCollection [
	^aCollection 
		select: [ :e |
			e queryOutgoingDependencies withoutSelfLoops isEmpty and:
			[ e queryIncomingDependencies withoutSelfLoops isEmpty ] ]
]

{ #category : #api }
HOTDemo >> lonelyResources [
	^self lonelyElements: (model allWithType: FamixHOTResourceType)
]

{ #category : #api }
HOTDemo >> lonelyResourcesReport [
	^(self lonelyResources
	sorted: [ :a :b | a mooseName < b mooseName ]) toStringPrintingBlock: [ :st :e | st nextPutAll: (e mooseName) ; cr ] .
]

{ #category : #api }
HOTDemo >> lonelyServices [
	^self lonelyElements: (model allWithType: FamixHOTService)
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

{ #category : #tags }
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

{ #category : #tags }
HOTDemo >> tagElements: elements with: tag [
	elements do: [ :e | e model tagWith: tag ].

]

{ #category : #tags }
HOTDemo >> tagNamed: aString color: aColorOrSymbol [
	^(model tagNamed: aString)
		color: (aColorOrSymbol isColor
			ifTrue: [ aColorOrSymbol ]
			ifFalse: [Color perform: aColorOrSymbol]) ;
		yourself.
	

]

{ #category : #api }
HOTDemo >> utilityServices [
	^(model allWithType: FamixHOTService)
		collect: [ :s |
			(s resourceTypes)
			ifEmpty: [ s -> 0 ]
			ifNotEmpty: [:members | s -> ((self lonelyElements: members) size / members size)]
		]
]
