#import "style/jsme_style.typ" : *
#import "style/bib_style.typ" : *

#show: jsme_init
#show: equate.with(breakable: true, number-mode: "line")
#show: bib_init

#show: jsme_title.with(
  number: "999999",
  title: [投稿論文作成について],
  subtitle: [(日本機械学会指定テンプレートファイル利用について)],
  authors: (
    (
      name: "機械 太郎",
      post: "学生員",
      presenter: "発表者",
      english_name: "Taro KIKAI",
      thanks: "日本機械大学　Nihon Kikai University"
    ),
    (
      name: "技術 さくら",
      post: "正員",
      presenter: "指導教員",
      english_name: "Sakura GIJYUTSU",
      thanks: "日本機械大学　Nihon Kikai University"
    ),
    (
      name: "機械 二郎",
      post: "",
      presenter: "",
      english_name: "Jiro KIKAI",
      thanks: "日本機械大学　Nihon Kikai University"
    ),
    (
      name: "機械 三郎",
      post: "",
      presenter: "",
      english_name: "Saburo KIKAI",
      thanks: "日本機械大学　Nihon Kikai University"
    ),
    (
      name: "東京 花子",
      post: "",
      presenter: "",
      english_name: "Hanako TOKYO",
      thanks: "飯田橋大学　Iidabashi University"
    ),
  ),
  english_title: [Preparing a Conference Paper],
  english_subtitle: [(How to use the JSME template file)],
  keywords: ("Keyword1", "Keyword2", "Keyword3", "Keyword4", "...")
)

= 緒　　　言

関東学生会　学生員卒業研究発表講演会のフォーマットについて記載をする．

このファイルは，日本機械学会論文集執筆要綱にのっとり原稿体裁を整えて投稿することができるように，スタイルファイルとしてフォントサイズなどの書式を設定し登録している．
1行の文字数，1ページの行数など定められた形式で作成することができる．
本文の文字数は，1ページ当たり，50文字$times$46行$times$1段組で2300字とする．
また，文章の区切りには全角の読点「，」（カンマ）と句点「．」（ピリオド）を用いる．カッコも全角入力する．

本文中の文字の書式は，明朝体・Serif系（Century, Times New Romanなど）を利用し，章節項については，ゴシック体を使用する．
文字の大きさおよびフォントの詳細を確認する場合は，日本機械学会論文集執筆要綱の「C.執筆要綱3・10節」を参照する．
執筆後はPDFファイルに変換し，容量は1ファイルあたり2 MB以下とする．

= このテンプレートファイルの使い方

このテンプレートの表題（副題），著者名，本文などはあらかじめ本会指定のフォントサイズなどの書式が設定されている．
この書式を崩さずに入力すれば，文字数，行数など定められた体裁で論文を作成することができる．
しかし，絶対的な出来上がりのレベルを保証するものではないので，体裁が望むレベルに達しない場合には，使用の環境に合わせ，投稿者各自において微調整を行うなど，本会の論文集掲載の体裁に最も近い設定を行う必要がある．

= 原稿執筆の手引き

== 原稿の規定ページ数について

2～5ページで執筆をする．なお，原稿中にページ番号は不要である．

== 原稿の作成に際して

原稿の冒頭には，講演番号，和文の表題・副題，英文の表題・副題，和文著者名，英文著者名（苗字は全て大文字），和文所属・英文所属を入れる．
氏名の前に会員資格を記載する．講演発表者名には◯を，指導教員名には◎を記載する．

#pagebreak()
\ #v(-3em)
== 講演番号

原稿の講演番号については，ウェブサイトに公開された講演プログラムの各講演タイトル先頭に割り振られている番号を記入する．
なお，申込番号と講演番号は異なるので注意する．

== 表題および副題の付け方

原稿の表題は，研究発表申込時に入力した表題を確認し，必ず一致させる．


== キーワードの付け方

キーワードは，論文の内容を代表する重要な用語である．
これによって論文の分類，検索が迅速になる．キーワードは，本文を執筆した後に書くのが望ましい．

+ キーワードは，5〜10語句とする．
+ キーワードは，英文抄録の直下に英語で記載する．キーワードにはハイフンは使用せず（ハイフンを使用してひとつの言葉として一般に認識されるものを除く），前置詞・冠詞も含めない．

== 見出し（章，節，項）の付け方および書き方

本文は適当に区分して，見出しを付ける．体裁としては，章は2行分をとって，行の中ほどに書く．
また，節・項は行の左端より1文字あけて書き，改行して本文を記載する．
ただし節の後に項がくるときは改行する．書体はゴシック体とする．

== 量記号・単位記号の書き方

量記号はイタリック体，単位記号はローマン体とする．無次元数はイタリック体で書く．

== 用いる単位について

単位は，SI単位を使用する．数学記号・単位記号および量記号は，半角英数字を使用する．
なお，SI単位については，本会発行の「機械工学SIマニュアル」および「JISZ8203 国際単位系（SI）およびその使い方」を参照する．
記載時には，例「200 MPa」のように数値と物理単位記号の間には半角スペースを設ける．


== 用いる記号
数学記号は，JISZ8201に従う．
また，量を表す文字記号（量記号）は，JISZ8202に従う．
なお，数字の書き方は，@table2 の例に従う．
年度の表し方については，本年または昨年などとせず，かならず2007年のように西暦ではっきり記述する．

== 原稿ファイル名
提出する原稿のファイル名は，「講演番号（半角英数字）.pdf」とする．講演番号については，ウェブサイトに公開された講演プログラムで確認する．なお，申込番号と講演番号は異なるので注意する．

= 図および写真・表の作成に関して

+ 本文中では，@fig1，@table1 のように日本語で書く．写真は，図として扱う．カラーで掲載できる．
+ 番号・説明などは，図についてはその下に，表についてはその上に書く．
+ 図・表はページ上部あるいは下部に配置し，本文との間は1行以上の空白を空けて，見やすくする．
+ 図中・表中の説明および題目はすべて英語で書く．（最初の文字は大文字とする．）書体としては，Serif系を利用し，9.5ポイントの大きさで記載する．
+ 図および表の横に空白ができても，その空白部には本文を記入してはならない．
+ 図および表は，余白部分にはみ出してはならない．

#grid(
  columns: (50%, 50%),
  [#figure(
    table(
      columns: 2,
      align: left,
      [Recommended], table.vline(start: 0, stroke: 0.5pt), [Not recommende],
      [$0.357$], [$.357$],
      [$3.141 6$], [$3.141,6$],
      [$3.141 6 times 2.5$], [$3.141 6 dot 2.5$],
      [$3.141 6 times 10^3$], [$3.141 6 "E"+3$],
      [$1000" or "1 000$], [$1,000$],
    ),
    caption: [Examples of writing numbers.]
  )<table1>],
  [#figure(
    table(
      columns: 2,
      align: left,
      [Recommended], table.vline(start: 0, stroke: 0.5pt), [Not recommende],
      [$sqrt(x - y)$], [$sqrt("") x-y $],
      [$(a+b)\/(c+d)$], [$a+b\/c+d$]
    ),
    caption: [Examples of writing a square root and a fraction.]
  )<table2>]
)

#figure(
  image("figure/1.svg", width: 50%),
  caption: [
    The nonlinear propagation of plane acoustic wave.
  ]
)<fig1>
#v(3em)
#figure(
  table(
    columns: 8,
    align: center,
    stroke: (top: none, bottom: none, right: none, left: none),
    table.hline(start: 0, stroke: 0.5pt, y: 0),
    table.header([$T [degree.c]$], table.vline(start: 0, stroke: 0.5pt),
    [$rho ["kg/m"^3]$], table.vline(start: 0, stroke: 0.5pt),
    [$c_p ["J/(kg" dot "K)"]$], table.vline(start: 0, stroke: 0.5pt),
    [$eta ["Pa" dot upright(s)]$], table.vline(start: 0, stroke: 0.5pt),
    [$nu [upright(m)^2"/s"]$], table.vline(start: 0, stroke: 0.5pt),
    [$k ["W/(m" dot "K)"]$], table.vline(start: 0, stroke: 0.5pt),
    [$a [upright(m)^2"/s"]$], table.vline(start: 0, stroke: 0.5pt), [$P r$]),
    table.hline(start: 0, stroke: 0.5pt),
    [], [], align(right)[$times 10^3$], align(right)[$times 10^(-5)$], align(right)[$times 10^(-5)$], align(right)[$times 10^(-2)$], align(right)[$times 10^(-5)$], [],
    [0], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [10], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [20], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [27], [1.1763], [1.007], [1.862], [1.583], [2.614], [2.207], [0.717],
    [30], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [40], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [50], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [60], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [70], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [80], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [90], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
  ),
  caption: "Physical properties of air at atmospheric pressure"
)

= 数式の書き方

文章と別行に式を示す場合は，@eq:example の例に従う．
$
upright("d") {sum_(i = 1)^N 1 / 2 m_i [(frac(upright("d") x_i, upright("d") t))^2 + (frac(upright("d") y_i, upright("d") t))^2 + (frac(upright("d") z_i, upright("d") t))^2]} = sum_(i = 1)^N (X_i upright("d") x_i + Y_i upright("d") y_i + Z_i upright("d") z_i)
$<eq:example>
式番号は，式と同じ行に右寄せして（ ）の中に書く．
また，本文で式を引用するときは，@eq:example のように書く．
式を書くときは，行頭に2文字分空白を空ける．
また，必要行数分を必ず使うようにして書く．
3行必要とする式を2行につめて書いたり，2行に分かれる式を1行に収めたりしない．
なお，本文と式，式相互間は1行以上の空白を空けて，見やすくする．

また，原則として数式のフォントサイズは本文に準じるものとするが，添え字等が小さく読みにくくなるときは適宜拡大する．
$
  overline(C)(t) = 1/N sum_(i = 1)^N C_i (t)\
  (p_v - p_"sat")/(p_"sat") = -(2.13204 + 2sqrt(pi) (1-zeta)/zeta) ((bold(u)_v - bold(u)_"int") dot bold(n))/(sqrt(2R T_"int"))\
  (T_v - T_"int")/(T_"int") = -0.44675 ((bold(u)_v - bold(u)_"int") dot bold(n))/(sqrt(2R T_"int"))
$

= 引用文献の書き方

本文中の引用箇所には，右肩に小括弧をつけて，通し番号を付ける．
例えば，新宿・渋谷@新宿:1987 @keer:1984 のようにする．
引用文献は，本文末尾に番号順にまとめて書く．
また，日本語の文献を引用する場合は日本語表記とし，英語の文献を引用する場合は英語表記とする．


= 結　　　言

本テンプレートファイルのスタイルを利用すると，各々の項目の書式が自動的に利用できるので便利である．

#include "mybib_jp.typ"
