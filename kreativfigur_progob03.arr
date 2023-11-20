use context essentials2021
include color

my-grey = color(36,37,38,1)
base = rectangle(100, 25, "solid", "dark-green")
s1 = rectangle(75, 25, "solid", "dark-green")
s2 = rectangle(50, 25, "solid", "dark-green")
s3 = rectangle(25, 25, "solid", "dark-green")
trunk = rectangle(25, 50, "solid", "brown")
background = rectangle(100, 200, "solid", my-grey) 


put-image(above(s3, above(s2, above(s1, above(base, trunk)))),
  50,100,
  background)