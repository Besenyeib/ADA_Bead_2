
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
  
   
   function IsEnded return Boolean is
   begin
      return isend;
   end IsEnded;
   
   function GetMapM return MapType is
   begin
      return MapM;
   end GetMapM;
   
   procedure SetStat(c : in Coord) is
   begin
      MapM(c.X,c.Y).Status := False;
   end SetStat;
   
   
   procedure Init(n : in Integer) is
   begin
      
      --      Ada.Text_IO.Put_Line("Init Start");
      --      s :=  n;
      --      for I in 1..n loop
      --         for J in 1..n loop
      --            --MapM(I,J).SP := null;
      --            MapM(I,J).Status := True;
      --         end loop;
      --      end loop;
      --      Ada.Text_IO.Put_Line("Init Done");
      
      
      --Ada.Text_IO.Put_Line("Init Start");
      for I in 1..n loop
         for J in 1..n loop
            MapM(I,J).Status := True;
            if J <= n/2 then
               MapM(I,J).SP := new Ship((J+(I-1)*n),Imperial);
            else
               MapM(I,J).SP := new Ship((J+(I-1)*n),Rebel);
            end if;
         end loop ;
      end loop;
      
      
      IBase.Send_Out_Ships((n*n)/2);
      
      RBase.Send_Out_Ships((n*n)/2);
      s := n;
      --Ada.Text_IO.Put_Line("Init End");
   end Init;
   
   procedure EndFight is
      A: Agent_Access;
   begin
      isend := True;
      --Ada.Text_IO.Put_Line("End Fight start");
      for I in 1..s loop
         for J in 1..s loop
            if MapM(I,J).Status = True then 
               A := new Agent(MapM(I,J).SP);
               MapM(I,J).Status := False;
            end if;
            
         end loop;
      end loop;
      --Ada.Text_IO.Put_Line("End Fight End");
      return;
   end EndFight;
end Map;
