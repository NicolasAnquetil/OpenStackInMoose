Class {
	#name : #FamixHOTAllowedValues,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#allowed => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTAllowedValues class >> annotation [

	<FMClass: #AllowedValues super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTAllowedValues >> allowed [

	<FMProperty: #allowed type: #Object>
	<generated>
	<multivalued>
	^ allowed
]

{ #category : #accessing }
FamixHOTAllowedValues >> allowed: anObject [
	<generated>
	allowed := anObject
]
