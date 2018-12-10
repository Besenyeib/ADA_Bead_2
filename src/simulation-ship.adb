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
            return;
         end Call_Back;
      or
         delay 0.5;
         Projectile(Side);
      end select;

   end loop;
end;
