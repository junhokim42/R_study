url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

# Problem1
node1 <- html_node(text, "h1")
node1
html_text(node1)

# Problem2
node2 <- html_nodes(text, "a")
node2
(node2.href = html_attr(node2, 'href'))

# Problem3
node3 <- html_nodes(text, "a img")
node3
(node3.href = html_attr(node3, 'src'))

# Problem4
node4 <- html_node(text, "h2:nth-of-type(1)")
node4
html_text(node4)

# Problem5
node5 <- html_text(html_node(text, "ul > li[style$=green]"), trim=T)
node5

# Problem6
node6 <- html_node(text, "h2:nth-of-type(2)")
node6
html_text(node6)

# Problem7
(node7 <- html_text(html_nodes(text, "ol > *"), trim=T))

# Problem8
(node8 <- html_nodes(text, "table *"))
(node8 <- gsub("[[:cntrl:]]", "", html_text(node8)))

# Problem9
(node9 <- html_nodes(text, "tr.name"))
(node9 <- gsub("[[:cntrl:]]", "", html_text(node9)))

# Problem 10
(node10 <- html_nodes(text, "td#target"))
(node10 <- gsub("[[:cntrl:]]", "", html_text(node10)))
