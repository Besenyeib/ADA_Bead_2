with Ada.Text_IO;
procedure Simulation is

   type Sides is (Rebel,Imperial);


   -------------SHIP
   task type Ship(Azon: Integer; Side: Sides) is
      entry Hit;
      entry Call_Back;
   end Ship;

      type ShipPointer is access Ship;

   procedure Projectile(Side : Sides);

   task type Base(Side: Sides) is
      entry Send_Out_Ships(n: in Integer);
      entry Ship_Lost;
      entry Destroy;
   end Base;

   RBase : Base(Rebel);
   IBase : Base(Imperial);


   type Coord is record
      X: Integer;
      Y: Integer;
   end record;

   -------------SAFE RANDOM

   protected Safe_Random is
      function RandCoord(size: Integer) return Coord;
   end Safe_Random;

   protected body Safe_Random is separate;







   task body Ship is separate;


   --ShipP : ShipPointer;


   -------------ÁGNES
   task type Agent(ShipP : ShipPointer);
   type Agent_Access is access Agent;

   task body Agent is separate;

   -------------MAP
   type MapTile  is record
      SP: ShipPointer;
      Status : Boolean;
   end record;

   type MapType is array (Integer range <>, Integer range <>) of MapTile;

   protected Map is
      function GetShip(c : Coord) return ShipPointer;
      function GetStat(c : Coord) return Boolean;
      function GetSize return Integer;
      procedure Init(n : in Integer);
      procedure EndFight;

   private
      s: Integer;
      MapM : MapType(Integer,Integer);

   end Map;

   protected body Map is separate;

   -------------BASE


   task body Base is separate;

   -------------PRINTER
   protected Printer is
      procedure PrintText(txt: in String);
      procedure PrintMap(m: in MapType);
   end Printer;



   protected body Printer is separate;


   -------------PROJECTILE
   procedure Projectile(Side : Sides) is separate;


begin
   Ada.Text_IO.Put_Line("asd");
   Map.Init(10);

end Simulation;
