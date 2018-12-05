with Ada.Numerics.Discrete_Random;

protected body Safe_Random is
   function RandCoord return Coord is
      package rand is  new Ada.Numerics.Discrete_Random(Natural);
      use rand;
      G : Generator;
   begin
      Reset(G);
      return Rando(G);
   end;
end Safe_Random;
