Class {
	#name : #FamixHOTModulo,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#step => FMProperty',
		'#offset => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTModulo class >> annotation [

	<FMClass: #Modulo super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTModulo >> offset [

	<FMProperty: #offset type: #Number>
	<generated>
	^ offset
]

{ #category : #accessing }
FamixHOTModulo >> offset: anObject [
	<generated>
	offset := anObject
]

{ #category : #accessing }
FamixHOTModulo >> step [

	<FMProperty: #step type: #Number>
	<generated>
	^ step
]

{ #category : #accessing }
FamixHOTModulo >> step: anObject [
	<generated>
	step := anObject
]
