import Hadamard6.KarlssonResidualBase

/-! Generated Bernstein positivity certificate for leaf 10. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

noncomputable def karlssonLeaf10BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    (((144 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((72 : ℝ) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + ((45 : ℝ) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((63 : ℝ) / 2) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1683 : ℝ) / 70) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((549 : ℝ) / 28) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((477 : ℝ) / 28) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    (((180 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((90 : ℝ) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1503 : ℝ) / 28) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1989 : ℝ) / 56) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((7227 : ℝ) / 280) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2277 : ℝ) / 112) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3879 : ℝ) / 224) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1017 : ℝ) / 64) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((1146 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((573 : ℝ) / 5) + ((171 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2301 : ℝ) / 35) + ((171 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1446 : ℝ) / 35) + ((522 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((717 : ℝ) / 25) + ((891 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((768 : ℝ) / 35) + ((621 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((10329 : ℝ) / 560) + ((2799 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2697 : ℝ) / 160) + ((189 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((663 : ℝ) / 40) + ((189 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    (((306 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((153 : ℝ) + ((153 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((41499 : ℝ) / 490) + ((153 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((49527 : ℝ) / 980) + ((486 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((40914 : ℝ) / 1225) + ((873 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((24273 : ℝ) / 980) + ((639 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((11511 : ℝ) / 560) + ((2997 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((20961 : ℝ) / 1120) + ((207 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((729 : ℝ) / 40) + ((207 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((198396 : ℝ) / 455) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((99198 : ℝ) / 455) + ((828 : ℝ) / 65) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((371583 : ℝ) / 3185) + ((828 : ℝ) / 65) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((420363 : ℝ) / 6370) + ((162 : ℝ) / 13) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1312767 : ℝ) / 31850) + ((792 : ℝ) / 65) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((374481 : ℝ) / 12740) + ((1557 : ℝ) / 130) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((305451 : ℝ) / 12740) + ((1539 : ℝ) / 130) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((19737 : ℝ) / 910) + ((153 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((37953 : ℝ) / 1820) + ((153 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((59712 : ℝ) / 91) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((29856 : ℝ) / 91) + ((126 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((217221 : ℝ) / 1274) + ((126 : ℝ) / 13) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((233679 : ℝ) / 2548) + ((990 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((343743 : ℝ) / 6370) + ((1098 : ℝ) / 91) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((46803 : ℝ) / 1274) + ((1179 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((74577 : ℝ) / 2548) + ((1233 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2382 : ℝ) / 91) + ((180 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9015 : ℝ) / 364) + ((180 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((1008720 : ℝ) / 1001) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((504360 : ℝ) / 1001) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1796589 : ℝ) / 7007) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((143019 : ℝ) / 1078) + ((6102 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2597373 : ℝ) / 35035) + ((87372 : ℝ) / 7007) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((337734 : ℝ) / 7007) + ((205119 : ℝ) / 14014) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((261711 : ℝ) / 7007) + ((225369 : ℝ) / 14014) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((131463 : ℝ) / 4004) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((61029 : ℝ) / 2002) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((217656 : ℝ) / 143) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((108828 : ℝ) / 143) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1917189 : ℝ) / 5005) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1942587 : ℝ) / 10010) + ((4266 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2627892 : ℝ) / 25025) + ((70164 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((659907 : ℝ) / 10010) + ((35037 : ℝ) / 2002) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((497331 : ℝ) / 10010) + ((198423 : ℝ) / 10010) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((122193 : ℝ) / 2860) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((27783 : ℝ) / 715) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((1577504 : ℝ) / 715) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((788752 : ℝ) / 715) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((396736 : ℝ) / 715) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((18248 : ℝ) / 65) + ((5328 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3776296 : ℝ) / 25025) + ((88992 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((42412 : ℝ) / 455) + ((22356 : ℝ) / 1001) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((343432 : ℝ) / 5005) + ((126972 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((41174 : ℝ) / 715) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3334 : ℝ) / 65) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((435312 : ℝ) / 143) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((217656 : ℝ) / 143) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((42498 : ℝ) / 55) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((284571 : ℝ) / 715) + ((1728 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5454018 : ℝ) / 25025) + ((127584 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((676674 : ℝ) / 5005) + ((151992 : ℝ) / 5005) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((980487 : ℝ) / 10010) + ((168264 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((229617 : ℝ) / 2860) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((50166 : ℝ) / 715) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((4034880 : ℝ) / 1001) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2017440 : ℝ) / 1001) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1043100 : ℝ) / 1001) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((555930 : ℝ) / 1001) + ((22248 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2213460 : ℝ) / 7007) + ((25344 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1401480 : ℝ) / 7007) + ((27666 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1008369 : ℝ) / 7007) + ((29214 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((231579 : ℝ) / 2002) + ((612 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((99702 : ℝ) / 1001) + ((612 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((477696 : ℝ) / 91) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((238848 : ℝ) / 91) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((886164 : ℝ) / 637) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((493278 : ℝ) / 637) + ((41112 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1470228 : ℝ) / 3185) + ((40896 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((191640 : ℝ) / 637) + ((40734 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((138165 : ℝ) / 637) + ((40626 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((31335 : ℝ) / 182) + ((828 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((13386 : ℝ) / 91) + ((828 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((3174336 : ℝ) / 455) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1587168 : ℝ) / 455) + ((864 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1208160 : ℝ) / 637) + ((864 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3506112 : ℝ) / 3185) + ((27648 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1559088 : ℝ) / 2275) + ((25056 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1464984 : ℝ) / 3185) + ((23112 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1066392 : ℝ) / 3185) + ((21816 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((120528 : ℝ) / 455) + ((432 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((103212 : ℝ) / 455) + ((432 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    (((9792 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((4896 : ℝ) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((664848 : ℝ) / 245) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((397512 : ℝ) / 245) + ((44064 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1276416 : ℝ) / 1225) + ((37728 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((175608 : ℝ) / 245) + ((32976 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3708 : ℝ) / 7) + ((29808 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((14778 : ℝ) / 35) + ((576 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1836 : ℝ) / 5) + ((576 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((73344 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((36672 : ℝ) / 5) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((20544 : ℝ) / 5) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + ((2496 : ℝ) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((285792 : ℝ) / 175) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8016 : ℝ) / 7) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((30192 : ℝ) / 35) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3504 : ℝ) / 5) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3144 : ℝ) / 5) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    (((23040 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((11520 : ℝ) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((45504 : ℝ) / 7) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((27936 : ℝ) / 7) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13248 : ℝ) / 5) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((13248 : ℝ) / 7) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((10224 : ℝ) / 7) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((1224 : ℝ) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((1152 : ℝ) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    (((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((18432 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((73728 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((46080 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((156672 : ℝ) / 35) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((23040 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((18432 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf10BernsteinRow0 s t +
    karlssonLeaf10BernsteinRow1 s t +
    karlssonLeaf10BernsteinRow2 s t +
    karlssonLeaf10BernsteinRow3 s t +
    karlssonLeaf10BernsteinRow4 s t +
    karlssonLeaf10BernsteinRow5 s t +
    karlssonLeaf10BernsteinRow6 s t +
    karlssonLeaf10BernsteinRow7 s t +
    karlssonLeaf10BernsteinRow8 s t +
    karlssonLeaf10BernsteinRow9 s t +
    karlssonLeaf10BernsteinRow10 s t +
    karlssonLeaf10BernsteinRow11 s t +
    karlssonLeaf10BernsteinRow12 s t +
    karlssonLeaf10BernsteinRow13 s t +
    karlssonLeaf10BernsteinRow14 s t +
    karlssonLeaf10BernsteinRow15 s t +
    karlssonLeaf10BernsteinRow16 s t
noncomputable def karlssonLeaf10ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((513 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((225 : ℝ) / 4) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((117 : ℝ) / 4) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((63 : ℝ) / 4) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1161 : ℝ) / 140) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((27 : ℝ) / 7) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((9 : ℝ) / 7) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((657 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((297 : ℝ) / 4) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((531 : ℝ) / 14) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1107 : ℝ) / 56) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2817 : ℝ) / 280) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((513 : ℝ) / 112) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((351 : ℝ) / 224) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9 : ℝ) / 64) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((4269 : ℝ) / 20) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1977 : ℝ) / 20) + ((171 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6999 : ℝ) / 140) + ((171 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3579 : ℝ) / 140) + ((522 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1293 : ℝ) / 100) + ((891 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((867 : ℝ) / 140) + ((621 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1509 : ℝ) / 560) + ((2799 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((177 : ℝ) / 160) + ((189 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((33 : ℝ) / 40) + ((189 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((1161 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((549 : ℝ) / 4) + ((153 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((67563 : ℝ) / 980) + ((153 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8523 : ℝ) / 245) + ((486 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((86481 : ℝ) / 4900) + ((873 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((4419 : ℝ) / 490) + ((639 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2691 : ℝ) / 560) + ((2997 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3321 : ℝ) / 1120) + ((207 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((99 : ℝ) / 40) + ((207 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((764919 : ℝ) / 1820) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((368127 : ℝ) / 1820) + ((828 : ℝ) / 65) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1285677 : ℝ) / 12740) + ((828 : ℝ) / 65) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((640071 : ℝ) / 12740) + ((162 : ℝ) / 13) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1622259 : ℝ) / 63700) + ((792 : ℝ) / 65) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((86913 : ℝ) / 6370) + ((1557 : ℝ) / 130) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((26199 : ℝ) / 3185) + ((1539 : ℝ) / 130) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((10809 : ℝ) / 1820) + ((153 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2322 : ℝ) / 455) + ((153 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((233115 : ℝ) / 364) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((113691 : ℝ) / 364) + ((126 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((394311 : ℝ) / 2548) + ((126 : ℝ) / 13) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((48387 : ℝ) / 637) + ((990 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((486831 : ℝ) / 12740) + ((1098 : ℝ) / 91) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((53475 : ℝ) / 2548) + ((1179 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((17223 : ℝ) / 1274) + ((1233 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3795 : ℝ) / 364) + ((180 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1641 : ℝ) / 182) + ((180 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((3971817 : ℝ) / 4004) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1954377 : ℝ) / 4004) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6744915 : ℝ) / 28028) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((252081 : ℝ) / 2156) + ((6102 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8182287 : ℝ) / 140140) + ((87372 : ℝ) / 7007) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((909495 : ℝ) / 28028) + ((205119 : ℝ) / 14014) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((605403 : ℝ) / 28028) + ((225369 : ℝ) / 14014) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((17100 : ℝ) / 1001) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((58995 : ℝ) / 4004) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((861615 : ℝ) / 572) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((426303 : ℝ) / 572) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((7353441 : ℝ) / 20020) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3569859 : ℝ) / 20020) + ((4266 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8934993 : ℝ) / 100100) + ((70164 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1004499 : ℝ) / 20020) + ((35037 : ℝ) / 2002) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((679347 : ℝ) / 20020) + ((198423 : ℝ) / 10010) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((19287 : ℝ) / 715) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((66087 : ℝ) / 2860) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((6264971 : ℝ) / 2860) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3109963 : ℝ) / 2860) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1541899 : ℝ) / 2860) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((68897 : ℝ) / 260) + ((5328 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13528609 : ℝ) / 100100) + ((88992 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((140983 : ℝ) / 1820) + ((22356 : ℝ) / 1001) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1058413 : ℝ) / 20020) + ((126972 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((119651 : ℝ) / 2860) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9241 : ℝ) / 260) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((1732239 : ℝ) / 572) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((861615 : ℝ) / 572) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((166527 : ℝ) / 220) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1093239 : ℝ) / 2860) + ((1728 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((20239497 : ℝ) / 100100) + ((127584 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2391381 : ℝ) / 20020) + ((151992 : ℝ) / 5005) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1645659 : ℝ) / 20020) + ((168264 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((46143 : ℝ) / 715) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((155619 : ℝ) / 2860) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((16076457 : ℝ) / 4004) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((8006697 : ℝ) / 4004) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4109337 : ℝ) / 4004) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2160657 : ℝ) / 4004) + ((22248 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8412399 : ℝ) / 28028) + ((25344 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((5164479 : ℝ) / 28028) + ((27666 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3592035 : ℝ) / 28028) + ((29214 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((400095 : ℝ) / 4004) + ((612 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((335745 : ℝ) / 4004) + ((612 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((1905051 : ℝ) / 364) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((949659 : ℝ) / 364) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3504525 : ℝ) / 2548) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1932981 : ℝ) / 2548) + ((41112 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5680257 : ℝ) / 12740) + ((40896 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((726429 : ℝ) / 2548) + ((40734 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((512529 : ℝ) / 2548) + ((40626 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((56937 : ℝ) / 364) + ((828 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((47811 : ℝ) / 364) + ((828 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((12668679 : ℝ) / 1820) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6320007 : ℝ) / 1820) + ((864 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4792509 : ℝ) / 2548) + ((864 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((13823793 : ℝ) / 12740) + ((27648 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6093027 : ℝ) / 9100) + ((25056 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((5659281 : ℝ) / 12740) + ((23112 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4064913 : ℝ) / 12740) + ((21816 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((453447 : ℝ) / 1820) + ((432 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((384183 : ℝ) / 1820) + ((432 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((39105 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((19521 : ℝ) / 4) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2643957 : ℝ) / 980) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1574613 : ℝ) / 980) + ((44064 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5028489 : ℝ) / 4900) + ((37728 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((686997 : ℝ) / 980) + ((32976 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((14391 : ℝ) / 28) + ((29808 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((56907 : ℝ) / 140) + ((576 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7029 : ℝ) / 20) + ((576 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((293061 : ℝ) / 20) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((146373 : ℝ) / 20) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((81861 : ℝ) / 20) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((9921 : ℝ) / 4) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1132143 : ℝ) / 700) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((31623 : ℝ) / 28) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((118563 : ℝ) / 140) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((13701 : ℝ) / 20) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((12261 : ℝ) / 20) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((92097 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((46017 : ℝ) / 4) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((181575 : ℝ) / 28) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((111303 : ℝ) / 28) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((52677 : ℝ) / 20) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((52551 : ℝ) / 28) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((40455 : ℝ) / 28) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4833 : ℝ) / 4) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4545 : ℝ) / 4) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((147393 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((73665 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((294471 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((183879 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((624483 : ℝ) / 140) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((91719 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((73287 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9153 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9153 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf10ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf10ShiftedBernsteinRow0 s t +
    karlssonLeaf10ShiftedBernsteinRow1 s t +
    karlssonLeaf10ShiftedBernsteinRow2 s t +
    karlssonLeaf10ShiftedBernsteinRow3 s t +
    karlssonLeaf10ShiftedBernsteinRow4 s t +
    karlssonLeaf10ShiftedBernsteinRow5 s t +
    karlssonLeaf10ShiftedBernsteinRow6 s t +
    karlssonLeaf10ShiftedBernsteinRow7 s t +
    karlssonLeaf10ShiftedBernsteinRow8 s t +
    karlssonLeaf10ShiftedBernsteinRow9 s t +
    karlssonLeaf10ShiftedBernsteinRow10 s t +
    karlssonLeaf10ShiftedBernsteinRow11 s t +
    karlssonLeaf10ShiftedBernsteinRow12 s t +
    karlssonLeaf10ShiftedBernsteinRow13 s t +
    karlssonLeaf10ShiftedBernsteinRow14 s t +
    karlssonLeaf10ShiftedBernsteinRow15 s t +
    karlssonLeaf10ShiftedBernsteinRow16 s t

theorem karlssonLeaf10_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 2) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 2) * (t : ℝ)) =
      karlssonLeaf10Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf10Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf10BernsteinRow0 karlssonLeaf10BernsteinRow1 karlssonLeaf10BernsteinRow2 karlssonLeaf10BernsteinRow3 karlssonLeaf10BernsteinRow4 karlssonLeaf10BernsteinRow5 karlssonLeaf10BernsteinRow6 karlssonLeaf10BernsteinRow7 karlssonLeaf10BernsteinRow8 karlssonLeaf10BernsteinRow9 karlssonLeaf10BernsteinRow10 karlssonLeaf10BernsteinRow11 karlssonLeaf10BernsteinRow12 karlssonLeaf10BernsteinRow13 karlssonLeaf10BernsteinRow14 karlssonLeaf10BernsteinRow15 karlssonLeaf10BernsteinRow16
  ring


theorem karlssonLeaf10_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 2) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 2) * (t : ℝ)) := by
  rw [karlssonLeaf10_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf10Bernstein s t = ((63 : ℝ) / 4) +
        karlssonLeaf10ShiftedBernstein s t := by
    unfold karlssonLeaf10Bernstein karlssonLeaf10ShiftedBernstein
    unfold karlssonLeaf10BernsteinRow0 karlssonLeaf10BernsteinRow1 karlssonLeaf10BernsteinRow2 karlssonLeaf10BernsteinRow3 karlssonLeaf10BernsteinRow4 karlssonLeaf10BernsteinRow5 karlssonLeaf10BernsteinRow6 karlssonLeaf10BernsteinRow7 karlssonLeaf10BernsteinRow8 karlssonLeaf10BernsteinRow9 karlssonLeaf10BernsteinRow10 karlssonLeaf10BernsteinRow11 karlssonLeaf10BernsteinRow12 karlssonLeaf10BernsteinRow13 karlssonLeaf10BernsteinRow14 karlssonLeaf10BernsteinRow15 karlssonLeaf10BernsteinRow16 karlssonLeaf10ShiftedBernsteinRow0 karlssonLeaf10ShiftedBernsteinRow1 karlssonLeaf10ShiftedBernsteinRow2 karlssonLeaf10ShiftedBernsteinRow3 karlssonLeaf10ShiftedBernsteinRow4 karlssonLeaf10ShiftedBernsteinRow5 karlssonLeaf10ShiftedBernsteinRow6 karlssonLeaf10ShiftedBernsteinRow7 karlssonLeaf10ShiftedBernsteinRow8 karlssonLeaf10ShiftedBernsteinRow9 karlssonLeaf10ShiftedBernsteinRow10 karlssonLeaf10ShiftedBernsteinRow11 karlssonLeaf10ShiftedBernsteinRow12 karlssonLeaf10ShiftedBernsteinRow13 karlssonLeaf10ShiftedBernsteinRow14 karlssonLeaf10ShiftedBernsteinRow15 karlssonLeaf10ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf10ShiftedBernstein
  unfold karlssonLeaf10ShiftedBernsteinRow0 karlssonLeaf10ShiftedBernsteinRow1 karlssonLeaf10ShiftedBernsteinRow2 karlssonLeaf10ShiftedBernsteinRow3 karlssonLeaf10ShiftedBernsteinRow4 karlssonLeaf10ShiftedBernsteinRow5 karlssonLeaf10ShiftedBernsteinRow6 karlssonLeaf10ShiftedBernsteinRow7 karlssonLeaf10ShiftedBernsteinRow8 karlssonLeaf10ShiftedBernsteinRow9 karlssonLeaf10ShiftedBernsteinRow10 karlssonLeaf10ShiftedBernsteinRow11 karlssonLeaf10ShiftedBernsteinRow12 karlssonLeaf10ShiftedBernsteinRow13 karlssonLeaf10ShiftedBernsteinRow14 karlssonLeaf10ShiftedBernsteinRow15 karlssonLeaf10ShiftedBernsteinRow16
  positivity


end Hadamard6
