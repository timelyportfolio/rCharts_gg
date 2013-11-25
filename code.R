require(rCharts)

path = getwd()

g1 <- rCharts$new()
g1$setLib(path)
g1$set(
  spec = list(
    layers = c(
      list( geom= "rect", stat= "bin", aes= list( group= list(opacity= 0.5, color= "name")) ),
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
      })
  )
)
g1