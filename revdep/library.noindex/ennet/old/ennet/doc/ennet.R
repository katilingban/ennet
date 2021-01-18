## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  error = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo = FALSE------------------------------------------------------
library(ennet)
library(DiagrammeR)

## ----ennet-structure, echo = FALSE, eval = FALSE, out.width = "100%"----------
#  DiagrammeR::grViz("
#    digraph ennet {
#  
#      graph [layout = dot, fontname = Helvetica]
#  
#      node [shape = ellipse, style = filled, color = grey,
#            fontcolor = white, fontsize = 20]
#  
#        node [fillcolor = royalblue]
#          a [label = '@@1']
#  
#        node [fillcolor = darkgreen]
#          b [label = '@@2-1']
#          c [label = '@@2-2']
#          d [label = '@@2-3']
#  
#        node [fillcolor = purple]
#          e [label = '@@3-1']
#          f [label = '@@3-2']
#          g [label = '@@3-3']
#          h [label = '@@3-4']
#          i [label = '@@3-5']
#          j [label = '@@3-6']
#  
#  
#        node [fillcolor = orange]
#          k [label = '@@4-7']
#          l [label = '@@4-8']
#          m [label = '@@4-9']
#          n [label = '@@4-10']
#          o [label = '@@4-11']
#          p [label = '@@4-12']
#          q [label = '@@4-13']
#          r [label = '@@4-14']
#          s [label = '@@4-15']
#          t [label = '@@4-16']
#          u [label = '@@4-17']
#          v [label = '@@4-18']
#  
#      edge [color = grey]
#        a -> {b c d}
#        b -> {e f}
#        c -> {g h}
#        d -> {i j}
#        e -> {k l}
#        f -> {m n}
#        g -> {o p}
#        h -> {q r}
#        i -> {s t}
#        j -> {u v}
#    }
#  
#    [1]: 'en-net'
#    [2]: 'Thematic area'
#    [3]: 'Topic'
#    [4]: 'Discussion'
#  ")

## ----ennet-structure-1, echo = FALSE, eval = TRUE, out.width = "90%", fig.align = "center"----
knitr::include_graphics("../man/figures/ennet_structure.png")
