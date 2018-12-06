separate(simulation)
procedure Projectile(size : Integer; Side : Sides) is
   coordinate : Coord;
begin
   coordinate := Safe_Random.RandCoord(size);
   
   If Map.GetShip(coordinate).Side = Side then
      null;
   else
      if Map.GetShip(coordinate).Stat = True then
         Map.GetShip(coordinate).Hit;
         
      end if;
   end if;
end Projectile;
