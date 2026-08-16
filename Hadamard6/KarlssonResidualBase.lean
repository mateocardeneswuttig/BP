import Mathlib.Tactic

/-! Shared definitions for the generated Karlsson residual certificate.

The ten Bernstein-positivity leaves live in their own modules.  Each leaf
costs well over a gigabyte of elaboration memory, so keeping all ten in one
module exceeded the memory available on a standard CI runner. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

noncomputable def karlssonCompactResidualRow0 (y : ℝ) : ℝ :=
  ((589824 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-2359296 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((4718592 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-5898240 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((5013504 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-2949120 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((1179648 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-294912 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow1 (y : ℝ) : ℝ :=
  ((-9437184 : ℝ) + (-1179648 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((40108032 : ℝ) + (4718592 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-83755008 : ℝ) + (-8847360 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((108527616 : ℝ) + (10027008 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-94961664 : ℝ) + (-7372800 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((57212928 : ℝ) + (3538944 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-23298048 : ℝ) + (-1032192 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((5898240 : ℝ) + (147456 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-737280 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow2 (y : ℝ) : ℝ :=
  ((77266944 : ℝ) + (17694720 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-344457216 : ℝ) + (-70778880 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((741998592 : ℝ) + (132710400 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-985006080 : ℝ) + (-150405120 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((877953024 : ℝ) + (110592000 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-536739840 : ℝ) + (-53084160 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((220889088 : ℝ) + (15482880 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-56328192 : ℝ) + (-2211840 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((7041024 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow3 (y : ℝ) : ℝ :=
  ((-421134336 : ℝ) + (-132120576 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((1936982016 : ℝ) + (528482304 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-4252631040 : ℝ) + (-976748544 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((5754322944 : ℝ) + (1080557568 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-5228199936 : ℝ) + (-772669440 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((3256418304 : ℝ) + (360972288 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-1361608704 : ℝ) + (-103219200 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((350945280 : ℝ) + (14745600 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-43868160 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow4 (y : ℝ) : ℝ :=
  ((1691025408 : ℝ) + (644087808 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-7898923008 : ℝ) + (-2576351232 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((17471766528 : ℝ) + (4646633472 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-24002297856 : ℝ) + (-4922671104 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((22351085568 : ℝ) + (3335454720 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-14361034752 : ℝ) + (-1472200704 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((6185779200 : ℝ) + (402554880 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-1625260032 : ℝ) + (-57507840 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((203157504 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow5 (y : ℝ) : ℝ :=
  ((-5263589376 : ℝ) + (-2279079936 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((24642846720 : ℝ) + (9116319744 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-54328688640 : ℝ) + (-15974793216 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((75355914240 : ℝ) + (16017260544 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-72264646656 : ℝ) + (-10050600960 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((48491200512 : ℝ) + (4041474048 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-21778366464 : ℝ) + (-1015676928 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((5869928448 : ℝ) + (145096704 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-733741056 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow6 (y : ℝ) : ℝ :=
  ((13068140544 : ℝ) + (6176636928 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-60707045376 : ℝ) + (-24706547712 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((132168941568 : ℝ) + (42120511488 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-183694786560 : ℝ) + (-39888617472 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((181326643200 : ℝ) + (22837985280 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-127516999680 : ℝ) + (-8019247104 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((59815526400 : ℝ) + (1725825024 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-16526868480 : ℝ) + (-246546432 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((2065858560 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow7 (y : ℝ) : ℝ :=
  ((-26301431808 : ℝ) + (-13212057600 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((120385437696 : ℝ) + (52848230400 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-257028784128 : ℝ) + (-88218796032 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((354772058112 : ℝ) + (79687581696 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-357434523648 : ℝ) + (-41806725120 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((261095030784 : ℝ) + (12457082880 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-126724276224 : ℝ) + (-2047868928 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((35660759040 : ℝ) + (292552704 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-4457594880 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow8 (y : ℝ) : ℝ :=
  ((43262410752 : ℝ) + (22677553152 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-194283307008 : ℝ) + (-90710212608 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((405128871936 : ℝ) + (149782265856 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-550343540736 : ℝ) + (-131861053440 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((556837502976 : ℝ) + (65612021760 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-414379671552 : ℝ) + (-17284202496 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((204753862656 : ℝ) + (2080899072 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-58153107456 : ℝ) + (-297271296 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((7269138432 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow9 (y : ℝ) : ℝ :=
  ((-58265174016 : ℝ) + (-31463571456 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((256257294336 : ℝ) + (125854285824 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-521489350656 : ℝ) + (-208061595648 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((691962642432 : ℝ) + (183694786560 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-688886120448 : ℝ) + (-91965358080 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((509237526528 : ℝ) + (24602738688 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-251289796608 : ℝ) + (-3104833536 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((71321518080 : ℝ) + (443547648 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-8915189760 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow10 (y : ℝ) : ℝ :=
  ((63993544704 : ℝ) + (35276193792 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-275697893376 : ℝ) + (-141104775168 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((548847747072 : ℝ) + (236316524544 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-708279533568 : ℝ) + (-215082860544 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((680885747712 : ℝ) + (114520227840 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-487390445568 : ℝ) + (-35191259136 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((235482513408 : ℝ) + (6143606784 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-66107473920 : ℝ) + (-877658112 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((8263434240 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow11 (y : ℝ) : ℝ :=
  ((-56717475840 : ℝ) + (-31708938240 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((239779971072 : ℝ) + (126835752960 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-469197914112 : ℝ) + (-217206226944 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((588918030336 : ℝ) + (207693545472 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-540660989952 : ℝ) + (-120890327040 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((367545286656 : ℝ) + (43599790080 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-170829545472 : ℝ) + (-9710862336 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((46959427584 : ℝ) + (1387266048 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-5869928448 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow12 (y : ℝ) : ℝ :=
  ((39796604928 : ℝ) + (22460497920 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-165565956096 : ℝ) + (-89841991680 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((320288587776 : ℝ) + (158148329472 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-392671789056 : ℝ) + (-159998017536 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((344133992448 : ℝ) + (101732843520 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-220391276544 : ℝ) + (-41617981440 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((97408253952 : ℝ) + (10635706368 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-26004160512 : ℝ) + (-1519386624 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((3250520064 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow13 (y : ℝ) : ℝ :=
  ((-21403533312 : ℝ) + (-12155092992 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((87916806144 : ℝ) + (48620371968 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-168982216704 : ℝ) + (-87992303616 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((203616681984 : ℝ) + (93805608960 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-171605753856 : ℝ) + (-64078479360 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((103865647104 : ℝ) + (28538044416 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-43514855424 : ℝ) + (-7861174272 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((11230248960 : ℝ) + (1123024896 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-1403781120 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow14 (y : ℝ) : ℝ :=
  ((8342470656 : ℝ) + (4756340736 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-33936113664 : ℝ) + (-19025362944 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((64984449024 : ℝ) + (35219570688 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-77309411328 : ℝ) + (-39069941760 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((63153635328 : ℝ) + (28028436480 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-36389781504 : ℝ) + (-13136560128 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((14476640256 : ℝ) + (3765436416 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-3605004288 : ℝ) + (-537919488 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((450625536 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow15 (y : ℝ) : ℝ :=
  ((-2113929216 : ℝ) + (-1207959552 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((8531214336 : ℝ) + (4831838208 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-16269705216 : ℝ) + (-9059696640 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((19100860416 : ℝ) + (10267656192 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((-15156117504 : ℝ) + (-7549747200 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((8342470656 : ℝ) + (3623878656 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-3152019456 : ℝ) + (-1056964608 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((754974720 : ℝ) + (150994944 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-94371840 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidualRow16 (y : ℝ) : ℝ :=
  ((264241152 : ℝ) + (150994944 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-1056964608 : ℝ) + (-603979776 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((2000683008 : ℝ) + (1132462080 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-2302672896 : ℝ) + (-1283457024 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((1764753408 : ℝ) + (943718400 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-924844032 : ℝ) + (-452984832 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((330301440 : ℝ) + (132120576 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-75497472 : ℝ) + (-18874368 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((9437184 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonCompactResidual (x y : ℝ) : ℝ :=
  karlssonCompactResidualRow0 y * x ^ 0 +
    karlssonCompactResidualRow1 y * x ^ 1 +
    karlssonCompactResidualRow2 y * x ^ 2 +
    karlssonCompactResidualRow3 y * x ^ 3 +
    karlssonCompactResidualRow4 y * x ^ 4 +
    karlssonCompactResidualRow5 y * x ^ 5 +
    karlssonCompactResidualRow6 y * x ^ 6 +
    karlssonCompactResidualRow7 y * x ^ 7 +
    karlssonCompactResidualRow8 y * x ^ 8 +
    karlssonCompactResidualRow9 y * x ^ 9 +
    karlssonCompactResidualRow10 y * x ^ 10 +
    karlssonCompactResidualRow11 y * x ^ 11 +
    karlssonCompactResidualRow12 y * x ^ 12 +
    karlssonCompactResidualRow13 y * x ^ 13 +
    karlssonCompactResidualRow14 y * x ^ 14 +
    karlssonCompactResidualRow15 y * x ^ 15 +
    karlssonCompactResidualRow16 y * x ^ 16

noncomputable def karlssonPositiveRealResidualRow0 (y : ℝ) : ℝ :=
  ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((221184 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow1 (y : ℝ) : ℝ :=
  ((147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((0 : ℝ) + (147456 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((294912 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((0 : ℝ) + (442368 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (442368 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-294912 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((0 : ℝ) + (147456 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow2 (y : ℝ) : ℝ :=
  ((405504 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((1622016 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((2433024 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((1622016 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((405504 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow3 (y : ℝ) : ℝ :=
  ((2064384 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((0 : ℝ) + (-737280 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-2949120 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((0 : ℝ) + (4866048 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (4866048 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((2949120 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((0 : ℝ) + (-737280 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-2064384 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow4 (y : ℝ) : ℝ :=
  ((5234688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-14450688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((45563904 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-14450688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((5234688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow5 (y : ℝ) : ℝ :=
  ((0 : ℝ) + (1327104 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((0 : ℝ) + (11059200 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (11059200 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((0 : ℝ) + (1327104 : ℝ) * Real.sqrt 3) * y ^ 1
noncomputable def karlssonPositiveRealResidualRow6 (y : ℝ) : ℝ :=
  ((-13971456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((78594048 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-69672960 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((78594048 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-13971456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow7 (y : ℝ) : ℝ :=
  ((-1916928 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((0 : ℝ) + (8699904 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((3244032 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((0 : ℝ) + (11943936 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (11943936 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-3244032 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((0 : ℝ) + (8699904 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((1916928 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow8 (y : ℝ) : ℝ :=
  ((26025984 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-65765376 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((156155904 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-65765376 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((26025984 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow9 (y : ℝ) : ℝ :=
  ((1916928 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((0 : ℝ) + (8699904 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-3244032 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((0 : ℝ) + (11943936 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (11943936 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((3244032 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((0 : ℝ) + (8699904 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((-1916928 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow10 (y : ℝ) : ℝ :=
  ((-13971456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((78594048 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((-69672960 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((78594048 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((-13971456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow11 (y : ℝ) : ℝ :=
  ((0 : ℝ) + (1327104 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((0 : ℝ) + (11059200 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (11059200 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((0 : ℝ) + (1327104 : ℝ) * Real.sqrt 3) * y ^ 1
noncomputable def karlssonPositiveRealResidualRow12 (y : ℝ) : ℝ :=
  ((5234688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((-14450688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((45563904 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((-14450688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((5234688 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow13 (y : ℝ) : ℝ :=
  ((-2064384 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((0 : ℝ) + (-737280 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((2949120 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((0 : ℝ) + (4866048 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (4866048 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((-2949120 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((0 : ℝ) + (-737280 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((2064384 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow14 (y : ℝ) : ℝ :=
  ((405504 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((1622016 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((2433024 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((1622016 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((405504 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow15 (y : ℝ) : ℝ :=
  ((-147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((0 : ℝ) + (147456 : ℝ) * Real.sqrt 3) * y ^ 7 +
    ((-294912 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((0 : ℝ) + (442368 : ℝ) * Real.sqrt 3) * y ^ 5 +
    ((0 : ℝ) + (442368 : ℝ) * Real.sqrt 3) * y ^ 3 +
    ((294912 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((0 : ℝ) + (147456 : ℝ) * Real.sqrt 3) * y ^ 1 +
    ((147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidualRow16 (y : ℝ) : ℝ :=
  ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 8 +
    ((147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 6 +
    ((221184 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 4 +
    ((147456 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 2 +
    ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * y ^ 0
noncomputable def karlssonPositiveRealResidual (x y : ℝ) : ℝ :=
  karlssonPositiveRealResidualRow0 y * x ^ 0 +
    karlssonPositiveRealResidualRow1 y * x ^ 1 +
    karlssonPositiveRealResidualRow2 y * x ^ 2 +
    karlssonPositiveRealResidualRow3 y * x ^ 3 +
    karlssonPositiveRealResidualRow4 y * x ^ 4 +
    karlssonPositiveRealResidualRow5 y * x ^ 5 +
    karlssonPositiveRealResidualRow6 y * x ^ 6 +
    karlssonPositiveRealResidualRow7 y * x ^ 7 +
    karlssonPositiveRealResidualRow8 y * x ^ 8 +
    karlssonPositiveRealResidualRow9 y * x ^ 9 +
    karlssonPositiveRealResidualRow10 y * x ^ 10 +
    karlssonPositiveRealResidualRow11 y * x ^ 11 +
    karlssonPositiveRealResidualRow12 y * x ^ 12 +
    karlssonPositiveRealResidualRow13 y * x ^ 13 +
    karlssonPositiveRealResidualRow14 y * x ^ 14 +
    karlssonPositiveRealResidualRow15 y * x ^ 15 +
    karlssonPositiveRealResidualRow16 y * x ^ 16

noncomputable def karlssonSharedResidualRow0 (p : ℂ) : ℂ :=
  ((-36864 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4
noncomputable def karlssonSharedResidualRow1 (p : ℂ) : ℂ :=
  ((73728 : ℂ) + (36864 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((73728 : ℂ) + (-36864 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3
noncomputable def karlssonSharedResidualRow2 (p : ℂ) : ℂ :=
  ((-405504 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4
noncomputable def karlssonSharedResidualRow3 (p : ℂ) : ℂ :=
  ((221184 : ℂ) + (-110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 7 +
    ((811008 : ℂ) + (147456 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((811008 : ℂ) + (-147456 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3 +
    ((221184 : ℂ) + (110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 1
noncomputable def karlssonSharedResidualRow4 (p : ℂ) : ℂ :=
  ((-331776 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 8 +
    ((-884736 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 6 +
    ((-2801664 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4 +
    ((-884736 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 2 +
    ((-331776 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 0
noncomputable def karlssonSharedResidualRow5 (p : ℂ) : ℂ :=
  ((0 : ℂ) + (-110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 7 +
    ((0 : ℂ) + (663552 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((0 : ℂ) + (-663552 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3 +
    ((0 : ℂ) + (110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 1
noncomputable def karlssonSharedResidualRow6 (p : ℂ) : ℂ :=
  ((995328 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 8 +
    ((4423680 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 6 +
    ((3133440 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4 +
    ((4423680 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 2 +
    ((995328 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 0
noncomputable def karlssonSharedResidualRow7 (p : ℂ) : ℂ :=
  ((-221184 : ℂ) + (221184 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 7 +
    ((-737280 : ℂ) + (1511424 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((-737280 : ℂ) + (-1511424 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3 +
    ((-221184 : ℂ) + (-221184 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 1
noncomputable def karlssonSharedResidualRow8 (p : ℂ) : ℂ :=
  ((-1327104 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 8 +
    ((-5308416 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 6 +
    ((-12754944 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4 +
    ((-5308416 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 2 +
    ((-1327104 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 0
noncomputable def karlssonSharedResidualRow9 (p : ℂ) : ℂ :=
  ((221184 : ℂ) + (221184 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 7 +
    ((737280 : ℂ) + (1511424 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((737280 : ℂ) + (-1511424 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3 +
    ((221184 : ℂ) + (-221184 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 1
noncomputable def karlssonSharedResidualRow10 (p : ℂ) : ℂ :=
  ((995328 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 8 +
    ((4423680 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 6 +
    ((3133440 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4 +
    ((4423680 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 2 +
    ((995328 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 0
noncomputable def karlssonSharedResidualRow11 (p : ℂ) : ℂ :=
  ((0 : ℂ) + (-110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 7 +
    ((0 : ℂ) + (663552 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((0 : ℂ) + (-663552 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3 +
    ((0 : ℂ) + (110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 1
noncomputable def karlssonSharedResidualRow12 (p : ℂ) : ℂ :=
  ((-331776 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 8 +
    ((-884736 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 6 +
    ((-2801664 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4 +
    ((-884736 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 2 +
    ((-331776 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 0
noncomputable def karlssonSharedResidualRow13 (p : ℂ) : ℂ :=
  ((-221184 : ℂ) + (-110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 7 +
    ((-811008 : ℂ) + (147456 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((-811008 : ℂ) + (-147456 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3 +
    ((-221184 : ℂ) + (110592 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 1
noncomputable def karlssonSharedResidualRow14 (p : ℂ) : ℂ :=
  ((-405504 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4
noncomputable def karlssonSharedResidualRow15 (p : ℂ) : ℂ :=
  ((-73728 : ℂ) + (36864 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 5 +
    ((-73728 : ℂ) + (-36864 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 3
noncomputable def karlssonSharedResidualRow16 (p : ℂ) : ℂ :=
  ((-36864 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * p ^ 4
noncomputable def karlssonSharedResidual (t p : ℂ) : ℂ :=
  karlssonSharedResidualRow0 p * t ^ 0 +
    karlssonSharedResidualRow1 p * t ^ 1 +
    karlssonSharedResidualRow2 p * t ^ 2 +
    karlssonSharedResidualRow3 p * t ^ 3 +
    karlssonSharedResidualRow4 p * t ^ 4 +
    karlssonSharedResidualRow5 p * t ^ 5 +
    karlssonSharedResidualRow6 p * t ^ 6 +
    karlssonSharedResidualRow7 p * t ^ 7 +
    karlssonSharedResidualRow8 p * t ^ 8 +
    karlssonSharedResidualRow9 p * t ^ 9 +
    karlssonSharedResidualRow10 p * t ^ 10 +
    karlssonSharedResidualRow11 p * t ^ 11 +
    karlssonSharedResidualRow12 p * t ^ 12 +
    karlssonSharedResidualRow13 p * t ^ 13 +
    karlssonSharedResidualRow14 p * t ^ 14 +
    karlssonSharedResidualRow15 p * t ^ 15 +
    karlssonSharedResidualRow16 p * t ^ 16

noncomputable def karlssonCayleyDenominator (rho : ℂ) : ℂ :=
  ((1 : ℂ) + (0 : ℂ) * Complex.I) * rho ^ 8 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I) * rho ^ 7 +
    ((-28 : ℂ) + (0 : ℂ) * Complex.I) * rho ^ 6 +
    ((0 : ℂ) + (-56 : ℂ) * Complex.I) * rho ^ 5 +
    ((70 : ℂ) + (0 : ℂ) * Complex.I) * rho ^ 4 +
    ((0 : ℂ) + (56 : ℂ) * Complex.I) * rho ^ 3 +
    ((-28 : ℂ) + (0 : ℂ) * Complex.I) * rho ^ 2 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I) * rho ^ 1 +
    ((1 : ℂ) + (0 : ℂ) * Complex.I) * rho ^ 0

end Hadamard6
