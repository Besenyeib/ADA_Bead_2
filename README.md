Ada: 2. Beadandó
A feladat a Star Wars: New Hope űrcsata jelenetének szimulációja lesz. A feladatot taszkok és védett egységek segítségével valósítsd meg, ezek mind külön fájlokban jelenjenek meg (separate kulcsszó). A feladat értékelésénél a funkcionális helyességen túl figyelembe vesszük a tanult nyelvi elemek használatát, és a kód szépségét is. A beadandó fájlok:

simulation.adb
simulation-printer.adb
simulation-safe_random.adb
simulation-map.adb
simulation-ship.adb
simulation-base.adb
simulation-projectile.adb
simulation-agent.adb
Ezen felül segéd-alprogramok is megadhatóak, de csak forráskód adható be. Ahol a feladat nem rendelkezik pontos definícióval, ott több megoldást is megvalósíthat (a fentiekre figyelemmel). A program a szimuláció végén mindig termináljon szabályosan.

Főkoncepció
Két fél kűzd egymás ellen (Imperial, Rebel). A feladat során egy pályán (mátrixon) számos hajó (Ship) lő egymásra lövedékeket (Projectile). Ha egy ilyen lövedék eltalál egy hajót, az felrobban (terminál). A hajók pozícióját a pálya (Map) tartja számon, a bázisok (Base) csak a hajók számával rendelkeznek. Ha egy bázis érzékeli, hogy az összes hajója elveszett, feladja a harcot. Ezen felül a bázis el is pusztítható (Destroy belépési pont), ekkor is véget ér a harc és a hajók visszahívásra kerülnek.

Védett egységek
A feladat során szükség lesz random szám generálásra és kiírásra. Kiírással dokumentáljon minden nagyobb eseményt, valamint változás esetén a pálya teljes állapotát. A Safe_Random védett egység egyelőre (később szükséges lesz kiegészíteni) egy eljárással rendelkezzen, mely kimenő paramétere egy random koordináta.

A kiírást egy Printer védett egységgel valósítsa meg. Ez rendelkezzen két eljárással, az egyik egy szöveg, a másik egy mátrix (ez lesz a pálya) esztétikus kiírását valósítsák meg. Utóbbinál látszódjanak az üres, a Rebel és az Imperial hajók által elfoglalt mezők.

Bázis
A bázis egy olyan task type legyen, mely három belépési ponttal rendelkezik:

Send_Out_Ships(Integer): kezdetben erre a hívásra vár a bázis, paraméterként megkapja, hogy hány hajóból áll a flottája.
Ship_Lost: hívás esetén csökkenti a hajóinak a számát.
Destroy: hívás esetén lenullázza a hajóinak a számát, visszahívja azokat (lásd később), illetve terminál.
A bázis diszkriminánsa adja meg, hogy melyik oldalhoz tartozik.

Hajó
A hajó (Ship) diszkriminánsa egy azonosító, valamint a hovatartozása legyen. A hajók addig végzik tevékenységüket, amíg nem éri őket találat, vagy nem hívják vissza őket. Belépési pontjai így tehát a Hit és egy Call_Back legyen. Amennyiben a hajót visszahívják, termináljon. Amennyiben találat éri, jelezze azt az oldalának megfelelő bázisnak (vegyük figyelembe, hogy a bázis eközben felrobbanhat).

Ha a fenti két hívás nem történt meg 0.5 másodpercen belül, indítson útjára egy lövedéket (Projectile), majd kezdje előről a folyamatot.

Lövedék
A lövedék (a filmhez hűen) véletlenszerűen generál (Safe_Printer-t használva) egy célpontkoordinátát, ahol ha ott az ellenfél hajója tartózkodik, meghívja annak a Hit belépési pontját. Figyeljünk, hogy csak akkor próbálkozzunk, ha a célpont nem terminált.

Pálya
A szimuláció központi eleme egy Map védett egység, mely a pálya mátrixreprezentációját tartalmazza. A mátrix elemei rekordok, melyek a hajókra mutató mutatókat, illetve azok státuszát megadó logikai értéket tartalmaznak.

Adjon lekérdezőműveletet a pálya elemeire, módosító műveletet a státuszukra vonatkozóan (utóbbit módosítja például a lövedék).

A pályának legyen egy Init eljárása, mely a pálya baloldalát Imperial, a jobboldalát Rebel hajókkal tölti fel. Ezt követően küldje el a bázisoknak a hajók számát.

Legyen továbbá egy End_Fight eljárása is a Map-nek, ezt valamelyik bázis fogja meghívni, ha az épp terminálás előtt áll. Az End_Fight a csata végét jelzi, így ebben az alprogramban a megmaradt hajók visszahívásáról kell gondoskodni. A visszahívást egy ágens taszk segítségével valósítsa meg, melynek diszkriminánsa a hajó mutatója legyen.

A szimuláció
A főprogramban példányosítson két bázist (Death_Star és Rebel_Base), mindkét oldalnak, illetve hívja meg a Map.Init eljárást, mellyel megkezdődik a csata. A szimulációt futtassa egy 10 * 10-es pályán. (Itt nem érdemes addig folytatni a feladat megoldását, amíg a fentiek nem működnek tökéletesen.)

Luke Skywalker
A csata kezdetétől eltelt öt másodperc után jelenjen meg Luke_Skywalker, aki ugyanúgy egy hajó típusú egység lesz. Luke célja a Death_Starelpusztítása, annak Destroy belépési pontjának meghívásával. Ehhez picit módosítani kell a Ship implementációját, a lövés helyett Luke generáltasson két random számot (ez [1..Max], ahol Max a pálya mérete), melyek ha megegyeznek, akkor megérezte, hogy vele van az erő, és el tudja találni a Death_Star gyenge pontját, elpusztítva azt. Ellenkező esetben nem érzi még az erőt, és ebben a pillanatban nem csinál semmit.