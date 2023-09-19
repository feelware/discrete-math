#import "template.typ": *

#let datos = (
  title: "Título del documento",
  professor: "Dr. Ciro Rodríguez Rodríguez",
  author: "Jesus Stevan Diaz Ingol"
)

#show: documento.with(datos)