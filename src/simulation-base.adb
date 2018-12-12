
separate(simulation)
task body Base is
   ShipCount : Integer := 0;

begin
   accept Send_Out_Ships(n: in Integer) do
      ShipCount := n;
   end Send_Out_Ships;
   
   while ShipCount > 0 loop
      select 
         accept Ship_Lost do  
            if ShipCount = 1 then
               Ada.Text_IO.Put_Line(Sides'Image(Side) & "s Lost Battle");
               Map.EndFight;
            end if;
            ShipCount := ShipCount - 1;
         end Ship_Lost;
      or
         accept Destroy do
            
            Ada.Text_IO.Put(Sides'Image(Side));
            Ada.Text_IO.Put("s Lost to Luke");
            Ada.Text_IO.Put_Line("");
            Map.EndFight;
            ShipCount := 0;
         end Destroy;
      end select;
   end loop;
end;
