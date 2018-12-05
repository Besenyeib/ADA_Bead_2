with simulation-safe_random;
procedure Simulation is

   type Sides is (Rebel,Imperial);

   type ShipPointer is access Ship;
   ShipP : ShipPointer;

   type Coord is record
      X: Natural;
      Y: Natural;
   end record;

   -------------SAFE RANDOM
   separate protected Safe_Random(size: Integer) is
      function RandCoord return Coord;
   end Safe_Random;

   -------------PRINTER
   separate protected Printer is
      procedure PrintText(txt: in String);
      procedure PrintMap(m: in MapM);
   end Printer;

   -------------BASE
   separate task type Base(Side: Sides) is
      entry Send_Out_Ships(n: in Integer);
      entry Ship_Lost;
      entry Destroy;
   end Base;

   RBase : Base(Rebel);
   IBase : Base(Imperial);

   -------------SHIP
   separate task type Ship(Azon: Integer, Side: Sides) is
      entry Hit;
      entry Call_Back;
   end Ship;

   -------------PROJECTILE
   separate procedure Projectile(size : Integer);


   -------------MAP
   separate protected Map is
      function GetShip(c : Coord) return ShipPointer;
      function GetStat(c : Coord) return Booleand;
      procedure Init(n : in Integer);
      procedure EndFight

      private

      type MapTile  is record
         SP: ShipPointer;
         Status : Boolean;
      end record;

      type MapM is array (Integer range <>, Integer range <>) of MapTile;






begin
   --  Insert code here.
   null;
end Simulation;
