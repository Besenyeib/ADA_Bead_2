separate(simulation)
procedure Projectile(Sidee : Sides) is
   coordinate : Coord;
begin
   coordinate := Safe_Random.RandCoord(Map.GetSize);
  If Map.GetShip(coordinate).Side = Sidee then
      --Ada.Text_IO.Put_Line("NO TK");
      null;
   else
      if Map.GetStat(coordinate) = True then
         --Ada.Text_IO.Put_Line("Loves Talalt");
         Map.SetStat(coordinate);
         Map.GetShip(coordinate).Hit;
         Printer.PrintMap(Map.GetMapM,Map.GetSize); 
                 
      end if;
end if;


end Projectile;
