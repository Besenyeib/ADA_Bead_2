separate(simulation)
procedure Projectile(Sidee : Sides) is
   coordinate : Coord;
begin
   coordinate := Safe_Random.RandCoord(Map.GetSize);
  If Map.GetShip(coordinate).Side = Sidee then
      Ada.Text_IO.Put_Line("NO TK");
   else
      if Map.GetStat(coordinate) = True then
         Ada.Text_IO.Put_Line("Loves Talalt");
         Map.GetShip(coordinate).Hit;
         Map.SetStat(coordinate);
      end if;
end if;


end Projectile;
