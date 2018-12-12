
separate(simulation)
task body Base is
   ShipCount : Integer := 0;

begin
   accept Send_Out_Ships(n: in Integer) do
      ShipCount := n;
   end Send_Out_Ships;
   loop
      select 
         accept Ship_Lost do
            ShipCount := ShipCount - 1;
            if ShipCount = 0 then
               Ada.Text_IO.Put(Sides'Image(Side));
               Ada.Text_IO.Put("Battle Lost");
               Ada.Text_IO.Put_Line("");
               Map.EndFight;
               return;
            end if;
         end Ship_Lost;
      or
         accept Destroy do
            ShipCount := 0;
            Ada.Text_IO.Put(Sides'Image(Side));
            Ada.Text_IO.Put("s Lost to Luke");
            Ada.Text_IO.Put_Line("");
            Map.EndFight;
            return;
         end Destroy;
      end select;
   end loop;
end;
