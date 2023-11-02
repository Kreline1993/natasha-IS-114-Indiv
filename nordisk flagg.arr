use context essentials2021
#Include libraries
include color
include image
include tables
#HEIGHT FOR ALL FLAGS
var height = 200

#table for flag information
#cross 1 is the innermost cross
#cross-vertical/horizonal = position related to scale
flag-table = table: country :: String, scale-height :: Number, scale-width :: Number, cross-size-1 :: Number, cross-color-1 :: Color, cross-y-axis-1 :: Number, cross-x-axis-1, cross-size-2 :: Number, cross-color-2 :: Color, cross-y-axis-2, cross-x-axis-2, main-color :: Color
  row: "Faroe-Islands", 16, 22, 2, color(239, 48, 62, 1), 7, 7, 4, color(0, 94, 185, 1), 6,6, color(255, 255, 255, 1)
  row: "Norway", 16, 22, 2, color(0, 26, 91, 1), 7, 7, 4, color(255, 255, 255, 1), 6, 6, color(187, 4, 43, 1)
  row: "Sweden", 10, 16, 2, color(254, 205, 0, 1), 4, 5, 0, color(0, 0, 0, 0), 0, 0, color(0, 106, 168, 1)
  row: "Denmark", 28, 37, 4, color(255, 255, 255, 1), 12, 12, 0, color(0, 0, 0, 0), 0, 0, color(201, 47, 42, 1)
  row: "Finland", 11, 18, 3, color(0, 43, 108, 1), 4, 5, 0, color(0, 0, 0, 0), 0, 0, color(255, 255, 255, 1)
  row: "Iceland", 18, 25, 2, color(221, 24, 50, 1), 8, 8, 4, color(255, 255, 255, 1), 7, 7, color(0, 81, 157, 1)
end

#instruction table
#displayed on run
instructions = table: function-name :: String, description :: String
 row: "draw(country-name :: String)", "Draws the specified flag"
 row: "print-countries", "displays available countries"
end
instructions

#table of available countries
print-countries = table: country :: String
  row: "Norway"
  row: "Denmark"
  row: "Sweden"
  row: "Faroe-Islands"
  row: "Finland"
  row: "Iceland"
end

fun draw(country-name :: String):
  input = sieve flag-table using country:
    country == country-name
 end
  if input.length() == 1:
    toDraw = input.row-n(0)
    #get colours
    main-color = toDraw["main-color"]
    cross-1-color = toDraw["cross-color-1"]
    cross-2-color = toDraw["cross-color-2"]
    #get flag size
    flagScale = height / toDraw["scale-height"]
    width = flagScale * toDraw["scale-width"]
    #get rectangle sizes for cross
    cr-v-1 = flagScale * toDraw["cross-size-1"]
    cr-h-1 = flagScale * toDraw["cross-size-1"]
    cr-v-2 = flagScale * toDraw["cross-size-2"]
    cr-h-2 = flagScale * toDraw["cross-size-2"]
    #get rectangle positions for cross
    #v-xpos = vertical rectangle x-axis value
    #h-ypos = horizontal rectangle y-axis value
    cr-1-v-xpos = (flagScale * toDraw["cross-x-axis-1"]) + (cr-v-1 / 2)
    cr-1-v-ypos = height / 2
    cr-1-h-ypos = height / 2
    cr-1-h-xpos = width / 2
    cr-2-v-xpos = (flagScale * toDraw["cross-x-axis-2"]) + (cr-v-2 / 2)
    cr-2-v-ypos = height / 2
    cr-2-h-ypos = height / 2
    cr-2-h-xpos = width / 2
    #flag elements
    flagBase = rectangle(width, height, "solid", main-color)
    v-1 = rectangle(cr-v-1, height, "solid", cross-1-color)
    v-2 = rectangle(cr-v-2, height, "solid", cross-2-color)
    h-1 = rectangle(width, cr-h-1, "solid", cross-1-color)
    h-2= rectangle(width, cr-h-2, "solid", cross-2-color)
    #placing images
    place-image(v-1,
      cr-1-v-xpos, cr-1-v-ypos,
      place-image(h-1,
        cr-1-h-xpos, cr-1-h-ypos,
        place-image(v-2,
          cr-2-v-xpos, cr-2-v-ypos,
          place-image(h-2,
            cr-2-h-xpos, cr-2-h-ypos,
            flagBase))))
  else:
    "Check function syntax and try again, or review available countries"
end
end

  