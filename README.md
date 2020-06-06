# OpenStackInMoose
Experiment to handle OpenStack description in Moose

One can create a small, example model with: ```OSAbstractTest new createExampleModel.```


The manually created metamodel is the following (created with plantUML):
![Complete MetaModel for OpenStack](doc/mmManual.png)

The implemented metamodel is the following (there are a few slight differences).
Because they are generated from the actual metamodel, placing is not ideal, therefore the whole metamodel has been devided in parts. some central entites (e.g. ```Feature```) appear in several of these parts.

The top, named, entities of the metamodel:
![Top, named, entities](doc/namedHOT.png)

Core part of the metamodel
![Core part](doc/coreHOT.png)


Detailed view of the ```Feature```s, i.e. ```Attribute``` and ```Propertie``` : 
![Detailed view of Features](doc/resourceTypeHOT.png)

And, finally, detailed view of the ```Constraints```:
![Detailed bview of Constraints](doc/constraintHOT.png)
