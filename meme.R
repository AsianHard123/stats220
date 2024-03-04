library(magick)
#static image meme
meme_text <- image_blank(width = 500, height = 50, color = "#000000") %>% #Creating Block for text
  image_annotate(text = "When my owner walks past without giving me a cuddle", color = "#FFFFFF", size = 20, gravity = "center")
meme_image <- image_read("https://i.kym-cdn.com/entries/icons/original/000/048/010/side_eye_cat.jpg") %>% #Scailing image to fit block of text
  image_scale(500)

#Producing the static meme
meme_vector <- c(meme_text, meme_image)
meme <- image_append(meme_vector, stack = TRUE) #Combining image and block of text

meme

image_write(meme, "static_meme.png") #Saving meme as a png file

#gif meme code

#Creating frames for the gif
frame1 <- meme
frame2 <- image_read("https://media.tenor.com/a467V24M0IUAAAAe/cat-bombastic-side-eye.png") %>%
  image_scale(500) %>%
  image_resize("500x500") #resizing so that all frames are the same
frame3 <- image_read("https://assets.coingecko.com/coins/images/34354/large/photo_2024-01-07_21.44.19.jpeg?1704703981") %>%
  image_scale(500) %>%
  image_resize("500x500") #resizing so that all frames are the same
frame4 <- image_read("https://i.redd.it/si6diz4wjqqb1.jpg") %>%
  image_scale(500) %>%
  image_resize("500x500") #resizing so that all frames are the same

#Appending the block of code to each frame
frame2_wtxt <- image_append(c(meme_text, frame2), stack = TRUE)
frame3_wtxt <- image_append(c(meme_text, frame3), stack = TRUE)
frame4_wtxt <- image_append(c(meme_text, frame4), stack = TRUE)

#Producing the gif
frames <- c(frame1, frame2_wtxt, frame3_wtxt, frame4_wtxt)
gif <- image_animate(frames, fps = 1)
gif

image_write(gif, "gif_meme.gif") #Saving meme as a gif
