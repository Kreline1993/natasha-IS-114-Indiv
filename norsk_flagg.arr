#Personal Repository for IS-114 Norsk Flagg oppgave

#Definitions

whiteRectangle = rectangle(220,160, "solid", "white")

blueHorizontal = rectangle(220,20, "solid", "navy")

blueVertical = rectangle(20,160, "solid", "navy")

redSquare = square(60, "solid", "red")

redRectangle = rectangle(120, 60, "solid", "red")

#Første Variant

put-image(blueHorizontal,

  110,80,

  put-image(blueVertical,

    80,80,

    put-image(redSquare,

      30,30,

      put-image(redSquare,

        30,130,

        put-image(redRectangle,

          160,30,

          put-image(redRectangle,

            160,130,

            put-image(whiteRectangle,

              110,80,

              empty-scene(220,160))))))))