
separate(simulation)
protected body Printer is
   procedure PrintText(txt: in String) is
   begin
      Ada.Text_IO.Put_Line(txt);
   end;
   
   procedure PrintMap(m: in MapType) is
   begin
      for I in m'Range(1) loop 
         for J in m'Range(1) loop 
            if m(I,J).SP.Side = Rebel then
               Ada.Text_IO.Put("R ");
            elsif m(I,J).SP.Side = Imperial then
               Ada.Text_IO.Put("I ");
            else
               Ada.Text_IO.Put("  ");
            end if;
         end loop;
         Ada.Text_IO.Put_Line("");
      end loop;
   end PrintMap;
end Printer;
