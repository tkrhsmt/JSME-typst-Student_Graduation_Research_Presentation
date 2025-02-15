/* --------------------------------------------------
             TYPST JSME BIB STYLE FILE
  file: bib_style.typ
  author: T.Hashimoto
-------------------------------------------------- */

#let bib_s = state("bib_x", ())
#let bib_s2 = state("bib_x2", ((), 1))

//bibの初期設定
#let bib_init(body) = {

  show figure.caption: it => {
    if it.kind != "bib"{
      it
    }
  }

  show ref: it =>{
      if it.element.has("kind"){
        if it.element.kind == "bib"{

          let now_element_num = eval(it.element.supplement.children.at(4).text)
          bib_s.update(bib_info => {
            let tmp = bib_info
            if type(tmp) == array{
              tmp.push(now_element_num)
            }
            tmp
          })
          bib_s2.update(bib_info => {
            let tmp = bib_info
            let output = ((), 1)
            if type(tmp) == array{
              if tmp.at(0).contains(now_element_num){
                let num = 0
                for value in tmp.at(0){
                  if value == now_element_num{
                    num += 1
                    break
                  }
                  num += 1
                }
                output.at(0) = tmp.at(0)
                output.at(1) = num
              }else{
                tmp.at(0).push(now_element_num)
                output.at(0) = tmp.at(0)
                output.at(1) = tmp.at(0).len()
              }
            }
            output
          })

          if it.supplement == [citet]{//citetのとき
            it.element.supplement.children.at(0) + " (" + it.element.supplement.children.at(2) + ")"
          }
          else if it.supplement == [citep]{//citepのとき
            "(" + it.element.supplement.children.at(0) + ", " + it.element.supplement.children.at(2) + ")"
          }
          else if it.supplement == [citet1]{//citet 2つのうち最初
            it.element.supplement.children.at(0) + " (" + it.element.supplement.children.at(2) + "); "
          }
          else if it.supplement == [citep1]{//citep 2つのうち最初
            "(" + it.element.supplement.children.at(0) + ", " + it.element.supplement.children.at(2) + "; "
          }
          else if it.supplement == [citep2]{//citep 2つのうち最後
            it.element.supplement.children.at(0) + ", " + it.element.supplement.children.at(2) + ")"
          }
          else if it.supplement == [citen]{ //citenのとき
            it.element.supplement.children.at(0)
            super("(")
            super(context bib_s2.get().at(1))
            super(")")
          }
          else{//その他
            //let tmp = "(" + it.element.supplement.children.at(4) + ")"
            super("(")
            super(context bib_s2.get().at(1))
            super(")")
          }
        }
        else{
          it
        }
      }
      else{
        it
      }
  }
  body
}

// --------------------------------------------------
//  SETTING
// --------------------------------------------------

//JSMEの文献形式に合わせた ris設定ファイル
#import "ris_jsme_style.typ" : *
//JSMEの文献形式に合わせた bibtex設定ファイル
#import "tex_jsme_style.typ" : *

//文献を名前順に並び替える
#let bib_name_changer(bib_output) = {

  let name_list = ()
  let i = 0
  for value in bib_output{
    if value.at(4) != none{//yomiがあれば，これを優先的にname_listに追加
      let tmp = (value.at(4), i)
      name_list.push(tmp)
    }
    else if value.at(1) != none{//authorがあれば，name_listに追加
      let tmp = (value.at(1), i)
      name_list.push(tmp)
    }
    else{//authorもなければ，文献の冒頭語句をname_listに追加
      let tmp = (value.at(0).split(" ").at(0), i)
      name_list.push(tmp)
    }
    i += 1
  }

  name_list = name_list.sorted()

  let bib_output_sorted = ()
  for value in name_list{
    bib_output_sorted.push(bib_output.at(value.at(1)))
  }

  return bib_output_sorted

}

//文献の重複を検知し，yearに番号を振る
#let bib_doubling_year(bib_output) = {

  let bib_output_year = bib_output
  let bef_author = ""
  let bef_year = ""

  let count = 0
  while count < bib_output_year.len(){
    let value = bib_output_year.at(count)

    if value.at(1) != none and value.at(2) != none{
      if value.at(1) == bef_author and value.at(2) == bef_year{//前の項目と重複していたら
        let doubling_number = ()//重複している文献番号
        let num = 0
        for d_value in bib_output{
          if d_value.at(1) == bef_author and d_value.at(2) == bef_year{
            doubling_number.push(num)
          }
          num += 1
        }
        num = 1
        for d_value in doubling_number{
          let add_character = numbering("a", num)
          //yearを更新
          bib_output_year.at(d_value).at(2) = str(bib_output_year.at(d_value).at(2)) + add_character
          //文献中にyearがあれば，それを更新
          if bib_output_year.at(d_value).at(5) != none{
            let tmp = bib_output_year.at(d_value).at(0).slice(0, bib_output_year.at(d_value).at(5).at(0))
            tmp += bib_output_year.at(d_value).at(2)
            tmp += bib_output_year.at(d_value).at(0).slice(bib_output_year.at(d_value).at(5).at(1), bib_output_year.at(d_value).at(0).len())

            bib_output_year.at(d_value).at(0) = tmp
            bib_output_year.at(d_value).at(5).at(1) = bib_output_year.at(d_value).at(5).at(1) + add_character.len()
          }
          num += 1
        }
        bef_author = ""
        bef_year = ""
      }
      else{//重複していなければ
        bef_author = value.at(1)
        bef_year = value.at(2)
      }
    }
    count += 1
  }

  return bib_output_year

}

#let bib_add_s(arr) = {
   bib_s.update(x => {
    let tmp = ()
    let arr_cpy = arr
    let a = 0
    let remove_arr = ()

    for value in x{
      if remove_arr.contains(value) == false{
        arr_cpy.at(value - 1).at(7) = a
        tmp.push(arr_cpy.at(value - 1))
        remove_arr.push(value)
        a += 1
      }
    }

    let i = 1
    for value in arr_cpy{
      if remove_arr.contains(i) == false{
        tmp.push(value)
      }
      i += 1
    }
    let valuenum = 0
    for value in tmp{
      let it = value.at(0)
      let it_arr = ()
      let output = ""
      let num = 0
      if value.at(6) != (){
        for i in value.at(6){
          it_arr.push(it.slice(num, i))
          num = i
        }
        it_arr.push(it.slice(num, it.len()))

        num = 0
        for i in it_arr{
          output += eval(i, mode: "markup")
          if num != it_arr.len() - 1{
            output += [#linebreak()]
          }
          num += 1
        }
        tmp.at(valuenum).at(0) = output
      }
      valuenum += 1
    }
    tmp
  })
}


//contentに含まれる文献をfigure環境で管理し，出力する
#let from_content_to_output(body) = {
  let bib_content = body
  let bib_output = ()

  for value in bib_content.children{
    if value.has("text"){
      bib_output.push(eval(value.text))
    }
  }

  //文献の並び替え
  bib_output = bib_name_changer(bib_output)

  //文献の重複管理
  //bib_output = bib_doubling_year(bib_output)

  let i = 0
  for value in bib_output{
    bib_output.at(i).push(i)
    i += 1
  }

  //bib_sへ文献を代入
  bib_add_s(bib_output)

  //文献の出力
  set enum(numbering: "(1)")

  //set par(hanging-indent: 2em)
  let bib_num = 1



  for value in bib_output{

    [+ #figure([#context bib_s.get().at(bib_num - 1).at(0)], kind: "bib", supplement: [#value.at(1) #value.at(2) #bib_num], numbering: "a")#bib_output.at(bib_num - 1).at(3)
    ]
    bib_num += 1
  }
  linebreak()
}

//contentをstrに変換する
#let from_content_to_str(body) = {
  let contents = body
  let output_str = ""
  for value in body.children{
    if value.has("text"){//テキスト
      output_str += value.text
    }
    else if value == [ ]{//空白文字
      output_str += " "
    }
    else if value.has("dest"){//url
      output_str += value.dest
    }
  }
  return output_str
}

// --------------------------------------------------
//  MAIN FUNCTION
// --------------------------------------------------

//メイン関数
#let bibliography-list(lang: "jp", body) = {

  if lang == "jp"{
    heading("文　　　献", numbering: none)
  }
  else if lang == "en"{
    heading("References", numbering: none)
  }
  set par(first-line-indent: 0em)
  set par(leading: 1em)

  show figure.where(kind: "bib"): it =>{
    align(left, it)
    //v(-2em)
  }

  let bib_content = body
  from_content_to_output(bib_content)
}

// --------------------------------------------------
//  SUB MAIN FUNCTION
// --------------------------------------------------

//手書きで文献を入力する関数
#let bib-item(it, author: none, year: none, label: none, yomi: none, yearnum: none, linebreak: ()) = {

    let it_str = from_content_to_str(it)
    return (it_str, author, year, label, yomi, yearnum, linebreak)
}

//ris形式で文献を出力する関数
#let bib-ris(it, label: none, yomi: none, lang: false, linebreak: ()) = {

  let it_str = from_ris_to_biblist(it, lang)
  let yomi_str = yomi
  if yomi_str == none{
    yomi_str = it_str.at(4)
  }

  return (it_str.at(0), it_str.at(2), it_str.at(3), label, yomi_str, it_str.at(1), linebreak)
}

//tex形式で文献を出力する関数
#let bib-tex(it, lang: false, linebreak: ()) = {
  let tmp = from_tex_to_biblist(it, lang: lang)
  tmp.push(linebreak)
  return tmp
}

// --------------------------------------------------
//  CITE FUNCTION
// --------------------------------------------------

#let citet(label) = {
    ref(label, supplement: "citet")
}

#let citep(label) = {
    ref(label, supplement: "citep")
}

#let citet2(label1, label2) = {
    let tmp1 = ref(label1, supplement: "citet1")
    let tmp2 = ref(label2, supplement: "citet")
    tmp1 + tmp2
}

#let citep2(label1, label2) = {
    let tmp1 = ref(label1, supplement: "citep1")
    let tmp2 = ref(label2, supplement: "citep2")
    tmp1 + tmp2
}

#let citen(label) = {
    ref(label, supplement: "citen")
}
