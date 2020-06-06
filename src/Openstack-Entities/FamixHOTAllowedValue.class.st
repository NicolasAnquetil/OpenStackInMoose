Class {
	#name : #FamixHOTAllowedValue,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#allowed => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTAllowedValue class >> annotation [

	<FMClass: #AllowedValue super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTAllowedValue >> allowed [

	<FMProperty: #allowed type: #String>
	<generated>
	<multivalued>
	^ allowed
]

{ #category : #accessing }
FamixHOTAllowedValue >> allowed: anObject [
	<generated>
	allowed := anObject
]
