
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
            if m(I,J).SP.Side = Rebel  and m(I,J).Status = True then
               Ada.Text_IO.Put("R ");
            elsif m(I,J).SP.Side = Imperial  and m(I,J).Status = True then
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
