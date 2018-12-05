with Ada.Numerics.Discrete_Random;

protected body Safe_Random(size: Integer) is
   subtype Rangee is Integer range 1..size;
   function RandCoord return Coord is
      package rand is  new Ada.Numerics.Discrete_Random(Rangee);
      use rand;
      G : Generator;
   begin
      Reset(G);
      return Rando(G);
   end;
end Safe_Random;
