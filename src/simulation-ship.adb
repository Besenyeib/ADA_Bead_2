task body Ship is
begin
   loop
      
      select
         accept Hit do
            if Side = Rebel then
               RBase.Ship_Lost;
            else 
               IBase.Ship_Lost;
         end Hit;
         
      or
         accept Call_Back do
            exit;
         end Call_Back;
      or
         delay 0.5;
         --Projectile dolog
      end select;

   end loop;
end;