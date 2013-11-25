require(rCharts)

path = getwd()


#replicate example from editor.html
g1 <- rCharts$new()
g1$setLib(path)
g1$set(
  spec = list(
    layers = list(
      list(geom= "rect", stat= "bin", aes = list( group= list(opacity= 0.5, color= "name")) ) ,
      list( geom= "line", aes= list(group= list(color= "black"), stat= "loess", scales= list(color= "identity")))
    ),
    aes = list( x= "{new Date(x)}", y = "{+y}" ),
    facets = list( y= "name", type= "wrap" ),
    scales = list( y= "log", opacity= "identity" ),
    data = lapply(
      0:9, function(i){
        return( list(
          x = paste0("9-",(i+1),"-2010"),
          y = i*10,
          name = "sample name"
        ))
      }
    ),
    opts = list(
      width = 900,
      height = 700,
      title = "Custom plot",
      minimal = TRUE
    )
  )
)
g1
g1$save("editor_test.html", cdn = T)


# do a custom implementation of geom_point
g2 <- rCharts$new()
g2$setLib(path)
g2$set( spec = list(
    layers = list(
      list(
        geom = "point",
        aes = list( x = "x", y = "y" )
      ),
      list(
        geom = "line",
        aes = list( x = "x", y = "y" )
      )
    ),
    data = lapply(1:10,function(i) {return( list(x = i, y = i ))})
  )
)
g2
g2$save("dottest.html", cdn = T)