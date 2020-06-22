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

{ #category : #accessing }
HOTDemo >> clearTags [
	model tags copy do: [ :t | t remove ]
]

{ #category : #accessing }
HOTDemo >> colorAt: i [
	"requires a bit of fidling because indices in Pharo start at 1"
	| colors |
	colors := self colorTheme.
	^ colors at: (((i - 1) \\ colors size) + 1)
]

{ #category : #accessing }
HOTDemo >> colorTheme [
	^{Color red . Color green . Color purple . Color orange . Color yellow . Color brown }
]

{ #category : #accessing }
HOTDemo >> computeCycles [
	tarjan := MalTarjan new.
	tarjan nodes: leafServices.
	tarjan edges: leafServices from: #yourself toAll: [ :s | s queryOutgoingDependencies atScope: FamixHOTService].
	tarjan run.
]

{ #category : #accessing }
HOTDemo >> cycles [
	tarjan ifNil: [ self computeCycles ].
	^tarjan circuits
]

{ #category : #accessing }
HOTDemo >> dsm [
	dsm := OSDsm2 new.
	dsm objects: leafServices.
	dsm dependency: [ :s | s queryOutgoingDependencies atScope: FamixHOTService].
	^dsm
]

{ #category : #accessing }
HOTDemo >> model: aModel [
	model := aModel.
	leafServices := (model allWithType: FamixHOTService) select: [ :s | s subServices isEmpty].
]

{ #category : #accessing }
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
