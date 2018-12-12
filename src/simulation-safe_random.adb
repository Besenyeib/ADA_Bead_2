
separate(simulation)
protected body Safe_Random is
   function RandCoord(size: Integer) return Coord is
      subtype Rangee is Integer range 1..size;
      package rand is  new Ada.Numerics.Discrete_Random(Rangee);
      use rand;
      G : Generator;
      c : Coord;
   begin
      Reset(G);
      c.X := Random(G);
      c.Y := Random(G);
      return c;
   end;
end Safe_Random;
