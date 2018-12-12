separate(simulation)
task body Ship is
begin
   loop
      select
         accept Hit do
            Ada.Text_IO.Put_Line("Eltalaltak");
            if Side = Rebel then
               RBase.Ship_Lost;
            else 
               IBase.Ship_Lost;
            end if;
         end Hit;
      or
         accept Call_Back do
            Ada.Text_IO.Put_Line("Visszahivva");
         end Call_Back;
      or
         delay 0.5;
         Ada.Text_IO.Put_Line("Lo");
         Projectile(Side);
      end select;

   end loop;
end;
