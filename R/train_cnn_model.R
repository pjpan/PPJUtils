library(FNN)
library(jpeg)
library(imager)
library(mxnet)

work_path <- c("D:/PPT/图片/")
nrow = length(list.files(work_path))
im <- NULL
# i <- 1

PreprocessImage <- function(path,show_img = T){
  
  img <- load.image(path)
  
  short_edge = min(dim(img)[1:2])

  yy = (dim(img)[1] - short_edge) / 2
  xx = (dim(img)[2] - short_edge) / 2
  crop_img = imresize(as.cimg(img[(yy+1) : (yy + short_edge), (xx+1) : (xx + short_edge),,],scale=1))

  # convert to numpy.ndarray
  sample = as.array(crop_img) * 256
  # cat(dim(sample))
  # swap axes to make image from (299, 299, 1, 3) to (1, 3, 299, 299)
  sample <- permute_axes(sample,"zcxy")
  # sub mean
  normed_img = sample - 128.
  normed_img = normed_img /128.
  # print("transformed Image Shape:", dim(normed_img))
  return(normed_img)
  
}

# load img file
for(i in 3:nrow){
  if(list.files(work_path)[i]){
    path = paste0(work_path, list.files(work_path)[i])
    img  <- PreprocessImage(path)
  }
}

# train a cnn network
library(mxnet)













