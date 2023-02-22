#Mini Assignment 01/10/2023: "Hello World"

#Messages and Replies#
#Message
hello.world <- "Hello, World!"
#First Response
hihello <- "Hi, hello!"
#Second Response 
heyheyhey <- "Hey, hey, hey!"
#Third Response 
holamundo <- "¡Hola, mundo!"
#Fourth Response 
lastq <- "I wonder which kind of greeting increases our chances of the world saying 'Hello' back to us... "

#Count repetition begins at 0 
count <- 0 

repeat { #For message to be repeated 
  print(hello.world) #Hello World Message repeated
  count <- count + 1 #Begin counting the repetitions
  if(count == 1) #If in the first repetition then 
    print(hihello) #Print First Response
  if(count == 2) #If in the second repetition then 
    print(heyheyhey) #Print Second Response
  if(count == 3) #If in the third repetition then 
    print(holamundo) #Print Third Response 
  if(count ==4) #If in the fourth repetition then 
    print(lastq) #Print Fourth (and final) Response
  if (count > 3) #If messages go above three then
    break #Stop the repetitions 
}
