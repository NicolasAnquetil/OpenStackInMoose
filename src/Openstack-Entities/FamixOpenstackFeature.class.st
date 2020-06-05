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
