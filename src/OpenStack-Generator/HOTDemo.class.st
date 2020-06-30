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
HOTDemo >> computeCycles [
	tarjan := MalTarjan new.
	tarjan nodes: leafServices.
	tarjan edges: leafServices from: #yourself toAll: [ :s | s queryOutgoingDependencies atScope: FamixHOTService].
	tarjan run.
]

{ #category : #api }
HOTDemo >> cycles [
	tarjan ifNil: [ self computeCycles ].
	^tarjan circuits
]

{ #category : #api }
HOTDemo >> dsm [
	dsm := OSDsm2 new.
	dsm objects: leafServices.
	dsm dependency: [ :s | s queryOutgoingDependencies atScope: FamixHOTService].
	^dsm
]

{ #category : #searching }
HOTDemo >> entity: aClass named: aString [
	^(model allWithType: aClass) detect: [ :s | s name = aString ]
]

{ #category : #api }
HOTDemo >> graphDepOn: services [

	| bldr |
	bldr := RTMondrian new.
	bldr shape box color: [:e | e tags isEmpty ifTrue: [ Color gray ] ifFalse: [ e tags anyOne color ]  ].
	bldr
		nodes: services.

	bldr shape arrowedLine color: Color black.
	bldr edges connectToAll: [:s | s queryOutgoingDependencies atScope: FamixHOTService].
	bldr layout force.
	bldr build.
	^bldr view
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
		tag := model tagNamed: 'cycle-' , i asString.
		tag color: (self colorAt: i).
		cycle do: [ :e | e model tagWith: tag ].
		i := i + 1
	]
]
