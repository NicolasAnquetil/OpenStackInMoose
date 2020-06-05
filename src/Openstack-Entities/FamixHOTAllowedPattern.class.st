Class {
	#name : #FamixHOTAllowedPattern,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#pattern => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTAllowedPattern class >> annotation [

	<FMClass: #AllowedPattern super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTAllowedPattern >> pattern [

	<FMProperty: #pattern type: #String>
	<generated>
	^ pattern
]

{ #category : #accessing }
FamixHOTAllowedPattern >> pattern: anObject [
	<generated>
	pattern := anObject
]
