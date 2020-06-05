Class {
	#name : #FamixHOTFeature,
	#superclass : #FamixHOTHotEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#description => FMProperty',
		'#type => FMProperty',
		'#supportStatus => FMOne type: #FamixHOTSupportStatus opposite: #feature',
		'#constraints => FMMany type: #FamixHOTConstraint opposite: #constrainedFeature',
		'#entity => FMOne type: #FamixHOTResourceType opposite: #features',
		'#schemas => FMMany type: #FamixHOTProperty opposite: #parentFeature'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTFeature class >> annotation [

	<FMClass: #Feature super: #FamixHOTHotEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixHOTFeature >> addConstraint: anObject [
	<generated>
	^ self constraints add: anObject
]

{ #category : #adding }
FamixHOTFeature >> addSchema: anObject [
	<generated>
	^ self schemas add: anObject
]

{ #category : #accessing }
FamixHOTFeature >> constraints [
	"Relation named: #constraints type: #FamixHOTConstraint opposite: #constrainedFeature"

	<generated>
	<derived>
	^ constraints
]

{ #category : #accessing }
FamixHOTFeature >> constraints: anObject [

	<generated>
	constraints value: anObject
]

{ #category : #accessing }
FamixHOTFeature >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixHOTFeature >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #accessing }
FamixHOTFeature >> entity [
	"Relation named: #entity type: #FamixHOTResourceType opposite: #features"

	<generated>
	^ entity
]

{ #category : #accessing }
FamixHOTFeature >> entity: anObject [

	<generated>
	entity := anObject
]

{ #category : #accessing }
FamixHOTFeature >> schemas [
	"Relation named: #schemas type: #FamixHOTProperty opposite: #parentFeature"

	<generated>
	<derived>
	^ schemas
]

{ #category : #accessing }
FamixHOTFeature >> schemas: anObject [

	<generated>
	schemas value: anObject
]

{ #category : #accessing }
FamixHOTFeature >> supportStatus [
	"Relation named: #supportStatus type: #FamixHOTSupportStatus opposite: #feature"

	<generated>
	^ supportStatus
]

{ #category : #accessing }
FamixHOTFeature >> supportStatus: anObject [

	<generated>
	supportStatus := anObject
]

{ #category : #accessing }
FamixHOTFeature >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : #accessing }
FamixHOTFeature >> type: anObject [
	<generated>
	type := anObject
]
