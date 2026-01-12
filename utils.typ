#let rubik-colors = (
  D: rgb(242, 242, 242, 200),   // blanco
  U: rgb(255, 217,  26, 200),   // amarillo
  L: rgb(204,  26,  26, 200),   // rojo
  R: rgb(255, 128,   0, 200),   // naranja
  B: rgb( 26,  77, 204, 200),   // azul
  F: rgb(  0, 153,  77, 200),   // verde
)

#let solved-cube = (
  U: range(1,9),
  L: range(9,17),
  F: range(17,25),
  R: range(25,33),
  B: range(33,41),
  D: range(41,49)
)

#let get-color(i) = {
  if (type(i) == str) {
    return rubik-colors.at(i)
  } else if (type(i) == int) {
    return (
      (i < 9, rubik-colors.U),
      (i < 17, rubik-colors.L),
      (i < 25, rubik-colors.F),
      (i < 33, rubik-colors.R),
      (i < 41, rubik-colors.B),
      (i < 49, rubik-colors.D),
    ).find(t => t.at(0)).at(1)
  }
}

#let bloque(nums, centro, size, display-numbers, color-function: get-color) = block(stroke: 1pt, breakable: false)[
  #table(
    columns: (size,)*3,
    rows: (size,),
    inset: 0pt,
    stroke:0.8pt,
    align: center + horizon,
    ..(0,1,2,7,-1,3,6,5,4).map(i => {
      let num
      if i >= 0 {
        num = nums.at(i)
      } else {
        num = centro
      }
      let col = color-function(num)
      if not display-numbers and type(num) != str {num=""}
      return table.cell(fill: col)[$num$]
    }),
)]

#let vacio = []

#let cube-numbering-diagram(
  cube: solved-cube,
  size: 2em,
  color-function: get-color,
  display-numbers: true
) = block(breakable: false)[
  #table(
    columns: 4,
    rows: 3,
    gutter: 0pt,
    stroke: none,
    inset: 0pt,
    
    // fila 1
    vacio, bloque(cube.U, "U", size, display-numbers, color-function: color-function), vacio, vacio,
    // fila 2
    ..("L", "F", "R", "B").map(i => 
      bloque(cube.at(i), i, size, display-numbers,color-function: color-function)
    ),
    // fila 3
    vacio, bloque(cube.D, "D", size, display-numbers,color-function: color-function)
  )
]

#let rotate-face(face) = (
  ..(6,7,0,1,2,3,4,5).map(i => face.at(i))
)

#let u(cube: solved-cube) = {
  let new = cube

  // rotar la cara U
  new.U = rotate-face(cube.U)

  // guardar tiras superiores
  let L = cube.L.slice(0, 3)
  let F = cube.F.slice(0, 3)
  let R = cube.R.slice(0, 3)
  let B = cube.B.slice(0, 3)

  // ciclo L -> B -> R -> F -> L
  new.B = (..L, ..cube.B.slice(3))
  new.R = (..B, ..cube.R.slice(3))
  new.F = (..R, ..cube.F.slice(3))
  new.L = (..F, ..cube.L.slice(3))

  new
}

#let l(cube: solved-cube) = {
  let new = cube
  new.L = rotate-face(cube.L)

  let U = (cube.U.at(0), cube.U.at(6), cube.U.at(7))
  let B = cube.B.slice(2,5)
  let D = (cube.D.at(0), cube.D.at(7), cube.D.at(6))
  let F = (cube.F.at(0), cube.F.at(6), cube.F.at(7))

  // D -> B -> U -> F
  new.B = (..cube.B.slice(0,2), ..D, ..cube.B.slice(5))
  new.D = (F.at(0), ..cube.D.slice(1,6), ..F.slice(1))
  new.F = (U.at(0), ..cube.F.slice(1,6), ..U.slice(1))
  new.U = (B.at(0), ..cube.U.slice(1,6), ..B.slice(1))

  new
}

#let d(cube: solved-cube) = {
  let new = cube

  new.D = rotate-face(cube.D)

  let L = cube.L.slice(4, 7)
  let F = cube.F.slice(4, 7)
  let R = cube.R.slice(4, 7)
  let B = cube.B.slice(4, 7)

  // ciclo L -> F -> R -> B
  new.B = (..cube.B.slice(0,4), ..R, cube.B.at(7))
  new.R = (..cube.R.slice(0,4), ..F, cube.R.at(7))
  new.F = (..cube.F.slice(0,4), ..L, cube.F.at(7))
  new.L = (..cube.L.slice(0,4), ..B, cube.L.at(7))

  new
}

#let r(cube: solved-cube) = {
  let new = cube
  new.R = rotate-face(cube.R)

  let U = cube.U.slice(2, 5)
  let B = (cube.B.at(6), cube.B.at(7), cube.B.at(0))
  let F = cube.F.slice(2, 5)
  let D = cube.D.slice(2, 5)

  // D -> F -> U -> B
  new.B = (U.last(), ..cube.B.slice(1,6), ..U.slice(0,2))
  new.D = (..cube.D.slice(0,2), ..B, ..cube.D.slice(5))
  new.F = (..cube.F.slice(0,2), ..D, ..cube.F.slice(5))
  new.U = (..cube.U.slice(0,2), ..F, ..cube.U.slice(5))

  new
}

#let f(cube: solved-cube) = {
  let new = cube

  new.F = rotate-face(cube.F)

  let L = cube.L.slice(2, 5)
  let U = cube.U.slice(4, 7)
  let R = (cube.R.at(6), cube.R.at(7), cube.R.at(0))
  let D = cube.D.slice(0, 3)

  // ciclo L -> U -> R -> D
  new.U = (..cube.U.slice(0,4), ..L, ..cube.U.slice(7))
  new.R = (U.last(), ..cube.R.slice(1,6), ..U.slice(0,2))
  new.D = (..R, ..cube.D.slice(3))
  new.L = (..cube.L.slice(0, 2), ..D, ..cube.L.slice(5))

  new
}

#let b(cube: solved-cube) = {
  let new = cube

  new.B = rotate-face(cube.B)

  let L = (cube.L.at(6), cube.L.at(7), cube.L.at(0))
  let U = cube.U.slice(0, 3)
  let R = cube.R.slice(2, 5)
  let D = cube.D.slice(4, 7)

  // ciclo L -> D -> R -> U
  new.U = (..R, ..cube.U.slice(3))
  new.R = (..cube.R.slice(0,2), ..D, ..cube.R.slice(5))
  new.D = (..cube.D.slice(0,4), ..L, cube.D.at(-1))
  new.L = (U.at(2), ..cube.L.slice(1,6), ..U.slice(0,2))

  new
}

#let moves = (
  D: d,
  U: u,
  L: l,
  R: r,
  B: b,
  F: f,
)

#let alg(alg, cube: solved-cube) = {
  let c = cube
  for i in alg.split(" ") {
    if i != "" and i != " "{
      c = moves.at(i)(cube: c)
    }
  }
  c
}

#set page(width: auto, height: auto)
#let c = solved-cube
#let i = 0
#let algoritmo = "R U R R R U U U"

#while true {
  [#i]
  cube-numbering-diagram(cube: c)
  c = alg(cube: c, algoritmo)
  pagebreak()
  i+=1
  if c == solved-cube {
    break
  }
}
$o(\"#algoritmo\")=#i$
#cube-numbering-diagram(cube: c)
