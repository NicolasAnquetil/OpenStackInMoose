"
Showing a dependencyGraph between services
"
Class {
	#name : #OSDependencyGraph,
	#superclass : #Object,
	#instVars : [
		'elements',
		'dependencies'
	],
	#category : #'OpenStack-Generator'
}

{ #category : #accessing }
OSDependencyGraph >> dependencies [
	^ dependencies
]

{ #category : #accessing }
OSDependencyGraph >> dependencies: anObject [
	dependencies := anObject
]

{ #category : #drawing }
OSDependencyGraph >> draw [
	| canvas shapes stepping edges  layout |
	canvas := RSCanvas new.
	shapes := elements collect: [ :e || box |
		box := RSEllipse new.
		box
			size: 5;
			draggable;
			model: e.
		box @ (RSLabeled new text: [:elt | elt mooseName] ; yourself).
		e tags
			ifEmpty: [ box color: #lightGray ]
			ifNotEmpty: [:tags | box color: tags anyOne color ].
		box
	].
	edges := RSEdgeBuilder arrowedLine
		shapes: shapes;
		connectToAll: [ :e | e queryOutgoingDependencies atScope: e class ].
	canvas
		addAll: edges;
		addAll: shapes.
	stepping := RSForceLayoutStepping new.
	
	(layout := stepping layout)
		length: 80;
		charge: -300.
	canvas @ stepping.
	canvas @ RSCanvasController.
	
	^ canvas
]

{ #category : #accessing }
OSDependencyGraph >> elements [
	^ elements
]

{ #category : #accessing }
OSDependencyGraph >> elements: anObject [
	elements := anObject
]
