task body Base is
   ShipCount : Integer;
begin
   loop
      select 
         accept Send_Out_Ships(n: in Integer) do
            //TODO
         end Send_Out_Ship;
      or
         accept Ship_Lost do
            //TODO
         end Ship_Lost;
      or
         accept Destroy do
            //TODO
         end Destroy;
      end select;
   end loop;
end;
