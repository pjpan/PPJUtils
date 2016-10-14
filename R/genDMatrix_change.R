genDMatrix_change = function(df_y, df_X){
  df_X = as.data.frame(df_X)
  col2len = function(x){
    col = df_X[[x]]
    if(is.factor(col)){
      return (length(levels(col)))
    }
    return (1)
  }
  col_len = sapply(names(df_X), FUN = col2len)
  col_offset = (cumsum(col_len) - col_len)+1
  
  train_new = matrix(nrow=nrow(df_X),ncol=sum(col_len))
  
  for(i in 1:ncol(df_X)){
    if(!is.factor(df_X[[names(df_X)[i]]]))
      train_new[,col_offset[i]] = df_X[,i]
    if(is.factor(df_X[[names(df_X)[i]]])){
      for(j in 1:col_len[i])
        train_new[as.integer(df_X[[i]])==j,(j+col_offset[i]-1)]=1
    }
  }
  return (xgb.DMatrix(data=train_new,label=df_y,missing = NA))
}
