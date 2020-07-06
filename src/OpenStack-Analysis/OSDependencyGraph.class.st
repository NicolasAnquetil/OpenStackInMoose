"
Showing a dependencyGraph between elements
"
Class {
	#name : #OSDependencyGraph,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'OpenStack-Analysis'
}

{ #category : #drawing }
OSDependencyGraph >> defaultEdgeCharge [
	^-500
]

{ #category : #drawing }
OSDependencyGraph >> defaultEdgeLength [
	^150
]

{ #category : #drawing }
OSDependencyGraph >> draw [
	| canvas shapes stepping edges  layout |
	canvas := RSCanvas new.
	shapes := elements collect: [ :e || box |
		box := RSEllipse new.
		box
			size: 10;
			draggable;
			model: e.
		box @ (RSLabeled new text: [:elt | elt mooseName] ; yourself).
		e tags
			ifEmpty: [ box color: #lightGray ]
			ifNotEmpty: [:tags | box color: tags anyOne color ].
		box
	].
	edges := RSEdgeBuilder arrowedLine
		color: (Color lightGray) ;
		shapes: shapes;
		connectToAll: [ :e | e queryOutgoingDependencies atScope: e class ].
	canvas
		addAll: edges;
		addAll: shapes.
	stepping := RSForceLayoutStepping new.
	
	(layout := stepping layout)
		length: self defaultEdgeLength;
		charge: self defaultEdgeCharge.
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
