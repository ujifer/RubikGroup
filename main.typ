#import "@local/math:1.0.0": *
#import "utils.typ": *

#show: document-init
#set page(numbering: none)

// --- Bibliografía ---
#let bibfile = "refs.bib"

// =========================
// Portada
// =========================
#align(center)[
  #v(2em)
  #image("assets/uji.png", height: 4em)

  #v(1fr)
  #title("El Cubo de Rubik como Grupo de Permutaciones")
  \
  *Asignatura:* Álgebra Abstracta (MT1025)

  *Autores:* Ferran Martinavarro, Alejandro Navarro
  
  *Fecha:* #datetime.today().display("[day]/[month]/[year]")
  #v(1fr)
]

#pagebreak()
#set page(numbering: "1.")
#counter(page).update(1)
// =========================
// Índice
// =========================
#outline(depth: 2)

#pagebreak()
#include "sections/01-Introduccion.typ"
#include "sections/02-Preliminares.typ"
#include "sections/03-GrupoRubik.typ"
#include "sections/04-SubgruposAcciones.typ"
#include "sections/05-RestriccionesEstructurales.typ"
#include "sections/06-CalculoOrden.typ"

= Conclusiones

Quiero dormir, he caído en la locura.

// =========================
// Bibliografía
// =========================
#block[
  #set text(size: 0pt)
@navarro2016
@puzzle_generator_cube
]

#pagebreak()
= Bibliografía

#bibliography(bibfile, title: none)

