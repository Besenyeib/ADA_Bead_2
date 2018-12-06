procedure Simulation is

   type Sides is (Rebel,Imperial);


   type Coord is record
      X: Integer;
      Y: Integer;
   end record;

   -------------SAFE RANDOM

   protected Safe_Random is
      function RandCoord(size: Integer) return Coord;
   end Safe_Random;

   protected body Safe_Random is separate;


   -------------PROJECTILE
   procedure Projectile(size : Integer; Side : Sides) is separate;


   -------------SHIP
   task type Ship(Azon: Integer; Side: Sides) is
      entry Hit;
      entry Call_Back;
   end Ship;

   task body Ship is separate;

   type ShipPointer is access Ship;
   ShipP : ShipPointer;

   -------------BASE
   task type Base(Side: Sides) is
      entry Send_Out_Ships(n: in Integer);
      entry Ship_Lost;
      entry Destroy;
   end Base;

   task body Base is separate;

   RBase : Base(Rebel);
   IBase : Base(Imperial);

   -------------MAP
   type MapTile  is record
      SP: ShipPointer;
      Status : Boolean;
   end record;

   type MapType is array (Integer range <>, Integer range <>) of MapTile;

   protected Map is
      function GetShip(c : Coord) return ShipPointer;
      function GetStat(c : Coord) return Boolean;
      procedure Init(n : in Integer);
      procedure EndFight;

      private
      s: Integer;
      MapM : MapType(Integer,Integer);

   end Map;

   protected body Map is separate;

   -------------PRINTER
   protected Printer is
      procedure PrintText(txt: in String);
      procedure PrintMap(m: in MapType);
   end Printer;

   protected body Printer is separate;




   -------------ÁGNES
   --separate task Agent(ShipP : ShipPointer) is
   --   null
   --end Agent;


begin
   --  Insert code here.
   null;
end Simulation;
