Class {
	#name : #FamixHOTProperty,
	#superclass : #FamixHOTFeature,
	#instVars : [
		'#default => FMProperty',
		'#immutable => FMProperty',
		'#required => FMProperty',
		'#updateAllowed => FMProperty',
		'#parentResourceType => FMOne type: #FamixHOTResourceType opposite: #properties',
		'#parentFeature => FMOne type: #FamixHOTFeature opposite: #schemas'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTProperty class >> annotation [

	<FMClass: #Property super: #FamixHOTFeature>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTProperty >> default [

	<FMProperty: #default type: #String>
	<generated>
	^ default
]

{ #category : #accessing }
FamixHOTProperty >> default: anObject [
	<generated>
	default := anObject
]

{ #category : #accessing }
FamixHOTProperty >> immutable [

	<FMProperty: #immutable type: #Boolean>
	<generated>
	^ immutable
]

{ #category : #accessing }
FamixHOTProperty >> immutable: anObject [
	<generated>
	immutable := anObject
]

{ #category : #accessing }
FamixHOTProperty >> parentFeature [
	"Relation named: #parentFeature type: #FamixHOTFeature opposite: #schemas"

	<generated>
	<container>
	^ parentFeature
]

{ #category : #accessing }
FamixHOTProperty >> parentFeature: anObject [

	<generated>
	parentFeature := anObject
]

{ #category : #navigation }
FamixHOTProperty >> parentFeatureGroup [
	<generated>
	<navigation: 'ParentFeature'>
	^ MooseGroup with: self parentFeature
]

{ #category : #accessing }
FamixHOTProperty >> parentResourceType [
	"Relation named: #parentResourceType type: #FamixHOTResourceType opposite: #properties"

	<generated>
	<container>
	^ parentResourceType
]

{ #category : #accessing }
FamixHOTProperty >> parentResourceType: anObject [

	<generated>
	parentResourceType := anObject
]

{ #category : #navigation }
FamixHOTProperty >> parentResourceTypeGroup [
	<generated>
	<navigation: 'ParentResourceType'>
	^ MooseGroup with: self parentResourceType
]

{ #category : #printing }
FamixHOTProperty >> printOn: aStream [
	^aStream
		nextPutAll: '(prop.)' ;
		nextPutAll: self name ;
		yourself
]

{ #category : #accessing }
FamixHOTProperty >> required [

	<FMProperty: #required type: #Boolean>
	<generated>
	^ required
]

{ #category : #accessing }
FamixHOTProperty >> required: anObject [
	<generated>
	required := anObject
]

{ #category : #accessing }
FamixHOTProperty >> updateAllowed [

	<FMProperty: #updateAllowed type: #Boolean>
	<generated>
	^ updateAllowed
]

{ #category : #accessing }
FamixHOTProperty >> updateAllowed: anObject [
	<generated>
	updateAllowed := anObject
]
