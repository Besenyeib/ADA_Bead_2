separate(simulation)
task body Ship is
begin
   loop
      
      select
         accept Hit do
            if Side = Rebel then
               RBase.Ship_Lost;
            else 
               IBase.Ship_Lost;
            end if;
         end Hit;
         
      or
         accept Call_Back do
            null;
         end Call_Back;
      or
         delay 0.5;
         Projectile(Map.s,Side);
      end select;

   end loop;
end;
