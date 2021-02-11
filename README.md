# Love Match

You've been approached by the Cupid dating agency to create a love calculator
to determine their clients' suitability for each other.

A pair of names is fed into an algorithm as a single string, separated by the
word "loves", that then returns the percentage of how well they are matched.

eg "Simon loves Elaine" = 79% compatibility

The calculation for LoveMatch.calculate("Simon loves Elaine") is as follows:

  * starting from the left, count the occurrences of each character (not
    including spaces), eg s(2), i(2), m(1), o(2), n(2), l(2), v(1), e(3), a(1)
    giving `221222131`
  * sum the first and last digits working inwards for each pair e.g. 2+1=3,
    2+3=5, 1+1=2, 2+2=4, 2 giving 35242
  * repeat until you're left with a two figure number which is your result

To see a demonstration of the method see [Love calc
method](https://www.youtube.com/watch?v=oFsLVG7EAZ4)
