#import "template.typ": *

#let caratula = (
  title: "Tarea: Lógica Matemática",
  professor: "Dr. Ciro Rodriguez Rodriguez",
  semester: "2023",
  due_time: "17 de setiembre",
  author: "Jesus Stevan Diaz Ingol"
)

#show: documento.with(caratula)
#set math.vec(delim: "[")
#set math.mat(delim: "[")


== Ejercicio 1
Se sabe que únicamente $p$ es verdadero (V), ¿Qué puede afirmarse del valor de verdad de cada una las proposiciones siguientes?

#let cell = rect.with(
  inset: 12pt,
  fill: rgb("e4e5ea"),
  width: 100%,
  radius: 5pt,
)
#set grid(rows: auto, gutter: 11.7pt)

#grid(columns: 2,
  cell[
  *$p or s arrow (q and not p)$*\ \
  $"V " or s arrow (q and not "V ")$\
  $"V " arrow "F "$\
  $therefore "F "$
  ],
  cell[
  *$q and not p arrow r and q$*\ \
  $q and "F " arrow r and q$\
  $"F " arrow r and q$\
  $therefore"V "$
  ]
)

#grid(columns: (15%, 18%, 20%, 17%, 20%),
  cell[
  *$p and q$*\ \
  $"V " and q$\
  $therefore q$
  ],
  cell[
  *$r or p$*\ \
  $r or "V "$\
  $therefore"V "$
  ],
  cell[
  *$r and p$*\ \
  $r and "V "$\
  $therefore r$
  ],
  cell[
  *$r arrow p$*\ \
  $r arrow "V "$\
  $therefore"V "$
  ],
  cell[
  *$p arrow q$*\ \
  $"V " arrow q$\
  $therefore q$
  ],
  cell[
  *$s or not p$*\ \
  $s or not "V "$\
  $therefore s$
  ],
  cell[
  *$p arrow p or s$*\ \
  $"V " arrow "V " or s$\
  $"V " arrow "V "$\
  $therefore"V "$
  ],
  cell[
  *$not p arrow q and r$*\ \
  $not "V " arrow q and r$\
  $therefore"V "$
  ],
  cell[
  *$s arrow not p$*\ \
  $s arrow not "V "$\
  $therefore not s$
  ],
  cell[
  *$r arrow (s arrow p)$*\ \
  $r arrow (s arrow "V ")$\
  $r arrow "V "$\
  $therefore"V "$
  ],
)


#pagebreak()

#set table(inset: 10pt, align: horizon)

== Ejercicio 2
Determinar cuáles de las siguientes proposiciones son tautologías:

#align(center)[

$p and q arrow p and r$
#table(
  columns: 6,
  [$p$], [$q$], [$p and q$], [$r$], [$p and r$], [$p and q arrow p and r$],
  [V], [V], [V], [V], [V], [V],
  [V], [V], [V], [F], [F], [F],
  [V], [F], [F], [V], [V], [V],
  [V], [F], [F], [F], [F], [V],
  [F], [V], [F], [V], [F], [V],
  [F], [V], [F], [F], [F], [V],
  [F], [F], [F], [V], [F], [V],
  [F], [F], [F], [F], [F], [V],
)
La proposición NO es una tautología. \ \

$p arrow p and q$
#table(
  columns: 4,
  [$p$], [$q$], [$p and q$], [$p arrow p and q$],
  [V], [V], [V], [V],
  [V], [F], [F], [F],
  [F], [V], [F], [V],
  [F], [F], [F], [V],
)
La proposición NO es una tautología. \ \

#pagebreak()

$p and not(q or p)$
#table(
  columns: 5,
  [$p$], [$q$], [$q or p$], [$not(q or p)$], [$p and not(q or p)$],
  [V], [V], [V], [F], [F],
  [V], [F], [V], [F], [F],
  [F], [V], [V], [F], [F],
  [F], [F], [F], [V], [F],
)
La proposición NO es una tautología. \ \

$(p arrow (q or not p)) arrow not q$
#table(
  columns: 7,
  [$p$], [$q$], [$not p$], [$q or not p$], [$p arrow (q or not p)$], [$not q$], [$(p arrow (q or not p)) arrow not q$],
  [V], [V], [F], [V], [V], [F], [F],
  [V], [F], [F], [F], [F], [V], [V],
  [F], [V], [V], [V], [V], [F], [F],
  [F], [F], [V], [V], [V], [V], [V],
)
La proposición NO es una tautología. \ \

$(p arrow q) arrow (not q arrow p)$
#table(
  columns: 6,
  [$p$], [$q$], [$p arrow q$], [$not q$], [$not q arrow p$], [$(p arrow q) arrow (not q arrow p)$],
  [V], [V], [V], [F], [V], [V],
  [V], [F], [F], [V], [V], [V],
  [F], [V], [V], [F], [V], [V],
  [F], [F], [V], [V], [F], [F],
)
La proposición NO es una tautología. \ \

#pagebreak()

$(p arrow.l.r q) and (p and not q)$
#table(
  columns: 6,
  [$p$], [$q$], [$p arrow.l.r q$], [$not q$], [$p and not q$], [$(p arrow.l.r q) and (p and not q)$],
  [V], [V], [V], [F], [F], [F],
  [V], [F], [F], [V], [V], [F],
  [F], [V], [F], [F], [F], [F],
  [F], [F], [V], [V], [F], [F],
)
La proposición NO es una tautología. \ \

$p and not ((p or q) or r)$
#table(
  columns: 7,
  [$p$], [$q$], [$p or q$], [$r$], [$p or q or r$], [$not (p or q or r)$], [$p and not (p or q or r)$],
  [V], [V], [V], [V], [V], [F], [F],
  [V], [V], [V], [F], [V], [F], [F],
  [V], [F], [V], [V], [V], [F], [F],
  [V], [F], [V], [F], [V], [F], [F],
  [F], [V], [V], [V], [V], [F], [F],
  [F], [V], [V], [F], [V], [F], [F],
  [F], [F], [F], [V], [V], [F], [F],
  [F], [F], [F], [F], [F], [V], [F],
)
La proposición NO es una tautología. \ \

#pagebreak()

$p or (not p or r)$
#table(
  columns: 5,
  [$p$], [$not p$], [$r$], [$not p or r$], [$p or (not p or r)$],
  [V], [F], [V], [V], [V],
  [V], [F], [F], [F], [V],
  [F], [V], [V], [V], [V],
  [F], [V], [F], [V], [V],
)
La proposición SÍ es una tautología. \ \

]
