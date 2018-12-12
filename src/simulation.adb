with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Calendar;
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

   -------------SHIP
   task type Ship(Azon: Integer; Side: Sides) is
      entry Hit;
      entry Call_Back;
   end Ship;

   type ShipPointer is access Ship;

   procedure Projectile(Sidee : Sides);

   task type Base(Side: Sides) is
      entry Send_Out_Ships(n: in Integer);
      entry Ship_Lost;
      entry Destroy;
   end Base;

   RBase : Base(Rebel);
   IBase : Base(Imperial);






   protected body Safe_Random is separate;





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
      function GetMapM return MapType;
      function IsEnded return Boolean;
      procedure SetStat(c : in Coord);
      procedure Init(n : in Integer);
      procedure EndFight;

   private
      s: Integer;
      MapM : MapType(1..10,1..10);
      isend : Boolean := False;

   end Map;

   protected body Map is separate;

   -------------BASE


   task body Base is separate;

   -------------PRINTER
   protected Printer is
      procedure PrintText(txt: in String);
      procedure PrintMap(m: in MapType; s: in Integer);
   end Printer;

   task body Ship is separate;


   protected body Printer is separate;


   -------------PROJECTILE
   procedure Projectile(Sidee : Sides) is separate;

   luktime : Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 5.0 );
   lukp : ShipPointer;
   vanluk : Boolean := False;

begin

   Map.Init(6);
   --RBase.Send_Out_Ships(8);
   --IBase.Send_Out_Ships(8);
   Printer.PrintMap(Map.GetMapM,Map.GetSize);
   --Ada.Text_IO.Put_Line("Sim Begin");
   while Map.IsEnded = False loop
      if Ada.Calendar.">"(Ada.Calendar.Clock, luktime)  and vanluk = False then
        Printer.PrintText("Luke joined");
         lukp := new Ship(666999,Rebel);
         vanluk := True;
      end if;
   end loop;

   --Ada.Text_IO.Put_Line("VÉGA");

   abort IBase;
   abort RBase;
   return;

end Simulation;
