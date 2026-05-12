
// This is the portrait long report typst template

#let pdf(
  title: none,
  subtitle: none,
  author: none,
  timeframe: none,
  program: none,
  department: none,
  cols: 1,
  margin: (x: 0.5in,
           top: 1.35in,
           bottom: 1in),
  paper: "us-letter",
  font: "Arial",
  fontsize: 11pt,
  title_font: "Trade Gothic Next Rounded",
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  sectionnumbering: none,
  doc,
) = {

  // establish basics about the page ----
  set page(paper: paper,
           margin: margin,
           numbering: "1 of 1",
           header: context {

           // page 1 of the report
           if counter(page).get().first() > 1 [

                // title
                #place(top + right,
                       dx: 0.25in,
                       dy: 0.1in,
                       block(width: 3.75in,
                             height: 0.9in,
                             inset: 0.1in)[
                         #text(size: 16pt,
                               fill: rgb("000000"),
                               font: title_font,
                               top-edge: "cap-height",
                               bottom-edge: "baseline",
                               align(right + horizon, title))])

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
           footer: context {

           if counter(page).get().first() > 1 [
              // set colored bar ----
              #place(bottom + center,
                  dx: 0in,
                  dy: 0in,
                  rect(fill: rgb("38939b"),
                       width: 8.5in,
                       height: 0.5in))

              // add department name ----
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

                ]},
            background: context {

               if counter(page).get().first() > 1 [

                   #place(center + top,
                          dx: 0in,
                          dy: 1.05in,
                          rect(width: 8.5in,
                               height: 0.1in,
                               fill: rgb("38939b")))

           ]}
      )

  // make title page

  set par(leading: 10pt)

  // place title at the top of the page
  place(top + center,
        dx: 0in,
        dy: -0.6in,
        block(width: 7in,
              height: 1.2in)[
              #text(weight: "bold",
                   size: 40pt,
                   fill: rgb("000000"),
                   font: title_font,
                   top-edge: "cap-height",
                   bottom-edge: "baseline",
                   align(center + horizon, title))])

  if author != none {

      place(top + center,
            dx: 0in,
            dy: .45in,
            block(width: 7in,
                  height: 1in)[
                  #text(weight: "bold",
                       size: 24pt,
                       fill: rgb("000000"),
                       font: title_font,
                       top-edge: "cap-height",
                       bottom-edge: "baseline",
                       align(center + horizon, subtitle))])

      place(top + center,
            dx: 0in,
            dy: 1.45in,
            block(width: 7in,
                  height: 1in)[
                  #text(size: 14pt,
                       fill: rgb("000000"),
                       font: title_font,
                       top-edge: "cap-height",
                       bottom-edge: "baseline",
                       align(center + horizon, author))])

  } else {

       place(top + center,
          dx: 0in,
          dy: .8in,
          block(width: 7in,
                height: 1in)[
                #text(weight: "bold",
                     size: 24pt,
                     fill: rgb("000000"),
                     font: title_font,
                     top-edge: "cap-height",
                     bottom-edge: "baseline",
                     align(center + horizon, subtitle))])

  }

  // top border of image -----
  place(top + left,
        dx: -0.5in,
        dy: 2.28in, // this should be 0.22in higher than the main image
        image("images/title-teal-border.png",
              width: 8.5in))

  // main image -----
  place(top + left,
        dx: -0.5in,
        dy: 2.5in,
        image("images/placeholder-title-image.jpg",
              width: 8.5in))

  // bottom border of image ----
  place(top + left,
        dx: -0.5in,
        dy: 7.1in,
        image("images/title-teal-border.png",
              width: 8.5in))


  // SMC logo -----
  place(bottom + left,
        dx: -0.15in,
        dy: 0.15in,
        image("images/example-logo.png",
              width: 3in))
  place(bottom + left,
        dx: -0.15in,
        dy: 0.5in,
        text(size: 20pt,
             weight: "bold",
             fill: rgb("006cb6"),
             font: title_font,
             top-edge: "cap-height",
             bottom-edge: "baseline",
             align(left, department)))

  // report date ----
  place(bottom + right,
        dx: -0.15in,
        dy: 0.5in,
        text(size: 20pt,
             weight: "bold",
             fill: rgb("000000"),
             font: title_font,
             top-edge: "cap-height",
             bottom-edge: "baseline",
             align(right, timeframe)))

  // add table of contents ---
  pagebreak()

    if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }

    set text(font: font)

    block(above: 0em, below: 2em)[
    #outline(
      title: text(toc_title,
                  weight: "bold",
                  size: 14pt,
                  font: font),
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  pagebreak()


  // this is where you format the headings (##) from quarto ----
  // level 2 ----
  show heading.where(level:1): set text(weight: "bold",
                                        size: 14pt,
                                        fill: rgb("000000"),
                                        font: font,
                                        top-edge: "ascender",
                                        bottom-edge: "descender")

  // level 3 (same as level 2 but centered) ----
  show heading.where(level:2): set text(weight: "bold",
                                        size: 14pt,
                                        fill: rgb("000000"),
                                        font: font,
                                        top-edge: "ascender",
                                        bottom-edge: "descender")
  show heading.where(level:2): set align(center)

  // level 3 ----
  show heading.where(level:4): set text(size: 9pt,
                                        font: font,
                                        weight: "thin",
                                        fill: rgb("595959"),
                                        top-edge: "cap-height",
                                        bottom-edge: "baseline")



  // set font and text  things ----
  set par(justify: false,
          leading: 5pt)
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


