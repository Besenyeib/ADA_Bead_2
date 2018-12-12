separate(simulation)
task body Ship is
   alive : Boolean := True;
   c : Coord;
   s : Integer;
begin
   if azon = 666999 then
      --LÜKE
      s := Map.GetSize;
      while Map.IsEnded = False loop
         c := Safe_Random.RandCoord(s);
         if c.X = c.Y then
            Printer.PrintText("Van Ero");
--            Ada.Text_IO.Put_Line("van ero");
            IBase.Destroy;
         end if;
         delay 1.0;
      end loop;
      
   else
      
      while alive = True loop
         select
            accept Hit do
               --            Ada.Text_IO.Put_Line(Sides'Image(Side) & " ship lost");
               if Side = Rebel then
                  RBase.Ship_Lost;
               else 
                  IBase.Ship_Lost;
               end if;
               --Ada.Text_IO.Put_Line("halok");
               alive := False;
            end Hit;
         or
            accept Call_Back do
               --Ada.Text_IO.Put_Line("Visszahivva");
               alive := False;
            end Call_Back;
         or
            delay 0.5;
            --Ada.Text_IO.Put_Line("Lo");
            Projectile(Side);
         end select;
      end loop;
   end if;
   
end;
