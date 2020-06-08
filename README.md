# OpenStackInMoose
Experiment to handle OpenStack description in Moose

## Example

One can create a small, example model with: ```OSAbstractTest new createExampleModel.```

## UML

The manually created metamodel is the following (created with plantUML):

<img src="doc/mmManual.png" alt="Complete MetaModel for OpenStack"/>

The implemented metamodel is the following (there are a few slight differences).
Because they are generated from the actual metamodel, placing is not ideal, therefore the whole metamodel has been devided in parts. some central entites (e.g. ```Feature```) appear in several of these parts.

The top, named, entities of the metamodel:

<img src="doc/mmNamed.png" alt="Top, named, entities" width="260"/>

Core part of the metamodel

<img alt="Core part" src="doc/mmCore.png" width="400"/>

Detailed view of the ```Feature```s, i.e. ```Attribute``` and ```Propertie``` : 

<img alt="Detailed view of Features" src="doc/mmResourceType.png" width="310"/>

And, finally, detailed view of the ```Constraints```:

<img alt="Detailed bview of Constraints" src="doc/mmConstraint.png" width="580"/>
