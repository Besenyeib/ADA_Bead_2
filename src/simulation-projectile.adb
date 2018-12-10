separate(simulation)
procedure Projectile(Side : Sides) is
   coordinate : Coord;
begin
   coordinate := Safe_Random.RandCoord(Map.GetSize);
   
   If Map.GetShip(coordinate).Side = Side then
      null;
   else
      if Map.GetStat(coordinate) = True then
         Map.GetShip(coordinate).Hit;
         
      end if;
   end if;
end Projectile;
