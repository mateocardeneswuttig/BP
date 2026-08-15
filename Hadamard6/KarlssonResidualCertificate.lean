import Mathlib.Tactic

/-! Generated exact Bernstein identities for the compact Karlsson residual. -/

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

noncomputable def karlssonLeaf0000BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    (((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((27648 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((147456 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((114048 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((63936 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((71280 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((57600 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((6750 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((5625 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    (((25344 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((19008 : ℝ) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((101448 : ℝ) / 7) + (108 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((78570 : ℝ) / 7) + ((864 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((308934 : ℝ) / 35) + ((891 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + ((7047 : ℝ) + ((999 : ℝ) / 8) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((319905 : ℝ) / 56) + ((13365 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((150525 : ℝ) / 32) + ((225 : ℝ) / 2) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7875 : ℝ) / 2) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((87456 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((65592 : ℝ) / 5) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((50052 : ℝ) / 5) + (162 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((38826 : ℝ) / 5) + ((1296 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2142171 : ℝ) / 350) + ((2673 : ℝ) / 14) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((274455 : ℝ) / 56) + ((2997 : ℝ) / 16) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((446595 : ℝ) / 112) + ((40095 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((105525 : ℝ) / 32) + ((675 : ℝ) / 4) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((355125 : ℝ) / 128) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((60408 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((45306 : ℝ) / 5) + ((846 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((678339 : ℝ) / 98) + ((1269 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((10545309 : ℝ) / 1960) + ((101547 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5210001 : ℝ) / 1225) + ((209547 : ℝ) / 980) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((26800227 : ℝ) / 7840) + ((8397 : ℝ) / 40) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((87614451 : ℝ) / 31360) + ((787077 : ℝ) / 3920) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((41623929 : ℝ) / 17920) + ((212229 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7046451 : ℝ) / 3584) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((3788892 : ℝ) / 455) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2841669 : ℝ) / 455) + ((837 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((30433959 : ℝ) / 6370) + ((2511 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((23720121 : ℝ) / 6370) + ((100521 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((21512007 : ℝ) / 7280) + ((415287 : ℝ) / 1960) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((486497097 : ℝ) / 203840) + ((66663 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((114264693 : ℝ) / 58240) + ((6259923 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((95632137 : ℝ) / 58240) + ((211437 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((652405491 : ℝ) / 465920) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((519804 : ℝ) / 91) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((389853 : ℝ) / 91) + ((40149 : ℝ) / 364) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((66933675 : ℝ) / 20384) + ((120447 : ℝ) / 728) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((209431251 : ℝ) / 81536) + ((3860631 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((835236279 : ℝ) / 407680) + ((998433 : ℝ) / 5096) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((67894443 : ℝ) / 40768) + ((1285047 : ℝ) / 6656) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1799449803 : ℝ) / 1304576) + ((121007763 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((867843315 : ℝ) / 745472) + ((8200629 : ℝ) / 46592) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((373430763 : ℝ) / 372736) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((3895137 : ℝ) / 1001) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((11685411 : ℝ) / 4004) + ((70713 : ℝ) / 728) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((143675163 : ℝ) / 64064) + ((212139 : ℝ) / 1456) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((451726875 : ℝ) / 256256) + ((6807483 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((12696072273 : ℝ) / 8968960) + ((1764423 : ℝ) / 10192) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1040654547 : ℝ) / 896896) + ((2277963 : ℝ) / 13312) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((27846279693 : ℝ) / 28700672) + ((215328375 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((13571587125 : ℝ) / 16400384) + ((14656545 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5905404459 : ℝ) / 8200192) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((15035589 : ℝ) / 5720) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((45106767 : ℝ) / 22880) + ((118251 : ℝ) / 1430) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1947731553 : ℝ) / 1281280) + ((354753 : ℝ) / 2860) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6162678693 : ℝ) / 5125120) + ((6515073 : ℝ) / 45760) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((24960442167 : ℝ) / 25625600) + ((6774111 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8270930979 : ℝ) / 10250240) + ((9779049 : ℝ) / 66560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((55996485957 : ℝ) / 82001920) + ((208545759 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((27645481953 : ℝ) / 46858240) + ((99923229 : ℝ) / 732160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1219143753 : ℝ) / 2342912) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((10064089 : ℝ) / 5720) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((30192267 : ℝ) / 22880) + ((392229 : ℝ) / 5720) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((32738315 : ℝ) / 32032) + ((1176687 : ℝ) / 11440) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1044335529 : ℝ) / 1281280) + ((75783681 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8553982449 : ℝ) / 12812800) + ((79088481 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((5744558403 : ℝ) / 10250240) + ((3278799 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2466760097 : ℝ) / 5125120) + ((2462564187 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4947330579 : ℝ) / 11714560) + ((169735851 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((8864753809 : ℝ) / 23429120) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((53402373 : ℝ) / 45760) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((160207119 : ℝ) / 183040) + ((1018827 : ℝ) / 18304) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((635341761 : ℝ) / 931840) + ((3056481 : ℝ) / 36608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((22526640351 : ℝ) / 41000960) + ((140956281 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1461628071 : ℝ) / 3203200) + ((147785553 : ℝ) / 1464320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((63849566331 : ℝ) / 164003840) + ((215805141 : ℝ) / 2129920) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((111619446273 : ℝ) / 328007680) + ((4666307859 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((56988891981 : ℝ) / 187432960) + ((2270395269 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((25988830281 : ℝ) / 93716480) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((49184019 : ℝ) / 64064) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((147552057 : ℝ) / 256256) + ((11375775 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((12968705025 : ℝ) / 28700672) + ((34127325 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((42352108497 : ℝ) / 114802688) + ((2210207715 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((178898673033 : ℝ) / 574013440) + ((2330580195 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((31128275457 : ℝ) / 114802688) + ((69994935 : ℝ) / 851968) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((111101154993 : ℝ) / 459210752) + ((74842540785 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1504072017 : ℝ) / 6815744) + ((5253900705 : ℝ) / 65601536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15391625283 : ℝ) / 74973184) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((1461375 : ℝ) / 2912) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4384125 : ℝ) / 11648) + ((6503841 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((239367987 : ℝ) / 802816) + ((19511523 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((10329262479 : ℝ) / 41746432) + ((317111877 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((44542864953 : ℝ) / 208732160) + ((673445313 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((323673813 : ℝ) / 1703936) + ((3508857 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((57952031391 : ℝ) / 333971456) + ((689561181 : ℝ) / 10436608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((297135135 : ℝ) / 1835008) + ((783426843 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((29365207965 : ℝ) / 190840832) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((152284383 : ℝ) / 465920) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((456853149 : ℝ) / 1863680) + ((25283907 : ℝ) / 931840) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((10255123539 : ℝ) / 52183040) + ((75851721 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((34732615077 : ℝ) / 208732160) + ((2476975383 : ℝ) / 52183040) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((61403589459 : ℝ) / 417464320) + ((1326133863 : ℝ) / 26091520) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((224456370219 : ℝ) / 1669857280) + ((894198771 : ℝ) / 17039360) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((420880650543 : ℝ) / 3339714560) + ((88965170559 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1437333201 : ℝ) / 11927552) + ((6399229797 : ℝ) / 119275520) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((223394682681 : ℝ) / 1908408320) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((4360167 : ℝ) / 20480) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((13080501 : ℝ) / 81920) + ((24031359 : ℝ) / 1146880) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2086621569 : ℝ) / 16056320) + ((72094077 : ℝ) / 2293760) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((7242592239 : ℝ) / 64225280) + ((591807249 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((16471447443 : ℝ) / 160563200) + ((2559760137 : ℝ) / 64225280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((24800806719 : ℝ) / 256901120) + ((436985901 : ℝ) / 10485760) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((191266417863 : ℝ) / 2055208960) + ((44087053329 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((107171258301 : ℝ) / 1174405120) + ((1608043041 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((53203978881 : ℝ) / 587202560) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((5710857 : ℝ) / 40960) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((17132571 : ℝ) / 163840) + ((1059453 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((198942591 : ℝ) / 2293760) + ((3178359 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((355565673 : ℝ) / 4587520) + ((26255583 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3341864529 : ℝ) / 45875200) + ((114830379 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((92738547 : ℝ) / 1310720) + ((139145769 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((41213345349 : ℝ) / 587202560) + ((2035708443 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((23672059983 : ℝ) / 335544320) + ((75347847 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((11998257783 : ℝ) / 167772160) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((2961 : ℝ) / 32) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((8883 : ℝ) / 128) + ((823275 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((30886119 : ℝ) / 524288) + ((2469825 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((114243615 : ℝ) / 2097152) + ((20542275 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((7788640941 : ℝ) / 146800640) + ((90908325 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6251484825 : ℝ) / 117440512) + ((111759075 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((25505237781 : ℝ) / 469762048) + ((1659854025 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((14991164937 : ℝ) / 268435456) + ((62322975 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1935175491 : ℝ) / 33554432) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((258237 : ℝ) / 4096) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((774711 : ℝ) / 16384) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((75666051 : ℝ) / 1835008) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((290540115 : ℝ) / 7340032) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2934177507 : ℝ) / 73400320) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2429055135 : ℝ) / 58720256) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((5080819941 : ℝ) / 117440512) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1522988541 : ℝ) / 33554432) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0000BernsteinRow0 s t +
    karlssonLeaf0000BernsteinRow1 s t +
    karlssonLeaf0000BernsteinRow2 s t +
    karlssonLeaf0000BernsteinRow3 s t +
    karlssonLeaf0000BernsteinRow4 s t +
    karlssonLeaf0000BernsteinRow5 s t +
    karlssonLeaf0000BernsteinRow6 s t +
    karlssonLeaf0000BernsteinRow7 s t +
    karlssonLeaf0000BernsteinRow8 s t +
    karlssonLeaf0000BernsteinRow9 s t +
    karlssonLeaf0000BernsteinRow10 s t +
    karlssonLeaf0000BernsteinRow11 s t +
    karlssonLeaf0000BernsteinRow12 s t +
    karlssonLeaf0000BernsteinRow13 s t +
    karlssonLeaf0000BernsteinRow14 s t +
    karlssonLeaf0000BernsteinRow15 s t +
    karlssonLeaf0000BernsteinRow16 s t
noncomputable def karlssonLeaf0000ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((270292399533 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((202646664621 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((154328282541 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((119297455533 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((467839585377 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((74451957165 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((60107437485 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((49254675885 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((40997139885 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((185735230893 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((139228788141 : ℝ) / 7340032) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((106085397933 : ℝ) / 7340032) + (108 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((82096076205 : ℝ) / 7340032) + ((864 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((322488077409 : ℝ) / 36700160) + ((891 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((51434665389 : ℝ) / 7340032) + ((999 : ℝ) / 8) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((41640048045 : ℝ) / 7340032) + ((13365 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((34236282285 : ℝ) / 7340032) + ((225 : ℝ) / 2) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((28610835885 : ℝ) / 7340032) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((640477138017 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((479994678369 : ℝ) / 36700160) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((365930581089 : ℝ) / 36700160) + (162 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((283531381857 : ℝ) / 36700160) + ((1296 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((159407292339 : ℝ) / 26214400) + ((2673 : ℝ) / 14) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((35682825645 : ℝ) / 7340032) + ((2997 : ℝ) / 16) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((28977509805 : ℝ) / 7340032) + ((40095 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((23914362285 : ℝ) / 7340032) + ((675 : ℝ) / 4) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((20073747885 : ℝ) / 7340032) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((441943952481 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((331094789217 : ℝ) / 36700160) + ((846 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((353611216827 : ℝ) / 51380224) + ((1269 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1372025837223 : ℝ) / 256901120) + ((101547 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5412237488451 : ℝ) / 1284505600) + ((209547 : ℝ) / 980) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((868020934311 : ℝ) / 256901120) + ((8397 : ℝ) / 40) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((707568678567 : ℝ) / 256901120) + ((787077 : ℝ) / 3920) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((83793106017 : ℝ) / 36700160) + ((212229 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((14140591533 : ℝ) / 7340032) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((3954056110317 : ℝ) / 477102080) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2960820805869 : ℝ) / 477102080) + ((837 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((15823963743867 : ℝ) / 3339714560) + ((2511 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((12303979046523 : ℝ) / 3339714560) + ((100521 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1390925783277 : ℝ) / 477102080) + ((415287 : ℝ) / 1960) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((7838572684923 : ℝ) / 3339714560) + ((66663 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((917171257581 : ℝ) / 477102080) + ((6259923 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((764533358829 : ℝ) / 477102080) + ((211437 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((649178115309 : ℝ) / 477102080) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((541276977609 : ℝ) / 95420416) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((405013477833 : ℝ) / 95420416) + ((40149 : ℝ) / 364) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2166843511935 : ℝ) / 667942912) + ((120447 : ℝ) / 728) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1689221657727 : ℝ) / 667942912) + ((3860631 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6710059845243 : ℝ) / 3339714560) + ((998433 : ℝ) / 5096) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1085943403647 : ℝ) / 667942912) + ((1285047 : ℝ) / 6656) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((894879148671 : ℝ) / 667942912) + ((121007763 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((107306922825 : ℝ) / 95420416) + ((8200629 : ℝ) / 46592) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((91821253833 : ℝ) / 95420416) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((4042799938467 : ℝ) / 1049624576) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3021713144739 : ℝ) / 1049624576) + ((70713 : ℝ) / 728) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((330346662021 : ℝ) / 149946368) + ((212139 : ℝ) / 1456) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1808726043555 : ℝ) / 1049624576) + ((6807483 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((50548958754633 : ℝ) / 36736860160) + ((1764423 : ℝ) / 10192) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8234211393909 : ℝ) / 7347372032) + ((2277963 : ℝ) / 13312) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6837816946293 : ℝ) / 7347372032) + ((215328375 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((827034339555 : ℝ) / 1049624576) + ((14656545 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((714344534307 : ℝ) / 1049624576) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((13587476867631 : ℝ) / 5248122880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((10138673605167 : ℝ) / 5248122880) + ((118251 : ℝ) / 1430) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1110024608409 : ℝ) / 749731840) + ((354753 : ℝ) / 2860) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6102846799407 : ℝ) / 5248122880) + ((6515073 : ℝ) / 45760) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((24520811867883 : ℝ) / 26240614400) + ((6774111 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((4026980479023 : ℝ) / 5248122880) + ((9779049 : ℝ) / 66560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3376038919023 : ℝ) / 5248122880) + ((208545759 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2888557796511 : ℝ) / 5248122880) + ((99923229 : ℝ) / 732160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((504629164899 : ℝ) / 1049624576) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((9026105731631 : ℝ) / 5248122880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6717645253167 : ℝ) / 5248122880) + ((392229 : ℝ) / 5720) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((147317409925 : ℝ) / 149946368) + ((1176687 : ℝ) / 11440) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((4069862144559 : ℝ) / 5248122880) + ((75783681 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((16479875144427 : ℝ) / 26240614400) + ((79088481 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2733477720111 : ℝ) / 5248122880) + ((3278799 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2318226157103 : ℝ) / 5248122880) + ((2462564187 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2008667917167 : ℝ) / 5248122880) + ((169735851 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1777968670991 : ℝ) / 5248122880) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((5916875172399 : ℝ) / 5248122880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4385722333743 : ℝ) / 5248122880) + ((1018827 : ℝ) / 18304) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((306409874157 : ℝ) / 477102080) + ((3056481 : ℝ) / 36608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2675673782703 : ℝ) / 5248122880) + ((140956281 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((10934976246507 : ℝ) / 26240614400) + ((147785553 : ℝ) / 1464320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1835449940367 : ℝ) / 5248122880) + ((215805141 : ℝ) / 2129920) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((225453565449 : ℝ) / 749731840) + ((4666307859 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1387952793243 : ℝ) / 5248122880) + ((2270395269 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1247638313511 : ℝ) / 5248122880) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((764283730851 : ℝ) / 1049624576) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((562825989027 : ℝ) / 1049624576) + ((11375775 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3029157831285 : ℝ) / 7347372032) + ((34127325 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2419704288693 : ℝ) / 7347372032) + ((2210207715 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9995361798537 : ℝ) / 36736860160) + ((2330580195 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1701378974133 : ℝ) / 7347372032) + ((69994935 : ℝ) / 851968) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1486787824773 : ℝ) / 7347372032) + ((74842540785 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((17279986743 : ℝ) / 95420416) + ((5253900705 : ℝ) / 65601536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((173935517517 : ℝ) / 1049624576) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((44109314505 : ℝ) / 95420416) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((32137730505 : ℝ) / 95420416) + ((6503841 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((13285770363 : ℝ) / 51380224) + ((19511523 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((138829049199 : ℝ) / 667942912) + ((317111877 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((580490086923 : ℝ) / 3339714560) + ((673445313 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((14348712033 : ℝ) / 95420416) + ((3508857 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((89464912317 : ℝ) / 667942912) + ((689561181 : ℝ) / 10436608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((128285775 : ℝ) / 1048576) + ((783426843 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((21811164975 : ℝ) / 190840832) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((137054100717 : ℝ) / 477102080) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((98069298669 : ℝ) / 477102080) + ((25283907 : ℝ) / 931840) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((524132154171 : ℝ) / 3339714560) + ((75851721 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((423526088907 : ℝ) / 3339714560) + ((2476975383 : ℝ) / 52183040) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((359032963347 : ℝ) / 3339714560) + ((1326133863 : ℝ) / 26091520) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((316716988113 : ℝ) / 3339714560) + ((894198771 : ℝ) / 17039360) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((144342449109 : ℝ) / 1669857280) + ((88965170559 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((7721644113 : ℝ) / 95420416) + ((6399229797 : ℝ) / 119275520) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((147854252781 : ℝ) / 1908408320) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((6360718689 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4407363873 : ℝ) / 36700160) + ((24031359 : ℝ) / 1146880) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((23217041079 : ℝ) / 256901120) + ((72094077 : ℝ) / 2293760) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((18801464931 : ℝ) / 256901120) + ((591807249 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((80927059419 : ℝ) / 1284505600) + ((2559760137 : ℝ) / 64225280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((7315951347 : ℝ) / 128450560) + ((436985901 : ℝ) / 10485760) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((109915185663 : ℝ) / 2055208960) + ((44087053329 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((8669262843 : ℝ) / 167772160) + ((1608043041 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((29960769681 : ℝ) / 587202560) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((3664227297 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2384995329 : ℝ) / 36700160) + ((1059453 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1730380881 : ℝ) / 36700160) + ((3178359 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1391824809 : ℝ) / 36700160) + ((26255583 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6103955241 : ℝ) / 183500800) + ((114830379 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1143978741 : ℝ) / 36700160) + ((139145769 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2567162307 : ℝ) / 83886080) + ((2035708443 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((72731583081 : ℝ) / 2348810240) + ((75347847 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((37501386081 : ℝ) / 1174405120) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((388642221 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((218846637 : ℝ) / 7340032) + ((823275 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((141865551 : ℝ) / 7340032) + ((2469825 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((218625075 : ℝ) / 14680064) + ((20542275 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1977838641 : ℝ) / 146800640) + ((90908325 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1602842985 : ℝ) / 117440512) + ((111759075 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6910670421 : ℝ) / 469762048) + ((1659854025 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((30559885119 : ℝ) / 1879048192) + ((62322975 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4248944757 : ℝ) / 234881024) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((172220589 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((56530413 : ℝ) / 7340032) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((12124089 : ℝ) / 7340032) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + ((0 : ℝ) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((28776357 : ℝ) / 73400320) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((104734215 : ℝ) / 58720256) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((432178101 : ℝ) / 117440512) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1363636107 : ℝ) / 234881024) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3763452681 : ℝ) / 469762048) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0000ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0000ShiftedBernsteinRow0 s t +
    karlssonLeaf0000ShiftedBernsteinRow1 s t +
    karlssonLeaf0000ShiftedBernsteinRow2 s t +
    karlssonLeaf0000ShiftedBernsteinRow3 s t +
    karlssonLeaf0000ShiftedBernsteinRow4 s t +
    karlssonLeaf0000ShiftedBernsteinRow5 s t +
    karlssonLeaf0000ShiftedBernsteinRow6 s t +
    karlssonLeaf0000ShiftedBernsteinRow7 s t +
    karlssonLeaf0000ShiftedBernsteinRow8 s t +
    karlssonLeaf0000ShiftedBernsteinRow9 s t +
    karlssonLeaf0000ShiftedBernsteinRow10 s t +
    karlssonLeaf0000ShiftedBernsteinRow11 s t +
    karlssonLeaf0000ShiftedBernsteinRow12 s t +
    karlssonLeaf0000ShiftedBernsteinRow13 s t +
    karlssonLeaf0000ShiftedBernsteinRow14 s t +
    karlssonLeaf0000ShiftedBernsteinRow15 s t +
    karlssonLeaf0000ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf0001BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    (((5625 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((4500 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((26100 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((22320 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((98352 : ℝ) / 35) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((17856 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((16704 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((7875 : ℝ) / 2) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((101475 : ℝ) / 32) + ((1575 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((74115 : ℝ) / 28) + ((10215 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((127773 : ℝ) / 56) + ((594 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((70974 : ℝ) / 35) + ((558 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((26001 : ℝ) / 14) + ((531 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((12276 : ℝ) / 7) + ((513 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((1710 : ℝ) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((1728 : ℝ) + (72 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((355125 : ℝ) / 128) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((144075 : ℝ) / 64) + ((4725 : ℝ) / 32) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((424365 : ℝ) / 224) + ((30645 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((26355 : ℝ) / 16) + ((891 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((295437 : ℝ) / 200) + ((837 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((191181 : ℝ) / 140) + ((1593 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((91137 : ℝ) / 70) + ((1539 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6411 : ℝ) / 5) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((6546 : ℝ) / 5) + (108 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((7046451 : ℝ) / 3584) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4120083 : ℝ) / 2560) + ((46539 : ℝ) / 280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((42872733 : ℝ) / 31360) + ((302283 : ℝ) / 1960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((37634859 : ℝ) / 31360) + ((35208 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((42598377 : ℝ) / 39200) + ((6624 : ℝ) / 49) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((7952823 : ℝ) / 7840) + ((31554 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((273447 : ℝ) / 280) + ((6102 : ℝ) / 49) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((271953 : ℝ) / 280) + ((612 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((10017 : ℝ) / 10) + ((612 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((652405491 : ℝ) / 465920) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((38553849 : ℝ) / 33280) + ((745497 : ℝ) / 4480) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((115877781 : ℝ) / 116480) + ((4856409 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((359861841 : ℝ) / 407680) + ((141831 : ℝ) / 980) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((32926545 : ℝ) / 40768) + ((26757 : ℝ) / 196) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((77613381 : ℝ) / 101920) + ((255501 : ℝ) / 1960) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((37724067 : ℝ) / 50960) + ((49491 : ℝ) / 392) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((386469 : ℝ) / 520) + ((621 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((281655 : ℝ) / 364) + ((621 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((373430763 : ℝ) / 372736) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((89411391 : ℝ) / 106496) + ((14564637 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3721005 : ℝ) / 5096) + ((95295069 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((855428391 : ℝ) / 1304576) + ((2795355 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((494669403 : ℝ) / 815360) + ((2647413 : ℝ) / 20384) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((188484867 : ℝ) / 326144) + ((5072913 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((11560347 : ℝ) / 20384) + ((4924971 : ℝ) / 40768) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6691221 : ℝ) / 11648) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((878391 : ℝ) / 1456) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((5905404459 : ℝ) / 8200192) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1435718673 : ℝ) / 2342912) + ((26291385 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3880208061 : ℝ) / 7175168) + ((173024505 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1284066171 : ℝ) / 2609152) + ((5104863 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8265219111 : ℝ) / 17937920) + ((4860081 : ℝ) / 40768) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3182139981 : ℝ) / 7175168) + ((9352989 : ℝ) / 81536) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((98473437 : ℝ) / 224224) + ((9108207 : ℝ) / 81536) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((114922107 : ℝ) / 256256) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15203583 : ℝ) / 32032) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((1219143753 : ℝ) / 2342912) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((21120268167 : ℝ) / 46858240) + ((181518687 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1507192623 : ℝ) / 3727360) + ((171890217 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2783327067 : ℝ) / 7454720) + ((1021491 : ℝ) / 9152) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4534844931 : ℝ) / 12812800) + ((4893489 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((641495079 : ℝ) / 1863680) + ((9466029 : ℝ) / 91520) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((880951671 : ℝ) / 2562560) + ((9252063 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((23534721 : ℝ) / 66560) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((17238879 : ℝ) / 45760) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((8864753809 : ℝ) / 23429120) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((391742323 : ℝ) / 1171456) + ((24084081 : ℝ) / 225280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((12524729333 : ℝ) / 41000960) + ((2093263101 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2936230013 : ℝ) / 10250240) + ((4824279 : ℝ) / 49280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((14096119211 : ℝ) / 51251200) + ((60529221 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((692466889 : ℝ) / 2562560) + ((117778833 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((697069757 : ℝ) / 2562560) + ((115592427 : ℝ) / 1281280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((25764283 : ℝ) / 91520) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((27601633 : ℝ) / 91520) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((25988830281 : ℝ) / 93716480) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((46966429143 : ℝ) / 187432960) + ((4264118307 : ℝ) / 46858240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((347912847 : ℝ) / 1490944) + ((4112963397 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((72938061243 : ℝ) / 328007680) + ((124383843 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4030733439 : ℝ) / 18636800) + ((24204969 : ℝ) / 292864) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2513876121 : ℝ) / 11714560) + ((237011193 : ℝ) / 2928640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1115028927 : ℝ) / 5125120) + ((46730439 : ℝ) / 585728) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((132551847 : ℝ) / 585728) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((17826777 : ℝ) / 73216) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((15391625283 : ℝ) / 74973184) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((14238458379 : ℝ) / 74973184) + ((10073814615 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((82848565845 : ℝ) / 459210752) + ((68766725655 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((160482482505 : ℝ) / 918421504) + ((2100957345 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((28229233113 : ℝ) / 164003840) + ((2062068975 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((39579830217 : ℝ) / 229605376) + ((4065805395 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((5047298937 : ℝ) / 28700672) + ((4026917025 : ℝ) / 57401344) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((215139123 : ℝ) / 1171456) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((406310733 : ℝ) / 2050048) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((29365207965 : ℝ) / 190840832) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1987740135 : ℝ) / 13631488) + ((384325101 : ℝ) / 5963776) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((23597054433 : ℝ) / 166985728) + ((2654808237 : ℝ) / 41746432) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((11610474417 : ℝ) / 83492864) + ((81989865 : ℝ) / 1304576) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((57884494131 : ℝ) / 417464320) + ((81201699 : ℝ) / 1304576) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((208819809 : ℝ) / 1490944) + ((161221149 : ℝ) / 2609152) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1499150403 : ℝ) / 10436608) + ((160432983 : ℝ) / 2609152) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((224286759 : ℝ) / 1490944) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((121246605 : ℝ) / 745472) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((223394682681 : ℝ) / 1908408320) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((15486860943 : ℝ) / 136314880) + ((990516357 : ℝ) / 18350080) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((37483024419 : ℝ) / 333971456) + ((90060713217 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((187228582497 : ℝ) / 1669857280) + ((43266231 : ℝ) / 802816) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((94402009827 : ℝ) / 834928640) + ((2810610009 : ℝ) / 52183040) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((48043283643 : ℝ) / 417464320) + ((5618677509 : ℝ) / 104366080) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1767312441 : ℝ) / 14909440) + ((5616982503 : ℝ) / 104366080) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1854063747 : ℝ) / 14909440) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((200589525 : ℝ) / 1490944) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((53203978881 : ℝ) / 587202560) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((15092093889 : ℝ) / 167772160) + ((6644338371 : ℝ) / 146800640) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((18592331409 : ℝ) / 205520896) + ((47057380227 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((188307037773 : ℝ) / 2055208960) + ((297109593 : ℝ) / 6422528) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((119880799029 : ℝ) / 1284505600) + ((1497703779 : ℝ) / 32112640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((49126768137 : ℝ) / 513802240) + ((3013641279 : ℝ) / 64225280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6345623259 : ℝ) / 64225280) + ((3025797093 : ℝ) / 64225280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((380672631 : ℝ) / 3670016) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((51458625 : ℝ) / 458752) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((11998257783 : ℝ) / 167772160) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((24320971149 : ℝ) / 335544320) + ((319655457 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4348453443 : ℝ) / 58720256) + ((2291405409 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((44571161319 : ℝ) / 587202560) + ((73082655 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((28617674187 : ℝ) / 367001600) + ((74278593 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1684128333 : ℝ) / 20971520) + ((150351093 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1526056617 : ℝ) / 18350080) + ((151547031 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((91523805 : ℝ) / 1048576) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((12354375 : ℝ) / 131072) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((1935175491 : ℝ) / 33554432) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((15971642919 : ℝ) / 268435456) + ((271028475 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((14468455359 : ℝ) / 234881024) + ((1964166075 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((29950678701 : ℝ) / 469762048) + ((63217125 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9679974021 : ℝ) / 146800640) + ((64705275 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8005729905 : ℝ) / 117440512) + ((131642775 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1037462085 : ℝ) / 14680064) + ((133130925 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((310750875 : ℝ) / 4194304) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2615625 : ℝ) / 32768) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((835507161 : ℝ) / 16777216) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((764625051 : ℝ) / 14680064) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((56940453 : ℝ) / 1048576) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8283555009 : ℝ) / 146800640) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((429171975 : ℝ) / 7340032) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6952275 : ℝ) / 114688) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4156875 : ℝ) / 65536) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((17859375 : ℝ) / 262144) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0001BernsteinRow0 s t +
    karlssonLeaf0001BernsteinRow1 s t +
    karlssonLeaf0001BernsteinRow2 s t +
    karlssonLeaf0001BernsteinRow3 s t +
    karlssonLeaf0001BernsteinRow4 s t +
    karlssonLeaf0001BernsteinRow5 s t +
    karlssonLeaf0001BernsteinRow6 s t +
    karlssonLeaf0001BernsteinRow7 s t +
    karlssonLeaf0001BernsteinRow8 s t +
    karlssonLeaf0001BernsteinRow9 s t +
    karlssonLeaf0001BernsteinRow10 s t +
    karlssonLeaf0001BernsteinRow11 s t +
    karlssonLeaf0001BernsteinRow12 s t +
    karlssonLeaf0001BernsteinRow13 s t +
    karlssonLeaf0001BernsteinRow14 s t +
    karlssonLeaf0001BernsteinRow15 s t +
    karlssonLeaf0001BernsteinRow16 s t
noncomputable def karlssonLeaf0001ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((374293357137 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((298795885137 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1729183330359 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1475511824439 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6488500891923 : ℝ) / 2348810240) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1175937855543 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1098628444215 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((151424819793 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((151424819793 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((261047149137 : ℝ) / 67108864) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((209614496337 : ℝ) / 67108864) + ((1575 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1221085343799 : ℝ) / 469762048) + ((10215 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1049479589943 : ℝ) / 469762048) + ((594 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4651194413331 : ℝ) / 2348810240) + ((558 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((850090766391 : ℝ) / 469762048) + ((531 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((801470394423 : ℝ) / 469762048) + ((513 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((111562154577 : ℝ) / 67108864) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((112770114129 : ℝ) / 67108864) + (72 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((182993773137 : ℝ) / 67108864) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((147879584337 : ℝ) / 67108864) + ((4725 : ℝ) / 32) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((867599888439 : ℝ) / 469762048) + ((30645 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((107346879057 : ℝ) / 67108864) + ((891 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2398455110121 : ℝ) / 1677721600) + ((837 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3095694831891 : ℝ) / 2348810240) + ((1593 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2946260168979 : ℝ) / 2348810240) + ((1539 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((414264912789 : ℝ) / 335544320) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((423324609429 : ℝ) / 335544320) + (108 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((901234405431 : ℝ) / 469762048) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((524057504661 : ℝ) / 335544320) + ((46539 : ℝ) / 280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((21695128737669 : ℝ) / 16441671680) + ((302283 : ℝ) / 1960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((18948974253957 : ℝ) / 16441671680) + ((35208 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((85422618015129 : ℝ) / 82208358400) + ((6624 : ℝ) / 49) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((15895747958661 : ℝ) / 16441671680) + ((31554 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2182049591571 : ℝ) / 2348810240) + ((6102 : ℝ) / 49) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2169517011219 : ℝ) / 2348810240) + ((612 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((320144731029 : ℝ) / 335544320) + ((612 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((41302774955511 : ℝ) / 30534533120) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4845719910033 : ℝ) / 4362076160) + ((745497 : ℝ) / 4480) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((28923393719799 : ℝ) / 30534533120) + ((4856409 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((178498345775553 : ℝ) / 213741731840) + ((141831 : ℝ) / 980) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((32491405026189 : ℝ) / 42748346368) + ((26757 : ℝ) / 196) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((152594158072257 : ℝ) / 213741731840) + ((255501 : ℝ) / 1960) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((148053305995713 : ℝ) / 213741731840) + ((49491 : ℝ) / 392) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3034326759057 : ℝ) / 4362076160) + ((621 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4434732511947 : ℝ) / 6106906624) + ((621 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((5827635360459 : ℝ) / 6106906624) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((690936077853 : ℝ) / 872415232) + ((14564637 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((29179472487309 : ℝ) / 42748346368) + ((95295069 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((25996097692557 : ℝ) / 42748346368) + ((2795355 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((119501716861377 : ℝ) / 213741731840) + ((2647413 : ℝ) / 20384) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((22670508663693 : ℝ) / 42748346368) + ((5072913 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((22209225008013 : ℝ) / 42748346368) + ((4924971 : ℝ) / 40768) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3217472615115 : ℝ) / 6106906624) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3393584624331 : ℝ) / 6106906624) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((45179876462265 : ℝ) / 67175972864) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((5423961275199 : ℝ) / 9596567552) + ((26291385 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((231912937424655 : ℝ) / 470231810048) + ((173024505 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((19003560321933 : ℝ) / 42748346368) + ((5104863 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((971436909011787 : ℝ) / 2351159050240) + ((4860081 : ℝ) / 40768) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((186164347733775 : ℝ) / 470231810048) + ((9352989 : ℝ) / 81536) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((184133387290383 : ℝ) / 470231810048) + ((9108207 : ℝ) / 81536) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((26928943951545 : ℝ) / 67175972864) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((28687027629753 : ℝ) / 67175972864) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((4536870402879 : ℝ) / 9596567552) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((19343442555963 : ℝ) / 47982837760) + ((181518687 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((10893650664951 : ℝ) / 30534533120) + ((171890217 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((9947236363767 : ℝ) / 30534533120) + ((1021491 : ℝ) / 9152) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((514461273149457 : ℝ) / 1679399321600) + ((4893489 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((9056984071671 : ℝ) / 30534533120) + ((9466029 : ℝ) / 91520) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((99482113091997 : ℝ) / 335879864320) + ((9252063 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1334761289361 : ℝ) / 4362076160) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15792562739259 : ℝ) / 47982837760) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((15871303753787 : ℝ) / 47982837760) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2752410700607 : ℝ) / 9596567552) + ((24084081 : ℝ) / 225280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((86616598366621 : ℝ) / 335879864320) + ((2093263101 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((80228400736669 : ℝ) / 335879864320) + ((4824279 : ℝ) / 49280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((381971712659473 : ℝ) / 1679399321600) + ((60529221 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((74777035745693 : ℝ) / 335879864320) + ((117778833 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((75380342860189 : ℝ) / 335879864320) + ((115592427 : ℝ) / 1281280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((11224192358459 : ℝ) / 47982837760) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((12187492915259 : ℝ) / 47982837760) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((11022569056827 : ℝ) / 47982837760) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9739693813563 : ℝ) / 47982837760) + ((4264118307 : ℝ) / 46858240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1134396760779 : ℝ) / 6106906624) + ((4112963397 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((58702590383517 : ℝ) / 335879864320) + ((124383843 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((25753411818963 : ℝ) / 152672665600) + ((24204969 : ℝ) / 292864) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8013124544571 : ℝ) / 47982837760) + ((237011193 : ℝ) / 2928640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((57088551430557 : ℝ) / 335879864320) + ((46730439 : ℝ) / 585728) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1714987051839 : ℝ) / 9596567552) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1879848905535 : ℝ) / 9596567552) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((1513385626815 : ℝ) / 9596567552) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1365780263103 : ℝ) / 9596567552) + ((10073814615 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((62456553364239 : ℝ) / 470231810048) + ((68766725655 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((59786652981519 : ℝ) / 470231810048) + ((2100957345 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((41827485086109 : ℝ) / 335879864320) + ((2062068975 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((58679114223375 : ℝ) / 470231810048) + ((4065805395 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((60314567722767 : ℝ) / 470231810048) + ((4026917025 : ℝ) / 57401344) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1305677286207 : ℝ) / 9596567552) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((10116793233081 : ℝ) / 67175972864) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((649032394347 : ℝ) / 6106906624) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((85693331421 : ℝ) / 872415232) + ((384325101 : ℝ) / 5963776) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4006266111117 : ℝ) / 42748346368) + ((2654808237 : ℝ) / 41746432) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3909983077773 : ℝ) / 42748346368) + ((81989865 : ℝ) / 1304576) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((19463961876417 : ℝ) / 213741731840) + ((81201699 : ℝ) / 1304576) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((564671677131 : ℝ) / 6106906624) + ((161221149 : ℝ) / 2609152) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4105940226957 : ℝ) / 42748346368) + ((160432983 : ℝ) / 2609152) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((628024304331 : ℝ) / 6106906624) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((702597927627 : ℝ) / 6106906624) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((2121043620231 : ℝ) / 30534533120) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((287969364081 : ℝ) / 4362076160) + ((990516357 : ℝ) / 18350080) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2763247301901 : ℝ) / 42748346368) + ((90060713217 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((13792359440961 : ℝ) / 213741731840) + ((43266231 : ℝ) / 802816) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13994015397057 : ℝ) / 213741731840) + ((2810610009 : ℝ) / 52183040) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((14425262106561 : ℝ) / 213741731840) + ((5618677509 : ℝ) / 104366080) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2166184576503 : ℝ) / 30534533120) + ((5616982503 : ℝ) / 104366080) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2343851251191 : ℝ) / 30534533120) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((530960433867 : ℝ) / 6106906624) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((101025815319 : ℝ) / 2348810240) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((14214173463 : ℝ) / 335544320) + ((6644338371 : ℝ) / 146800640) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((140971162257 : ℝ) / 3288334336) + ((47057380227 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((723925600749 : ℝ) / 16441671680) + ((297109593 : ℝ) / 6422528) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3759717630681 : ℝ) / 82208358400) + ((1497703779 : ℝ) / 32112640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((789525878949 : ℝ) / 16441671680) + ((3013641279 : ℝ) / 64225280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((841948852869 : ℝ) / 16441671680) + ((3025797093 : ℝ) / 64225280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((26368076727 : ℝ) / 469762048) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((30335611959 : ℝ) / 469762048) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((8026501251 : ℝ) / 335544320) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4175478417 : ℝ) / 167772160) + ((319655457 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((12429607503 : ℝ) / 469762048) + ((2291405409 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((66494545071 : ℝ) / 2348810240) + ((73082655 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((356815072959 : ℝ) / 11744051200) + ((74278593 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((10976039013 : ℝ) / 335544320) + ((150351093 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((83545146771 : ℝ) / 2348810240) + ((151547031 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2663520657 : ℝ) / 67108864) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3131437137 : ℝ) / 67108864) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((676348119 : ℝ) / 67108864) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3195631467 : ℝ) / 268435456) + ((271028475 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6578890677 : ℝ) / 469762048) + ((1964166075 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1898164665 : ℝ) / 117440512) + ((63217125 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((43089484131 : ℝ) / 2348810240) + ((64705275 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((9664899579 : ℝ) / 469762048) + ((131642775 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((10840766679 : ℝ) / 469762048) + ((133130925 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1778011137 : ℝ) / 67108864) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2162797137 : ℝ) / 67108864) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    (((0 : ℝ) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((148025781 : ℝ) / 67108864) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2109981591 : ℝ) / 469762048) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((450186129 : ℝ) / 67108864) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((20746779939 : ℝ) / 2348810240) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((5108986359 : ℝ) / 469762048) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6118498359 : ℝ) / 469762048) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1062637137 : ℝ) / 67108864) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1377997137 : ℝ) / 67108864) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0001ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0001ShiftedBernsteinRow0 s t +
    karlssonLeaf0001ShiftedBernsteinRow1 s t +
    karlssonLeaf0001ShiftedBernsteinRow2 s t +
    karlssonLeaf0001ShiftedBernsteinRow3 s t +
    karlssonLeaf0001ShiftedBernsteinRow4 s t +
    karlssonLeaf0001ShiftedBernsteinRow5 s t +
    karlssonLeaf0001ShiftedBernsteinRow6 s t +
    karlssonLeaf0001ShiftedBernsteinRow7 s t +
    karlssonLeaf0001ShiftedBernsteinRow8 s t +
    karlssonLeaf0001ShiftedBernsteinRow9 s t +
    karlssonLeaf0001ShiftedBernsteinRow10 s t +
    karlssonLeaf0001ShiftedBernsteinRow11 s t +
    karlssonLeaf0001ShiftedBernsteinRow12 s t +
    karlssonLeaf0001ShiftedBernsteinRow13 s t +
    karlssonLeaf0001ShiftedBernsteinRow14 s t +
    karlssonLeaf0001ShiftedBernsteinRow15 s t +
    karlssonLeaf0001ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf0010BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((258237 : ℝ) / 4096) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((774711 : ℝ) / 16384) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((75666051 : ℝ) / 1835008) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((290540115 : ℝ) / 7340032) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2934177507 : ℝ) / 73400320) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2429055135 : ℝ) / 58720256) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((5080819941 : ℝ) / 117440512) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1522988541 : ℝ) / 33554432) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((68733 : ℝ) / 2048) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((206199 : ℝ) / 8192) + ((479475 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((86461371 : ℝ) / 3670016) + ((1438425 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((362455155 : ℝ) / 14680064) + ((12181725 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3948069087 : ℝ) / 146800640) + ((55559925 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((494962245 : ℝ) / 16777216) + ((70754175 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((15141321747 : ℝ) / 469762048) + ((1088293725 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9376651719 : ℝ) / 268435456) + ((42180525 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((314706843 : ℝ) / 8388608) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((880017 : ℝ) / 40960) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2640051 : ℝ) / 163840) + ((371853 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((73531527 : ℝ) / 4587520) + ((1115559 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((329137317 : ℝ) / 18350080) + ((1362069 : ℝ) / 131072) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3766028481 : ℝ) / 183500800) + ((6304797 : ℝ) / 524288) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3419844489 : ℝ) / 146800640) + ((57135969 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((239118051 : ℝ) / 9175040) + ((127512549 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4817888469 : ℝ) / 167772160) + ((35062947 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5234776593 : ℝ) / 167772160) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((90351 : ℝ) / 5120) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((271053 : ℝ) / 20480) + ((1378989 : ℝ) / 286720) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((429884181 : ℝ) / 32112640) + ((4136967 : ℝ) / 573440) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1956407661 : ℝ) / 128450560) + ((8864451 : ℝ) / 1003520) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((22639213503 : ℝ) / 1284505600) + ((164864727 : ℝ) / 16056320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((20700710487 : ℝ) / 1027604480) + ((30640221 : ℝ) / 2621440) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((93007285407 : ℝ) / 4110417920) + ((3365832609 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((58685267259 : ℝ) / 2348810240) + ((66362643 : ℝ) / 4587520) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7976390931 : ℝ) / 293601280) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((820017 : ℝ) / 46592) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2460051 : ℝ) / 186368) + ((16864389 : ℝ) / 3727360) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((681381621 : ℝ) / 52183040) + ((50593167 : ℝ) / 7454720) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3032770329 : ℝ) / 208732160) + ((107834301 : ℝ) / 13045760) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((34522616421 : ℝ) / 2087321600) + ((1988676927 : ℝ) / 208732160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((31182724953 : ℝ) / 1669857280) + ((366190821 : ℝ) / 34078720) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1734258411 : ℝ) / 83492864) + ((39881880009 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((43412691069 : ℝ) / 1908408320) + ((780599943 : ℝ) / 59637760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((46867515579 : ℝ) / 1908408320) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((916161 : ℝ) / 46592) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2748483 : ℝ) / 186368) + ((1731519 : ℝ) / 372736) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((292964703 : ℝ) / 20873216) + ((5194557 : ℝ) / 745472) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1251446895 : ℝ) / 83492864) + ((43808409 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13802999841 : ℝ) / 834928640) + ((15264909 : ℝ) / 1605632) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((12177005265 : ℝ) / 667942912) + ((35821341 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((53186658069 : ℝ) / 2671771648) + ((3827895489 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((32785736481 : ℝ) / 1526726656) + ((147378681 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1092154911 : ℝ) / 47710208) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((12086037 : ℝ) / 512512) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((36258111 : ℝ) / 2050048) + ((20625471 : ℝ) / 4100096) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((925821459 : ℝ) / 57401344) + ((61876413 : ℝ) / 8200192) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3763871145 : ℝ) / 229605376) + ((515495961 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((39860635761 : ℝ) / 2296053760) + ((2287737513 : ℝ) / 229605376) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2621300373 : ℝ) / 141295616) + ((36649719 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((36296779293 : ℝ) / 1836843008) + ((42059263041 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3986527833 : ℝ) / 190840832) + ((1584359289 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3535773057 : ℝ) / 161480704) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((2708307 : ℝ) / 91520) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((8124921 : ℝ) / 366080) + ((50967 : ℝ) / 9152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((61297191 : ℝ) / 3153920) + ((152901 : ℝ) / 18304) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3076811163 : ℝ) / 164003840) + ((6300153 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((31124715939 : ℝ) / 1640038400) + ((2110617 : ℝ) / 197120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((25639574031 : ℝ) / 1312030720) + ((3006693 : ℝ) / 266240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((106028051931 : ℝ) / 5248122880) + ((481165029 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((62508657447 : ℝ) / 2998927360) + ((17712801 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((8027007723 : ℝ) / 374865920) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((86587 : ℝ) / 2288) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((259761 : ℝ) / 9152) + ((282681 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((123074573 : ℝ) / 5125120) + ((848043 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((453073437 : ℝ) / 20500480) + ((6928083 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4376889453 : ℝ) / 205004800) + ((29710287 : ℝ) / 2562560) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3466051569 : ℝ) / 164003840) + ((638451 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((630552991 : ℝ) / 29818880) + ((499987647 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((15308625 : ℝ) / 720896) + ((18015003 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3998531189 : ℝ) / 187432960) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((550683 : ℝ) / 11440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1652049 : ℝ) / 45760) + ((1243773 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((304840629 : ℝ) / 10250240) + ((3731319 : ℝ) / 366080) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1078300269 : ℝ) / 41000960) + ((30282579 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9991790397 : ℝ) / 410009600) + ((128317851 : ℝ) / 10250240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((7617955473 : ℝ) / 328007680) + ((2714391 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2269821357 : ℝ) / 100925440) + ((2088073971 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3294186273 : ℝ) / 149946368) + ((73853379 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((505225719 : ℝ) / 23429120) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((1919565 : ℝ) / 32032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((5758695 : ℝ) / 128128) + ((1890729 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((130239675 : ℝ) / 3587584) + ((5672187 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((34350885 : ℝ) / 1103872) + ((45809847 : ℝ) / 3587584) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3996650997 : ℝ) / 143503360) + ((192370383 : ℝ) / 14350336) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2946681261 : ℝ) / 114802688) + ((2871585 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1384263891 : ℝ) / 57401344) + ((3048984423 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3010453533 : ℝ) / 131203072) + ((106209927 : ℝ) / 8200192) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2889162477 : ℝ) / 131203072) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((13197 : ℝ) / 182) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((39591 : ℝ) / 728) + ((3285 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((14125305 : ℝ) / 326144) + ((9855 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((47312289 : ℝ) / 1304576) + ((19827 : ℝ) / 1456) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((411948063 : ℝ) / 13045760) + ((330831 : ℝ) / 23296) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3245805 : ℝ) / 114688) + ((376803 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1081333455 : ℝ) / 41746432) + ((5139369 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((574222059 : ℝ) / 23855104) + ((88443 : ℝ) / 6656) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((67479411 : ℝ) / 2981888) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((15525 : ℝ) / 182) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((46575 : ℝ) / 728) + ((3465 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2056149 : ℝ) / 40768) + ((10395 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6768441 : ℝ) / 163072) + ((104301 : ℝ) / 7280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((288467001 : ℝ) / 8153600) + ((1732023 : ℝ) / 116480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((202241853 : ℝ) / 6522880) + ((1959579 : ℝ) / 133120) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((13930839 : ℝ) / 501760) + ((26511057 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((37697967 : ℝ) / 1490944) + ((452079 : ℝ) / 33280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((174021219 : ℝ) / 7454720) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((981 : ℝ) / 10) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2943 : ℝ) / 40) + ((693 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1805427 : ℝ) / 31360) + ((2079 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((5865939 : ℝ) / 125440) + ((16659 : ℝ) / 1120) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((49182849 : ℝ) / 1254400) + ((68931 : ℝ) / 4480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((33867801 : ℝ) / 1003520) + ((15525 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((23829345 : ℝ) / 802816) + ((1044171 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((60954417 : ℝ) / 2293760) + ((35379 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1731393 : ℝ) / 71680) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((1113 : ℝ) / 10) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3339 : ℝ) / 40) + ((711 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((14547 : ℝ) / 224) + ((2133 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((233901 : ℝ) / 4480) + ((2439 : ℝ) / 160) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1935261 : ℝ) / 44800) + ((10071 : ℝ) / 640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1313037 : ℝ) / 35840) + ((15831 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((162489 : ℝ) / 5120) + ((151551 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1146843 : ℝ) / 40960) + ((35793 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1028337 : ℝ) / 40960) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    (((126 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((189 : ℝ) / 2) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((16389 : ℝ) / 224) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((52245 : ℝ) / 896) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((61047 : ℝ) / 1280) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((286173 : ℝ) / 7168) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((139743 : ℝ) / 4096) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((486621 : ℝ) / 16384) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((53865 : ℝ) / 2048) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    (((144 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((108 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((333 : ℝ) / 4) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1053 : ℝ) / 16) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((59643 : ℝ) / 1120) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((39447 : ℝ) / 896) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((66537 : ℝ) / 1792) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((16335 : ℝ) / 512) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((28575 : ℝ) / 1024) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0010BernsteinRow0 s t +
    karlssonLeaf0010BernsteinRow1 s t +
    karlssonLeaf0010BernsteinRow2 s t +
    karlssonLeaf0010BernsteinRow3 s t +
    karlssonLeaf0010BernsteinRow4 s t +
    karlssonLeaf0010BernsteinRow5 s t +
    karlssonLeaf0010BernsteinRow6 s t +
    karlssonLeaf0010BernsteinRow7 s t +
    karlssonLeaf0010BernsteinRow8 s t +
    karlssonLeaf0010BernsteinRow9 s t +
    karlssonLeaf0010BernsteinRow10 s t +
    karlssonLeaf0010BernsteinRow11 s t +
    karlssonLeaf0010BernsteinRow12 s t +
    karlssonLeaf0010BernsteinRow13 s t +
    karlssonLeaf0010BernsteinRow14 s t +
    karlssonLeaf0010BernsteinRow15 s t +
    karlssonLeaf0010BernsteinRow16 s t
noncomputable def karlssonLeaf0010ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((2608557759 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((893036457 : ℝ) / 26091520) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((23525947269 : ℝ) / 834928640) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((88587328581 : ℝ) / 3339714560) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((179793305649 : ℝ) / 6679429120) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((756352696473 : ℝ) / 26717716480) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1614038293251 : ℝ) / 53435432960) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3455248943277 : ℝ) / 106870865920) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7381959999039 : ℝ) / 213741731840) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((1069935219 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((632106009 : ℝ) / 52183040) + ((479475 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((17535711933 : ℝ) / 1669857280) + ((1438425 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((77700248037 : ℝ) / 6679429120) + ((12181725 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((184840591941 : ℝ) / 13358858240) + ((55559925 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((878719970421 : ℝ) / 53435432960) + ((70754175 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4098362275269 : ℝ) / 213741731840) + ((1088293725 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((18700879246551 : ℝ) / 854966927360) + ((42180525 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((653473905003 : ℝ) / 26717716480) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((439760037 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((63789849 : ℝ) / 20873216) + ((371853 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1240315989 : ℝ) / 417464320) + ((1115559 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1629456795 : ℝ) / 333971456) + ((1362069 : ℝ) / 131072) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((124666473051 : ℝ) / 16698572800) + ((6304797 : ℝ) / 524288) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((136772153523 : ℝ) / 13358858240) + ((57135969 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2171527341 : ℝ) / 166985728) + ((127512549 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((334705078989 : ℝ) / 21374173184) + ((35062947 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1939083129933 : ℝ) / 106870865920) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((239475771 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9261423 : ℝ) / 52183040) + ((1378989 : ℝ) / 286720) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((27488277 : ℝ) / 83492864) + ((4136967 : ℝ) / 573440) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((518441103 : ℝ) / 238551040) + ((8864451 : ℝ) / 1003520) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((76267656819 : ℝ) / 16698572800) + ((164864727 : ℝ) / 16056320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((18935108271 : ℝ) / 2671771648) + ((30640221 : ℝ) / 2621440) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((511359930387 : ℝ) / 53435432960) + ((3365832609 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2549420200953 : ℝ) / 213741731840) + ((66362643 : ℝ) / 4587520) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((376984184769 : ℝ) / 26717716480) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((237037419 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((571743 : ℝ) / 4014080) + ((16864389 : ℝ) / 3727360) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + ((0 : ℝ) + ((50593167 : ℝ) / 7454720) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((61448769 : ℝ) / 41746432) + ((107834301 : ℝ) / 13045760) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1038193083 : ℝ) / 298188800) + ((1988676927 : ℝ) / 208732160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1339787583 : ℝ) / 238551040) + ((366190821 : ℝ) / 34078720) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((247710699 : ℝ) / 32112640) + ((39881880009 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((129455142507 : ℝ) / 13358858240) + ((780599943 : ℝ) / 59637760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((153638914077 : ℝ) / 13358858240) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((26516823 : ℝ) / 4014080) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((88193619 : ℝ) / 52183040) + ((1731519 : ℝ) / 372736) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((14580039 : ℝ) / 14909440) + ((5194557 : ℝ) / 745472) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((806181507 : ℝ) / 417464320) + ((43808409 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6375591 : ℝ) / 1835008) + ((15264909 : ℝ) / 1605632) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2468086083 : ℝ) / 477102080) + ((35821341 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((143641437 : ℝ) / 20971520) + ((3827895489 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((449765996931 : ℝ) / 53435432960) + ((147378681 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1263170001 : ℝ) / 128450560) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((464704893 : ℝ) / 44154880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2657073249 : ℝ) / 574013440) + ((20625471 : ℝ) / 4100096) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((251859537 : ℝ) / 82001920) + ((61876413 : ℝ) / 8200192) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3828960063 : ℝ) / 1148026880) + ((515495961 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9879844437 : ℝ) / 2296053760) + ((2287737513 : ℝ) / 229605376) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((50461358949 : ℝ) / 9184215040) + ((36649719 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((8794390167 : ℝ) / 1312030720) + ((42059263041 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((52311626667 : ℝ) / 6679429120) + ((1584359289 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((649391418567 : ℝ) / 73473720320) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((9491303673 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((5244678297 : ℝ) / 574013440) + ((50967 : ℝ) / 9152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3660890931 : ℝ) / 574013440) + ((152901 : ℝ) / 18304) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6547282479 : ℝ) / 1148026880) + ((6300153 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((67969054953 : ℝ) / 11480268800) + ((2110617 : ℝ) / 197120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((59553852921 : ℝ) / 9184215040) + ((3006693 : ℝ) / 266240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((262503702333 : ℝ) / 36736860160) + ((481165029 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1144153570167 : ℝ) / 146947440640) + ((17712801 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((30695409567 : ℝ) / 3673686016) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((14227748729 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((8797012089 : ℝ) / 574013440) + ((282681 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1257830869 : ℝ) / 114802688) + ((848043 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1038171681 : ℝ) / 114802688) + ((6928083 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((23800463187 : ℝ) / 2870067200) + ((29710287 : ℝ) / 2562560) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((9271965321 : ℝ) / 1148026880) + ((638451 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1688344453 : ℝ) / 208732160) + ((499987647 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((18777179301 : ℝ) / 2296053760) + ((18015003 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15200972593 : ℝ) / 1836843008) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((20135872377 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((203509305 : ℝ) / 8830976) + ((1243773 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((9575877393 : ℝ) / 574013440) + ((3731319 : ℝ) / 366080) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1520201187 : ℝ) / 114802688) + ((30282579 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4058317953 : ℝ) / 358758400) + ((128317851 : ℝ) / 10250240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((23344896987 : ℝ) / 2296053760) + ((2714391 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((86630578191 : ℝ) / 9184215040) + ((2088073971 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((327382975701 : ℝ) / 36736860160) + ((73853379 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9765664569 : ℝ) / 1148026880) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((26903406969 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1407981213 : ℝ) / 44154880) + ((1890729 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((13343150169 : ℝ) / 574013440) + ((5672187 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((10367262369 : ℝ) / 574013440) + ((45809847 : ℝ) / 3587584) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((653185089 : ℝ) / 44154880) + ((192370383 : ℝ) / 14350336) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((517014891 : ℝ) / 41000960) + ((2871585 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((906777297 : ℝ) / 82001920) + ((3048984423 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((45404291007 : ℝ) / 4592107520) + ((106209927 : ℝ) / 8200192) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((41159104047 : ℝ) / 4592107520) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((3102462219 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2156501259 : ℝ) / 52183040) + ((3285 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1578667179 : ℝ) / 52183040) + ((9855 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((93162303 : ℝ) / 4014080) + ((19827 : ℝ) / 1456) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((966410631 : ℝ) / 52183040) + ((330831 : ℝ) / 23296) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((397729827 : ℝ) / 26091520) + ((376803 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((54717159 : ℝ) / 4259840) + ((5139369 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((707358933 : ℝ) / 64225280) + ((88443 : ℝ) / 6656) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((999016143 : ℝ) / 104366080) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((3769946379 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2657114379 : ℝ) / 52183040) + ((3465 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((150037623 : ℝ) / 4014080) + ((10395 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1484519499 : ℝ) / 52183040) + ((104301 : ℝ) / 7280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5824035927 : ℝ) / 260915200) + ((1732023 : ℝ) / 116480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((936553203 : ℝ) / 52183040) + ((1959579 : ℝ) / 133120) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((153485127 : ℝ) / 10436608) + ((26511057 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((79755903 : ℝ) / 6522880) + ((452079 : ℝ) / 33280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((8386983 : ℝ) / 815360) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((4437774603 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3157985547 : ℝ) / 52183040) + ((693 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2322848907 : ℝ) / 52183040) + ((2079 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1758849003 : ℝ) / 52183040) + ((16659 : ℝ) / 1120) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6823124487 : ℝ) / 260915200) + ((68931 : ℝ) / 4480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1079744031 : ℝ) / 52183040) + ((15525 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((216881451 : ℝ) / 13045760) + ((1044171 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2821325463 : ℝ) / 208732160) + ((35379 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((579072483 : ℝ) / 52183040) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((5126590731 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3674597643 : ℝ) / 52183040) + ((711 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2707487499 : ℝ) / 52183040) + ((2133 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2043097227 : ℝ) / 52183040) + ((2439 : ℝ) / 160) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((7864051959 : ℝ) / 260915200) + ((10071 : ℝ) / 640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1230400251 : ℝ) / 52183040) + ((15831 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((974706267 : ℝ) / 52183040) + ((151551 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((779696361 : ℝ) / 52183040) + ((35793 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((628719717 : ℝ) / 52183040) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((5893681419 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4249915659 : ℝ) / 52183040) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3136599819 : ℝ) / 52183040) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2361367179 : ℝ) / 52183040) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((361476495 : ℝ) / 10436608) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1401957819 : ℝ) / 52183040) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1098944199 : ℝ) / 52183040) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((108563283 : ℝ) / 6522880) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((691098579 : ℝ) / 52183040) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((6832976139 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4954386699 : ℝ) / 52183040) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3662856459 : ℝ) / 52183040) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2752914699 : ℝ) / 52183040) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((419501007 : ℝ) / 10436608) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1616011659 : ℝ) / 52183040) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1256175819 : ℝ) / 52183040) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((983481579 : ℝ) / 52183040) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((774800379 : ℝ) / 52183040) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0010ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0010ShiftedBernsteinRow0 s t +
    karlssonLeaf0010ShiftedBernsteinRow1 s t +
    karlssonLeaf0010ShiftedBernsteinRow2 s t +
    karlssonLeaf0010ShiftedBernsteinRow3 s t +
    karlssonLeaf0010ShiftedBernsteinRow4 s t +
    karlssonLeaf0010ShiftedBernsteinRow5 s t +
    karlssonLeaf0010ShiftedBernsteinRow6 s t +
    karlssonLeaf0010ShiftedBernsteinRow7 s t +
    karlssonLeaf0010ShiftedBernsteinRow8 s t +
    karlssonLeaf0010ShiftedBernsteinRow9 s t +
    karlssonLeaf0010ShiftedBernsteinRow10 s t +
    karlssonLeaf0010ShiftedBernsteinRow11 s t +
    karlssonLeaf0010ShiftedBernsteinRow12 s t +
    karlssonLeaf0010ShiftedBernsteinRow13 s t +
    karlssonLeaf0010ShiftedBernsteinRow14 s t +
    karlssonLeaf0010ShiftedBernsteinRow15 s t +
    karlssonLeaf0010ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf0011BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((835507161 : ℝ) / 16777216) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((764625051 : ℝ) / 14680064) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((56940453 : ℝ) / 1048576) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8283555009 : ℝ) / 146800640) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((429171975 : ℝ) / 7340032) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6952275 : ℝ) / 114688) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4156875 : ℝ) / 65536) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((17859375 : ℝ) / 262144) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((314706843 : ℝ) / 8388608) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((10764586233 : ℝ) / 268435456) + ((193148775 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((9999546273 : ℝ) / 234881024) + ((1430267175 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((21067967187 : ℝ) / 469762048) + ((46841625 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((983876571 : ℝ) / 20971520) + ((48579975 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((5727773295 : ℝ) / 117440512) + ((99767475 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((742320315 : ℝ) / 14680064) + ((101505825 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((221329125 : ℝ) / 4194304) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7396875 : ℝ) / 131072) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((5234776593 : ℝ) / 167772160) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((5651664717 : ℝ) / 167772160) + ((163896057 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((528499725 : ℝ) / 14680064) + ((174801087 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((11182191267 : ℝ) / 293601280) + ((5761665 : ℝ) / 262144) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((14653484067 : ℝ) / 367001600) + ((6003999 : ℝ) / 262144) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3047003403 : ℝ) / 73400320) + ((12371499 : ℝ) / 524288) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((49262637 : ℝ) / 1146880) + ((12613833 : ℝ) / 524288) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((23406465 : ℝ) / 524288) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((6223125 : ℝ) / 131072) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((7976390931 : ℝ) / 293601280) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9848141091 : ℝ) / 335544320) + ((623978091 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((12888830673 : ℝ) / 411041792) + ((4668909867 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((136206042327 : ℝ) / 4110417920) + ((30832353 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((44541937323 : ℝ) / 1284505600) + ((160852059 : ℝ) / 8028160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((36951165603 : ℝ) / 1027604480) + ((331739559 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4761996471 : ℝ) / 128450560) + ((338429853 : ℝ) / 16056320) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((281446173 : ℝ) / 7340032) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4647375 : ℝ) / 114688) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((46867515579 : ℝ) / 1908408320) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((7188905727 : ℝ) / 272629760) + ((558396207 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((9355410801 : ℝ) / 333971456) + ((54082796067 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((98335274391 : ℝ) / 3339714560) + ((27380781 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((127975497417 : ℝ) / 4174643200) + ((1852389459 : ℝ) / 104366080) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((26412644799 : ℝ) / 834928640) + ((3813736959 : ℝ) / 208732160) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3387312603 : ℝ) / 104366080) + ((3886375653 : ℝ) / 208732160) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((995629329 : ℝ) / 29818880) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((52262775 : ℝ) / 1490944) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((1092154911 : ℝ) / 47710208) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((5301739689 : ℝ) / 218103808) + ((667832211 : ℝ) / 47710208) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((34164601383 : ℝ) / 1335885824) + ((4924340307 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((71196861381 : ℝ) / 2671771648) + ((160729965 : ℝ) / 10436608) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((22985869371 : ℝ) / 834928640) + ((166274739 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((18849997641 : ℝ) / 667942912) + ((340866639 : ℝ) / 20873216) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2403442317 : ℝ) / 83492864) + ((346411413 : ℝ) / 20873216) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((702504723 : ℝ) / 23855104) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((22896645 : ℝ) / 745472) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((3535773057 : ℝ) / 161480704) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6868327617 : ℝ) / 299892736) + ((6927971859 : ℝ) / 524812288) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((5461641477 : ℝ) / 229605376) + ((50326748883 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((90030308769 : ℝ) / 3673686016) + ((1622934765 : ℝ) / 114802688) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((115140241647 : ℝ) / 4592107520) + ((1663622451 : ℝ) / 114802688) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((23417613873 : ℝ) / 918421504) + ((3388276431 : ℝ) / 229605376) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1483336809 : ℝ) / 57401344) + ((3428964117 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((862290567 : ℝ) / 32800768) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((223426197 : ℝ) / 8200192) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((8027007723 : ℝ) / 374865920) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((65923466121 : ℝ) / 2998927360) + ((74422431 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((11797988229 : ℝ) / 524812288) + ((531162207 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((119953074051 : ℝ) / 5248122880) + ((16878753 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((37928400399 : ℝ) / 1640038400) + ((3421107 : ℝ) / 256256) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((30583169919 : ℝ) / 1312030720) + ((34551243 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((296018271 : ℝ) / 12615680) + ((6955605 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((222487569 : ℝ) / 9371648) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3582009 : ℝ) / 146432) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((3998531189 : ℝ) / 187432960) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2008409939 : ℝ) / 93716480) + ((72754893 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1766025931 : ℝ) / 82001920) + ((509715981 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((321760837 : ℝ) / 14909440) + ((15940467 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8846851171 : ℝ) / 410009600) + ((15950061 : ℝ) / 1281280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((176683985 : ℝ) / 8200192) + ((31914513 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((15771133 : ℝ) / 732160) + ((31924107 : ℝ) / 2562560) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((31748113 : ℝ) / 1464320) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((16269989 : ℝ) / 732160) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((505225719 : ℝ) / 23429120) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((15863514651 : ℝ) / 749731840) + ((287648649 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((13690859571 : ℝ) / 656015360) + ((1979365833 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((27025807401 : ℝ) / 1312030720) + ((60917751 : ℝ) / 5125120) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8341720407 : ℝ) / 410009600) + ((60158313 : ℝ) / 5125120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((85737393 : ℝ) / 4259840) + ((119177469 : ℝ) / 10250240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((117067959 : ℝ) / 5857280) + ((118418031 : ℝ) / 10250240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((234525087 : ℝ) / 11714560) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7476489 : ℝ) / 366080) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((2889162477 : ℝ) / 131203072) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((395410203 : ℝ) / 18743296) + ((400918437 : ℝ) / 32800768) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1172004543 : ℝ) / 57401344) + ((2714086629 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((4557721347 : ℝ) / 229605376) + ((82282203 : ℝ) / 7175168) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((427714083 : ℝ) / 22077440) + ((80230149 : ℝ) / 7175168) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((22249899 : ℝ) / 1171456) + ((157382217 : ℝ) / 14350336) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4802643 : ℝ) / 256256) + ((155330163 : ℝ) / 14350336) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((38315205 : ℝ) / 2050048) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9731781 : ℝ) / 512512) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((67479411 : ℝ) / 2981888) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((72206931 : ℝ) / 3407872) + ((650691 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((420313029 : ℝ) / 20873216) + ((4343427 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((805558503 : ℝ) / 41746432) + ((129933 : ℝ) / 11648) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((242939163 : ℝ) / 13045760) + ((125235 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((26992437 : ℝ) / 1490944) + ((243423 : ℝ) / 23296) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((23169831 : ℝ) / 1304576) + ((238725 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6575649 : ℝ) / 372736) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((104019 : ℝ) / 5824) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((174021219 : ℝ) / 7454720) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((22793229 : ℝ) / 1064960) + ((3259323 : ℝ) / 266240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((130460751 : ℝ) / 6522880) + ((21508731 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((246737709 : ℝ) / 13045760) + ((636309 : ℝ) / 58240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((42086511 : ℝ) / 2329600) + ((121455 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((11370249 : ℝ) / 652288) + ((1170999 : ℝ) / 116480) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6935337 : ℝ) / 407680) + ((228393 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1961451 : ℝ) / 116480) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((98991 : ℝ) / 5824) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((1731393 : ℝ) / 71680) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1424421 : ℝ) / 65536) + ((125649 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((40148919 : ℝ) / 2007040) + ((822033 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((75030453 : ℝ) / 4014080) + ((24111 : ℝ) / 2240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((22193019 : ℝ) / 1254400) + ((22833 : ℝ) / 2240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((17017209 : ℝ) / 1003520) + ((43749 : ℝ) / 4480) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((295227 : ℝ) / 17920) + ((42471 : ℝ) / 4480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((582723 : ℝ) / 35840) + ((747 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2619 : ℝ) / 160) + ((747 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((1028337 : ℝ) / 40960) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((909831 : ℝ) / 40960) + ((125883 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((25809 : ℝ) / 1280) + ((116973 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1336017 : ℝ) / 71680) + ((3411 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1567947 : ℝ) / 89600) + ((3213 : ℝ) / 320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((298833 : ℝ) / 17920) + ((6129 : ℝ) / 640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3615 : ℝ) / 224) + ((5931 : ℝ) / 640) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((10167 : ℝ) / 640) + ((729 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2553 : ℝ) / 160) + ((729 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((53865 : ℝ) / 2048) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((375219 : ℝ) / 16384) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((42021 : ℝ) / 2048) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((538353 : ℝ) / 28672) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((156789 : ℝ) / 8960) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((118917 : ℝ) / 7168) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((14337 : ℝ) / 896) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4023 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((28575 : ℝ) / 1024) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((765 : ℝ) / 32) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2367 : ℝ) / 112) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8577 : ℝ) / 448) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((39681 : ℝ) / 2240) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((117 : ℝ) / 7) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((225 : ℝ) / 14) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0011BernsteinRow0 s t +
    karlssonLeaf0011BernsteinRow1 s t +
    karlssonLeaf0011BernsteinRow2 s t +
    karlssonLeaf0011BernsteinRow3 s t +
    karlssonLeaf0011BernsteinRow4 s t +
    karlssonLeaf0011BernsteinRow5 s t +
    karlssonLeaf0011BernsteinRow6 s t +
    karlssonLeaf0011BernsteinRow7 s t +
    karlssonLeaf0011BernsteinRow8 s t +
    karlssonLeaf0011BernsteinRow9 s t +
    karlssonLeaf0011BernsteinRow10 s t +
    karlssonLeaf0011BernsteinRow11 s t +
    karlssonLeaf0011BernsteinRow12 s t +
    karlssonLeaf0011BernsteinRow13 s t +
    karlssonLeaf0011BernsteinRow14 s t +
    karlssonLeaf0011BernsteinRow15 s t +
    karlssonLeaf0011BernsteinRow16 s t
noncomputable def karlssonLeaf0011ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((2139397551 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((571855833 : ℝ) / 16777216) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((533930139 : ℝ) / 14680064) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((40462245 : ℝ) / 1048576) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5976605889 : ℝ) / 146800640) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((313824519 : ℝ) / 7340032) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((5149971 : ℝ) / 114688) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3126987 : ℝ) / 65536) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((13739823 : ℝ) / 262144) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((182881179 : ℝ) / 8388608) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6546164985 : ℝ) / 268435456) + ((193148775 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6308427681 : ℝ) / 234881024) + ((1430267175 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((13685730003 : ℝ) / 469762048) + ((46841625 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((654312411 : ℝ) / 20971520) + ((48579975 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3882213999 : ℝ) / 117440512) + ((99767475 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((511625403 : ℝ) / 14680064) + ((101505825 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((155416293 : ℝ) / 4194304) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5337099 : ℝ) / 131072) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((2598263313 : ℝ) / 167772160) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3015151437 : ℝ) / 167772160) + ((163896057 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((297804813 : ℝ) / 14680064) + ((174801087 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6568293027 : ℝ) / 293601280) + ((5761665 : ℝ) / 262144) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8886111267 : ℝ) / 367001600) + ((6003999 : ℝ) / 262144) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1893528843 : ℝ) / 73400320) + ((12371499 : ℝ) / 524288) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((31239597 : ℝ) / 1146880) + ((12613833 : ℝ) / 524288) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((15167361 : ℝ) / 524288) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4163349 : ℝ) / 131072) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((3362492691 : ℝ) / 293601280) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4575114531 : ℝ) / 335544320) + ((623978091 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6429373137 : ℝ) / 411041792) + ((4668909867 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((71611466967 : ℝ) / 4110417920) + ((30832353 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((24356132523 : ℝ) / 1284505600) + ((160852059 : ℝ) / 8028160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((20802521763 : ℝ) / 1027604480) + ((331739559 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2743415991 : ℝ) / 128450560) + ((338429853 : ℝ) / 16056320) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((166098717 : ℝ) / 7340032) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2845071 : ℝ) / 114688) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((16877177019 : ℝ) / 1908408320) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2904571647 : ℝ) / 272629760) + ((558396207 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4107101553 : ℝ) / 333971456) + ((54082796067 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((45852181911 : ℝ) / 3339714560) + ((27380781 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((62371631817 : ℝ) / 4174643200) + ((1852389459 : ℝ) / 104366080) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((13291871679 : ℝ) / 834928640) + ((3813736959 : ℝ) / 208732160) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1747215963 : ℝ) / 104366080) + ((3886375653 : ℝ) / 208732160) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((527030289 : ℝ) / 29818880) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((28832823 : ℝ) / 1490944) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((342396447 : ℝ) / 47710208) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1874272425 : ℝ) / 218103808) + ((667832211 : ℝ) / 47710208) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((13171364391 : ℝ) / 1335885824) + ((4924340307 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((29210387397 : ℝ) / 2671771648) + ((160729965 : ℝ) / 10436608) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9865096251 : ℝ) / 834928640) + ((166274739 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8353379145 : ℝ) / 667942912) + ((340866639 : ℝ) / 20873216) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1091365005 : ℝ) / 83492864) + ((346411413 : ℝ) / 20873216) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((327625491 : ℝ) / 23855104) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((11181669 : ℝ) / 745472) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((998129025 : ℝ) / 161480704) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2155560129 : ℝ) / 299892736) + ((6927971859 : ℝ) / 524812288) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1853428869 : ℝ) / 229605376) + ((50326748883 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((32298907041 : ℝ) / 3673686016) + ((1622934765 : ℝ) / 114802688) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((42975989487 : ℝ) / 4592107520) + ((1663622451 : ℝ) / 114802688) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8984763441 : ℝ) / 918421504) + ((3388276431 : ℝ) / 229605376) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((581283657 : ℝ) / 57401344) + ((3428964117 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((346831623 : ℝ) / 32800768) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((94561461 : ℝ) / 8200192) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((2136048363 : ℝ) / 374865920) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((18795791241 : ℝ) / 2998927360) + ((74422431 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3550645125 : ℝ) / 524812288) + ((531162207 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((37479643011 : ℝ) / 5248122880) + ((16878753 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((12155453199 : ℝ) / 1640038400) + ((3421107 : ℝ) / 256256) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((9964812159 : ℝ) / 1312030720) + ((34551243 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((97764831 : ℝ) / 12615680) + ((6955605 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((75213585 : ℝ) / 9371648) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1280853 : ℝ) / 146432) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((1053051509 : ℝ) / 187432960) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((535670099 : ℝ) / 93716480) + ((72754893 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((477378571 : ℝ) / 82001920) + ((509715981 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((87461317 : ℝ) / 14909440) + ((15940467 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2403614371 : ℝ) / 410009600) + ((15950061 : ℝ) / 1281280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((47819249 : ℝ) / 8200192) + ((31914513 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4265353 : ℝ) / 732160) + ((31924107 : ℝ) / 2562560) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((8736553 : ℝ) / 1464320) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4764209 : ℝ) / 732160) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((137040759 : ℝ) / 23429120) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4081595931 : ℝ) / 749731840) + ((287648649 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3381680691 : ℝ) / 656015360) + ((1979365833 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6407449641 : ℝ) / 1312030720) + ((60917751 : ℝ) / 5125120) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1898483607 : ℝ) / 410009600) + ((60158313 : ℝ) / 5125120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((18794673 : ℝ) / 4259840) + ((119177469 : ℝ) / 10250240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((25021719 : ℝ) / 5857280) + ((118418031 : ℝ) / 10250240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((50432607 : ℝ) / 11714560) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1723599 : ℝ) / 366080) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((827326701 : ℝ) / 131203072) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((100862235 : ℝ) / 18743296) + ((400918437 : ℝ) / 32800768) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((269951391 : ℝ) / 57401344) + ((2714086629 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((949508739 : ℝ) / 229605376) + ((82282203 : ℝ) / 7175168) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((80770563 : ℝ) / 22077440) + ((80230149 : ℝ) / 7175168) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3840651 : ℝ) / 1171456) + ((157382217 : ℝ) / 14350336) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((193905 : ℝ) / 64064) + ((155330163 : ℝ) / 14350336) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6099021 : ℝ) / 2050048) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1677735 : ℝ) / 512512) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((20619507 : ℝ) / 2981888) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((18652755 : ℝ) / 3407872) + ((650691 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((92293701 : ℝ) / 20873216) + ((4343427 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((149519847 : ℝ) / 41746432) + ((129933 : ℝ) / 11648) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((37927083 : ℝ) / 13045760) + ((125235 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3562485 : ℝ) / 1490944) + ((243423 : ℝ) / 23296) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2668623 : ℝ) / 1304576) + ((238725 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((718161 : ℝ) / 372736) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((49983 : ℝ) / 23296) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((56871459 : ℝ) / 7454720) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6057549 : ℝ) / 1064960) + ((3259323 : ℝ) / 266240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((27954711 : ℝ) / 6522880) + ((21508731 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((41725629 : ℝ) / 13045760) + ((636309 : ℝ) / 58240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5477211 : ℝ) / 2329600) + ((121455 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1119645 : ℝ) / 652288) + ((1170999 : ℝ) / 116480) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1057419 : ℝ) / 815360) + ((228393 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((65493 : ℝ) / 58240) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((29871 : ℝ) / 23296) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((604953 : ℝ) / 71680) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((394533 : ℝ) / 65536) + ((125649 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((8608599 : ℝ) / 2007040) + ((822033 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((11949813 : ℝ) / 4014080) + ((24111 : ℝ) / 2240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2480319 : ℝ) / 1254400) + ((22833 : ℝ) / 2240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1247049 : ℝ) / 1003520) + ((43749 : ℝ) / 4480) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((13617 : ℝ) / 17920) + ((42471 : ℝ) / 4480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((19503 : ℝ) / 35840) + ((747 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((837 : ℝ) / 1280) + ((747 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((384657 : ℝ) / 40960) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((266151 : ℝ) / 40960) + ((125883 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2847 : ℝ) / 640) + ((116973 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((209577 : ℝ) / 71680) + ((3411 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((159897 : ℝ) / 89600) + ((3213 : ℝ) / 320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((17223 : ℝ) / 17920) + ((6129 : ℝ) / 640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((759 : ℝ) / 1792) + ((5931 : ℝ) / 640) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((219 : ℝ) / 1280) + ((729 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((309 : ℝ) / 1280) + ((729 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((21681 : ℝ) / 2048) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((117747 : ℝ) / 16384) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((9837 : ℝ) / 2048) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((87777 : ℝ) / 28672) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((999 : ℝ) / 560) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6273 : ℝ) / 7168) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((513 : ℝ) / 1792) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((12483 : ℝ) / 1024) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2097 : ℝ) / 256) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((9711 : ℝ) / 1792) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6147 : ℝ) / 1792) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((17919 : ℝ) / 8960) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1791 : ℝ) / 1792) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((639 : ℝ) / 1792) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf0011ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf0011ShiftedBernsteinRow0 s t +
    karlssonLeaf0011ShiftedBernsteinRow1 s t +
    karlssonLeaf0011ShiftedBernsteinRow2 s t +
    karlssonLeaf0011ShiftedBernsteinRow3 s t +
    karlssonLeaf0011ShiftedBernsteinRow4 s t +
    karlssonLeaf0011ShiftedBernsteinRow5 s t +
    karlssonLeaf0011ShiftedBernsteinRow6 s t +
    karlssonLeaf0011ShiftedBernsteinRow7 s t +
    karlssonLeaf0011ShiftedBernsteinRow8 s t +
    karlssonLeaf0011ShiftedBernsteinRow9 s t +
    karlssonLeaf0011ShiftedBernsteinRow10 s t +
    karlssonLeaf0011ShiftedBernsteinRow11 s t +
    karlssonLeaf0011ShiftedBernsteinRow12 s t +
    karlssonLeaf0011ShiftedBernsteinRow13 s t +
    karlssonLeaf0011ShiftedBernsteinRow14 s t +
    karlssonLeaf0011ShiftedBernsteinRow15 s t +
    karlssonLeaf0011ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf01BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    (((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((18432 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((23040 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((156672 : ℝ) / 35) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((46080 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((73728 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((18432 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    (((1152 : ℝ) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((1224 : ℝ) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((10224 : ℝ) / 7) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((13248 : ℝ) / 7) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13248 : ℝ) / 5) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((27936 : ℝ) / 7) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((45504 : ℝ) / 7) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((11520 : ℝ) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((23040 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((3144 : ℝ) / 5) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3504 : ℝ) / 5) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((30192 : ℝ) / 35) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8016 : ℝ) / 7) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((285792 : ℝ) / 175) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + ((2496 : ℝ) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((20544 : ℝ) / 5) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((36672 : ℝ) / 5) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((73344 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((1836 : ℝ) / 5) + ((576 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((14778 : ℝ) / 35) + ((576 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3708 : ℝ) / 7) + ((29808 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((175608 : ℝ) / 245) + ((32976 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1276416 : ℝ) / 1225) + ((37728 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((397512 : ℝ) / 245) + ((44064 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((664848 : ℝ) / 245) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((4896 : ℝ) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((9792 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((103212 : ℝ) / 455) + ((432 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((120528 : ℝ) / 455) + ((432 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1066392 : ℝ) / 3185) + ((21816 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1464984 : ℝ) / 3185) + ((23112 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1559088 : ℝ) / 2275) + ((25056 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3506112 : ℝ) / 3185) + ((27648 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1208160 : ℝ) / 637) + ((864 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1587168 : ℝ) / 455) + ((864 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3174336 : ℝ) / 455) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((13386 : ℝ) / 91) + ((828 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((31335 : ℝ) / 182) + ((828 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((138165 : ℝ) / 637) + ((40626 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((191640 : ℝ) / 637) + ((40734 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1470228 : ℝ) / 3185) + ((40896 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((493278 : ℝ) / 637) + ((41112 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((886164 : ℝ) / 637) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((238848 : ℝ) / 91) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((477696 : ℝ) / 91) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((99702 : ℝ) / 1001) + ((612 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((231579 : ℝ) / 2002) + ((612 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1008369 : ℝ) / 7007) + ((29214 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1401480 : ℝ) / 7007) + ((27666 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2213460 : ℝ) / 7007) + ((25344 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((555930 : ℝ) / 1001) + ((22248 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1043100 : ℝ) / 1001) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2017440 : ℝ) / 1001) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4034880 : ℝ) / 1001) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((50166 : ℝ) / 715) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((229617 : ℝ) / 2860) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((980487 : ℝ) / 10010) + ((168264 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((676674 : ℝ) / 5005) + ((151992 : ℝ) / 5005) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5454018 : ℝ) / 25025) + ((127584 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((284571 : ℝ) / 715) + ((1728 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((42498 : ℝ) / 55) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((217656 : ℝ) / 143) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((435312 : ℝ) / 143) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((3334 : ℝ) / 65) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((41174 : ℝ) / 715) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((343432 : ℝ) / 5005) + ((126972 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((42412 : ℝ) / 455) + ((22356 : ℝ) / 1001) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3776296 : ℝ) / 25025) + ((88992 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((18248 : ℝ) / 65) + ((5328 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((396736 : ℝ) / 715) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((788752 : ℝ) / 715) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1577504 : ℝ) / 715) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((27783 : ℝ) / 715) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((122193 : ℝ) / 2860) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((497331 : ℝ) / 10010) + ((198423 : ℝ) / 10010) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((659907 : ℝ) / 10010) + ((35037 : ℝ) / 2002) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2627892 : ℝ) / 25025) + ((70164 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1942587 : ℝ) / 10010) + ((4266 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1917189 : ℝ) / 5005) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((108828 : ℝ) / 143) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((217656 : ℝ) / 143) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((61029 : ℝ) / 2002) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((131463 : ℝ) / 4004) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((261711 : ℝ) / 7007) + ((225369 : ℝ) / 14014) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((337734 : ℝ) / 7007) + ((205119 : ℝ) / 14014) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2597373 : ℝ) / 35035) + ((87372 : ℝ) / 7007) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((143019 : ℝ) / 1078) + ((6102 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1796589 : ℝ) / 7007) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((504360 : ℝ) / 1001) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1008720 : ℝ) / 1001) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((9015 : ℝ) / 364) + ((180 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2382 : ℝ) / 91) + ((180 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((74577 : ℝ) / 2548) + ((1233 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((46803 : ℝ) / 1274) + ((1179 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((343743 : ℝ) / 6370) + ((1098 : ℝ) / 91) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((233679 : ℝ) / 2548) + ((990 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((217221 : ℝ) / 1274) + ((126 : ℝ) / 13) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((29856 : ℝ) / 91) + ((126 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((59712 : ℝ) / 91) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((37953 : ℝ) / 1820) + ((153 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((19737 : ℝ) / 910) + ((153 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((305451 : ℝ) / 12740) + ((1539 : ℝ) / 130) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((374481 : ℝ) / 12740) + ((1557 : ℝ) / 130) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1312767 : ℝ) / 31850) + ((792 : ℝ) / 65) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((420363 : ℝ) / 6370) + ((162 : ℝ) / 13) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((371583 : ℝ) / 3185) + ((828 : ℝ) / 65) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((99198 : ℝ) / 455) + ((828 : ℝ) / 65) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((198396 : ℝ) / 455) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((729 : ℝ) / 40) + ((207 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((20961 : ℝ) / 1120) + ((207 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((11511 : ℝ) / 560) + ((2997 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((24273 : ℝ) / 980) + ((639 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((40914 : ℝ) / 1225) + ((873 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((49527 : ℝ) / 980) + ((486 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((41499 : ℝ) / 490) + ((153 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((153 : ℝ) + ((153 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((306 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((663 : ℝ) / 40) + ((189 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2697 : ℝ) / 160) + ((189 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((10329 : ℝ) / 560) + ((2799 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((768 : ℝ) / 35) + ((621 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((717 : ℝ) / 25) + ((891 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1446 : ℝ) / 35) + ((522 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2301 : ℝ) / 35) + ((171 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((573 : ℝ) / 5) + ((171 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1146 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1017 : ℝ) / 64) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3879 : ℝ) / 224) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2277 : ℝ) / 112) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((7227 : ℝ) / 280) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1989 : ℝ) / 56) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1503 : ℝ) / 28) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((90 : ℝ) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((180 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((477 : ℝ) / 28) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((549 : ℝ) / 28) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1683 : ℝ) / 70) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((63 : ℝ) / 2) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + ((45 : ℝ) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((72 : ℝ) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((144 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf01BernsteinRow0 s t +
    karlssonLeaf01BernsteinRow1 s t +
    karlssonLeaf01BernsteinRow2 s t +
    karlssonLeaf01BernsteinRow3 s t +
    karlssonLeaf01BernsteinRow4 s t +
    karlssonLeaf01BernsteinRow5 s t +
    karlssonLeaf01BernsteinRow6 s t +
    karlssonLeaf01BernsteinRow7 s t +
    karlssonLeaf01BernsteinRow8 s t +
    karlssonLeaf01BernsteinRow9 s t +
    karlssonLeaf01BernsteinRow10 s t +
    karlssonLeaf01BernsteinRow11 s t +
    karlssonLeaf01BernsteinRow12 s t +
    karlssonLeaf01BernsteinRow13 s t +
    karlssonLeaf01BernsteinRow14 s t +
    karlssonLeaf01BernsteinRow15 s t +
    karlssonLeaf01BernsteinRow16 s t
noncomputable def karlssonLeaf01ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((9153 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9153 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((73287 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((91719 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((624483 : ℝ) / 140) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((183879 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((294471 : ℝ) / 28) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((73665 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((147393 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((4545 : ℝ) / 4) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4833 : ℝ) / 4) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((40455 : ℝ) / 28) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((52551 : ℝ) / 28) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((52677 : ℝ) / 20) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((111303 : ℝ) / 28) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((181575 : ℝ) / 28) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((46017 : ℝ) / 4) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((92097 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((12261 : ℝ) / 20) + (144 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((13701 : ℝ) / 20) + (144 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((118563 : ℝ) / 140) + ((1080 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((31623 : ℝ) / 28) + ((1224 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1132143 : ℝ) / 700) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((9921 : ℝ) / 4) + ((1728 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((81861 : ℝ) / 20) + (288 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((146373 : ℝ) / 20) + (288 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((293061 : ℝ) / 20) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((7029 : ℝ) / 20) + ((576 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((56907 : ℝ) / 140) + ((576 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((14391 : ℝ) / 28) + ((29808 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((686997 : ℝ) / 980) + ((32976 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5028489 : ℝ) / 4900) + ((37728 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1574613 : ℝ) / 980) + ((44064 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2643957 : ℝ) / 980) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((19521 : ℝ) / 4) + ((1440 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((39105 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((384183 : ℝ) / 1820) + ((432 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((453447 : ℝ) / 1820) + ((432 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4064913 : ℝ) / 12740) + ((21816 : ℝ) / 245) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((5659281 : ℝ) / 12740) + ((23112 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6093027 : ℝ) / 9100) + ((25056 : ℝ) / 245) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((13823793 : ℝ) / 12740) + ((27648 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4792509 : ℝ) / 2548) + ((864 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6320007 : ℝ) / 1820) + ((864 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((12668679 : ℝ) / 1820) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((47811 : ℝ) / 364) + ((828 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((56937 : ℝ) / 364) + ((828 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((512529 : ℝ) / 2548) + ((40626 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((726429 : ℝ) / 2548) + ((40734 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5680257 : ℝ) / 12740) + ((40896 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1932981 : ℝ) / 2548) + ((41112 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3504525 : ℝ) / 2548) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((949659 : ℝ) / 364) + ((5904 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1905051 : ℝ) / 364) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((335745 : ℝ) / 4004) + ((612 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((400095 : ℝ) / 4004) + ((612 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3592035 : ℝ) / 28028) + ((29214 : ℝ) / 637) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((5164479 : ℝ) / 28028) + ((27666 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8412399 : ℝ) / 28028) + ((25344 : ℝ) / 637) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2160657 : ℝ) / 4004) + ((22248 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4109337 : ℝ) / 4004) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((8006697 : ℝ) / 4004) + ((2736 : ℝ) / 91) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((16076457 : ℝ) / 4004) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((155619 : ℝ) / 2860) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((46143 : ℝ) / 715) + ((5040 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1645659 : ℝ) / 20020) + ((168264 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2391381 : ℝ) / 20020) + ((151992 : ℝ) / 5005) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((20239497 : ℝ) / 100100) + ((127584 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1093239 : ℝ) / 2860) + ((1728 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((166527 : ℝ) / 220) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((861615 : ℝ) / 572) + ((8928 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1732239 : ℝ) / 572) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((9241 : ℝ) / 260) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((119651 : ℝ) / 2860) + ((19224 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1058413 : ℝ) / 20020) + ((126972 : ℝ) / 5005) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((140983 : ℝ) / 1820) + ((22356 : ℝ) / 1001) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13528609 : ℝ) / 100100) + ((88992 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((68897 : ℝ) / 260) + ((5328 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1541899 : ℝ) / 2860) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3109963 : ℝ) / 2860) + ((4032 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((6264971 : ℝ) / 2860) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((66087 : ℝ) / 2860) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((19287 : ℝ) / 715) + ((15003 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((679347 : ℝ) / 20020) + ((198423 : ℝ) / 10010) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1004499 : ℝ) / 20020) + ((35037 : ℝ) / 2002) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8934993 : ℝ) / 100100) + ((70164 : ℝ) / 5005) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3569859 : ℝ) / 20020) + ((4266 : ℝ) / 455) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((7353441 : ℝ) / 20020) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((426303 : ℝ) / 572) + ((3384 : ℝ) / 715) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((861615 : ℝ) / 572) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((58995 : ℝ) / 4004) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((17100 : ℝ) / 1001) + ((2403 : ℝ) / 143) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((605403 : ℝ) / 28028) + ((225369 : ℝ) / 14014) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((909495 : ℝ) / 28028) + ((205119 : ℝ) / 14014) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8182287 : ℝ) / 140140) + ((87372 : ℝ) / 7007) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((252081 : ℝ) / 2156) + ((6102 : ℝ) / 637) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6744915 : ℝ) / 28028) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1954377 : ℝ) / 4004) + ((6696 : ℝ) / 1001) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3971817 : ℝ) / 4004) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((1641 : ℝ) / 182) + ((180 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3795 : ℝ) / 364) + ((180 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((17223 : ℝ) / 1274) + ((1233 : ℝ) / 91) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((53475 : ℝ) / 2548) + ((1179 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((486831 : ℝ) / 12740) + ((1098 : ℝ) / 91) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((48387 : ℝ) / 637) + ((990 : ℝ) / 91) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((394311 : ℝ) / 2548) + ((126 : ℝ) / 13) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((113691 : ℝ) / 364) + ((126 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((233115 : ℝ) / 364) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((2322 : ℝ) / 455) + ((153 : ℝ) / 13) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((10809 : ℝ) / 1820) + ((153 : ℝ) / 13) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((26199 : ℝ) / 3185) + ((1539 : ℝ) / 130) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((86913 : ℝ) / 6370) + ((1557 : ℝ) / 130) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1622259 : ℝ) / 63700) + ((792 : ℝ) / 65) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((640071 : ℝ) / 12740) + ((162 : ℝ) / 13) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1285677 : ℝ) / 12740) + ((828 : ℝ) / 65) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((368127 : ℝ) / 1820) + ((828 : ℝ) / 65) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((764919 : ℝ) / 1820) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((99 : ℝ) / 40) + ((207 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3321 : ℝ) / 1120) + ((207 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2691 : ℝ) / 560) + ((2997 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((4419 : ℝ) / 490) + ((639 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((86481 : ℝ) / 4900) + ((873 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8523 : ℝ) / 245) + ((486 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((67563 : ℝ) / 980) + ((153 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((549 : ℝ) / 4) + ((153 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1161 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((33 : ℝ) / 40) + ((189 : ℝ) / 20) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((177 : ℝ) / 160) + ((189 : ℝ) / 20) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1509 : ℝ) / 560) + ((2799 : ℝ) / 280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((867 : ℝ) / 140) + ((621 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1293 : ℝ) / 100) + ((891 : ℝ) / 70) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3579 : ℝ) / 140) + ((522 : ℝ) / 35) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6999 : ℝ) / 140) + ((171 : ℝ) / 10) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1977 : ℝ) / 20) + ((171 : ℝ) / 10) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4269 : ℝ) / 20) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    (((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9 : ℝ) / 64) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((351 : ℝ) / 224) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((513 : ℝ) / 112) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2817 : ℝ) / 280) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1107 : ℝ) / 56) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((531 : ℝ) / 14) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((297 : ℝ) / 4) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((657 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    (((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((9 : ℝ) / 7) + ((135 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((27 : ℝ) / 7) + ((153 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1161 : ℝ) / 140) + ((90 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((63 : ℝ) / 4) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((117 : ℝ) / 4) + (18 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((225 : ℝ) / 4) + (18 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((513 : ℝ) / 4) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf01ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf01ShiftedBernsteinRow0 s t +
    karlssonLeaf01ShiftedBernsteinRow1 s t +
    karlssonLeaf01ShiftedBernsteinRow2 s t +
    karlssonLeaf01ShiftedBernsteinRow3 s t +
    karlssonLeaf01ShiftedBernsteinRow4 s t +
    karlssonLeaf01ShiftedBernsteinRow5 s t +
    karlssonLeaf01ShiftedBernsteinRow6 s t +
    karlssonLeaf01ShiftedBernsteinRow7 s t +
    karlssonLeaf01ShiftedBernsteinRow8 s t +
    karlssonLeaf01ShiftedBernsteinRow9 s t +
    karlssonLeaf01ShiftedBernsteinRow10 s t +
    karlssonLeaf01ShiftedBernsteinRow11 s t +
    karlssonLeaf01ShiftedBernsteinRow12 s t +
    karlssonLeaf01ShiftedBernsteinRow13 s t +
    karlssonLeaf01ShiftedBernsteinRow14 s t +
    karlssonLeaf01ShiftedBernsteinRow15 s t +
    karlssonLeaf01ShiftedBernsteinRow16 s t
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
noncomputable def karlssonLeaf1100BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((225 : ℝ) / 14) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((117 : ℝ) / 7) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((39681 : ℝ) / 2240) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((8577 : ℝ) / 448) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2367 : ℝ) / 112) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((765 : ℝ) / 32) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((28575 : ℝ) / 1024) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((63 : ℝ) / 4) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4023 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((14337 : ℝ) / 896) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((118917 : ℝ) / 7168) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((156789 : ℝ) / 8960) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((538353 : ℝ) / 28672) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((42021 : ℝ) / 2048) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((375219 : ℝ) / 16384) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((53865 : ℝ) / 2048) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((2553 : ℝ) / 160) + ((729 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((10167 : ℝ) / 640) + ((729 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3615 : ℝ) / 224) + ((5931 : ℝ) / 640) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((298833 : ℝ) / 17920) + ((6129 : ℝ) / 640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1567947 : ℝ) / 89600) + ((3213 : ℝ) / 320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1336017 : ℝ) / 71680) + ((3411 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((25809 : ℝ) / 1280) + ((116973 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((909831 : ℝ) / 40960) + ((125883 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1028337 : ℝ) / 40960) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((2619 : ℝ) / 160) + ((747 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((582723 : ℝ) / 35840) + ((747 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((295227 : ℝ) / 17920) + ((42471 : ℝ) / 4480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((17017209 : ℝ) / 1003520) + ((43749 : ℝ) / 4480) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((22193019 : ℝ) / 1254400) + ((22833 : ℝ) / 2240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((75030453 : ℝ) / 4014080) + ((24111 : ℝ) / 2240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((40148919 : ℝ) / 2007040) + ((822033 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1424421 : ℝ) / 65536) + ((125649 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1731393 : ℝ) / 71680) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((98991 : ℝ) / 5824) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1961451 : ℝ) / 116480) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6935337 : ℝ) / 407680) + ((228393 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((11370249 : ℝ) / 652288) + ((1170999 : ℝ) / 116480) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((42086511 : ℝ) / 2329600) + ((121455 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((246737709 : ℝ) / 13045760) + ((636309 : ℝ) / 58240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((130460751 : ℝ) / 6522880) + ((21508731 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((22793229 : ℝ) / 1064960) + ((3259323 : ℝ) / 266240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((174021219 : ℝ) / 7454720) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((104019 : ℝ) / 5824) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6575649 : ℝ) / 372736) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((23169831 : ℝ) / 1304576) + ((238725 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((26992437 : ℝ) / 1490944) + ((243423 : ℝ) / 23296) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((242939163 : ℝ) / 13045760) + ((125235 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((805558503 : ℝ) / 41746432) + ((129933 : ℝ) / 11648) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((420313029 : ℝ) / 20873216) + ((4343427 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((72206931 : ℝ) / 3407872) + ((650691 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((67479411 : ℝ) / 2981888) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((9731781 : ℝ) / 512512) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((38315205 : ℝ) / 2050048) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4802643 : ℝ) / 256256) + ((155330163 : ℝ) / 14350336) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((22249899 : ℝ) / 1171456) + ((157382217 : ℝ) / 14350336) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((427714083 : ℝ) / 22077440) + ((80230149 : ℝ) / 7175168) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((4557721347 : ℝ) / 229605376) + ((82282203 : ℝ) / 7175168) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1172004543 : ℝ) / 57401344) + ((2714086629 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((395410203 : ℝ) / 18743296) + ((400918437 : ℝ) / 32800768) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2889162477 : ℝ) / 131203072) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((7476489 : ℝ) / 366080) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((234525087 : ℝ) / 11714560) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((117067959 : ℝ) / 5857280) + ((118418031 : ℝ) / 10250240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((85737393 : ℝ) / 4259840) + ((119177469 : ℝ) / 10250240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8341720407 : ℝ) / 410009600) + ((60158313 : ℝ) / 5125120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((27025807401 : ℝ) / 1312030720) + ((60917751 : ℝ) / 5125120) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((13690859571 : ℝ) / 656015360) + ((1979365833 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((15863514651 : ℝ) / 749731840) + ((287648649 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((505225719 : ℝ) / 23429120) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((16269989 : ℝ) / 732160) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((31748113 : ℝ) / 1464320) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((15771133 : ℝ) / 732160) + ((31924107 : ℝ) / 2562560) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((176683985 : ℝ) / 8200192) + ((31914513 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8846851171 : ℝ) / 410009600) + ((15950061 : ℝ) / 1281280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((321760837 : ℝ) / 14909440) + ((15940467 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1766025931 : ℝ) / 82001920) + ((509715981 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2008409939 : ℝ) / 93716480) + ((72754893 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3998531189 : ℝ) / 187432960) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((3582009 : ℝ) / 146432) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((222487569 : ℝ) / 9371648) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((296018271 : ℝ) / 12615680) + ((6955605 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((30583169919 : ℝ) / 1312030720) + ((34551243 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((37928400399 : ℝ) / 1640038400) + ((3421107 : ℝ) / 256256) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((119953074051 : ℝ) / 5248122880) + ((16878753 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((11797988229 : ℝ) / 524812288) + ((531162207 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((65923466121 : ℝ) / 2998927360) + ((74422431 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((8027007723 : ℝ) / 374865920) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((223426197 : ℝ) / 8200192) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((862290567 : ℝ) / 32800768) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1483336809 : ℝ) / 57401344) + ((3428964117 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((23417613873 : ℝ) / 918421504) + ((3388276431 : ℝ) / 229605376) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((115140241647 : ℝ) / 4592107520) + ((1663622451 : ℝ) / 114802688) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((90030308769 : ℝ) / 3673686016) + ((1622934765 : ℝ) / 114802688) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((5461641477 : ℝ) / 229605376) + ((50326748883 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6868327617 : ℝ) / 299892736) + ((6927971859 : ℝ) / 524812288) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3535773057 : ℝ) / 161480704) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((22896645 : ℝ) / 745472) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((702504723 : ℝ) / 23855104) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2403442317 : ℝ) / 83492864) + ((346411413 : ℝ) / 20873216) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((18849997641 : ℝ) / 667942912) + ((340866639 : ℝ) / 20873216) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((22985869371 : ℝ) / 834928640) + ((166274739 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((71196861381 : ℝ) / 2671771648) + ((160729965 : ℝ) / 10436608) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((34164601383 : ℝ) / 1335885824) + ((4924340307 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((5301739689 : ℝ) / 218103808) + ((667832211 : ℝ) / 47710208) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1092154911 : ℝ) / 47710208) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((52262775 : ℝ) / 1490944) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((995629329 : ℝ) / 29818880) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3387312603 : ℝ) / 104366080) + ((3886375653 : ℝ) / 208732160) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((26412644799 : ℝ) / 834928640) + ((3813736959 : ℝ) / 208732160) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((127975497417 : ℝ) / 4174643200) + ((1852389459 : ℝ) / 104366080) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((98335274391 : ℝ) / 3339714560) + ((27380781 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((9355410801 : ℝ) / 333971456) + ((54082796067 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((7188905727 : ℝ) / 272629760) + ((558396207 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((46867515579 : ℝ) / 1908408320) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((4647375 : ℝ) / 114688) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((281446173 : ℝ) / 7340032) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4761996471 : ℝ) / 128450560) + ((338429853 : ℝ) / 16056320) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((36951165603 : ℝ) / 1027604480) + ((331739559 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((44541937323 : ℝ) / 1284505600) + ((160852059 : ℝ) / 8028160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((136206042327 : ℝ) / 4110417920) + ((30832353 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((12888830673 : ℝ) / 411041792) + ((4668909867 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9848141091 : ℝ) / 335544320) + ((623978091 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7976390931 : ℝ) / 293601280) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((6223125 : ℝ) / 131072) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((23406465 : ℝ) / 524288) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((49262637 : ℝ) / 1146880) + ((12613833 : ℝ) / 524288) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3047003403 : ℝ) / 73400320) + ((12371499 : ℝ) / 524288) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((14653484067 : ℝ) / 367001600) + ((6003999 : ℝ) / 262144) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((11182191267 : ℝ) / 293601280) + ((5761665 : ℝ) / 262144) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((528499725 : ℝ) / 14680064) + ((174801087 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((5651664717 : ℝ) / 167772160) + ((163896057 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5234776593 : ℝ) / 167772160) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((7396875 : ℝ) / 131072) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((221329125 : ℝ) / 4194304) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((742320315 : ℝ) / 14680064) + ((101505825 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((5727773295 : ℝ) / 117440512) + ((99767475 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((983876571 : ℝ) / 20971520) + ((48579975 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((21067967187 : ℝ) / 469762048) + ((46841625 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((9999546273 : ℝ) / 234881024) + ((1430267175 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((10764586233 : ℝ) / 268435456) + ((193148775 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((314706843 : ℝ) / 8388608) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((17859375 : ℝ) / 262144) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4156875 : ℝ) / 65536) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6952275 : ℝ) / 114688) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((429171975 : ℝ) / 7340032) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8283555009 : ℝ) / 146800640) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((56940453 : ℝ) / 1048576) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((764625051 : ℝ) / 14680064) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((835507161 : ℝ) / 16777216) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1100BernsteinRow0 s t +
    karlssonLeaf1100BernsteinRow1 s t +
    karlssonLeaf1100BernsteinRow2 s t +
    karlssonLeaf1100BernsteinRow3 s t +
    karlssonLeaf1100BernsteinRow4 s t +
    karlssonLeaf1100BernsteinRow5 s t +
    karlssonLeaf1100BernsteinRow6 s t +
    karlssonLeaf1100BernsteinRow7 s t +
    karlssonLeaf1100BernsteinRow8 s t +
    karlssonLeaf1100BernsteinRow9 s t +
    karlssonLeaf1100BernsteinRow10 s t +
    karlssonLeaf1100BernsteinRow11 s t +
    karlssonLeaf1100BernsteinRow12 s t +
    karlssonLeaf1100BernsteinRow13 s t +
    karlssonLeaf1100BernsteinRow14 s t +
    karlssonLeaf1100BernsteinRow15 s t +
    karlssonLeaf1100BernsteinRow16 s t
noncomputable def karlssonLeaf1100ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((9 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((639 : ℝ) / 1792) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1791 : ℝ) / 1792) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((17919 : ℝ) / 8960) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6147 : ℝ) / 1792) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((9711 : ℝ) / 1792) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2097 : ℝ) / 256) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((12483 : ℝ) / 1024) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((9 : ℝ) / 256) + (9 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((0 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((513 : ℝ) / 1792) + ((513 : ℝ) / 56) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6273 : ℝ) / 7168) + ((531 : ℝ) / 56) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((999 : ℝ) / 560) + ((279 : ℝ) / 28) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((87777 : ℝ) / 28672) + ((297 : ℝ) / 28) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((9837 : ℝ) / 2048) + ((10215 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((117747 : ℝ) / 16384) + ((1575 : ℝ) / 128) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((21681 : ℝ) / 2048) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((309 : ℝ) / 1280) + ((729 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((219 : ℝ) / 1280) + ((729 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((759 : ℝ) / 1792) + ((5931 : ℝ) / 640) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((17223 : ℝ) / 17920) + ((6129 : ℝ) / 640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((159897 : ℝ) / 89600) + ((3213 : ℝ) / 320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((209577 : ℝ) / 71680) + ((3411 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2847 : ℝ) / 640) + ((116973 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((266151 : ℝ) / 40960) + ((125883 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((384657 : ℝ) / 40960) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((837 : ℝ) / 1280) + ((747 : ℝ) / 80) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((19503 : ℝ) / 35840) + ((747 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((13617 : ℝ) / 17920) + ((42471 : ℝ) / 4480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1247049 : ℝ) / 1003520) + ((43749 : ℝ) / 4480) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2480319 : ℝ) / 1254400) + ((22833 : ℝ) / 2240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((11949813 : ℝ) / 4014080) + ((24111 : ℝ) / 2240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((8608599 : ℝ) / 2007040) + ((822033 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((394533 : ℝ) / 65536) + ((125649 : ℝ) / 10240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((604953 : ℝ) / 71680) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((29871 : ℝ) / 23296) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((65493 : ℝ) / 58240) + ((20133 : ℝ) / 2080) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1057419 : ℝ) / 815360) + ((228393 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1119645 : ℝ) / 652288) + ((1170999 : ℝ) / 116480) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5477211 : ℝ) / 2329600) + ((121455 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((41725629 : ℝ) / 13045760) + ((636309 : ℝ) / 58240) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((27954711 : ℝ) / 6522880) + ((21508731 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6057549 : ℝ) / 1064960) + ((3259323 : ℝ) / 266240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((56871459 : ℝ) / 7454720) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((49983 : ℝ) / 23296) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((718161 : ℝ) / 372736) + ((4221 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2668623 : ℝ) / 1304576) + ((238725 : ℝ) / 23296) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3562485 : ℝ) / 1490944) + ((243423 : ℝ) / 23296) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((37927083 : ℝ) / 13045760) + ((125235 : ℝ) / 11648) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((149519847 : ℝ) / 41746432) + ((129933 : ℝ) / 11648) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((92293701 : ℝ) / 20873216) + ((4343427 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((18652755 : ℝ) / 3407872) + ((650691 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((20619507 : ℝ) / 2981888) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((1677735 : ℝ) / 512512) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6099021 : ℝ) / 2050048) + ((393633 : ℝ) / 36608) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((193905 : ℝ) / 64064) + ((155330163 : ℝ) / 14350336) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3840651 : ℝ) / 1171456) + ((157382217 : ℝ) / 14350336) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((80770563 : ℝ) / 22077440) + ((80230149 : ℝ) / 7175168) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((949508739 : ℝ) / 229605376) + ((82282203 : ℝ) / 7175168) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((269951391 : ℝ) / 57401344) + ((2714086629 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((100862235 : ℝ) / 18743296) + ((400918437 : ℝ) / 32800768) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((827326701 : ℝ) / 131203072) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((1723599 : ℝ) / 366080) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((50432607 : ℝ) / 11714560) + ((2107827 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((25021719 : ℝ) / 5857280) + ((118418031 : ℝ) / 10250240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((18794673 : ℝ) / 4259840) + ((119177469 : ℝ) / 10250240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1898483607 : ℝ) / 410009600) + ((60158313 : ℝ) / 5125120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6407449641 : ℝ) / 1312030720) + ((60917751 : ℝ) / 5125120) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3381680691 : ℝ) / 656015360) + ((1979365833 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4081595931 : ℝ) / 749731840) + ((287648649 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((137040759 : ℝ) / 23429120) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((4764209 : ℝ) / 732160) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((8736553 : ℝ) / 1464320) + ((570159 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4265353 : ℝ) / 732160) + ((31924107 : ℝ) / 2562560) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((47819249 : ℝ) / 8200192) + ((31914513 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2403614371 : ℝ) / 410009600) + ((15950061 : ℝ) / 1281280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((87461317 : ℝ) / 14909440) + ((15940467 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((477378571 : ℝ) / 82001920) + ((509715981 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((535670099 : ℝ) / 93716480) + ((72754893 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1053051509 : ℝ) / 187432960) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((1280853 : ℝ) / 146432) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((75213585 : ℝ) / 9371648) + ((623061 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((97764831 : ℝ) / 12615680) + ((6955605 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((9964812159 : ℝ) / 1312030720) + ((34551243 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((12155453199 : ℝ) / 1640038400) + ((3421107 : ℝ) / 256256) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((37479643011 : ℝ) / 5248122880) + ((16878753 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3550645125 : ℝ) / 524812288) + ((531162207 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((18795791241 : ℝ) / 2998927360) + ((74422431 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2136048363 : ℝ) / 374865920) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((94561461 : ℝ) / 8200192) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((346831623 : ℝ) / 32800768) + ((8799255 : ℝ) / 585728) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((581283657 : ℝ) / 57401344) + ((3428964117 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8984763441 : ℝ) / 918421504) + ((3388276431 : ℝ) / 229605376) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((42975989487 : ℝ) / 4592107520) + ((1663622451 : ℝ) / 114802688) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((32298907041 : ℝ) / 3673686016) + ((1622934765 : ℝ) / 114802688) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1853428869 : ℝ) / 229605376) + ((50326748883 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2155560129 : ℝ) / 299892736) + ((6927971859 : ℝ) / 524812288) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((998129025 : ℝ) / 161480704) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((11181669 : ℝ) / 745472) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((327625491 : ℝ) / 23855104) + ((890775 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1091365005 : ℝ) / 83492864) + ((346411413 : ℝ) / 20873216) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8353379145 : ℝ) / 667942912) + ((340866639 : ℝ) / 20873216) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9865096251 : ℝ) / 834928640) + ((166274739 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((29210387397 : ℝ) / 2671771648) + ((160729965 : ℝ) / 10436608) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((13171364391 : ℝ) / 1335885824) + ((4924340307 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1874272425 : ℝ) / 218103808) + ((667832211 : ℝ) / 47710208) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((342396447 : ℝ) / 47710208) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((28832823 : ℝ) / 1490944) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((527030289 : ℝ) / 29818880) + ((2001375 : ℝ) / 106496) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1747215963 : ℝ) / 104366080) + ((3886375653 : ℝ) / 208732160) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((13291871679 : ℝ) / 834928640) + ((3813736959 : ℝ) / 208732160) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((62371631817 : ℝ) / 4174643200) + ((1852389459 : ℝ) / 104366080) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((45852181911 : ℝ) / 3339714560) + ((27380781 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4107101553 : ℝ) / 333971456) + ((54082796067 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2904571647 : ℝ) / 272629760) + ((558396207 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((16877177019 : ℝ) / 1908408320) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((2845071 : ℝ) / 114688) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((166098717 : ℝ) / 7340032) + ((174375 : ℝ) / 8192) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2743415991 : ℝ) / 128450560) + ((338429853 : ℝ) / 16056320) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((20802521763 : ℝ) / 1027604480) + ((331739559 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((24356132523 : ℝ) / 1284505600) + ((160852059 : ℝ) / 8028160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((71611466967 : ℝ) / 4110417920) + ((30832353 : ℝ) / 1605632) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6429373137 : ℝ) / 411041792) + ((4668909867 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4575114531 : ℝ) / 335544320) + ((623978091 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3362492691 : ℝ) / 293601280) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((4163349 : ℝ) / 131072) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((15167361 : ℝ) / 524288) + ((1591875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((31239597 : ℝ) / 1146880) + ((12613833 : ℝ) / 524288) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1893528843 : ℝ) / 73400320) + ((12371499 : ℝ) / 524288) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8886111267 : ℝ) / 367001600) + ((6003999 : ℝ) / 262144) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6568293027 : ℝ) / 293601280) + ((5761665 : ℝ) / 262144) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((297804813 : ℝ) / 14680064) + ((174801087 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3015151437 : ℝ) / 167772160) + ((163896057 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2598263313 : ℝ) / 167772160) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((5337099 : ℝ) / 131072) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((155416293 : ℝ) / 4194304) + ((1828125 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((511625403 : ℝ) / 14680064) + ((101505825 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3882213999 : ℝ) / 117440512) + ((99767475 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((654312411 : ℝ) / 20971520) + ((48579975 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((13685730003 : ℝ) / 469762048) + ((46841625 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6308427681 : ℝ) / 234881024) + ((1430267175 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6546164985 : ℝ) / 268435456) + ((193148775 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((182881179 : ℝ) / 8388608) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((13739823 : ℝ) / 262144) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3126987 : ℝ) / 65536) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((5149971 : ℝ) / 114688) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((313824519 : ℝ) / 7340032) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5976605889 : ℝ) / 146800640) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((40462245 : ℝ) / 1048576) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((533930139 : ℝ) / 14680064) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((571855833 : ℝ) / 16777216) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2139397551 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1100ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1100ShiftedBernsteinRow0 s t +
    karlssonLeaf1100ShiftedBernsteinRow1 s t +
    karlssonLeaf1100ShiftedBernsteinRow2 s t +
    karlssonLeaf1100ShiftedBernsteinRow3 s t +
    karlssonLeaf1100ShiftedBernsteinRow4 s t +
    karlssonLeaf1100ShiftedBernsteinRow5 s t +
    karlssonLeaf1100ShiftedBernsteinRow6 s t +
    karlssonLeaf1100ShiftedBernsteinRow7 s t +
    karlssonLeaf1100ShiftedBernsteinRow8 s t +
    karlssonLeaf1100ShiftedBernsteinRow9 s t +
    karlssonLeaf1100ShiftedBernsteinRow10 s t +
    karlssonLeaf1100ShiftedBernsteinRow11 s t +
    karlssonLeaf1100ShiftedBernsteinRow12 s t +
    karlssonLeaf1100ShiftedBernsteinRow13 s t +
    karlssonLeaf1100ShiftedBernsteinRow14 s t +
    karlssonLeaf1100ShiftedBernsteinRow15 s t +
    karlssonLeaf1100ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf1101BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((28575 : ℝ) / 1024) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((16335 : ℝ) / 512) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((66537 : ℝ) / 1792) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((39447 : ℝ) / 896) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((59643 : ℝ) / 1120) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1053 : ℝ) / 16) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((333 : ℝ) / 4) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((108 : ℝ) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((144 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((53865 : ℝ) / 2048) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((486621 : ℝ) / 16384) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((139743 : ℝ) / 4096) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((286173 : ℝ) / 7168) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((61047 : ℝ) / 1280) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((52245 : ℝ) / 896) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((16389 : ℝ) / 224) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((189 : ℝ) / 2) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((126 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((1028337 : ℝ) / 40960) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1146843 : ℝ) / 40960) + ((35793 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((162489 : ℝ) / 5120) + ((151551 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1313037 : ℝ) / 35840) + ((15831 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1935261 : ℝ) / 44800) + ((10071 : ℝ) / 640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((233901 : ℝ) / 4480) + ((2439 : ℝ) / 160) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((14547 : ℝ) / 224) + ((2133 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3339 : ℝ) / 40) + ((711 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1113 : ℝ) / 10) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((1731393 : ℝ) / 71680) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((60954417 : ℝ) / 2293760) + ((35379 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((23829345 : ℝ) / 802816) + ((1044171 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((33867801 : ℝ) / 1003520) + ((15525 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((49182849 : ℝ) / 1254400) + ((68931 : ℝ) / 4480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((5865939 : ℝ) / 125440) + ((16659 : ℝ) / 1120) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1805427 : ℝ) / 31360) + ((2079 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2943 : ℝ) / 40) + ((693 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((981 : ℝ) / 10) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((174021219 : ℝ) / 7454720) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((37697967 : ℝ) / 1490944) + ((452079 : ℝ) / 33280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((13930839 : ℝ) / 501760) + ((26511057 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((202241853 : ℝ) / 6522880) + ((1959579 : ℝ) / 133120) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((288467001 : ℝ) / 8153600) + ((1732023 : ℝ) / 116480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6768441 : ℝ) / 163072) + ((104301 : ℝ) / 7280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2056149 : ℝ) / 40768) + ((10395 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((46575 : ℝ) / 728) + ((3465 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15525 : ℝ) / 182) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((67479411 : ℝ) / 2981888) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((574222059 : ℝ) / 23855104) + ((88443 : ℝ) / 6656) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1081333455 : ℝ) / 41746432) + ((5139369 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3245805 : ℝ) / 114688) + ((376803 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((411948063 : ℝ) / 13045760) + ((330831 : ℝ) / 23296) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((47312289 : ℝ) / 1304576) + ((19827 : ℝ) / 1456) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((14125305 : ℝ) / 326144) + ((9855 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((39591 : ℝ) / 728) + ((3285 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((13197 : ℝ) / 182) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((2889162477 : ℝ) / 131203072) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3010453533 : ℝ) / 131203072) + ((106209927 : ℝ) / 8200192) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1384263891 : ℝ) / 57401344) + ((3048984423 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2946681261 : ℝ) / 114802688) + ((2871585 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3996650997 : ℝ) / 143503360) + ((192370383 : ℝ) / 14350336) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((34350885 : ℝ) / 1103872) + ((45809847 : ℝ) / 3587584) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((130239675 : ℝ) / 3587584) + ((5672187 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((5758695 : ℝ) / 128128) + ((1890729 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1919565 : ℝ) / 32032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((505225719 : ℝ) / 23429120) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3294186273 : ℝ) / 149946368) + ((73853379 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2269821357 : ℝ) / 100925440) + ((2088073971 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((7617955473 : ℝ) / 328007680) + ((2714391 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9991790397 : ℝ) / 410009600) + ((128317851 : ℝ) / 10250240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1078300269 : ℝ) / 41000960) + ((30282579 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((304840629 : ℝ) / 10250240) + ((3731319 : ℝ) / 366080) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1652049 : ℝ) / 45760) + ((1243773 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((550683 : ℝ) / 11440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((3998531189 : ℝ) / 187432960) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((15308625 : ℝ) / 720896) + ((18015003 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((630552991 : ℝ) / 29818880) + ((499987647 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3466051569 : ℝ) / 164003840) + ((638451 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4376889453 : ℝ) / 205004800) + ((29710287 : ℝ) / 2562560) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((453073437 : ℝ) / 20500480) + ((6928083 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((123074573 : ℝ) / 5125120) + ((848043 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((259761 : ℝ) / 9152) + ((282681 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((86587 : ℝ) / 2288) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((8027007723 : ℝ) / 374865920) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((62508657447 : ℝ) / 2998927360) + ((17712801 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((106028051931 : ℝ) / 5248122880) + ((481165029 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((25639574031 : ℝ) / 1312030720) + ((3006693 : ℝ) / 266240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((31124715939 : ℝ) / 1640038400) + ((2110617 : ℝ) / 197120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3076811163 : ℝ) / 164003840) + ((6300153 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((61297191 : ℝ) / 3153920) + ((152901 : ℝ) / 18304) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((8124921 : ℝ) / 366080) + ((50967 : ℝ) / 9152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2708307 : ℝ) / 91520) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((3535773057 : ℝ) / 161480704) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3986527833 : ℝ) / 190840832) + ((1584359289 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((36296779293 : ℝ) / 1836843008) + ((42059263041 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2621300373 : ℝ) / 141295616) + ((36649719 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((39860635761 : ℝ) / 2296053760) + ((2287737513 : ℝ) / 229605376) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3763871145 : ℝ) / 229605376) + ((515495961 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((925821459 : ℝ) / 57401344) + ((61876413 : ℝ) / 8200192) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((36258111 : ℝ) / 2050048) + ((20625471 : ℝ) / 4100096) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((12086037 : ℝ) / 512512) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((1092154911 : ℝ) / 47710208) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((32785736481 : ℝ) / 1526726656) + ((147378681 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((53186658069 : ℝ) / 2671771648) + ((3827895489 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((12177005265 : ℝ) / 667942912) + ((35821341 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13802999841 : ℝ) / 834928640) + ((15264909 : ℝ) / 1605632) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1251446895 : ℝ) / 83492864) + ((43808409 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((292964703 : ℝ) / 20873216) + ((5194557 : ℝ) / 745472) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2748483 : ℝ) / 186368) + ((1731519 : ℝ) / 372736) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((916161 : ℝ) / 46592) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((46867515579 : ℝ) / 1908408320) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((43412691069 : ℝ) / 1908408320) + ((780599943 : ℝ) / 59637760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1734258411 : ℝ) / 83492864) + ((39881880009 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((31182724953 : ℝ) / 1669857280) + ((366190821 : ℝ) / 34078720) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((34522616421 : ℝ) / 2087321600) + ((1988676927 : ℝ) / 208732160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3032770329 : ℝ) / 208732160) + ((107834301 : ℝ) / 13045760) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((681381621 : ℝ) / 52183040) + ((50593167 : ℝ) / 7454720) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2460051 : ℝ) / 186368) + ((16864389 : ℝ) / 3727360) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((820017 : ℝ) / 46592) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((7976390931 : ℝ) / 293601280) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((58685267259 : ℝ) / 2348810240) + ((66362643 : ℝ) / 4587520) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((93007285407 : ℝ) / 4110417920) + ((3365832609 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((20700710487 : ℝ) / 1027604480) + ((30640221 : ℝ) / 2621440) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((22639213503 : ℝ) / 1284505600) + ((164864727 : ℝ) / 16056320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1956407661 : ℝ) / 128450560) + ((8864451 : ℝ) / 1003520) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((429884181 : ℝ) / 32112640) + ((4136967 : ℝ) / 573440) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((271053 : ℝ) / 20480) + ((1378989 : ℝ) / 286720) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((90351 : ℝ) / 5120) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((5234776593 : ℝ) / 167772160) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4817888469 : ℝ) / 167772160) + ((35062947 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((239118051 : ℝ) / 9175040) + ((127512549 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3419844489 : ℝ) / 146800640) + ((57135969 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3766028481 : ℝ) / 183500800) + ((6304797 : ℝ) / 524288) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((329137317 : ℝ) / 18350080) + ((1362069 : ℝ) / 131072) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((73531527 : ℝ) / 4587520) + ((1115559 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2640051 : ℝ) / 163840) + ((371853 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((880017 : ℝ) / 40960) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((314706843 : ℝ) / 8388608) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((9376651719 : ℝ) / 268435456) + ((42180525 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((15141321747 : ℝ) / 469762048) + ((1088293725 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((494962245 : ℝ) / 16777216) + ((70754175 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3948069087 : ℝ) / 146800640) + ((55559925 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((362455155 : ℝ) / 14680064) + ((12181725 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((86461371 : ℝ) / 3670016) + ((1438425 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((206199 : ℝ) / 8192) + ((479475 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((68733 : ℝ) / 2048) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1522988541 : ℝ) / 33554432) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((5080819941 : ℝ) / 117440512) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2429055135 : ℝ) / 58720256) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2934177507 : ℝ) / 73400320) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((290540115 : ℝ) / 7340032) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((75666051 : ℝ) / 1835008) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((774711 : ℝ) / 16384) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((258237 : ℝ) / 4096) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1101BernsteinRow0 s t +
    karlssonLeaf1101BernsteinRow1 s t +
    karlssonLeaf1101BernsteinRow2 s t +
    karlssonLeaf1101BernsteinRow3 s t +
    karlssonLeaf1101BernsteinRow4 s t +
    karlssonLeaf1101BernsteinRow5 s t +
    karlssonLeaf1101BernsteinRow6 s t +
    karlssonLeaf1101BernsteinRow7 s t +
    karlssonLeaf1101BernsteinRow8 s t +
    karlssonLeaf1101BernsteinRow9 s t +
    karlssonLeaf1101BernsteinRow10 s t +
    karlssonLeaf1101BernsteinRow11 s t +
    karlssonLeaf1101BernsteinRow12 s t +
    karlssonLeaf1101BernsteinRow13 s t +
    karlssonLeaf1101BernsteinRow14 s t +
    karlssonLeaf1101BernsteinRow15 s t +
    karlssonLeaf1101BernsteinRow16 s t
noncomputable def karlssonLeaf1101ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((774800379 : ℝ) / 52183040) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((983481579 : ℝ) / 52183040) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1256175819 : ℝ) / 52183040) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1616011659 : ℝ) / 52183040) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((419501007 : ℝ) / 10436608) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2752914699 : ℝ) / 52183040) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3662856459 : ℝ) / 52183040) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4954386699 : ℝ) / 52183040) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((6832976139 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((691098579 : ℝ) / 52183040) + ((3375 : ℝ) / 256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((108563283 : ℝ) / 6522880) + ((225 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1098944199 : ℝ) / 52183040) + ((13365 : ℝ) / 896) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1401957819 : ℝ) / 52183040) + ((999 : ℝ) / 64) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((361476495 : ℝ) / 10436608) + ((891 : ℝ) / 56) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2361367179 : ℝ) / 52183040) + ((108 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3136599819 : ℝ) / 52183040) + ((27 : ℝ) / 2) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4249915659 : ℝ) / 52183040) + (9 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5893681419 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((628719717 : ℝ) / 52183040) + ((53811 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((779696361 : ℝ) / 52183040) + ((35793 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((974706267 : ℝ) / 52183040) + ((151551 : ℝ) / 10240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1230400251 : ℝ) / 52183040) + ((15831 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((7864051959 : ℝ) / 260915200) + ((10071 : ℝ) / 640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2043097227 : ℝ) / 52183040) + ((2439 : ℝ) / 160) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2707487499 : ℝ) / 52183040) + ((2133 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3674597643 : ℝ) / 52183040) + ((711 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5126590731 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((579072483 : ℝ) / 52183040) + ((53433 : ℝ) / 4096) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2821325463 : ℝ) / 208732160) + ((35379 : ℝ) / 2560) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((216881451 : ℝ) / 13045760) + ((1044171 : ℝ) / 71680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1079744031 : ℝ) / 52183040) + ((15525 : ℝ) / 1024) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6823124487 : ℝ) / 260915200) + ((68931 : ℝ) / 4480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1758849003 : ℝ) / 52183040) + ((16659 : ℝ) / 1120) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2322848907 : ℝ) / 52183040) + ((2079 : ℝ) / 160) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3157985547 : ℝ) / 52183040) + ((693 : ℝ) / 80) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4437774603 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((8386983 : ℝ) / 815360) + ((1375191 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((79755903 : ℝ) / 6522880) + ((452079 : ℝ) / 33280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((153485127 : ℝ) / 10436608) + ((26511057 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((936553203 : ℝ) / 52183040) + ((1959579 : ℝ) / 133120) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5824035927 : ℝ) / 260915200) + ((1732023 : ℝ) / 116480) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1484519499 : ℝ) / 52183040) + ((104301 : ℝ) / 7280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((150037623 : ℝ) / 4014080) + ((10395 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2657114379 : ℝ) / 52183040) + ((3465 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3769946379 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((999016143 : ℝ) / 104366080) + ((1358235 : ℝ) / 106496) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((707358933 : ℝ) / 64225280) + ((88443 : ℝ) / 6656) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((54717159 : ℝ) / 4259840) + ((5139369 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((397729827 : ℝ) / 26091520) + ((376803 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((966410631 : ℝ) / 52183040) + ((330831 : ℝ) / 23296) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((93162303 : ℝ) / 4014080) + ((19827 : ℝ) / 1456) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1578667179 : ℝ) / 52183040) + ((9855 : ℝ) / 832) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2156501259 : ℝ) / 52183040) + ((3285 : ℝ) / 416) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3102462219 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((41159104047 : ℝ) / 4592107520) + ((825758145 : ℝ) / 65601536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((45404291007 : ℝ) / 4592107520) + ((106209927 : ℝ) / 8200192) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((906777297 : ℝ) / 82001920) + ((3048984423 : ℝ) / 229605376) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((517014891 : ℝ) / 41000960) + ((2871585 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((653185089 : ℝ) / 44154880) + ((192370383 : ℝ) / 14350336) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((10367262369 : ℝ) / 574013440) + ((45809847 : ℝ) / 3587584) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((13343150169 : ℝ) / 574013440) + ((5672187 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1407981213 : ℝ) / 44154880) + ((1890729 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((26903406969 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((9765664569 : ℝ) / 1148026880) + ((116612433 : ℝ) / 9371648) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((327382975701 : ℝ) / 36736860160) + ((73853379 : ℝ) / 5857280) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((86630578191 : ℝ) / 9184215040) + ((2088073971 : ℝ) / 164003840) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((23344896987 : ℝ) / 2296053760) + ((2714391 : ℝ) / 212992) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4058317953 : ℝ) / 358758400) + ((128317851 : ℝ) / 10250240) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1520201187 : ℝ) / 114802688) + ((30282579 : ℝ) / 2562560) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((9575877393 : ℝ) / 574013440) + ((3731319 : ℝ) / 366080) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((203509305 : ℝ) / 8830976) + ((1243773 : ℝ) / 183040) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((20135872377 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((15200972593 : ℝ) / 1836843008) + ((28962981 : ℝ) / 2342912) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((18777179301 : ℝ) / 2296053760) + ((18015003 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1688344453 : ℝ) / 208732160) + ((499987647 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((9271965321 : ℝ) / 1148026880) + ((638451 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((23800463187 : ℝ) / 2870067200) + ((29710287 : ℝ) / 2562560) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1038171681 : ℝ) / 114802688) + ((6928083 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1257830869 : ℝ) / 114802688) + ((848043 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((8797012089 : ℝ) / 574013440) + ((282681 : ℝ) / 45760) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((14227748729 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((30695409567 : ℝ) / 3673686016) + ((2234979 : ℝ) / 180224) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1144153570167 : ℝ) / 146947440640) + ((17712801 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((262503702333 : ℝ) / 36736860160) + ((481165029 : ℝ) / 41000960) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((59553852921 : ℝ) / 9184215040) + ((3006693 : ℝ) / 266240) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((67969054953 : ℝ) / 11480268800) + ((2110617 : ℝ) / 197120) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6547282479 : ℝ) / 1148026880) + ((6300153 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3660890931 : ℝ) / 574013440) + ((152901 : ℝ) / 18304) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((5244678297 : ℝ) / 574013440) + ((50967 : ℝ) / 9152) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9491303673 : ℝ) / 574013440) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((649391418567 : ℝ) / 73473720320) + ((13265409015 : ℝ) / 1049624576) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((52311626667 : ℝ) / 6679429120) + ((1584359289 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((8794390167 : ℝ) / 1312030720) + ((42059263041 : ℝ) / 3673686016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((50461358949 : ℝ) / 9184215040) + ((36649719 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9879844437 : ℝ) / 2296053760) + ((2287737513 : ℝ) / 229605376) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3828960063 : ℝ) / 1148026880) + ((515495961 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((251859537 : ℝ) / 82001920) + ((61876413 : ℝ) / 8200192) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2657073249 : ℝ) / 574013440) + ((20625471 : ℝ) / 4100096) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((464704893 : ℝ) / 44154880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((1263170001 : ℝ) / 128450560) + ((96718995 : ℝ) / 7340032) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((449765996931 : ℝ) / 53435432960) + ((147378681 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((143641437 : ℝ) / 20971520) + ((3827895489 : ℝ) / 333971456) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2468086083 : ℝ) / 477102080) + ((35821341 : ℝ) / 3407872) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6375591 : ℝ) / 1835008) + ((15264909 : ℝ) / 1605632) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((806181507 : ℝ) / 417464320) + ((43808409 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((14580039 : ℝ) / 14909440) + ((5194557 : ℝ) / 745472) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((88193619 : ℝ) / 52183040) + ((1731519 : ℝ) / 372736) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((26516823 : ℝ) / 4014080) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((153638914077 : ℝ) / 13358858240) + ((2700790047 : ℝ) / 190840832) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((129455142507 : ℝ) / 13358858240) + ((780599943 : ℝ) / 59637760) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((247710699 : ℝ) / 32112640) + ((39881880009 : ℝ) / 3339714560) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1339787583 : ℝ) / 238551040) + ((366190821 : ℝ) / 34078720) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1038193083 : ℝ) / 298188800) + ((1988676927 : ℝ) / 208732160) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((61448769 : ℝ) / 41746432) + ((107834301 : ℝ) / 13045760) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + ((0 : ℝ) + ((50593167 : ℝ) / 7454720) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((571743 : ℝ) / 4014080) + ((16864389 : ℝ) / 3727360) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((237037419 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((376984184769 : ℝ) / 26717716480) + ((230975847 : ℝ) / 14680064) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2549420200953 : ℝ) / 213741731840) + ((66362643 : ℝ) / 4587520) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((511359930387 : ℝ) / 53435432960) + ((3365832609 : ℝ) / 256901120) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((18935108271 : ℝ) / 2671771648) + ((30640221 : ℝ) / 2621440) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((76267656819 : ℝ) / 16698572800) + ((164864727 : ℝ) / 16056320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((518441103 : ℝ) / 238551040) + ((8864451 : ℝ) / 1003520) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((27488277 : ℝ) / 83492864) + ((4136967 : ℝ) / 573440) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9261423 : ℝ) / 52183040) + ((1378989 : ℝ) / 286720) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((239475771 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((1939083129933 : ℝ) / 106870865920) + ((304147845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((334705078989 : ℝ) / 21374173184) + ((35062947 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2171527341 : ℝ) / 166985728) + ((127512549 : ℝ) / 8388608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((136772153523 : ℝ) / 13358858240) + ((57135969 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((124666473051 : ℝ) / 16698572800) + ((6304797 : ℝ) / 524288) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1629456795 : ℝ) / 333971456) + ((1362069 : ℝ) / 131072) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1240315989 : ℝ) / 417464320) + ((1115559 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((63789849 : ℝ) / 20873216) + ((371853 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((439760037 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((653473905003 : ℝ) / 26717716480) + ((361870875 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((18700879246551 : ℝ) / 854966927360) + ((42180525 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4098362275269 : ℝ) / 213741731840) + ((1088293725 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((878719970421 : ℝ) / 53435432960) + ((70754175 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((184840591941 : ℝ) / 13358858240) + ((55559925 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((77700248037 : ℝ) / 6679429120) + ((12181725 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((17535711933 : ℝ) / 1669857280) + ((1438425 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((632106009 : ℝ) / 52183040) + ((479475 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1069935219 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((7381959999039 : ℝ) / 213741731840) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3455248943277 : ℝ) / 106870865920) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1614038293251 : ℝ) / 53435432960) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((756352696473 : ℝ) / 26717716480) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((179793305649 : ℝ) / 6679429120) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((88587328581 : ℝ) / 3339714560) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((23525947269 : ℝ) / 834928640) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((893036457 : ℝ) / 26091520) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2608557759 : ℝ) / 52183040) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1101ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1101ShiftedBernsteinRow0 s t +
    karlssonLeaf1101ShiftedBernsteinRow1 s t +
    karlssonLeaf1101ShiftedBernsteinRow2 s t +
    karlssonLeaf1101ShiftedBernsteinRow3 s t +
    karlssonLeaf1101ShiftedBernsteinRow4 s t +
    karlssonLeaf1101ShiftedBernsteinRow5 s t +
    karlssonLeaf1101ShiftedBernsteinRow6 s t +
    karlssonLeaf1101ShiftedBernsteinRow7 s t +
    karlssonLeaf1101ShiftedBernsteinRow8 s t +
    karlssonLeaf1101ShiftedBernsteinRow9 s t +
    karlssonLeaf1101ShiftedBernsteinRow10 s t +
    karlssonLeaf1101ShiftedBernsteinRow11 s t +
    karlssonLeaf1101ShiftedBernsteinRow12 s t +
    karlssonLeaf1101ShiftedBernsteinRow13 s t +
    karlssonLeaf1101ShiftedBernsteinRow14 s t +
    karlssonLeaf1101ShiftedBernsteinRow15 s t +
    karlssonLeaf1101ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf1110BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((17859375 : ℝ) / 262144) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4156875 : ℝ) / 65536) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6952275 : ℝ) / 114688) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((429171975 : ℝ) / 7340032) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8283555009 : ℝ) / 146800640) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((56940453 : ℝ) / 1048576) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((764625051 : ℝ) / 14680064) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((835507161 : ℝ) / 16777216) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((2615625 : ℝ) / 32768) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((310750875 : ℝ) / 4194304) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1037462085 : ℝ) / 14680064) + ((133130925 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8005729905 : ℝ) / 117440512) + ((131642775 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9679974021 : ℝ) / 146800640) + ((64705275 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((29950678701 : ℝ) / 469762048) + ((63217125 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((14468455359 : ℝ) / 234881024) + ((1964166075 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((15971642919 : ℝ) / 268435456) + ((271028475 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1935175491 : ℝ) / 33554432) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((12354375 : ℝ) / 131072) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((91523805 : ℝ) / 1048576) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1526056617 : ℝ) / 18350080) + ((151547031 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1684128333 : ℝ) / 20971520) + ((150351093 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((28617674187 : ℝ) / 367001600) + ((74278593 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((44571161319 : ℝ) / 587202560) + ((73082655 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4348453443 : ℝ) / 58720256) + ((2291405409 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((24320971149 : ℝ) / 335544320) + ((319655457 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((11998257783 : ℝ) / 167772160) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((51458625 : ℝ) / 458752) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((380672631 : ℝ) / 3670016) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6345623259 : ℝ) / 64225280) + ((3025797093 : ℝ) / 64225280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((49126768137 : ℝ) / 513802240) + ((3013641279 : ℝ) / 64225280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((119880799029 : ℝ) / 1284505600) + ((1497703779 : ℝ) / 32112640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((188307037773 : ℝ) / 2055208960) + ((297109593 : ℝ) / 6422528) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((18592331409 : ℝ) / 205520896) + ((47057380227 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((15092093889 : ℝ) / 167772160) + ((6644338371 : ℝ) / 146800640) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((53203978881 : ℝ) / 587202560) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((200589525 : ℝ) / 1490944) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1854063747 : ℝ) / 14909440) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1767312441 : ℝ) / 14909440) + ((5616982503 : ℝ) / 104366080) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((48043283643 : ℝ) / 417464320) + ((5618677509 : ℝ) / 104366080) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((94402009827 : ℝ) / 834928640) + ((2810610009 : ℝ) / 52183040) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((187228582497 : ℝ) / 1669857280) + ((43266231 : ℝ) / 802816) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((37483024419 : ℝ) / 333971456) + ((90060713217 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((15486860943 : ℝ) / 136314880) + ((990516357 : ℝ) / 18350080) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((223394682681 : ℝ) / 1908408320) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((121246605 : ℝ) / 745472) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((224286759 : ℝ) / 1490944) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1499150403 : ℝ) / 10436608) + ((160432983 : ℝ) / 2609152) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((208819809 : ℝ) / 1490944) + ((161221149 : ℝ) / 2609152) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((57884494131 : ℝ) / 417464320) + ((81201699 : ℝ) / 1304576) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((11610474417 : ℝ) / 83492864) + ((81989865 : ℝ) / 1304576) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((23597054433 : ℝ) / 166985728) + ((2654808237 : ℝ) / 41746432) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1987740135 : ℝ) / 13631488) + ((384325101 : ℝ) / 5963776) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((29365207965 : ℝ) / 190840832) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((406310733 : ℝ) / 2050048) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((215139123 : ℝ) / 1171456) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((5047298937 : ℝ) / 28700672) + ((4026917025 : ℝ) / 57401344) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((39579830217 : ℝ) / 229605376) + ((4065805395 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((28229233113 : ℝ) / 164003840) + ((2062068975 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((160482482505 : ℝ) / 918421504) + ((2100957345 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((82848565845 : ℝ) / 459210752) + ((68766725655 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((14238458379 : ℝ) / 74973184) + ((10073814615 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15391625283 : ℝ) / 74973184) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((17826777 : ℝ) / 73216) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((132551847 : ℝ) / 585728) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1115028927 : ℝ) / 5125120) + ((46730439 : ℝ) / 585728) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2513876121 : ℝ) / 11714560) + ((237011193 : ℝ) / 2928640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4030733439 : ℝ) / 18636800) + ((24204969 : ℝ) / 292864) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((72938061243 : ℝ) / 328007680) + ((124383843 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((347912847 : ℝ) / 1490944) + ((4112963397 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((46966429143 : ℝ) / 187432960) + ((4264118307 : ℝ) / 46858240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((25988830281 : ℝ) / 93716480) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((27601633 : ℝ) / 91520) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((25764283 : ℝ) / 91520) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((697069757 : ℝ) / 2562560) + ((115592427 : ℝ) / 1281280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((692466889 : ℝ) / 2562560) + ((117778833 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((14096119211 : ℝ) / 51251200) + ((60529221 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2936230013 : ℝ) / 10250240) + ((4824279 : ℝ) / 49280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((12524729333 : ℝ) / 41000960) + ((2093263101 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((391742323 : ℝ) / 1171456) + ((24084081 : ℝ) / 225280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((8864753809 : ℝ) / 23429120) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((17238879 : ℝ) / 45760) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((23534721 : ℝ) / 66560) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((880951671 : ℝ) / 2562560) + ((9252063 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((641495079 : ℝ) / 1863680) + ((9466029 : ℝ) / 91520) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4534844931 : ℝ) / 12812800) + ((4893489 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2783327067 : ℝ) / 7454720) + ((1021491 : ℝ) / 9152) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1507192623 : ℝ) / 3727360) + ((171890217 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((21120268167 : ℝ) / 46858240) + ((181518687 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1219143753 : ℝ) / 2342912) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((15203583 : ℝ) / 32032) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((114922107 : ℝ) / 256256) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((98473437 : ℝ) / 224224) + ((9108207 : ℝ) / 81536) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3182139981 : ℝ) / 7175168) + ((9352989 : ℝ) / 81536) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8265219111 : ℝ) / 17937920) + ((4860081 : ℝ) / 40768) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1284066171 : ℝ) / 2609152) + ((5104863 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3880208061 : ℝ) / 7175168) + ((173024505 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1435718673 : ℝ) / 2342912) + ((26291385 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5905404459 : ℝ) / 8200192) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((878391 : ℝ) / 1456) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6691221 : ℝ) / 11648) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((11560347 : ℝ) / 20384) + ((4924971 : ℝ) / 40768) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((188484867 : ℝ) / 326144) + ((5072913 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((494669403 : ℝ) / 815360) + ((2647413 : ℝ) / 20384) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((855428391 : ℝ) / 1304576) + ((2795355 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3721005 : ℝ) / 5096) + ((95295069 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((89411391 : ℝ) / 106496) + ((14564637 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((373430763 : ℝ) / 372736) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((281655 : ℝ) / 364) + ((621 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((386469 : ℝ) / 520) + ((621 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((37724067 : ℝ) / 50960) + ((49491 : ℝ) / 392) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((77613381 : ℝ) / 101920) + ((255501 : ℝ) / 1960) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((32926545 : ℝ) / 40768) + ((26757 : ℝ) / 196) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((359861841 : ℝ) / 407680) + ((141831 : ℝ) / 980) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((115877781 : ℝ) / 116480) + ((4856409 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((38553849 : ℝ) / 33280) + ((745497 : ℝ) / 4480) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((652405491 : ℝ) / 465920) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((10017 : ℝ) / 10) + ((612 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((271953 : ℝ) / 280) + ((612 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((273447 : ℝ) / 280) + ((6102 : ℝ) / 49) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((7952823 : ℝ) / 7840) + ((31554 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((42598377 : ℝ) / 39200) + ((6624 : ℝ) / 49) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((37634859 : ℝ) / 31360) + ((35208 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((42872733 : ℝ) / 31360) + ((302283 : ℝ) / 1960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4120083 : ℝ) / 2560) + ((46539 : ℝ) / 280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7046451 : ℝ) / 3584) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((6546 : ℝ) / 5) + (108 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((6411 : ℝ) / 5) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((91137 : ℝ) / 70) + ((1539 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((191181 : ℝ) / 140) + ((1593 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((295437 : ℝ) / 200) + ((837 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((26355 : ℝ) / 16) + ((891 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((424365 : ℝ) / 224) + ((30645 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((144075 : ℝ) / 64) + ((4725 : ℝ) / 32) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((355125 : ℝ) / 128) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    (((1728 : ℝ) + (72 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((1710 : ℝ) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((12276 : ℝ) / 7) + ((513 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((26001 : ℝ) / 14) + ((531 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((70974 : ℝ) / 35) + ((558 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((127773 : ℝ) / 56) + ((594 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((74115 : ℝ) / 28) + ((10215 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((101475 : ℝ) / 32) + ((1575 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((7875 : ℝ) / 2) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    (((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((2304 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((16704 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((17856 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((98352 : ℝ) / 35) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((22320 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((26100 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((4500 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((5625 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1110BernsteinRow0 s t +
    karlssonLeaf1110BernsteinRow1 s t +
    karlssonLeaf1110BernsteinRow2 s t +
    karlssonLeaf1110BernsteinRow3 s t +
    karlssonLeaf1110BernsteinRow4 s t +
    karlssonLeaf1110BernsteinRow5 s t +
    karlssonLeaf1110BernsteinRow6 s t +
    karlssonLeaf1110BernsteinRow7 s t +
    karlssonLeaf1110BernsteinRow8 s t +
    karlssonLeaf1110BernsteinRow9 s t +
    karlssonLeaf1110BernsteinRow10 s t +
    karlssonLeaf1110BernsteinRow11 s t +
    karlssonLeaf1110BernsteinRow12 s t +
    karlssonLeaf1110BernsteinRow13 s t +
    karlssonLeaf1110BernsteinRow14 s t +
    karlssonLeaf1110BernsteinRow15 s t +
    karlssonLeaf1110BernsteinRow16 s t
noncomputable def karlssonLeaf1110ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((1377997137 : ℝ) / 67108864) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1062637137 : ℝ) / 67108864) + ((2109375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6118498359 : ℝ) / 469762048) + ((117318375 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((5108986359 : ℝ) / 469762048) + ((115705125 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((20746779939 : ℝ) / 2348810240) + ((56642625 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((450186129 : ℝ) / 67108864) + ((55029375 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2109981591 : ℝ) / 469762048) + ((1697216625 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((148025781 : ℝ) / 67108864) + ((232088625 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((0 : ℝ) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((2162797137 : ℝ) / 67108864) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1778011137 : ℝ) / 67108864) + ((2390625 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((10840766679 : ℝ) / 469762048) + ((133130925 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((9664899579 : ℝ) / 469762048) + ((131642775 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((43089484131 : ℝ) / 2348810240) + ((64705275 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1898164665 : ℝ) / 117440512) + ((63217125 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((6578890677 : ℝ) / 469762048) + ((1964166075 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3195631467 : ℝ) / 268435456) + ((271028475 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((676348119 : ℝ) / 67108864) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((3131437137 : ℝ) / 67108864) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2663520657 : ℝ) / 67108864) + ((2716875 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((83545146771 : ℝ) / 2348810240) + ((151547031 : ℝ) / 3670016) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((10976039013 : ℝ) / 335544320) + ((150351093 : ℝ) / 3670016) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((356815072959 : ℝ) / 11744051200) + ((74278593 : ℝ) / 1835008) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((66494545071 : ℝ) / 2348810240) + ((73082655 : ℝ) / 1835008) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((12429607503 : ℝ) / 469762048) + ((2291405409 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4175478417 : ℝ) / 167772160) + ((319655457 : ℝ) / 8388608) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((8026501251 : ℝ) / 335544320) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((30335611959 : ℝ) / 469762048) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((26368076727 : ℝ) / 469762048) + ((1546875 : ℝ) / 32768) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((841948852869 : ℝ) / 16441671680) + ((3025797093 : ℝ) / 64225280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((789525878949 : ℝ) / 16441671680) + ((3013641279 : ℝ) / 64225280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3759717630681 : ℝ) / 82208358400) + ((1497703779 : ℝ) / 32112640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((723925600749 : ℝ) / 16441671680) + ((297109593 : ℝ) / 6422528) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((140971162257 : ℝ) / 3288334336) + ((47057380227 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((14214173463 : ℝ) / 335544320) + ((6644338371 : ℝ) / 146800640) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((101025815319 : ℝ) / 2348810240) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((530960433867 : ℝ) / 6106906624) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2343851251191 : ℝ) / 30534533120) + ((2865375 : ℝ) / 53248) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2166184576503 : ℝ) / 30534533120) + ((5616982503 : ℝ) / 104366080) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((14425262106561 : ℝ) / 213741731840) + ((5618677509 : ℝ) / 104366080) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((13994015397057 : ℝ) / 213741731840) + ((2810610009 : ℝ) / 52183040) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((13792359440961 : ℝ) / 213741731840) + ((43266231 : ℝ) / 802816) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2763247301901 : ℝ) / 42748346368) + ((90060713217 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((287969364081 : ℝ) / 4362076160) + ((990516357 : ℝ) / 18350080) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2121043620231 : ℝ) / 30534533120) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((702597927627 : ℝ) / 6106906624) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((628024304331 : ℝ) / 6106906624) + ((816525 : ℝ) / 13312) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((4105940226957 : ℝ) / 42748346368) + ((160432983 : ℝ) / 2609152) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((564671677131 : ℝ) / 6106906624) + ((161221149 : ℝ) / 2609152) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((19463961876417 : ℝ) / 213741731840) + ((81201699 : ℝ) / 1304576) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((3909983077773 : ℝ) / 42748346368) + ((81989865 : ℝ) / 1304576) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((4006266111117 : ℝ) / 42748346368) + ((2654808237 : ℝ) / 41746432) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((85693331421 : ℝ) / 872415232) + ((384325101 : ℝ) / 5963776) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((649032394347 : ℝ) / 6106906624) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((10116793233081 : ℝ) / 67175972864) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1305677286207 : ℝ) / 9596567552) + ((10223145 : ℝ) / 146432) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((60314567722767 : ℝ) / 470231810048) + ((4026917025 : ℝ) / 57401344) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((58679114223375 : ℝ) / 470231810048) + ((4065805395 : ℝ) / 57401344) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((41827485086109 : ℝ) / 335879864320) + ((2062068975 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((59786652981519 : ℝ) / 470231810048) + ((2100957345 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((62456553364239 : ℝ) / 470231810048) + ((68766725655 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((1365780263103 : ℝ) / 9596567552) + ((10073814615 : ℝ) / 131203072) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1513385626815 : ℝ) / 9596567552) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((1879848905535 : ℝ) / 9596567552) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1714987051839 : ℝ) / 9596567552) + ((28996587 : ℝ) / 366080) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((57088551430557 : ℝ) / 335879864320) + ((46730439 : ℝ) / 585728) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8013124544571 : ℝ) / 47982837760) + ((237011193 : ℝ) / 2928640) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((25753411818963 : ℝ) / 152672665600) + ((24204969 : ℝ) / 292864) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((58702590383517 : ℝ) / 335879864320) + ((124383843 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1134396760779 : ℝ) / 6106906624) + ((4112963397 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((9739693813563 : ℝ) / 47982837760) + ((4264118307 : ℝ) / 46858240) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((11022569056827 : ℝ) / 47982837760) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((12187492915259 : ℝ) / 47982837760) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((11224192358459 : ℝ) / 47982837760) + ((2044629 : ℝ) / 22880) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((75380342860189 : ℝ) / 335879864320) + ((115592427 : ℝ) / 1281280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((74777035745693 : ℝ) / 335879864320) + ((117778833 : ℝ) / 1281280) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((381971712659473 : ℝ) / 1679399321600) + ((60529221 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((80228400736669 : ℝ) / 335879864320) + ((4824279 : ℝ) / 49280) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((86616598366621 : ℝ) / 335879864320) + ((2093263101 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2752410700607 : ℝ) / 9596567552) + ((24084081 : ℝ) / 225280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15871303753787 : ℝ) / 47982837760) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((15792562739259 : ℝ) / 47982837760) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1334761289361 : ℝ) / 4362076160) + ((228627 : ℝ) / 2288) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((99482113091997 : ℝ) / 335879864320) + ((9252063 : ℝ) / 91520) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((9056984071671 : ℝ) / 30534533120) + ((9466029 : ℝ) / 91520) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((514461273149457 : ℝ) / 1679399321600) + ((4893489 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((9947236363767 : ℝ) / 30534533120) + ((1021491 : ℝ) / 9152) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((10893650664951 : ℝ) / 30534533120) + ((171890217 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((19343442555963 : ℝ) / 47982837760) + ((181518687 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4536870402879 : ℝ) / 9596567552) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((28687027629753 : ℝ) / 67175972864) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((26928943951545 : ℝ) / 67175972864) + ((22923 : ℝ) / 208) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((184133387290383 : ℝ) / 470231810048) + ((9108207 : ℝ) / 81536) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((186164347733775 : ℝ) / 470231810048) + ((9352989 : ℝ) / 81536) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((971436909011787 : ℝ) / 2351159050240) + ((4860081 : ℝ) / 40768) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((19003560321933 : ℝ) / 42748346368) + ((5104863 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((231912937424655 : ℝ) / 470231810048) + ((173024505 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((5423961275199 : ℝ) / 9596567552) + ((26291385 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((45179876462265 : ℝ) / 67175972864) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((3393584624331 : ℝ) / 6106906624) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3217472615115 : ℝ) / 6106906624) + ((12375 : ℝ) / 104) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((22209225008013 : ℝ) / 42748346368) + ((4924971 : ℝ) / 40768) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((22670508663693 : ℝ) / 42748346368) + ((5072913 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((119501716861377 : ℝ) / 213741731840) + ((2647413 : ℝ) / 20384) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((25996097692557 : ℝ) / 42748346368) + ((2795355 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((29179472487309 : ℝ) / 42748346368) + ((95295069 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((690936077853 : ℝ) / 872415232) + ((14564637 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5827635360459 : ℝ) / 6106906624) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((4434732511947 : ℝ) / 6106906624) + ((621 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((3034326759057 : ℝ) / 4362076160) + ((621 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((148053305995713 : ℝ) / 213741731840) + ((49491 : ℝ) / 392) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((152594158072257 : ℝ) / 213741731840) + ((255501 : ℝ) / 1960) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((32491405026189 : ℝ) / 42748346368) + ((26757 : ℝ) / 196) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((178498345775553 : ℝ) / 213741731840) + ((141831 : ℝ) / 980) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((28923393719799 : ℝ) / 30534533120) + ((4856409 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4845719910033 : ℝ) / 4362076160) + ((745497 : ℝ) / 4480) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((41302774955511 : ℝ) / 30534533120) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((320144731029 : ℝ) / 335544320) + ((612 : ℝ) / 5) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2169517011219 : ℝ) / 2348810240) + ((612 : ℝ) / 5) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2182049591571 : ℝ) / 2348810240) + ((6102 : ℝ) / 49) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((15895747958661 : ℝ) / 16441671680) + ((31554 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((85422618015129 : ℝ) / 82208358400) + ((6624 : ℝ) / 49) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((18948974253957 : ℝ) / 16441671680) + ((35208 : ℝ) / 245) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((21695128737669 : ℝ) / 16441671680) + ((302283 : ℝ) / 1960) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((524057504661 : ℝ) / 335544320) + ((46539 : ℝ) / 280) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((901234405431 : ℝ) / 469762048) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((423324609429 : ℝ) / 335544320) + (108 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((414264912789 : ℝ) / 335544320) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2946260168979 : ℝ) / 2348810240) + ((1539 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((3095694831891 : ℝ) / 2348810240) + ((1593 : ℝ) / 14) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2398455110121 : ℝ) / 1677721600) + ((837 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((107346879057 : ℝ) / 67108864) + ((891 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((867599888439 : ℝ) / 469762048) + ((30645 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((147879584337 : ℝ) / 67108864) + ((4725 : ℝ) / 32) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((182993773137 : ℝ) / 67108864) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((112770114129 : ℝ) / 67108864) + (72 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((111562154577 : ℝ) / 67108864) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((801470394423 : ℝ) / 469762048) + ((513 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((850090766391 : ℝ) / 469762048) + ((531 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((4651194413331 : ℝ) / 2348810240) + ((558 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1049479589943 : ℝ) / 469762048) + ((594 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1221085343799 : ℝ) / 469762048) + ((10215 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((209614496337 : ℝ) / 67108864) + ((1575 : ℝ) / 16) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((261047149137 : ℝ) / 67108864) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((151424819793 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((151424819793 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1098628444215 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1175937855543 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6488500891923 : ℝ) / 2348810240) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1475511824439 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1729183330359 : ℝ) / 469762048) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((298795885137 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((374293357137 : ℝ) / 67108864) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1110ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1110ShiftedBernsteinRow0 s t +
    karlssonLeaf1110ShiftedBernsteinRow1 s t +
    karlssonLeaf1110ShiftedBernsteinRow2 s t +
    karlssonLeaf1110ShiftedBernsteinRow3 s t +
    karlssonLeaf1110ShiftedBernsteinRow4 s t +
    karlssonLeaf1110ShiftedBernsteinRow5 s t +
    karlssonLeaf1110ShiftedBernsteinRow6 s t +
    karlssonLeaf1110ShiftedBernsteinRow7 s t +
    karlssonLeaf1110ShiftedBernsteinRow8 s t +
    karlssonLeaf1110ShiftedBernsteinRow9 s t +
    karlssonLeaf1110ShiftedBernsteinRow10 s t +
    karlssonLeaf1110ShiftedBernsteinRow11 s t +
    karlssonLeaf1110ShiftedBernsteinRow12 s t +
    karlssonLeaf1110ShiftedBernsteinRow13 s t +
    karlssonLeaf1110ShiftedBernsteinRow14 s t +
    karlssonLeaf1110ShiftedBernsteinRow15 s t +
    karlssonLeaf1110ShiftedBernsteinRow16 s t
noncomputable def karlssonLeaf1111BernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((3194002863 : ℝ) / 67108864) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1522988541 : ℝ) / 33554432) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((5080819941 : ℝ) / 117440512) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2429055135 : ℝ) / 58720256) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2934177507 : ℝ) / 73400320) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((290540115 : ℝ) / 7340032) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((75666051 : ℝ) / 1835008) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((774711 : ℝ) / 16384) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((258237 : ℝ) / 4096) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((1935175491 : ℝ) / 33554432) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((14991164937 : ℝ) / 268435456) + ((62322975 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((25505237781 : ℝ) / 469762048) + ((1659854025 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((6251484825 : ℝ) / 117440512) + ((111759075 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((7788640941 : ℝ) / 146800640) + ((90908325 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((114243615 : ℝ) / 2097152) + ((20542275 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((30886119 : ℝ) / 524288) + ((2469825 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((8883 : ℝ) / 128) + ((823275 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((2961 : ℝ) / 32) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((11998257783 : ℝ) / 167772160) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((23672059983 : ℝ) / 335544320) + ((75347847 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((41213345349 : ℝ) / 587202560) + ((2035708443 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((92738547 : ℝ) / 1310720) + ((139145769 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((3341864529 : ℝ) / 45875200) + ((114830379 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((355565673 : ℝ) / 4587520) + ((26255583 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((198942591 : ℝ) / 2293760) + ((3178359 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((17132571 : ℝ) / 163840) + ((1059453 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5710857 : ℝ) / 40960) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((53203978881 : ℝ) / 587202560) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((107171258301 : ℝ) / 1174405120) + ((1608043041 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((191266417863 : ℝ) / 2055208960) + ((44087053329 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((24800806719 : ℝ) / 256901120) + ((436985901 : ℝ) / 10485760) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((16471447443 : ℝ) / 160563200) + ((2559760137 : ℝ) / 64225280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((7242592239 : ℝ) / 64225280) + ((591807249 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2086621569 : ℝ) / 16056320) + ((72094077 : ℝ) / 2293760) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((13080501 : ℝ) / 81920) + ((24031359 : ℝ) / 1146880) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4360167 : ℝ) / 20480) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((223394682681 : ℝ) / 1908408320) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1437333201 : ℝ) / 11927552) + ((6399229797 : ℝ) / 119275520) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((420880650543 : ℝ) / 3339714560) + ((88965170559 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((224456370219 : ℝ) / 1669857280) + ((894198771 : ℝ) / 17039360) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((61403589459 : ℝ) / 417464320) + ((1326133863 : ℝ) / 26091520) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((34732615077 : ℝ) / 208732160) + ((2476975383 : ℝ) / 52183040) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((10255123539 : ℝ) / 52183040) + ((75851721 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((456853149 : ℝ) / 1863680) + ((25283907 : ℝ) / 931840) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((152284383 : ℝ) / 465920) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((29365207965 : ℝ) / 190840832) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((297135135 : ℝ) / 1835008) + ((783426843 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((57952031391 : ℝ) / 333971456) + ((689561181 : ℝ) / 10436608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((323673813 : ℝ) / 1703936) + ((3508857 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((44542864953 : ℝ) / 208732160) + ((673445313 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((10329262479 : ℝ) / 41746432) + ((317111877 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((239367987 : ℝ) / 802816) + ((19511523 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4384125 : ℝ) / 11648) + ((6503841 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((1461375 : ℝ) / 2912) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((15391625283 : ℝ) / 74973184) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1504072017 : ℝ) / 6815744) + ((5253900705 : ℝ) / 65601536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((111101154993 : ℝ) / 459210752) + ((74842540785 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((31128275457 : ℝ) / 114802688) + ((69994935 : ℝ) / 851968) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((178898673033 : ℝ) / 574013440) + ((2330580195 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((42352108497 : ℝ) / 114802688) + ((2210207715 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((12968705025 : ℝ) / 28700672) + ((34127325 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((147552057 : ℝ) / 256256) + ((11375775 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((49184019 : ℝ) / 64064) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((25988830281 : ℝ) / 93716480) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((56988891981 : ℝ) / 187432960) + ((2270395269 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((111619446273 : ℝ) / 328007680) + ((4666307859 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((63849566331 : ℝ) / 164003840) + ((215805141 : ℝ) / 2129920) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1461628071 : ℝ) / 3203200) + ((147785553 : ℝ) / 1464320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((22526640351 : ℝ) / 41000960) + ((140956281 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((635341761 : ℝ) / 931840) + ((3056481 : ℝ) / 36608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((160207119 : ℝ) / 183040) + ((1018827 : ℝ) / 18304) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((53402373 : ℝ) / 45760) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((8864753809 : ℝ) / 23429120) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((4947330579 : ℝ) / 11714560) + ((169735851 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2466760097 : ℝ) / 5125120) + ((2462564187 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((5744558403 : ℝ) / 10250240) + ((3278799 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((8553982449 : ℝ) / 12812800) + ((79088481 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1044335529 : ℝ) / 1281280) + ((75783681 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((32738315 : ℝ) / 32032) + ((1176687 : ℝ) / 11440) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((30192267 : ℝ) / 22880) + ((392229 : ℝ) / 5720) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((10064089 : ℝ) / 5720) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((1219143753 : ℝ) / 2342912) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((27645481953 : ℝ) / 46858240) + ((99923229 : ℝ) / 732160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((55996485957 : ℝ) / 82001920) + ((208545759 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8270930979 : ℝ) / 10250240) + ((9779049 : ℝ) / 66560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((24960442167 : ℝ) / 25625600) + ((6774111 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6162678693 : ℝ) / 5125120) + ((6515073 : ℝ) / 45760) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1947731553 : ℝ) / 1281280) + ((354753 : ℝ) / 2860) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((45106767 : ℝ) / 22880) + ((118251 : ℝ) / 1430) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((15035589 : ℝ) / 5720) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((5905404459 : ℝ) / 8200192) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((13571587125 : ℝ) / 16400384) + ((14656545 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((27846279693 : ℝ) / 28700672) + ((215328375 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1040654547 : ℝ) / 896896) + ((2277963 : ℝ) / 13312) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((12696072273 : ℝ) / 8968960) + ((1764423 : ℝ) / 10192) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((451726875 : ℝ) / 256256) + ((6807483 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((143675163 : ℝ) / 64064) + ((212139 : ℝ) / 1456) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((11685411 : ℝ) / 4004) + ((70713 : ℝ) / 728) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3895137 : ℝ) / 1001) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((373430763 : ℝ) / 372736) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((867843315 : ℝ) / 745472) + ((8200629 : ℝ) / 46592) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1799449803 : ℝ) / 1304576) + ((121007763 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((67894443 : ℝ) / 40768) + ((1285047 : ℝ) / 6656) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((835236279 : ℝ) / 407680) + ((998433 : ℝ) / 5096) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((209431251 : ℝ) / 81536) + ((3860631 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((66933675 : ℝ) / 20384) + ((120447 : ℝ) / 728) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((389853 : ℝ) / 91) + ((40149 : ℝ) / 364) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((519804 : ℝ) / 91) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((652405491 : ℝ) / 465920) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((95632137 : ℝ) / 58240) + ((211437 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((114264693 : ℝ) / 58240) + ((6259923 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((486497097 : ℝ) / 203840) + ((66663 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((21512007 : ℝ) / 7280) + ((415287 : ℝ) / 1960) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((23720121 : ℝ) / 6370) + ((100521 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((30433959 : ℝ) / 6370) + ((2511 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2841669 : ℝ) / 455) + ((837 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3788892 : ℝ) / 455) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((7046451 : ℝ) / 3584) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((41623929 : ℝ) / 17920) + ((212229 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((87614451 : ℝ) / 31360) + ((787077 : ℝ) / 3920) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((26800227 : ℝ) / 7840) + ((8397 : ℝ) / 40) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5210001 : ℝ) / 1225) + ((209547 : ℝ) / 980) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((10545309 : ℝ) / 1960) + ((101547 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((678339 : ℝ) / 98) + ((1269 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((45306 : ℝ) / 5) + ((846 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((60408 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((355125 : ℝ) / 128) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((105525 : ℝ) / 32) + ((675 : ℝ) / 4) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((446595 : ℝ) / 112) + ((40095 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((274455 : ℝ) / 56) + ((2997 : ℝ) / 16) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((2142171 : ℝ) / 350) + ((2673 : ℝ) / 14) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((38826 : ℝ) / 5) + ((1296 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((50052 : ℝ) / 5) + (162 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((65592 : ℝ) / 5) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((87456 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((7875 : ℝ) / 2) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((150525 : ℝ) / 32) + ((225 : ℝ) / 2) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((319905 : ℝ) / 56) + ((13365 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + ((7047 : ℝ) + ((999 : ℝ) / 8) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((308934 : ℝ) / 35) + ((891 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((78570 : ℝ) / 7) + ((864 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((101448 : ℝ) / 7) + (108 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((19008 : ℝ) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((25344 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111BernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    (((5625 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + ((6750 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((57600 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((71280 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((63936 : ℝ) / 5) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((114048 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((147456 : ℝ) / 7) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + ((27648 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + ((36864 : ℝ) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111Bernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1111BernsteinRow0 s t +
    karlssonLeaf1111BernsteinRow1 s t +
    karlssonLeaf1111BernsteinRow2 s t +
    karlssonLeaf1111BernsteinRow3 s t +
    karlssonLeaf1111BernsteinRow4 s t +
    karlssonLeaf1111BernsteinRow5 s t +
    karlssonLeaf1111BernsteinRow6 s t +
    karlssonLeaf1111BernsteinRow7 s t +
    karlssonLeaf1111BernsteinRow8 s t +
    karlssonLeaf1111BernsteinRow9 s t +
    karlssonLeaf1111BernsteinRow10 s t +
    karlssonLeaf1111BernsteinRow11 s t +
    karlssonLeaf1111BernsteinRow12 s t +
    karlssonLeaf1111BernsteinRow13 s t +
    karlssonLeaf1111BernsteinRow14 s t +
    karlssonLeaf1111BernsteinRow15 s t +
    karlssonLeaf1111BernsteinRow16 s t
noncomputable def karlssonLeaf1111ShiftedBernsteinRow0 (s t : ℝ) : ℝ :=
  1 * s ^ 0 * (1 - s) ^ 16 *
    ((((3763452681 : ℝ) / 469762048) + ((441095625 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1363636107 : ℝ) / 234881024) + ((26125875 : ℝ) / 1048576) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((432178101 : ℝ) / 117440512) + ((1374073875 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((104734215 : ℝ) / 58720256) + ((91256625 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((28776357 : ℝ) / 73400320) + ((73234125 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + ((0 : ℝ) + ((1022625 : ℝ) / 57344) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((12124089 : ℝ) / 7340032) + ((1954125 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((56530413 : ℝ) / 7340032) + ((651375 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((172220589 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow1 (s t : ℝ) : ℝ :=
  16 * s ^ 1 * (1 - s) ^ 15 *
    ((((4248944757 : ℝ) / 234881024) + ((520320375 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((30559885119 : ℝ) / 1879048192) + ((62322975 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6910670421 : ℝ) / 469762048) + ((1659854025 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1602842985 : ℝ) / 117440512) + ((111759075 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1977838641 : ℝ) / 146800640) + ((90908325 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((218625075 : ℝ) / 14680064) + ((20542275 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((141865551 : ℝ) / 7340032) + ((2469825 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((218846637 : ℝ) / 7340032) + ((823275 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((388642221 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow2 (s t : ℝ) : ℝ :=
  120 * s ^ 2 * (1 - s) ^ 14 *
    ((((37501386081 : ℝ) / 1174405120) + ((621046845 : ℝ) / 16777216) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((72731583081 : ℝ) / 2348810240) + ((75347847 : ℝ) / 2097152) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2567162307 : ℝ) / 83886080) + ((2035708443 : ℝ) / 58720256) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1143978741 : ℝ) / 36700160) + ((139145769 : ℝ) / 4194304) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6103955241 : ℝ) / 183500800) + ((114830379 : ℝ) / 3670016) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1391824809 : ℝ) / 36700160) + ((26255583 : ℝ) / 917504) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1730380881 : ℝ) / 36700160) + ((3178359 : ℝ) / 131072) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2384995329 : ℝ) / 36700160) + ((1059453 : ℝ) / 65536) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3664227297 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow3 (s t : ℝ) : ℝ :=
  560 * s ^ 3 * (1 - s) ^ 13 *
    ((((29960769681 : ℝ) / 587202560) + ((2615302107 : ℝ) / 58720256) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((8669262843 : ℝ) / 167772160) + ((1608043041 : ℝ) / 36700160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((109915185663 : ℝ) / 2055208960) + ((44087053329 : ℝ) / 1027604480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((7315951347 : ℝ) / 128450560) + ((436985901 : ℝ) / 10485760) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((80927059419 : ℝ) / 1284505600) + ((2559760137 : ℝ) / 64225280) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((18801464931 : ℝ) / 256901120) + ((591807249 : ℝ) / 16056320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((23217041079 : ℝ) / 256901120) + ((72094077 : ℝ) / 2293760) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4407363873 : ℝ) / 36700160) + ((24031359 : ℝ) / 1146880) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((6360718689 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow4 (s t : ℝ) : ℝ :=
  1820 * s ^ 4 * (1 - s) ^ 12 *
    ((((147854252781 : ℝ) / 1908408320) + ((5135034447 : ℝ) / 95420416) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((7721644113 : ℝ) / 95420416) + ((6399229797 : ℝ) / 119275520) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((144342449109 : ℝ) / 1669857280) + ((88965170559 : ℝ) / 1669857280) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((316716988113 : ℝ) / 3339714560) + ((894198771 : ℝ) / 17039360) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((359032963347 : ℝ) / 3339714560) + ((1326133863 : ℝ) / 26091520) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((423526088907 : ℝ) / 3339714560) + ((2476975383 : ℝ) / 52183040) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((524132154171 : ℝ) / 3339714560) + ((75851721 : ℝ) / 1863680) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((98069298669 : ℝ) / 477102080) + ((25283907 : ℝ) / 931840) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((137054100717 : ℝ) / 477102080) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow5 (s t : ℝ) : ℝ :=
  4368 * s ^ 5 * (1 - s) ^ 11 *
    ((((21811164975 : ℝ) / 190840832) + ((1552077045 : ℝ) / 23855104) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((128285775 : ℝ) / 1048576) + ((783426843 : ℝ) / 11927552) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((89464912317 : ℝ) / 667942912) + ((689561181 : ℝ) / 10436608) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((14348712033 : ℝ) / 95420416) + ((3508857 : ℝ) / 53248) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((580490086923 : ℝ) / 3339714560) + ((673445313 : ℝ) / 10436608) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((138829049199 : ℝ) / 667942912) + ((317111877 : ℝ) / 5218304) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((13285770363 : ℝ) / 51380224) + ((19511523 : ℝ) / 372736) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((32137730505 : ℝ) / 95420416) + ((6503841 : ℝ) / 186368) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((44109314505 : ℝ) / 95420416) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow6 (s t : ℝ) : ℝ :=
  8008 * s ^ 6 * (1 - s) ^ 10 *
    ((((173935517517 : ℝ) / 1049624576) + ((20581616025 : ℝ) / 262406144) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((17279986743 : ℝ) / 95420416) + ((5253900705 : ℝ) / 65601536) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((1486787824773 : ℝ) / 7347372032) + ((74842540785 : ℝ) / 918421504) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1701378974133 : ℝ) / 7347372032) + ((69994935 : ℝ) / 851968) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((9995361798537 : ℝ) / 36736860160) + ((2330580195 : ℝ) / 28700672) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2419704288693 : ℝ) / 7347372032) + ((2210207715 : ℝ) / 28700672) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((3029157831285 : ℝ) / 7347372032) + ((34127325 : ℝ) / 512512) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((562825989027 : ℝ) / 1049624576) + ((11375775 : ℝ) / 256256) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((764283730851 : ℝ) / 1049624576) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow7 (s t : ℝ) : ℝ :=
  11440 * s ^ 7 * (1 - s) ^ 9 *
    ((((1247638313511 : ℝ) / 5248122880) + ((1760981769 : ℝ) / 18743296) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((1387952793243 : ℝ) / 5248122880) + ((2270395269 : ℝ) / 23429120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((225453565449 : ℝ) / 749731840) + ((4666307859 : ℝ) / 46858240) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1835449940367 : ℝ) / 5248122880) + ((215805141 : ℝ) / 2129920) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((10934976246507 : ℝ) / 26240614400) + ((147785553 : ℝ) / 1464320) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((2675673782703 : ℝ) / 5248122880) + ((140956281 : ℝ) / 1464320) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((306409874157 : ℝ) / 477102080) + ((3056481 : ℝ) / 36608) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((4385722333743 : ℝ) / 5248122880) + ((1018827 : ℝ) / 18304) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((5916875172399 : ℝ) / 5248122880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow8 (s t : ℝ) : ℝ :=
  12870 * s ^ 8 * (1 - s) ^ 8 *
    ((((1777968670991 : ℝ) / 5248122880) + ((130512951 : ℝ) / 1171456) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2008667917167 : ℝ) / 5248122880) + ((169735851 : ℝ) / 1464320) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((2318226157103 : ℝ) / 5248122880) + ((2462564187 : ℝ) / 20500480) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((2733477720111 : ℝ) / 5248122880) + ((3278799 : ℝ) / 26624) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((16479875144427 : ℝ) / 26240614400) + ((79088481 : ℝ) / 640640) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((4069862144559 : ℝ) / 5248122880) + ((75783681 : ℝ) / 640640) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((147317409925 : ℝ) / 149946368) + ((1176687 : ℝ) / 11440) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((6717645253167 : ℝ) / 5248122880) + ((392229 : ℝ) / 5720) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((9026105731631 : ℝ) / 5248122880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow9 (s t : ℝ) : ℝ :=
  11440 * s ^ 9 * (1 - s) ^ 7 *
    ((((504629164899 : ℝ) / 1049624576) + ((76273029 : ℝ) / 585728) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((2888557796511 : ℝ) / 5248122880) + ((99923229 : ℝ) / 732160) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((3376038919023 : ℝ) / 5248122880) + ((208545759 : ℝ) / 1464320) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((4026980479023 : ℝ) / 5248122880) + ((9779049 : ℝ) / 66560) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((24520811867883 : ℝ) / 26240614400) + ((6774111 : ℝ) / 45760) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((6102846799407 : ℝ) / 5248122880) + ((6515073 : ℝ) / 45760) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((1110024608409 : ℝ) / 749731840) + ((354753 : ℝ) / 2860) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((10138673605167 : ℝ) / 5248122880) + ((118251 : ℝ) / 1430) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((13587476867631 : ℝ) / 5248122880) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow10 (s t : ℝ) : ℝ :=
  8008 * s ^ 10 * (1 - s) ^ 6 *
    ((((714344534307 : ℝ) / 1049624576) + ((55604475 : ℝ) / 372736) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((827034339555 : ℝ) / 1049624576) + ((14656545 : ℝ) / 93184) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((6837816946293 : ℝ) / 7347372032) + ((215328375 : ℝ) / 1304576) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((8234211393909 : ℝ) / 7347372032) + ((2277963 : ℝ) / 13312) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((50548958754633 : ℝ) / 36736860160) + ((1764423 : ℝ) / 10192) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1808726043555 : ℝ) / 1049624576) + ((6807483 : ℝ) / 40768) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((330346662021 : ℝ) / 149946368) + ((212139 : ℝ) / 1456) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((3021713144739 : ℝ) / 1049624576) + ((70713 : ℝ) / 728) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((4042799938467 : ℝ) / 1049624576) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow11 (s t : ℝ) : ℝ :=
  4368 * s ^ 11 * (1 - s) ^ 5 *
    ((((91821253833 : ℝ) / 95420416) + ((30965895 : ℝ) / 186368) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((107306922825 : ℝ) / 95420416) + ((8200629 : ℝ) / 46592) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((894879148671 : ℝ) / 667942912) + ((121007763 : ℝ) / 652288) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((1085943403647 : ℝ) / 667942912) + ((1285047 : ℝ) / 6656) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((6710059845243 : ℝ) / 3339714560) + ((998433 : ℝ) / 5096) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1689221657727 : ℝ) / 667942912) + ((3860631 : ℝ) / 20384) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((2166843511935 : ℝ) / 667942912) + ((120447 : ℝ) / 728) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((405013477833 : ℝ) / 95420416) + ((40149 : ℝ) / 364) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((541276977609 : ℝ) / 95420416) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow12 (s t : ℝ) : ℝ :=
  1820 * s ^ 12 * (1 - s) ^ 4 *
    ((((649178115309 : ℝ) / 477102080) + ((318249 : ℝ) / 1792) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((764533358829 : ℝ) / 477102080) + ((211437 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((917171257581 : ℝ) / 477102080) + ((6259923 : ℝ) / 31360) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((7838572684923 : ℝ) / 3339714560) + ((66663 : ℝ) / 320) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((1390925783277 : ℝ) / 477102080) + ((415287 : ℝ) / 1960) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((12303979046523 : ℝ) / 3339714560) + ((100521 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((15823963743867 : ℝ) / 3339714560) + ((2511 : ℝ) / 14) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((2960820805869 : ℝ) / 477102080) + ((837 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((3954056110317 : ℝ) / 477102080) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow13 (s t : ℝ) : ℝ :=
  560 * s ^ 13 * (1 - s) ^ 3 *
    ((((14140591533 : ℝ) / 7340032) + ((79677 : ℝ) / 448) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((83793106017 : ℝ) / 36700160) + ((212229 : ℝ) / 1120) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((707568678567 : ℝ) / 256901120) + ((787077 : ℝ) / 3920) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((868020934311 : ℝ) / 256901120) + ((8397 : ℝ) / 40) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((5412237488451 : ℝ) / 1284505600) + ((209547 : ℝ) / 980) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((1372025837223 : ℝ) / 256901120) + ((101547 : ℝ) / 490) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((353611216827 : ℝ) / 51380224) + ((1269 : ℝ) / 7) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((331094789217 : ℝ) / 36700160) + ((846 : ℝ) / 7) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((441943952481 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow14 (s t : ℝ) : ℝ :=
  120 * s ^ 14 * (1 - s) ^ 2 *
    ((((20073747885 : ℝ) / 7340032) + ((10125 : ℝ) / 64) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((23914362285 : ℝ) / 7340032) + ((675 : ℝ) / 4) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((28977509805 : ℝ) / 7340032) + ((40095 : ℝ) / 224) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((35682825645 : ℝ) / 7340032) + ((2997 : ℝ) / 16) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((159407292339 : ℝ) / 26214400) + ((2673 : ℝ) / 14) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((283531381857 : ℝ) / 36700160) + ((1296 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((365930581089 : ℝ) / 36700160) + (162 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((479994678369 : ℝ) / 36700160) + (108 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((640477138017 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow15 (s t : ℝ) : ℝ :=
  16 * s ^ 15 * (1 - s) ^ 1 *
    ((((28610835885 : ℝ) / 7340032) + ((3375 : ℝ) / 32) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((34236282285 : ℝ) / 7340032) + ((225 : ℝ) / 2) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((41640048045 : ℝ) / 7340032) + ((13365 : ℝ) / 112) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((51434665389 : ℝ) / 7340032) + ((999 : ℝ) / 8) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((322488077409 : ℝ) / 36700160) + ((891 : ℝ) / 7) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((82096076205 : ℝ) / 7340032) + ((864 : ℝ) / 7) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((106085397933 : ℝ) / 7340032) + (108 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((139228788141 : ℝ) / 7340032) + (72 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((185735230893 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernsteinRow16 (s t : ℝ) : ℝ :=
  1 * s ^ 16 * (1 - s) ^ 0 *
    ((((40997139885 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 0 * (1 - t) ^ 8 + (((49254675885 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 1 * (1 - t) ^ 7 + (((60107437485 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 2 * (1 - t) ^ 6 + (((74451957165 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 3 * (1 - t) ^ 5 + (((467839585377 : ℝ) / 36700160) + (0 : ℝ) * Real.sqrt 3) * 70 * t ^ 4 * (1 - t) ^ 4 + (((119297455533 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 56 * t ^ 5 * (1 - t) ^ 3 + (((154328282541 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 28 * t ^ 6 * (1 - t) ^ 2 + (((202646664621 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 8 * t ^ 7 * (1 - t) ^ 1 + (((270292399533 : ℝ) / 7340032) + (0 : ℝ) * Real.sqrt 3) * 1 * t ^ 8 * (1 - t) ^ 0)

noncomputable def karlssonLeaf1111ShiftedBernstein (s t : ℝ) : ℝ :=
  karlssonLeaf1111ShiftedBernsteinRow0 s t +
    karlssonLeaf1111ShiftedBernsteinRow1 s t +
    karlssonLeaf1111ShiftedBernsteinRow2 s t +
    karlssonLeaf1111ShiftedBernsteinRow3 s t +
    karlssonLeaf1111ShiftedBernsteinRow4 s t +
    karlssonLeaf1111ShiftedBernsteinRow5 s t +
    karlssonLeaf1111ShiftedBernsteinRow6 s t +
    karlssonLeaf1111ShiftedBernsteinRow7 s t +
    karlssonLeaf1111ShiftedBernsteinRow8 s t +
    karlssonLeaf1111ShiftedBernsteinRow9 s t +
    karlssonLeaf1111ShiftedBernsteinRow10 s t +
    karlssonLeaf1111ShiftedBernsteinRow11 s t +
    karlssonLeaf1111ShiftedBernsteinRow12 s t +
    karlssonLeaf1111ShiftedBernsteinRow13 s t +
    karlssonLeaf1111ShiftedBernsteinRow14 s t +
    karlssonLeaf1111ShiftedBernsteinRow15 s t +
    karlssonLeaf1111ShiftedBernsteinRow16 s t

theorem karlssonLeaf0000_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual ((0 : ℝ) + ((1 : ℝ) / 4) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf0000Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf0000Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf0000BernsteinRow0 karlssonLeaf0000BernsteinRow1 karlssonLeaf0000BernsteinRow2 karlssonLeaf0000BernsteinRow3 karlssonLeaf0000BernsteinRow4 karlssonLeaf0000BernsteinRow5 karlssonLeaf0000BernsteinRow6 karlssonLeaf0000BernsteinRow7 karlssonLeaf0000BernsteinRow8 karlssonLeaf0000BernsteinRow9 karlssonLeaf0000BernsteinRow10 karlssonLeaf0000BernsteinRow11 karlssonLeaf0000BernsteinRow12 karlssonLeaf0000BernsteinRow13 karlssonLeaf0000BernsteinRow14 karlssonLeaf0000BernsteinRow15 karlssonLeaf0000BernsteinRow16
  ring

theorem karlssonLeaf0001_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual ((0 : ℝ) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf0001Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf0001Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf0001BernsteinRow0 karlssonLeaf0001BernsteinRow1 karlssonLeaf0001BernsteinRow2 karlssonLeaf0001BernsteinRow3 karlssonLeaf0001BernsteinRow4 karlssonLeaf0001BernsteinRow5 karlssonLeaf0001BernsteinRow6 karlssonLeaf0001BernsteinRow7 karlssonLeaf0001BernsteinRow8 karlssonLeaf0001BernsteinRow9 karlssonLeaf0001BernsteinRow10 karlssonLeaf0001BernsteinRow11 karlssonLeaf0001BernsteinRow12 karlssonLeaf0001BernsteinRow13 karlssonLeaf0001BernsteinRow14 karlssonLeaf0001BernsteinRow15 karlssonLeaf0001BernsteinRow16
  ring

theorem karlssonLeaf0010_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf0010Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf0010Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf0010BernsteinRow0 karlssonLeaf0010BernsteinRow1 karlssonLeaf0010BernsteinRow2 karlssonLeaf0010BernsteinRow3 karlssonLeaf0010BernsteinRow4 karlssonLeaf0010BernsteinRow5 karlssonLeaf0010BernsteinRow6 karlssonLeaf0010BernsteinRow7 karlssonLeaf0010BernsteinRow8 karlssonLeaf0010BernsteinRow9 karlssonLeaf0010BernsteinRow10 karlssonLeaf0010BernsteinRow11 karlssonLeaf0010BernsteinRow12 karlssonLeaf0010BernsteinRow13 karlssonLeaf0010BernsteinRow14 karlssonLeaf0010BernsteinRow15 karlssonLeaf0010BernsteinRow16
  ring

theorem karlssonLeaf0011_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf0011Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf0011Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf0011BernsteinRow0 karlssonLeaf0011BernsteinRow1 karlssonLeaf0011BernsteinRow2 karlssonLeaf0011BernsteinRow3 karlssonLeaf0011BernsteinRow4 karlssonLeaf0011BernsteinRow5 karlssonLeaf0011BernsteinRow6 karlssonLeaf0011BernsteinRow7 karlssonLeaf0011BernsteinRow8 karlssonLeaf0011BernsteinRow9 karlssonLeaf0011BernsteinRow10 karlssonLeaf0011BernsteinRow11 karlssonLeaf0011BernsteinRow12 karlssonLeaf0011BernsteinRow13 karlssonLeaf0011BernsteinRow14 karlssonLeaf0011BernsteinRow15 karlssonLeaf0011BernsteinRow16
  ring

theorem karlssonLeaf01_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual ((0 : ℝ) + ((1 : ℝ) / 2) * (s : ℝ)) (((1 : ℝ) / 2) + ((1 : ℝ) / 2) * (t : ℝ)) =
      karlssonLeaf01Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf01Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf01BernsteinRow0 karlssonLeaf01BernsteinRow1 karlssonLeaf01BernsteinRow2 karlssonLeaf01BernsteinRow3 karlssonLeaf01BernsteinRow4 karlssonLeaf01BernsteinRow5 karlssonLeaf01BernsteinRow6 karlssonLeaf01BernsteinRow7 karlssonLeaf01BernsteinRow8 karlssonLeaf01BernsteinRow9 karlssonLeaf01BernsteinRow10 karlssonLeaf01BernsteinRow11 karlssonLeaf01BernsteinRow12 karlssonLeaf01BernsteinRow13 karlssonLeaf01BernsteinRow14 karlssonLeaf01BernsteinRow15 karlssonLeaf01BernsteinRow16
  ring

theorem karlssonLeaf10_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 2) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 2) * (t : ℝ)) =
      karlssonLeaf10Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf10Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf10BernsteinRow0 karlssonLeaf10BernsteinRow1 karlssonLeaf10BernsteinRow2 karlssonLeaf10BernsteinRow3 karlssonLeaf10BernsteinRow4 karlssonLeaf10BernsteinRow5 karlssonLeaf10BernsteinRow6 karlssonLeaf10BernsteinRow7 karlssonLeaf10BernsteinRow8 karlssonLeaf10BernsteinRow9 karlssonLeaf10BernsteinRow10 karlssonLeaf10BernsteinRow11 karlssonLeaf10BernsteinRow12 karlssonLeaf10BernsteinRow13 karlssonLeaf10BernsteinRow14 karlssonLeaf10BernsteinRow15 karlssonLeaf10BernsteinRow16
  ring

theorem karlssonLeaf1100_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf1100Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf1100Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf1100BernsteinRow0 karlssonLeaf1100BernsteinRow1 karlssonLeaf1100BernsteinRow2 karlssonLeaf1100BernsteinRow3 karlssonLeaf1100BernsteinRow4 karlssonLeaf1100BernsteinRow5 karlssonLeaf1100BernsteinRow6 karlssonLeaf1100BernsteinRow7 karlssonLeaf1100BernsteinRow8 karlssonLeaf1100BernsteinRow9 karlssonLeaf1100BernsteinRow10 karlssonLeaf1100BernsteinRow11 karlssonLeaf1100BernsteinRow12 karlssonLeaf1100BernsteinRow13 karlssonLeaf1100BernsteinRow14 karlssonLeaf1100BernsteinRow15 karlssonLeaf1100BernsteinRow16
  ring

theorem karlssonLeaf1101_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (s : ℝ)) (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf1101Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf1101Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf1101BernsteinRow0 karlssonLeaf1101BernsteinRow1 karlssonLeaf1101BernsteinRow2 karlssonLeaf1101BernsteinRow3 karlssonLeaf1101BernsteinRow4 karlssonLeaf1101BernsteinRow5 karlssonLeaf1101BernsteinRow6 karlssonLeaf1101BernsteinRow7 karlssonLeaf1101BernsteinRow8 karlssonLeaf1101BernsteinRow9 karlssonLeaf1101BernsteinRow10 karlssonLeaf1101BernsteinRow11 karlssonLeaf1101BernsteinRow12 karlssonLeaf1101BernsteinRow13 karlssonLeaf1101BernsteinRow14 karlssonLeaf1101BernsteinRow15 karlssonLeaf1101BernsteinRow16
  ring

theorem karlssonLeaf1110_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf1110Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf1110Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf1110BernsteinRow0 karlssonLeaf1110BernsteinRow1 karlssonLeaf1110BernsteinRow2 karlssonLeaf1110BernsteinRow3 karlssonLeaf1110BernsteinRow4 karlssonLeaf1110BernsteinRow5 karlssonLeaf1110BernsteinRow6 karlssonLeaf1110BernsteinRow7 karlssonLeaf1110BernsteinRow8 karlssonLeaf1110BernsteinRow9 karlssonLeaf1110BernsteinRow10 karlssonLeaf1110BernsteinRow11 karlssonLeaf1110BernsteinRow12 karlssonLeaf1110BernsteinRow13 karlssonLeaf1110BernsteinRow14 karlssonLeaf1110BernsteinRow15 karlssonLeaf1110BernsteinRow16
  ring

theorem karlssonLeaf1111_polynomial_identity
    (s t : ℝ) :
    karlssonCompactResidual (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) =
      karlssonLeaf1111Bernstein s t := by
  unfold karlssonCompactResidual karlssonLeaf1111Bernstein
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonLeaf1111BernsteinRow0 karlssonLeaf1111BernsteinRow1 karlssonLeaf1111BernsteinRow2 karlssonLeaf1111BernsteinRow3 karlssonLeaf1111BernsteinRow4 karlssonLeaf1111BernsteinRow5 karlssonLeaf1111BernsteinRow6 karlssonLeaf1111BernsteinRow7 karlssonLeaf1111BernsteinRow8 karlssonLeaf1111BernsteinRow9 karlssonLeaf1111BernsteinRow10 karlssonLeaf1111BernsteinRow11 karlssonLeaf1111BernsteinRow12 karlssonLeaf1111BernsteinRow13 karlssonLeaf1111BernsteinRow14 karlssonLeaf1111BernsteinRow15 karlssonLeaf1111BernsteinRow16
  ring


theorem karlssonLeaf0000_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual ((0 : ℝ) + ((1 : ℝ) / 4) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf0000_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf0000Bernstein s t = ((290540115 : ℝ) / 7340032) +
        karlssonLeaf0000ShiftedBernstein s t := by
    unfold karlssonLeaf0000Bernstein karlssonLeaf0000ShiftedBernstein
    unfold karlssonLeaf0000BernsteinRow0 karlssonLeaf0000BernsteinRow1 karlssonLeaf0000BernsteinRow2 karlssonLeaf0000BernsteinRow3 karlssonLeaf0000BernsteinRow4 karlssonLeaf0000BernsteinRow5 karlssonLeaf0000BernsteinRow6 karlssonLeaf0000BernsteinRow7 karlssonLeaf0000BernsteinRow8 karlssonLeaf0000BernsteinRow9 karlssonLeaf0000BernsteinRow10 karlssonLeaf0000BernsteinRow11 karlssonLeaf0000BernsteinRow12 karlssonLeaf0000BernsteinRow13 karlssonLeaf0000BernsteinRow14 karlssonLeaf0000BernsteinRow15 karlssonLeaf0000BernsteinRow16 karlssonLeaf0000ShiftedBernsteinRow0 karlssonLeaf0000ShiftedBernsteinRow1 karlssonLeaf0000ShiftedBernsteinRow2 karlssonLeaf0000ShiftedBernsteinRow3 karlssonLeaf0000ShiftedBernsteinRow4 karlssonLeaf0000ShiftedBernsteinRow5 karlssonLeaf0000ShiftedBernsteinRow6 karlssonLeaf0000ShiftedBernsteinRow7 karlssonLeaf0000ShiftedBernsteinRow8 karlssonLeaf0000ShiftedBernsteinRow9 karlssonLeaf0000ShiftedBernsteinRow10 karlssonLeaf0000ShiftedBernsteinRow11 karlssonLeaf0000ShiftedBernsteinRow12 karlssonLeaf0000ShiftedBernsteinRow13 karlssonLeaf0000ShiftedBernsteinRow14 karlssonLeaf0000ShiftedBernsteinRow15 karlssonLeaf0000ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf0000ShiftedBernstein
  unfold karlssonLeaf0000ShiftedBernsteinRow0 karlssonLeaf0000ShiftedBernsteinRow1 karlssonLeaf0000ShiftedBernsteinRow2 karlssonLeaf0000ShiftedBernsteinRow3 karlssonLeaf0000ShiftedBernsteinRow4 karlssonLeaf0000ShiftedBernsteinRow5 karlssonLeaf0000ShiftedBernsteinRow6 karlssonLeaf0000ShiftedBernsteinRow7 karlssonLeaf0000ShiftedBernsteinRow8 karlssonLeaf0000ShiftedBernsteinRow9 karlssonLeaf0000ShiftedBernsteinRow10 karlssonLeaf0000ShiftedBernsteinRow11 karlssonLeaf0000ShiftedBernsteinRow12 karlssonLeaf0000ShiftedBernsteinRow13 karlssonLeaf0000ShiftedBernsteinRow14 karlssonLeaf0000ShiftedBernsteinRow15 karlssonLeaf0000ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf0001_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual ((0 : ℝ) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf0001_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf0001Bernstein s t = ((3194002863 : ℝ) / 67108864) +
        karlssonLeaf0001ShiftedBernstein s t := by
    unfold karlssonLeaf0001Bernstein karlssonLeaf0001ShiftedBernstein
    unfold karlssonLeaf0001BernsteinRow0 karlssonLeaf0001BernsteinRow1 karlssonLeaf0001BernsteinRow2 karlssonLeaf0001BernsteinRow3 karlssonLeaf0001BernsteinRow4 karlssonLeaf0001BernsteinRow5 karlssonLeaf0001BernsteinRow6 karlssonLeaf0001BernsteinRow7 karlssonLeaf0001BernsteinRow8 karlssonLeaf0001BernsteinRow9 karlssonLeaf0001BernsteinRow10 karlssonLeaf0001BernsteinRow11 karlssonLeaf0001BernsteinRow12 karlssonLeaf0001BernsteinRow13 karlssonLeaf0001BernsteinRow14 karlssonLeaf0001BernsteinRow15 karlssonLeaf0001BernsteinRow16 karlssonLeaf0001ShiftedBernsteinRow0 karlssonLeaf0001ShiftedBernsteinRow1 karlssonLeaf0001ShiftedBernsteinRow2 karlssonLeaf0001ShiftedBernsteinRow3 karlssonLeaf0001ShiftedBernsteinRow4 karlssonLeaf0001ShiftedBernsteinRow5 karlssonLeaf0001ShiftedBernsteinRow6 karlssonLeaf0001ShiftedBernsteinRow7 karlssonLeaf0001ShiftedBernsteinRow8 karlssonLeaf0001ShiftedBernsteinRow9 karlssonLeaf0001ShiftedBernsteinRow10 karlssonLeaf0001ShiftedBernsteinRow11 karlssonLeaf0001ShiftedBernsteinRow12 karlssonLeaf0001ShiftedBernsteinRow13 karlssonLeaf0001ShiftedBernsteinRow14 karlssonLeaf0001ShiftedBernsteinRow15 karlssonLeaf0001ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf0001ShiftedBernstein
  unfold karlssonLeaf0001ShiftedBernsteinRow0 karlssonLeaf0001ShiftedBernsteinRow1 karlssonLeaf0001ShiftedBernsteinRow2 karlssonLeaf0001ShiftedBernsteinRow3 karlssonLeaf0001ShiftedBernsteinRow4 karlssonLeaf0001ShiftedBernsteinRow5 karlssonLeaf0001ShiftedBernsteinRow6 karlssonLeaf0001ShiftedBernsteinRow7 karlssonLeaf0001ShiftedBernsteinRow8 karlssonLeaf0001ShiftedBernsteinRow9 karlssonLeaf0001ShiftedBernsteinRow10 karlssonLeaf0001ShiftedBernsteinRow11 karlssonLeaf0001ShiftedBernsteinRow12 karlssonLeaf0001ShiftedBernsteinRow13 karlssonLeaf0001ShiftedBernsteinRow14 karlssonLeaf0001ShiftedBernsteinRow15 karlssonLeaf0001ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf0010_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) ((0 : ℝ) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf0010_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf0010Bernstein s t = ((681381621 : ℝ) / 52183040) +
        karlssonLeaf0010ShiftedBernstein s t := by
    unfold karlssonLeaf0010Bernstein karlssonLeaf0010ShiftedBernstein
    unfold karlssonLeaf0010BernsteinRow0 karlssonLeaf0010BernsteinRow1 karlssonLeaf0010BernsteinRow2 karlssonLeaf0010BernsteinRow3 karlssonLeaf0010BernsteinRow4 karlssonLeaf0010BernsteinRow5 karlssonLeaf0010BernsteinRow6 karlssonLeaf0010BernsteinRow7 karlssonLeaf0010BernsteinRow8 karlssonLeaf0010BernsteinRow9 karlssonLeaf0010BernsteinRow10 karlssonLeaf0010BernsteinRow11 karlssonLeaf0010BernsteinRow12 karlssonLeaf0010BernsteinRow13 karlssonLeaf0010BernsteinRow14 karlssonLeaf0010BernsteinRow15 karlssonLeaf0010BernsteinRow16 karlssonLeaf0010ShiftedBernsteinRow0 karlssonLeaf0010ShiftedBernsteinRow1 karlssonLeaf0010ShiftedBernsteinRow2 karlssonLeaf0010ShiftedBernsteinRow3 karlssonLeaf0010ShiftedBernsteinRow4 karlssonLeaf0010ShiftedBernsteinRow5 karlssonLeaf0010ShiftedBernsteinRow6 karlssonLeaf0010ShiftedBernsteinRow7 karlssonLeaf0010ShiftedBernsteinRow8 karlssonLeaf0010ShiftedBernsteinRow9 karlssonLeaf0010ShiftedBernsteinRow10 karlssonLeaf0010ShiftedBernsteinRow11 karlssonLeaf0010ShiftedBernsteinRow12 karlssonLeaf0010ShiftedBernsteinRow13 karlssonLeaf0010ShiftedBernsteinRow14 karlssonLeaf0010ShiftedBernsteinRow15 karlssonLeaf0010ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf0010ShiftedBernstein
  unfold karlssonLeaf0010ShiftedBernsteinRow0 karlssonLeaf0010ShiftedBernsteinRow1 karlssonLeaf0010ShiftedBernsteinRow2 karlssonLeaf0010ShiftedBernsteinRow3 karlssonLeaf0010ShiftedBernsteinRow4 karlssonLeaf0010ShiftedBernsteinRow5 karlssonLeaf0010ShiftedBernsteinRow6 karlssonLeaf0010ShiftedBernsteinRow7 karlssonLeaf0010ShiftedBernsteinRow8 karlssonLeaf0010ShiftedBernsteinRow9 karlssonLeaf0010ShiftedBernsteinRow10 karlssonLeaf0010ShiftedBernsteinRow11 karlssonLeaf0010ShiftedBernsteinRow12 karlssonLeaf0010ShiftedBernsteinRow13 karlssonLeaf0010ShiftedBernsteinRow14 karlssonLeaf0010ShiftedBernsteinRow15 karlssonLeaf0010ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf0011_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf0011_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf0011Bernstein s t = ((4023 : ℝ) / 256) +
        karlssonLeaf0011ShiftedBernstein s t := by
    unfold karlssonLeaf0011Bernstein karlssonLeaf0011ShiftedBernstein
    unfold karlssonLeaf0011BernsteinRow0 karlssonLeaf0011BernsteinRow1 karlssonLeaf0011BernsteinRow2 karlssonLeaf0011BernsteinRow3 karlssonLeaf0011BernsteinRow4 karlssonLeaf0011BernsteinRow5 karlssonLeaf0011BernsteinRow6 karlssonLeaf0011BernsteinRow7 karlssonLeaf0011BernsteinRow8 karlssonLeaf0011BernsteinRow9 karlssonLeaf0011BernsteinRow10 karlssonLeaf0011BernsteinRow11 karlssonLeaf0011BernsteinRow12 karlssonLeaf0011BernsteinRow13 karlssonLeaf0011BernsteinRow14 karlssonLeaf0011BernsteinRow15 karlssonLeaf0011BernsteinRow16 karlssonLeaf0011ShiftedBernsteinRow0 karlssonLeaf0011ShiftedBernsteinRow1 karlssonLeaf0011ShiftedBernsteinRow2 karlssonLeaf0011ShiftedBernsteinRow3 karlssonLeaf0011ShiftedBernsteinRow4 karlssonLeaf0011ShiftedBernsteinRow5 karlssonLeaf0011ShiftedBernsteinRow6 karlssonLeaf0011ShiftedBernsteinRow7 karlssonLeaf0011ShiftedBernsteinRow8 karlssonLeaf0011ShiftedBernsteinRow9 karlssonLeaf0011ShiftedBernsteinRow10 karlssonLeaf0011ShiftedBernsteinRow11 karlssonLeaf0011ShiftedBernsteinRow12 karlssonLeaf0011ShiftedBernsteinRow13 karlssonLeaf0011ShiftedBernsteinRow14 karlssonLeaf0011ShiftedBernsteinRow15 karlssonLeaf0011ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf0011ShiftedBernstein
  unfold karlssonLeaf0011ShiftedBernsteinRow0 karlssonLeaf0011ShiftedBernsteinRow1 karlssonLeaf0011ShiftedBernsteinRow2 karlssonLeaf0011ShiftedBernsteinRow3 karlssonLeaf0011ShiftedBernsteinRow4 karlssonLeaf0011ShiftedBernsteinRow5 karlssonLeaf0011ShiftedBernsteinRow6 karlssonLeaf0011ShiftedBernsteinRow7 karlssonLeaf0011ShiftedBernsteinRow8 karlssonLeaf0011ShiftedBernsteinRow9 karlssonLeaf0011ShiftedBernsteinRow10 karlssonLeaf0011ShiftedBernsteinRow11 karlssonLeaf0011ShiftedBernsteinRow12 karlssonLeaf0011ShiftedBernsteinRow13 karlssonLeaf0011ShiftedBernsteinRow14 karlssonLeaf0011ShiftedBernsteinRow15 karlssonLeaf0011ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf01_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual ((0 : ℝ) + ((1 : ℝ) / 2) * (s : ℝ)) (((1 : ℝ) / 2) + ((1 : ℝ) / 2) * (t : ℝ)) := by
  rw [karlssonLeaf01_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf01Bernstein s t = ((63 : ℝ) / 4) +
        karlssonLeaf01ShiftedBernstein s t := by
    unfold karlssonLeaf01Bernstein karlssonLeaf01ShiftedBernstein
    unfold karlssonLeaf01BernsteinRow0 karlssonLeaf01BernsteinRow1 karlssonLeaf01BernsteinRow2 karlssonLeaf01BernsteinRow3 karlssonLeaf01BernsteinRow4 karlssonLeaf01BernsteinRow5 karlssonLeaf01BernsteinRow6 karlssonLeaf01BernsteinRow7 karlssonLeaf01BernsteinRow8 karlssonLeaf01BernsteinRow9 karlssonLeaf01BernsteinRow10 karlssonLeaf01BernsteinRow11 karlssonLeaf01BernsteinRow12 karlssonLeaf01BernsteinRow13 karlssonLeaf01BernsteinRow14 karlssonLeaf01BernsteinRow15 karlssonLeaf01BernsteinRow16 karlssonLeaf01ShiftedBernsteinRow0 karlssonLeaf01ShiftedBernsteinRow1 karlssonLeaf01ShiftedBernsteinRow2 karlssonLeaf01ShiftedBernsteinRow3 karlssonLeaf01ShiftedBernsteinRow4 karlssonLeaf01ShiftedBernsteinRow5 karlssonLeaf01ShiftedBernsteinRow6 karlssonLeaf01ShiftedBernsteinRow7 karlssonLeaf01ShiftedBernsteinRow8 karlssonLeaf01ShiftedBernsteinRow9 karlssonLeaf01ShiftedBernsteinRow10 karlssonLeaf01ShiftedBernsteinRow11 karlssonLeaf01ShiftedBernsteinRow12 karlssonLeaf01ShiftedBernsteinRow13 karlssonLeaf01ShiftedBernsteinRow14 karlssonLeaf01ShiftedBernsteinRow15 karlssonLeaf01ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf01ShiftedBernstein
  unfold karlssonLeaf01ShiftedBernsteinRow0 karlssonLeaf01ShiftedBernsteinRow1 karlssonLeaf01ShiftedBernsteinRow2 karlssonLeaf01ShiftedBernsteinRow3 karlssonLeaf01ShiftedBernsteinRow4 karlssonLeaf01ShiftedBernsteinRow5 karlssonLeaf01ShiftedBernsteinRow6 karlssonLeaf01ShiftedBernsteinRow7 karlssonLeaf01ShiftedBernsteinRow8 karlssonLeaf01ShiftedBernsteinRow9 karlssonLeaf01ShiftedBernsteinRow10 karlssonLeaf01ShiftedBernsteinRow11 karlssonLeaf01ShiftedBernsteinRow12 karlssonLeaf01ShiftedBernsteinRow13 karlssonLeaf01ShiftedBernsteinRow14 karlssonLeaf01ShiftedBernsteinRow15 karlssonLeaf01ShiftedBernsteinRow16
  positivity

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

theorem karlssonLeaf1100_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf1100_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf1100Bernstein s t = ((4023 : ℝ) / 256) +
        karlssonLeaf1100ShiftedBernstein s t := by
    unfold karlssonLeaf1100Bernstein karlssonLeaf1100ShiftedBernstein
    unfold karlssonLeaf1100BernsteinRow0 karlssonLeaf1100BernsteinRow1 karlssonLeaf1100BernsteinRow2 karlssonLeaf1100BernsteinRow3 karlssonLeaf1100BernsteinRow4 karlssonLeaf1100BernsteinRow5 karlssonLeaf1100BernsteinRow6 karlssonLeaf1100BernsteinRow7 karlssonLeaf1100BernsteinRow8 karlssonLeaf1100BernsteinRow9 karlssonLeaf1100BernsteinRow10 karlssonLeaf1100BernsteinRow11 karlssonLeaf1100BernsteinRow12 karlssonLeaf1100BernsteinRow13 karlssonLeaf1100BernsteinRow14 karlssonLeaf1100BernsteinRow15 karlssonLeaf1100BernsteinRow16 karlssonLeaf1100ShiftedBernsteinRow0 karlssonLeaf1100ShiftedBernsteinRow1 karlssonLeaf1100ShiftedBernsteinRow2 karlssonLeaf1100ShiftedBernsteinRow3 karlssonLeaf1100ShiftedBernsteinRow4 karlssonLeaf1100ShiftedBernsteinRow5 karlssonLeaf1100ShiftedBernsteinRow6 karlssonLeaf1100ShiftedBernsteinRow7 karlssonLeaf1100ShiftedBernsteinRow8 karlssonLeaf1100ShiftedBernsteinRow9 karlssonLeaf1100ShiftedBernsteinRow10 karlssonLeaf1100ShiftedBernsteinRow11 karlssonLeaf1100ShiftedBernsteinRow12 karlssonLeaf1100ShiftedBernsteinRow13 karlssonLeaf1100ShiftedBernsteinRow14 karlssonLeaf1100ShiftedBernsteinRow15 karlssonLeaf1100ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf1100ShiftedBernstein
  unfold karlssonLeaf1100ShiftedBernsteinRow0 karlssonLeaf1100ShiftedBernsteinRow1 karlssonLeaf1100ShiftedBernsteinRow2 karlssonLeaf1100ShiftedBernsteinRow3 karlssonLeaf1100ShiftedBernsteinRow4 karlssonLeaf1100ShiftedBernsteinRow5 karlssonLeaf1100ShiftedBernsteinRow6 karlssonLeaf1100ShiftedBernsteinRow7 karlssonLeaf1100ShiftedBernsteinRow8 karlssonLeaf1100ShiftedBernsteinRow9 karlssonLeaf1100ShiftedBernsteinRow10 karlssonLeaf1100ShiftedBernsteinRow11 karlssonLeaf1100ShiftedBernsteinRow12 karlssonLeaf1100ShiftedBernsteinRow13 karlssonLeaf1100ShiftedBernsteinRow14 karlssonLeaf1100ShiftedBernsteinRow15 karlssonLeaf1100ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf1101_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (s : ℝ)) (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf1101_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf1101Bernstein s t = ((681381621 : ℝ) / 52183040) +
        karlssonLeaf1101ShiftedBernstein s t := by
    unfold karlssonLeaf1101Bernstein karlssonLeaf1101ShiftedBernstein
    unfold karlssonLeaf1101BernsteinRow0 karlssonLeaf1101BernsteinRow1 karlssonLeaf1101BernsteinRow2 karlssonLeaf1101BernsteinRow3 karlssonLeaf1101BernsteinRow4 karlssonLeaf1101BernsteinRow5 karlssonLeaf1101BernsteinRow6 karlssonLeaf1101BernsteinRow7 karlssonLeaf1101BernsteinRow8 karlssonLeaf1101BernsteinRow9 karlssonLeaf1101BernsteinRow10 karlssonLeaf1101BernsteinRow11 karlssonLeaf1101BernsteinRow12 karlssonLeaf1101BernsteinRow13 karlssonLeaf1101BernsteinRow14 karlssonLeaf1101BernsteinRow15 karlssonLeaf1101BernsteinRow16 karlssonLeaf1101ShiftedBernsteinRow0 karlssonLeaf1101ShiftedBernsteinRow1 karlssonLeaf1101ShiftedBernsteinRow2 karlssonLeaf1101ShiftedBernsteinRow3 karlssonLeaf1101ShiftedBernsteinRow4 karlssonLeaf1101ShiftedBernsteinRow5 karlssonLeaf1101ShiftedBernsteinRow6 karlssonLeaf1101ShiftedBernsteinRow7 karlssonLeaf1101ShiftedBernsteinRow8 karlssonLeaf1101ShiftedBernsteinRow9 karlssonLeaf1101ShiftedBernsteinRow10 karlssonLeaf1101ShiftedBernsteinRow11 karlssonLeaf1101ShiftedBernsteinRow12 karlssonLeaf1101ShiftedBernsteinRow13 karlssonLeaf1101ShiftedBernsteinRow14 karlssonLeaf1101ShiftedBernsteinRow15 karlssonLeaf1101ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf1101ShiftedBernstein
  unfold karlssonLeaf1101ShiftedBernsteinRow0 karlssonLeaf1101ShiftedBernsteinRow1 karlssonLeaf1101ShiftedBernsteinRow2 karlssonLeaf1101ShiftedBernsteinRow3 karlssonLeaf1101ShiftedBernsteinRow4 karlssonLeaf1101ShiftedBernsteinRow5 karlssonLeaf1101ShiftedBernsteinRow6 karlssonLeaf1101ShiftedBernsteinRow7 karlssonLeaf1101ShiftedBernsteinRow8 karlssonLeaf1101ShiftedBernsteinRow9 karlssonLeaf1101ShiftedBernsteinRow10 karlssonLeaf1101ShiftedBernsteinRow11 karlssonLeaf1101ShiftedBernsteinRow12 karlssonLeaf1101ShiftedBernsteinRow13 karlssonLeaf1101ShiftedBernsteinRow14 karlssonLeaf1101ShiftedBernsteinRow15 karlssonLeaf1101ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf1110_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) (((1 : ℝ) / 2) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf1110_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf1110Bernstein s t = ((3194002863 : ℝ) / 67108864) +
        karlssonLeaf1110ShiftedBernstein s t := by
    unfold karlssonLeaf1110Bernstein karlssonLeaf1110ShiftedBernstein
    unfold karlssonLeaf1110BernsteinRow0 karlssonLeaf1110BernsteinRow1 karlssonLeaf1110BernsteinRow2 karlssonLeaf1110BernsteinRow3 karlssonLeaf1110BernsteinRow4 karlssonLeaf1110BernsteinRow5 karlssonLeaf1110BernsteinRow6 karlssonLeaf1110BernsteinRow7 karlssonLeaf1110BernsteinRow8 karlssonLeaf1110BernsteinRow9 karlssonLeaf1110BernsteinRow10 karlssonLeaf1110BernsteinRow11 karlssonLeaf1110BernsteinRow12 karlssonLeaf1110BernsteinRow13 karlssonLeaf1110BernsteinRow14 karlssonLeaf1110BernsteinRow15 karlssonLeaf1110BernsteinRow16 karlssonLeaf1110ShiftedBernsteinRow0 karlssonLeaf1110ShiftedBernsteinRow1 karlssonLeaf1110ShiftedBernsteinRow2 karlssonLeaf1110ShiftedBernsteinRow3 karlssonLeaf1110ShiftedBernsteinRow4 karlssonLeaf1110ShiftedBernsteinRow5 karlssonLeaf1110ShiftedBernsteinRow6 karlssonLeaf1110ShiftedBernsteinRow7 karlssonLeaf1110ShiftedBernsteinRow8 karlssonLeaf1110ShiftedBernsteinRow9 karlssonLeaf1110ShiftedBernsteinRow10 karlssonLeaf1110ShiftedBernsteinRow11 karlssonLeaf1110ShiftedBernsteinRow12 karlssonLeaf1110ShiftedBernsteinRow13 karlssonLeaf1110ShiftedBernsteinRow14 karlssonLeaf1110ShiftedBernsteinRow15 karlssonLeaf1110ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf1110ShiftedBernstein
  unfold karlssonLeaf1110ShiftedBernsteinRow0 karlssonLeaf1110ShiftedBernsteinRow1 karlssonLeaf1110ShiftedBernsteinRow2 karlssonLeaf1110ShiftedBernsteinRow3 karlssonLeaf1110ShiftedBernsteinRow4 karlssonLeaf1110ShiftedBernsteinRow5 karlssonLeaf1110ShiftedBernsteinRow6 karlssonLeaf1110ShiftedBernsteinRow7 karlssonLeaf1110ShiftedBernsteinRow8 karlssonLeaf1110ShiftedBernsteinRow9 karlssonLeaf1110ShiftedBernsteinRow10 karlssonLeaf1110ShiftedBernsteinRow11 karlssonLeaf1110ShiftedBernsteinRow12 karlssonLeaf1110ShiftedBernsteinRow13 karlssonLeaf1110ShiftedBernsteinRow14 karlssonLeaf1110ShiftedBernsteinRow15 karlssonLeaf1110ShiftedBernsteinRow16
  positivity

theorem karlssonLeaf1111_residual_pos
    (s t : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (s : ℝ)) (((3 : ℝ) / 4) + ((1 : ℝ) / 4) * (t : ℝ)) := by
  rw [karlssonLeaf1111_polynomial_identity]
  have hs0 : (0 : ℝ) ≤ s := s.2.1
  have hs1 : (s : ℝ) ≤ 1 := s.2.2
  have ht0 : (0 : ℝ) ≤ t := t.2.1
  have ht1 : (t : ℝ) ≤ 1 := t.2.2
  have hdecomposition :
      karlssonLeaf1111Bernstein s t = ((290540115 : ℝ) / 7340032) +
        karlssonLeaf1111ShiftedBernstein s t := by
    unfold karlssonLeaf1111Bernstein karlssonLeaf1111ShiftedBernstein
    unfold karlssonLeaf1111BernsteinRow0 karlssonLeaf1111BernsteinRow1 karlssonLeaf1111BernsteinRow2 karlssonLeaf1111BernsteinRow3 karlssonLeaf1111BernsteinRow4 karlssonLeaf1111BernsteinRow5 karlssonLeaf1111BernsteinRow6 karlssonLeaf1111BernsteinRow7 karlssonLeaf1111BernsteinRow8 karlssonLeaf1111BernsteinRow9 karlssonLeaf1111BernsteinRow10 karlssonLeaf1111BernsteinRow11 karlssonLeaf1111BernsteinRow12 karlssonLeaf1111BernsteinRow13 karlssonLeaf1111BernsteinRow14 karlssonLeaf1111BernsteinRow15 karlssonLeaf1111BernsteinRow16 karlssonLeaf1111ShiftedBernsteinRow0 karlssonLeaf1111ShiftedBernsteinRow1 karlssonLeaf1111ShiftedBernsteinRow2 karlssonLeaf1111ShiftedBernsteinRow3 karlssonLeaf1111ShiftedBernsteinRow4 karlssonLeaf1111ShiftedBernsteinRow5 karlssonLeaf1111ShiftedBernsteinRow6 karlssonLeaf1111ShiftedBernsteinRow7 karlssonLeaf1111ShiftedBernsteinRow8 karlssonLeaf1111ShiftedBernsteinRow9 karlssonLeaf1111ShiftedBernsteinRow10 karlssonLeaf1111ShiftedBernsteinRow11 karlssonLeaf1111ShiftedBernsteinRow12 karlssonLeaf1111ShiftedBernsteinRow13 karlssonLeaf1111ShiftedBernsteinRow14 karlssonLeaf1111ShiftedBernsteinRow15 karlssonLeaf1111ShiftedBernsteinRow16
    ring
  rw [hdecomposition]
  unfold karlssonLeaf1111ShiftedBernstein
  unfold karlssonLeaf1111ShiftedBernsteinRow0 karlssonLeaf1111ShiftedBernsteinRow1 karlssonLeaf1111ShiftedBernsteinRow2 karlssonLeaf1111ShiftedBernsteinRow3 karlssonLeaf1111ShiftedBernsteinRow4 karlssonLeaf1111ShiftedBernsteinRow5 karlssonLeaf1111ShiftedBernsteinRow6 karlssonLeaf1111ShiftedBernsteinRow7 karlssonLeaf1111ShiftedBernsteinRow8 karlssonLeaf1111ShiftedBernsteinRow9 karlssonLeaf1111ShiftedBernsteinRow10 karlssonLeaf1111ShiftedBernsteinRow11 karlssonLeaf1111ShiftedBernsteinRow12 karlssonLeaf1111ShiftedBernsteinRow13 karlssonLeaf1111ShiftedBernsteinRow14 karlssonLeaf1111ShiftedBernsteinRow15 karlssonLeaf1111ShiftedBernsteinRow16
  positivity


theorem karlssonResidual_compactification_identity
    (t rho : ℝ) (ht : 0 ≤ t) (hrho : 0 ≤ rho) :
    (1 + t) ^ 16 * (1 + rho) ^ 8 *
      karlssonCompactResidual (t / (1 + t)) (rho / (1 + rho)) =
        karlssonPositiveRealResidual t rho := by
  have htden : 1 + t ≠ 0 := by positivity
  have hrden : 1 + rho ≠ 0 := by positivity
  unfold karlssonCompactResidual karlssonPositiveRealResidual
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonPositiveRealResidualRow0 karlssonPositiveRealResidualRow1 karlssonPositiveRealResidualRow2 karlssonPositiveRealResidualRow3 karlssonPositiveRealResidualRow4 karlssonPositiveRealResidualRow5 karlssonPositiveRealResidualRow6 karlssonPositiveRealResidualRow7 karlssonPositiveRealResidualRow8 karlssonPositiveRealResidualRow9 karlssonPositiveRealResidualRow10 karlssonPositiveRealResidualRow11 karlssonPositiveRealResidualRow12 karlssonPositiveRealResidualRow13 karlssonPositiveRealResidualRow14 karlssonPositiveRealResidualRow15 karlssonPositiveRealResidualRow16
  field_simp [htden, hrden]
  ring

theorem karlssonResidual_cayley_identity (t rho : ℝ) :
    karlssonCayleyDenominator (rho : ℂ) *
      karlssonSharedResidual (t : ℂ)
        (((1 : ℂ) + Complex.I * (rho : ℂ)) /
          ((1 : ℂ) - Complex.I * (rho : ℂ))) =
      -(karlssonPositiveRealResidual t rho : ℂ) := by
  have hden : (1 : ℂ) - Complex.I * (rho : ℂ) ≠ 0 := by
    intro h
    have hre := congrArg Complex.re h
    norm_num [Complex.mul_re] at hre
  unfold karlssonCayleyDenominator karlssonSharedResidual
  unfold karlssonSharedResidualRow0 karlssonSharedResidualRow1 karlssonSharedResidualRow2 karlssonSharedResidualRow3 karlssonSharedResidualRow4 karlssonSharedResidualRow5 karlssonSharedResidualRow6 karlssonSharedResidualRow7 karlssonSharedResidualRow8 karlssonSharedResidualRow9 karlssonSharedResidualRow10 karlssonSharedResidualRow11 karlssonSharedResidualRow12 karlssonSharedResidualRow13 karlssonSharedResidualRow14 karlssonSharedResidualRow15 karlssonSharedResidualRow16
  unfold karlssonPositiveRealResidual
  unfold karlssonPositiveRealResidualRow0 karlssonPositiveRealResidualRow1 karlssonPositiveRealResidualRow2 karlssonPositiveRealResidualRow3 karlssonPositiveRealResidualRow4 karlssonPositiveRealResidualRow5 karlssonPositiveRealResidualRow6 karlssonPositiveRealResidualRow7 karlssonPositiveRealResidualRow8 karlssonPositiveRealResidualRow9 karlssonPositiveRealResidualRow10 karlssonPositiveRealResidualRow11 karlssonPositiveRealResidualRow12 karlssonPositiveRealResidualRow13 karlssonPositiveRealResidualRow14 karlssonPositiveRealResidualRow15 karlssonPositiveRealResidualRow16
  push_cast
  field_simp [hden]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four]
  ring

end Hadamard6
