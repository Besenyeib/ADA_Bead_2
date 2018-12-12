
separate(simulation)
task body Agent is
   endtime : Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 1.0 );
begin
   while Ada.Calendar."<"(Ada.Calendar.Clock, endtime) loop
      ShipP.Call_Back;
   end loop;
end Agent;
