Class {
	#name : #OSDsm3,
	#superclass : #Object,
	#instVars : [
		'elements',
		'dependencies'
	],
	#category : #'OpenStack-Generator'
}

{ #category : #'as yet unclassified' }
OSDsm3 >> boxPopup [
	| popup |
	popup := RSPopup new
		text: [ :model ||sourceService targetService resourceDependencies|
			sourceService := model key.
			targetService := model value.
			resourceDependencies := (sourceService queryOutgoingDependencies
				select: [ :dep | ((dep to atScope: FamixHOTService) includes: targetService) ]
				thenCollect: [ :dep | dep from -> dep to ])
					asSet.
			String streamContents: [ :st |
				sourceService printOn: st.
				st nextPutAll: '->'.
				targetService printOn: st.

				resourceDependencies
					do: [ :dep |
						st
							nextPut: (Character cr) ;
							nextPutAll: '   '.
						dep key printOn: st.
						st nextPutAll: '->'.
						dep value printOn: st. ].
				] ] ;
		yourself.
	^ popup
]

{ #category : #'as yet unclassified' }
OSDsm3 >> colorX: x Y: y [
	| tags |
	(x = y)
		ifTrue: [ ^Color darkGray ].
	((dependencies at: x) includes: y)
		ifFalse: [ ^Color lightGray lighter ].
	tags := x tags intersection: y tags.
	tags
		ifNotEmpty: [ ^ tags anyOne color ].
	^Color blue				
]

{ #category : #'as yet unclassified' }
OSDsm3 >> draw [
	| canvas shapes |
	canvas := RSCanvas new.
	shapes := elements flatCollect: [ :x |
		elements collect: [ :y |
			RSBox new
				size: 5 ;
				model: (x -> y) ;
				addInteraction: self boxPopup ;
				color: (self colorX: x Y: y) ;
				yourself ] ].
	canvas addAll: shapes.
	RSGridLayout new
		lineItemsCount: (elements size) ;
		gapSize: 1 ;
		on: shapes.
	canvas @RSDraggableCanvas.
	canvas @RSZoomableCanvas.
	^ canvas
]

{ #category : #'as yet unclassified' }
OSDsm3 >> elements: aCollection [
	elements := aCollection.
	dependencies := Dictionary new: aCollection size.
	aCollection do: [ :e |
		dependencies
			at: e
			put: (e queryOutgoingDependencies atScope: FamixHOTService) withoutSelfLoops
	]
]
