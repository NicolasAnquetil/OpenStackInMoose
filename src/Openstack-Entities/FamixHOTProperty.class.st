Class {
	#name : #FamixHOTProperty,
	#superclass : #FamixHOTFeature,
	#instVars : [
		'#default => FMProperty',
		'#immutable => FMProperty',
		'#required => FMProperty',
		'#update_allowed => FMProperty',
		'#parentResource => FMOne type: #FamixHOTResourceType opposite: #properties',
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
	^ parentFeature
]

{ #category : #accessing }
FamixHOTProperty >> parentFeature: anObject [

	<generated>
	parentFeature := anObject
]

{ #category : #accessing }
FamixHOTProperty >> parentResource [
	"Relation named: #parentResource type: #FamixHOTResourceType opposite: #properties"

	<generated>
	<container>
	^ parentResource
]

{ #category : #accessing }
FamixHOTProperty >> parentResource: anObject [

	<generated>
	parentResource := anObject
]

{ #category : #navigation }
FamixHOTProperty >> parentResourceGroup [
	<generated>
	<navigation: 'ParentResource'>
	^ MooseGroup with: self parentResource
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
FamixHOTProperty >> update_allowed [

	<FMProperty: #update_allowed type: #Boolean>
	<generated>
	^ update_allowed
]

{ #category : #accessing }
FamixHOTProperty >> update_allowed: anObject [
	<generated>
	update_allowed := anObject
]
