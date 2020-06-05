Class {
	#name : #FamixOpenstackFeature,
	#superclass : #FamixOpenstackHotEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#description => FMProperty',
		'#type => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackFeature class >> annotation [

	<FMClass: #Feature super: #FamixOpenstackHotEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixOpenstackFeature >> addConstraint: anObject [
	<generated>
	^ self constraints add: anObject
]

{ #category : #adding }
FamixOpenstackFeature >> addSchema: anObject [
	<generated>
	^ self schemas add: anObject
]

{ #category : #accessing }
FamixOpenstackFeature >> constraints [
	"Relation named: #constraints type: #FamixOpenstackConstraint opposite: #constrainedFeature"

	<generated>
	<derived>
	^ constraints
]

{ #category : #accessing }
FamixOpenstackFeature >> constraints: anObject [

	<generated>
	constraints value: anObject
]

{ #category : #accessing }
FamixOpenstackFeature >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixOpenstackFeature >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #accessing }
FamixOpenstackFeature >> entity [
	"Relation named: #entity type: #FamixOpenstackResourceType opposite: #features"

	<generated>
	^ entity
]

{ #category : #accessing }
FamixOpenstackFeature >> entity: anObject [

	<generated>
	entity := anObject
]

{ #category : #accessing }
FamixOpenstackFeature >> schemas [
	"Relation named: #schemas type: #FamixOpenstackProperty opposite: #parentFeature"

	<generated>
	<derived>
	^ schemas
]

{ #category : #accessing }
FamixOpenstackFeature >> schemas: anObject [

	<generated>
	schemas value: anObject
]

{ #category : #accessing }
FamixOpenstackFeature >> supportStatus [
	"Relation named: #supportStatus type: #FamixOpenstackSupportStatus opposite: #feature"

	<generated>
	^ supportStatus
]

{ #category : #accessing }
FamixOpenstackFeature >> supportStatus: anObject [

	<generated>
	supportStatus := anObject
]

{ #category : #accessing }
FamixOpenstackFeature >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : #accessing }
FamixOpenstackFeature >> type: anObject [
	<generated>
	type := anObject
]
