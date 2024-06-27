Instance: taisukef
InstanceOf: Patient
Usage: #example
* meta.profile = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient"
* name[0].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #IDE
* name[=].use = #usual
* name[=].text = "福野 泰介"
* name[=].family = "福野"
* name[=].given = "泰介"
* name[+].extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension.valueCode = #SYL
* name[=].use = #usual
* name[=].text = "フクノ タイスケ"
* name[=].family = "フクノ"
* name[=].given = "タイスケ"
* gender = #male
* birthDate = "1978-11-08"
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-religion"
* extension[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ReligiousAffiliation#1046 "Shinto"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/patient-birthPlace"
* extension[=].valueAddress.state = "東京"
* extension[+].url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race"
* extension[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-Race#2039-6 "Japanese"
