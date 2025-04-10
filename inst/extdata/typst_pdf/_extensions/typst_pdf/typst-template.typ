
// This is an example typst template

#let pdf(
  title: none,
  author: none,
  timeframe: none,
  program: none,
  cols: 1,
  department: "Department name",
  margin: (x: 0.5in,
           top: 1.15in,
           bottom: 1in),
  paper: "us-letter",
  font: "Arial",
  fontsize: 11pt,
  title_font: "Trade Gothic Next Rounded",
  sectionnumbering: none,
  doc,
) = {

  // establish basics about the page ----
  set page(paper: paper,
           margin: margin,
           numbering: "1 of 1",
           header: context {

           // page 1 of the report
           if counter(page).get().first() == 1 [

                // logo
                #place(top + right,
                       dx: 0.3in,
                       dy: 0.3in,
                       image("images/example-logo.png",
                            width: 1.8in))

                // program + timeframe
                #place(top + left,
                      dx: -0.1in,
                      dy: 0.4in,
                      stack(dir: ttb,
                      block(width: 3.75in,
                         height: 0.25in)[
                         #text(size: 14pt,
                               fill: rgb("000000"),
                               font: title_font,
                               top-edge: "cap-height",
                               bottom-edge: "descender",
                               align(left, program))],
                      block(width: 3.75in,
                         height: 0.25in)[
                         #text(size: 14pt,
                               fill: rgb("000000"),
                               font: title_font,
                               top-edge: "cap-height",
                               bottom-edge: "descender",
                               align(left, timeframe))]))
               ] else [

                // title
                #place(top + right,
                       dx: 0.3in,
                       dy: 0.3in,
                       block(width: 5in,
                            height: 0.25in,
                            inset: 0.1in)[
                         #text(size: 16pt,
                               fill: rgb("000000"),
                               font: title_font,
                               top-edge: "cap-height",
                               bottom-edge: "descender",
                               align(right, title))])

                #place(top + left,
                      dx: -0.1in,
                      dy: 0.4in,
                      stack(dir: ttb,
                      block(width: 3.75in,
                         height: 0.25in)[
                         #text(size: 14pt,
                               fill: rgb("000000"),
                               font: title_font,
                               top-edge: "cap-height",
                               bottom-edge: "descender",
                               align(left, program))],
                      block(width: 3.75in,
                         height: 0.25in)[
                         #text(size: 14pt,
                               fill: rgb("000000"),
                               font: title_font,
                               top-edge: "cap-height",
                               bottom-edge: "descender",
                               align(left, timeframe))]))
               ]},
           footer: context [
              // set colored bar ----
              #place(bottom + center,
                  dx: 0in,
                  dy: 0in,
                  rect(fill: rgb("38939b"),
                       width: 8.5in,
                       height: 0.5in))

              // add OEE name ----
              #place(bottom + left,
                      dx: -0.4in,
                      dy: -0.05in,
                      block(width: 5in,
                            height: 0.5in,
                            inset: 0.1in)[
                                #text(weight: "bold",
                                      size: 14pt,
                                      fill: rgb("fefefe"),
                                      font: title_font,
                                      top-edge: "cap-height",
                                      bottom-edge: "descender")[#department]])

               // add page counter ----
               #set text(size: 11pt,
                         fill: rgb("fefefe"),
                         font: title_font,
                         top-edge: "cap-height",
                         bottom-edge: "descender")
               #place(bottom + right,
                      dx: 0in,
                      dy: -0.18in,
                      counter(page).display("1 of 1", both: true))

                ],
            background: context {

               if counter(page).get().first() > 1 [

                   #place(center + top,
                          dx: 0in,
                          dy: 0.95in,
                          rect(width: 8.5in,
                               height: 0.1in,
                               fill: rgb("38939b")))

           ]}
      )


  // set rectangles for the page ----
   place(center + top,
      dx: 0in,
      dy: -0.1in,
      clearance: 10pt,
      block(width: 8.5in,
          height: 0.5in,
          inset: 0.08in,
          fill: rgb("38939b"))[#text(size: 20pt,
            fill: rgb("fefefe"),
            font: title_font,
            top-edge: "ascender",
            bottom-edge: "descender",
            align(center, title))])

  linebreak()
  linebreak()

  if author != none {

     text(size: fontsize,
          font: font,
          fill: rgb("000000"),
          top-edge: "cap-height",
          bottom-edge: "baseline",
          align(center, author))

  }

  // this is where you format the headings (##) from quarto ----
  // level 2 ----
  show heading.where(level:1): set text(weight: "bold",
                                        size: 14pt,
                                        fill: rgb("000000"),
                                        font: font,
                                        top-edge: "ascender",
                                        bottom-edge: "descender")

  // level 3 ----
  show heading.where(level:2): set text(weight: "bold",
                                        size: 13pt,
                                        fill: rgb("000000"),
                                        font: font,
                                        top-edge: "ascender",
                                        bottom-edge: "descender")

  // level 3 ----
  show heading.where(level:4): set text(size: 9pt,
                                        font: font,
                                        weight: "thin",
                                        fill: rgb("595959"),
                                        top-edge: "cap-height",
                                        bottom-edge: "baseline")



  // set font and text  things ----
  set par(justify: false,
          leading: 0.5em)
  set text(font: font,
           size: fontsize)

  show link: set text(fill: blue)
  show link: underline




  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}


