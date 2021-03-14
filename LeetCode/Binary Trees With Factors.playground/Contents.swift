import Foundation

func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
    let arr = arr.sorted()
    var binaryTreesForNumbers = [Int: Int]()
    arr.forEach { number in
        binaryTreesForNumbers[number] = 1
    }
    
    for product in 0 ..< arr.count {
        for factor1 in 0 ..< product {
            for factor2 in 0 ..< product {
                if arr[factor1] * arr[factor2] == arr[product] {
                    binaryTreesForNumbers[arr[product]]! += binaryTreesForNumbers[arr[factor1]]! * binaryTreesForNumbers[arr[factor2]]!
                }
            }
        }
    }
    
    let result = binaryTreesForNumbers.reduce(0) { (partial, keyValue) in
        (partial + keyValue.value) % 1000000007
    }
    
    return result
}

let solution = numFactoredBinaryTrees
solution([2,4]) == 3
solution([2,4,5,10]) == 7
solution([197,328,400,11,77,102,150,171,298,370,224,99,269,218,151,34,396,20,61,135]) == 21
solution([45,42,2,18,23,1170,12,41,40,9,47,24,33,28,10,32,29,17,46,11,759,37,6,26,21,49,31,14,19,8,13,7,27,22,3,36,34,38,39,30,43,15,4,16,35,25,20,44,5,48]) == 777
solution([151915525,176447077,637974090,495633179,396599749,875602132,832061088,949836891,991492429,171678814,276050834,360490850,726385776,200142352,81722404,414813291,148680669,520656707,263382732,781597535,742464903,163225270,358390667,579554191,905308421,678533159,547000274,695836427,630762564,400623928,204675941,801328265,302847422,208360644,501565954,481978171,474877525,313464282,15695265,443333632,558927022,612454819,435764255,369388452,574149558,894391727,64210045,896877663,824278783,68156559,521093481,141961362,249380756,493364910,562414659,760321398,985143962,498747354,967948036,449843744,202963129,686928711,449799279,487423755,185073269,430055166,115195298,324415566,104715404,343697422,487820092,568182203,343102761,604869355,856242111,176435383,572513647,340322694,704202191,10775770,526474647,969298690,911909622,300200490,539182135,671806424,906620383,903076637,106519620,575342931,241971752,982083357,291716879,790188175,665378669,733733442,678812604,372405759,947965390,531790366,892102379,826694929,277921969,18666886,545995241,836373102,6544601,539609489,261237124,749896758,274798678,177832892,252319114,303204597,826676857,424397913,18441736,567943733,309633908,186643478,12133017,472499194,877495826,909006952,823823443,992209574,228457938,146132370,861071815,505054094,46517422,773416081,800740540,189091208,285698970,566695733,756087489,702347174,55428584,624576889,8531775,299208828,222130282,919904451,475773937,942803432,35301062,945968021,36028884,381423464,860180307,432514714,183571947,405658878,368149592,953687559,920799766,188279403,924193410,869418871,511531164,453362375,242739667,282817086,257908434,129427567,427615135,380171456,97941722,714621480,141154990,728829613,417560294,428768008,841143064,473390190,639030062,991966380,185566660,875167872,875631294,285461497,793602220,476954163,564233551,291537862,730536501,675915247,363599155,563769177,496534941,79752562,293364323,242277576,823058629,206943946,740672748,870721578,9309374,278242665,407177295,227005701,380719400,551082350,749855467,407560564,905258478,883470218,232131817,117145864,789896881,742521660,440922088,974235845,129958614,585501057,113203427,108014573,430792441,173973129,801612176,190174590,589540099,351390712,480200006,768776261,731214973,700417100,286859161,874560953,994370402,959851446,477110559,587557716,394512070,459767460,598296889,291082577,31861504,869780580,372048086,615510578,200668006,340282131,283962189,913370200,308491815,829360099,542110775,850233674,705259641,762494983,980991632,24025367,113244520,786676347,584240774,24781980,333873792,650459980,834482207,509884236,799875781,756122160,928101063,956357937,467022342,100979050,599605968,525926424,980088484,363709026,534216589,267807678,525982767,116190868,510702045,205628417,637862966,309466869,56358099,164777684,162962686,518477436,356767382,142405656,958348275,382134533,315485144,608578085,412937691,536789871,80223126,110521780,853071150,90355734,250803326,856911364,4682077,697320338,207172015,866736468,792647746,441692823,724102356,187528562,641441616,466000373,744462236,121022599,560058226,133118694,656945480,89791915,291890725,866626589,391797950,221260476,541977221,297091881,660408217,39723343,683769320,419742385,405854109,422827711,562535048,281761015,994501741,533433283,802430218,596863041,886096877,275269220,315204914,52359419,544948405,149479263,178538861,236531392,651174487,738858637,398892925,812677248,793641340,54333559,855236527,231873192,994829820,738399209,684966861,595538269,995494383,142040723,641342994,746656667,368568346,472135671,113357693,478616264,592474619,376634156,332052525,484340538,422979332,948520627,540717529,827609813,80685497,483483892,223982621,176413010,879344196,746076144,362546083,89230257,295230391,550915313,634335990,941205000,177868583,454432074,200428707,794827341,40009651,607812418,122617011,223734590,486933230,331446909,987153416,592628979,600302576,229486945,38657741,501673508,647157617,927063378,131594488,758974022,81775321,519630426,815999298,662092023,491151038,463672433,147330247,839542752,965851316,544248833,626343348,846294850,804170607,106376093,520324621,961613534,846099314,929615777,98909155,340335882,305209411,124775548,956557665,724026893,919744455,246167976,133689402,159666744,687495443,309896973,515033776,602566889,40674780,884303856,235198331,749287217,830954154,676885576,335635504,66356566,992093267,371955271,832719435,933678085,493310160,888974511,513155631,284005098,514896216,480166340,150790863,39021949,160825857,799108350,231974636,349372534,683948672,83046301,84769656,599538327,19563143,658905827,918588030,291000125,652310107,524629172,950949909,409558920,931504034,645556100,319805220,691270726,812684974,217224035,324650303,713499770,953893603,799343053,825442022,165898299,853086622,561089453,707991715,183014825,313740608,936995113,820617565,318251430,627167062,834570951,940574339,702401272,776663357,340999693,463954312,196707666,117709753,212967903,484714723,153541403,755940291,45012001,65255115,666485237,139915253,806973105,212387679,288934628,944492571,987681317,405601703,934835881,834024035,330905954,290563918,153086469,730779023,132721422,438996577,283129275,151551368,246929109,94007393,715060908,510392775,462063587,83178950,761800942,71829800,553376052,313000746,744135552,249874814,281341094,701789048,583447149,44469755,473279966,997220758,435379075,156147051,531291174,715933290,880659655,748886887,507300860,643983551,781289678,830536925,41675813,745926870,935718543,313556235,111515038,250568052,687604929,56424325,46817483,189474836,810753295,836556669,378377159,475259120,416888055,540407418,474365776,389508528,430921726,616100515,225124294,140558851,569359530,513213926,841746312,500088031,127000714,779813397,85938662,771984824,474590360,713541551,950171016,570947340,575340618,943853287,798541829,634649818,309579869,759882685,161121508,856465286,958712425,445028194,102889116,191250953,27147304,654268742,728683852,861751771,320646232,594246549,798982683,992399382,389146519,819961421,332300542,283719523,286646729,118325337,102144707,659612830,130917377,549257484,471504652,146137306,999028277,306040258,303032397,425727929,265465068,199725120,407801894,122338928,599341987,910791955,672623571,981172259,368403034,276502714,8193630,875210526,405221183,430912658,635220405,579468590,27821932,88640297,368042532,835785277,902707292,747402498,186654087,751502440,383874028,954436428,742270128,941451228,659994987,60187054,469698506,997741053,116258443,638268343,459487065,909821375,866064390,965971419,154197224,922315803,948315922,818689448,987578849,511153850,945066286,253050164,979105269,74408169,152204419,820806824,826290025,111319659,507307583,105031771,737632020,269062474,577112098,425358036,428544037,990051547,964560716,979680032,635187430,920408392,606318020,560224190,284551811,408495233,357230810,129079407,296391367,150492138,194927955,695551906,667682953,447902508,379288232,388927045,911976364,18857597,775429720,906642948,632715386,60416703,108351686,865859013,337150503,37007173,782633395,856523074,32451972,836455746,962870398,413211243,935892071,735706733,61009695,375093923,81674834,168375356,125559833,547232780,843860614,280989743,109336986,437956255,570485403,406763832,773851997,318959352,525923488,259924637,653627563,537462848,611489146,967545626,466212763,776686641,989613259,858172949,837662097,140089906,195603220,662992889,831074729,338825764,424947198,121928559,711325665,547610337,390664935,222079585,497250239,296340717,61493174,732180974,359390458,149047605,483039130,169100145,71509563,986305096,251842320,457379954,532618002,418298730,217579728,373093630,900573555,250960244,195824211,520367972,567359,828973174,804898669,800630752,902324604,912045630,604763367,995035714,833710411,796845404,16060422,659353358,978061682,449665799,469945807,97010477,799028387,709331954,315616828,378323299,687308523,250874812,13596721,790072789,954060961,907582942,953645009,59472201,229639127,567416025,589466895,705684901,441361096,367502296,769715032,75609218,274251663,543556648,947244748,168726836,688101366,515952750,767439033,113335790,455472169,574752399,806192866,629843090,161294107,617166178,373691476,151469850,782752292,630496558,835610992,159688302,210752114,438473017,893736578,147601071,209228786,656964852,714367256,103270434,407907231,477814980,181909428,864988537,259920408,990220257,824357819,116685586,347332532,38808860,659198136,625352605,20072620,994889588,186178091,195518969,855364158,926739502,851525897,822822026,780159620,440230985,579772994,277335022,660740908,759696686,768060227,484300018,940099290,325059541,194379046,217165801,613737497,88119124,401929125,433115769,974309147,293406038,57126585,803701090,800419341,336887956,535724325,483331544,376743917,376716234,392694911,818146025,277194647,607093108,246280890,743902014,230265210,568140472,631577844,751040644,376230594,133250304,976846669,910010632,779700375,125685881,94967981,633070399,310343205,938027477,107564820,574469911,127047037,563716523,436303114,319851798,907205144,950058169,384732537,448139367,279295465,413911703,538632031,124394927,954869908,76625559,219252179,518110081,395292643,890568823,782078532,564704049,15480758,137118588,166032720,648992729,558265718,24933004,365439553,224624148,419569660,983163514,589814307,390785113,222460383,983041016,397253951,243513065,283577066,680921297,504477414,802999539,210139183,489130010,6293891,296813229,393624029,983707699,584217247,696763649,251919232,964518448,128143120,433917039,25983958,826066537,599123664,990686764,321619267,639621733,306927499,194462500,446464370,705460907,593757425,622437699,156867095,610510520,907441350,969402405,602137956,510997199,965830782,4356506,595020627,909555528,431891322,414073059,333843353,226280738,829277437,802363187,817153524,916664779,130384117,380596667,129658945,249395475,998700234,425594286,76690575,361595069,544108317,878614305,978433509,891282591,520199285,917154864,450079178])
