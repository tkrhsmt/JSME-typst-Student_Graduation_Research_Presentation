// ==================================================
//                jsme_style.typ
//
// first version: 2024/11/8   Takeru HASHIMOTO
// ==================================================


// import equate package
#import "@preview/equate:0.2.1": equate

// setting font
#let gothic = ("Harano Aji Gothic")
#let mincho = ("Harano Aji Mincho")
#let english = ("Times New Roman")
#let mathf = ("Latin Modern Math")
#let presen_numf = ("Arial")

//setting font size
#let title_fontsize = 14pt
#let subtitle_fontsize = 12pt
#let text_fontsize = 9.6pt
#let thanks_fontsize = 9.6pt
#let presentation_number_fontsize = 18pt

#let jsme_init(body) = {

  // setting japanese language
  set text(lang: "ja")
  // setting page size
  set page(
    paper:"a4",
    margin: (left: 20mm, right: 20mm, top: 25mm, bottom: 25mm),
    numbering: none,
    number-align: center,
  )

  // setting normal font
  set text(font: (english, mincho), size: text_fontsize, cjk-latin-spacing: auto, weight: 250)
  // setting line spacing
  set par(leading: thanks_fontsize)
  // set heading
  set heading(numbering: "1·1")
  show heading.where(level: 1): it => {// if header level 1 ...
    v(1em)
    set align(center)
    set text(size: text_fontsize, weight: "bold", font: (english, gothic))
    if it.numbering != none{
      counter(heading).display() + [.　]
    }
    else{
      line(length: 100%, stroke: 0pt)
    }
    it.body
    v(0.5em)
  }
  show heading.where(level: 2): it => {// if header level 2 ...
    set align(left)
    v(1em)
    set text(size: text_fontsize, weight: "bold", font: (english, gothic))
    counter(heading).display() + [　]
    it.body
  }
  show heading.where(level: 3): it => {// if header level 3 ...
    set align(left)
    v(1em)
    set text(size: text_fontsize, weight: "bold", font: (english, gothic))
    counter(heading).display() + [　]
    it.body
  }
  // set footnote line
  set footnote.entry(separator: line(length: 100%, stroke: 0.5pt))
  // set enumering style
  set enum(numbering: "　（1）")

  // set table and figure style
  set table(
    stroke: (top: 0.5pt + black, bottom: 0.5pt + black, right: none, left: none),
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    )
  )
  show figure.where(// if figure kind is table ...
    kind: table
  ): set figure.caption(position: top)
  show figure.where(
    kind: table
  ): set figure(supplement: "Table")
  show figure.where(// if figure kind is image ...
    kind: image
  ): set figure(supplement: "Fig.")
  set figure.caption(separator: [　])
  show figure.caption: it => {// if figure caption is image ...
    set text(size: 9.5pt)
    set par(leading: 4.5pt, justify: true)
    grid(
      columns: 2,
      [#it.supplement #it.counter.display()　],
      align(left)[#it.body]
    )
  }
  //setting equation
  set math.equation(numbering: "(1)")// equation numbering
  show math.equation.where(block: true): set align(left)// set block equation align
  show math.equation.where(block: true): it => {// set block equation space
    grid(
      columns: (2em, auto),
      [],it
    )
  }
  set math.equation(numbering: num =>
    "(" + str(num) + ")"
  )
  show math.equation: set block(spacing: 2em)
  // setting ref
  // In reference, set figures and tables to 図 or 表
  set ref(supplement: it=>{
    let body-func = it.body.func()
    if body-func == table{
      [図]
    }else if body-func == image{
      [表]
    }else{
      it.supplement
    }
  })

  //setting footer
  set page(footer: context [
    #v(0.75em)
    #line(length: 100%, stroke: 0.5pt)
])

  //setting strong text
  show strong: set text(font: (english, mincho), weight: "bold")

  body
}

#let jsme_title(
  number: "",
  title: [],
  subtitle: [],
  authors: (),
  english_title: [],
  english_subtitle: [],
  abstruct: [],
  keywords: (),
  email: "",
  body) = {

    //setting document
    set document(author: authors.map(a => a.name), title: title)
    set par(leading: 0.5em)

    //setting title
    set text(font: presen_numf, weight: "regular")
    align(left)[
      #text(size: presentation_number_fontsize, weight: "bold", number)
    ]
    v(-0.75em)
    set text(font: (english, gothic))
    align(center)[
      #text(size: title_fontsize, weight: "bold", title)
    ]
    v(-0.75em)
    align(center)[
      #text(size: subtitle_fontsize, weight: "bold", subtitle)
    ]

    //setting english title
    set text(font: (english, gothic))
    align(center)[
      #text(size: subtitle_fontsize, weight: "bold", english_title)
    ]
    v(-0.75em)
    align(center)[
      #text(size: subtitle_fontsize, weight: "bold", english_subtitle)
    ]
    v(-0.75em)
    set text(font: (english, mincho), size: subtitle_fontsize)
    set align(center)

    //setting authors
    let value = 0
    let input_value = ()
    let input_string = ()
    while value < authors.len(){

      if (authors.at(value).presenter == "発表者"){
        [◯]
      }
      else if (authors.at(value).presenter == "指導教員"){
        [◎]
      }

      if (authors.at(value).post == "学生員"){
        [学　]
      }
      else if (authors.at(value).post == "正員"){
        [正　]
      }

      [#authors.at(value).name]

      let itr = 0
      let check = -1
      while itr < input_value.len(){
        if authors.at(value).thanks == input_string.at(itr){
          check = itr
          break
        }
        itr += 1
      }

      if check == -1{//english_thanksの重複がない場合
          let tmp = input_value.len()
          if input_value.len() != 0{
            tmp = calc.max(input_value.at(0)) + 1
          }
          input_value.push(tmp)
          input_string.push(authors.at(value).thanks)
          [#super("*" + str(tmp+1))，]
      }
      else{//english/thanksに重複がある場合
        let tmp = check
        input_value.push(tmp)
        input_string.push(authors.at(value).thanks)
        [#super("*" + str(tmp+1))，]
      }

      if calc.rem(value+1, 3) == 0 and authors.len()-1 != value{
        linebreak()
      }

      value += 1
    }

    //setting english authors
    //v(0.25em)
    let value = 0
    let foot_value = 0
    set align(center)
    while value < authors.len(){
      set text(size: subtitle_fontsize)
      authors.at(value).english_name
      if (authors.at(value).thanks != "") {
        super("*" + str(input_value.at(foot_value)+1))
        foot_value += 1
      }
      if (value != authors.len()-1) {
        if (value == authors.len()-2) {
          [ and ]
        }
        else{
          [, ]
        }

      }

      if calc.rem(value+1, 3) == 0 and authors.len()-1 != value{//3人以上は改行
        linebreak()
      }

      value = value + 1
    }

    //setting english thanks
    v(-0.5em)
    set text(font: (english, mincho), size: thanks_fontsize)
    let value = 0
    let now_value = -1
    while value < input_value.len(){

      if now_value != input_value.at(value){
        now_value += 1
        super("*" + str(input_value.at(value)+1)) + " " + str(input_string.at(value)) + linebreak()
      }

      value += 1
    }


    //setting abstruct
    //if abstruct != [] {
    //  text(font: english, weight: "bold")[Abstruct\ ]
    //  abstruct
    //}
    v(1em)

    //setting keywords
    set text(font: (english, mincho))
    let value = 0
    if keywords.len() != 0 {
      text(font: english, weight: "bold", style: "italic")[Keywords] + [ :　]
    }
    while value < keywords.len(){

      keywords.at(value)

      if value != keywords.len() - 1{
        [, ]
      }

      value = value + 1
    }
    v(0.5em)

    set align(left)
    set par(leading: 0.95em, first-line-indent: 1em, spacing: 0.95em)

    for value in body.children{
      if value != [ ]{
        value
      }
    }
}

#let nonumber = <equate:revoke>
