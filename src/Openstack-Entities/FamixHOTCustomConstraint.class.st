Class {
	#name : #FamixHOTCustomConstraint,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTCustomConstraint class >> annotation [

	<FMClass: #CustomConstraint super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTCustomConstraint >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FamixHOTCustomConstraint >> name: anObject [
	<generated>
	name := anObject
]
