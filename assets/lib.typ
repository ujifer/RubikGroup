#import "@preview/headcount:0.1.0": *
#import "@preview/great-theorems:0.1.0": *

#let inv(expression) = $(expression)^(-1)$
#let iff = $<==>$
#let langle = $chevron.l$
#let rangle = $chevron.r$

#let math-counter = counter("declaraciones")
#let teorema = mathblock(
  blocktitle: "Teorema",
  counter: math-counter,
  numbering: dependent-numbering("1.1")
)

#let def = mathblock(
  blocktitle: "Definición",
  counter: math-counter,
  numbering: dependent-numbering("1.1")
)

#let demo = proofblock(
  blocktitle: "Demostración"
)

#let prop = mathblock(
  blocktitle: "Proposición",
  counter: math-counter,
  numbering: dependent-numbering("1.1")
)

#let lema = mathblock(
  blocktitle: "Lema",
  counter: math-counter,
  numbering: dependent-numbering("1.1")
)

#let nota(body, breakable: false) = block(
  inset: 1em,
  stroke: 1pt + gray,
  radius: 0pt,
  width: 100%,
  breakable: breakable
)[
  *Nota:* #body
]

#let aviso(body) = {
  set text(size: 18pt, fill: red)
  body
}

#let document-init(body) = {
  set heading(numbering: "1.1.", )
  set page(paper: "a4", margin: 2cm)
  set par(justify: true)
  set text(lang: "es", size: 14pt)
  show title: set text(hyphenate: false, size: 34pt)
  show title: set align(center)
  show heading: reset-counter(math-counter)
  show: great-theorems-init
  show heading: it => {
    it
    v(.25em)
  }
  body
}