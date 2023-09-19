#let meses = ("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")

#let autosize_title(original, size) = {
  let new = ""
  let i = 0
  for char in original {
    new += char
    i += 1
    if char == " " and i == size {
      new += "\n"
      i = 0
    }
  }
  return new
}

#let separator(h) = { block(height: h, fill: none) }

#let documento(head, body) = {
  set document(title: head.title, author: head.author)
  set page(
    paper:"us-letter", 
    footer: locate(loc => {
      let page_number = counter(page).at(loc).first()
      let total_pages = counter(page).final(loc).last()
      align(center)[Página #page_number de #total_pages]
    })
  )

  // options
  show math.equation: set text(weight: 400)
  set par(justify: true)
  set text(10pt, hyphenate: false)
  
  // header
  align(center)[
    Escuela Profesional de Ingeniería de Software. *UNMSM*
    #separator(20%)
    #image("img/unmsm.svg", width: 25%) \

    #text(size: 17pt)[*#autosize_title(head.title, 27)*]

    #head.professor

    #text(style: "italic")[
      #datetime.today().day() de #meses.at(datetime.today().month()-1) del #datetime.today().year()
    ]

    #separator(15%)

    *#head.author*
  ]

  pagebreak(weak: false)
  body
}
