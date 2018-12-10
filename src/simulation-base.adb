with Ada.Text_IO;
separate(simulation)
task body Base is
   ShipCount : Integer;
   ShipP : ShipPointer;
begin
   Ada.Text_IO.Put_Line("a");
   accept Send_Out_Ships(n: in Integer) do
      for I in 1..n loop
         ShipP := new Ship(I,Side);
      end loop;
      ShipCount := n;
   end Send_Out_Ships;
   
   loop
      select 
         accept Ship_Lost do
            ShipCount := ShipCount - 1;
            if ShipCount = 0 then
               --Ada.Text_IO.Put(Text_IO'Image(Side));
               Ada.Text_IO.Put("s Lost");
               Map.EndFight;
               return;
            end if;
         end Ship_Lost;
      or
         accept Destroy do
            ShipCount := 0;
            --Ada.Text_IO.Put(Text_IO'Image(Side));
            Ada.Text_IO.Put("s Lost");
            Map.EndFight;
         end Destroy;
      end select;
   end loop;
end;
