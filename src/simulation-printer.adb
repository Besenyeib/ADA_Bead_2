
separate(simulation)
protected body Printer is
   procedure PrintText(txt: in String) is
   begin
      Ada.Text_IO.Put_Line(txt);
   end;
   
   procedure PrintMap(m: in MapType; s: in Integer) is
   begin
      --Ada.Text_IO.Put_Line(Integer'Image(s));
      for I in 1..s loop 
         Ada.Text_IO.Put("|");
         for J in 1..s loop 
            if m(J,I).SP.Side = Rebel  and m(J,I).Status = True then
               Ada.Text_IO.Put("R ");
            elsif m(J,I).SP.Side = Imperial  and m(J,I).Status = True then
               Ada.Text_IO.Put("I ");
            else
               Ada.Text_IO.Put("  ");
            end if;
         end loop;
         Ada.Text_IO.Put("|");
         Ada.Text_IO.Put_Line("");
      end loop;
      Ada.Text_IO.Put_Line("");
   end PrintMap;
end Printer;
