with Ada.Text_IO;
separate(simulation)
protected body Map is
   function GetShip(c : Coord) return ShipPointer is
   begin
      return MapM(c.X,c.Y).SP;
   end GetShip;
   
   function GetStat(c : Coord) return Boolean is
   begin
      return MapM(c.X,c.Y).Status;
   end GetStat;
   
   function GetSize return Integer is
   begin
      return s;
   end GetSize;
   
   
   procedure Init(n : in Integer) is
   begin
      Ada.Text_IO.Put_Line("Init Start");
      s :=  n;
      for I in 1..n loop
         for J in 1..n loop
            MapM(I,J).SP := null;
            MapM(I,J).Status := False;
         end loop;
      end loop;
      Ada.Text_IO.Put_Line("Init Done");
   end Init;
   
   procedure EndFight is
      A: Agent_Access;
   begin
      for I in 1..s loop
         for J in 1..s loop
            if MapM(I,J).Status = True then
              A := new Agent(MapM(I,J).SP);
            end if;
         end loop;
      end loop;
      
   end EndFight;
   
   
end Map;
