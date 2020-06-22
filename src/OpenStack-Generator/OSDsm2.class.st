Class {
	#name : #OSDsm2,
	#superclass : #RTDSM,
	#category : #'OpenStack-Generator'
}

{ #category : #'as yet unclassified' }
OSDsm2 >> boxPopup [
	^[ :assoc||sourceService targetService resourceDependencies|
		sourceService := assoc key.
		targetService := assoc value.
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
			]
		]
]

{ #category : #'as yet unclassified' }
OSDsm2 >> boxPopup: assoc [
	^ 'blah' -> assoc key

"	|sourceService targetService resourceDependencies|
	sourceService := assoc key.
	targetService := assoc value.
	resourceDependencies := (sourceService queryOutgoingDependencies
		select: [ :dep | ((dep to atScope: FamixHOTService) includes: targetService) ]
		thenCollect: [ :dep | dep from -> dep to ])
			asSet.
	^String streamContents: [ :st |
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
		]"
]

{ #category : #'as yet unclassified' }
OSDsm2 >> colorX: x Y: y [
	| tags |
	(x = y)
		ifTrue: [ ^Color darkGray ].
	(self isAssocDependent: x -> y)
		ifFalse: [ ^Color lightGray lighter ].
	tags := x tags intersection: y tags.
	tags
		ifNotEmpty: [ ^ tags anyOne color ].
	^Color blue				
]

{ #category : #initialization }
OSDsm2 >> initialize [
	super initialize.
	self shape
		color: [ :assoc | self colorX: assoc key Y: assoc value ].
	self interaction popupText: self boxPopup
]

{ #category : #'as yet unclassified' }
OSDsm2 >> labelShape [
	^ super labelShape
		text: [ :model |"|sourceService targetService resourceDependencies|
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
				]" 'blah'] ;
		yourself.
]
