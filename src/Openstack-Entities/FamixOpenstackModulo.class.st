Class {
	#name : #FamixOpenstackModulo,
	#superclass : #FamixOpenstackConstraint,
	#instVars : [
		'#step => FMProperty',
		'#offset => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackModulo class >> annotation [

	<FMClass: #Modulo super: #FamixOpenstackConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackModulo >> offset [

	<FMProperty: #offset type: #Number>
	<generated>
	^ offset
]

{ #category : #accessing }
FamixOpenstackModulo >> offset: anObject [
	<generated>
	offset := anObject
]

{ #category : #accessing }
FamixOpenstackModulo >> step [

	<FMProperty: #step type: #Number>
	<generated>
	^ step
]

{ #category : #accessing }
FamixOpenstackModulo >> step: anObject [
	<generated>
	step := anObject
]
