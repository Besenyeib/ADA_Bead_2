
separate(simulation)
task body Agent is
   endtime : Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 1.0 );
begin
   while Ada.Calendar."<"(Ada.Calendar.Clock, endtime) loop
      ShipP.Call_Back;
      --Ada.Text_IO.Put_Line("agnes");
   end loop;
end Agent;
