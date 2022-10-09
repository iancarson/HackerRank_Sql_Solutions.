delimiter $
create procedure isprime(N int)
begin
    declare c varchar(1000) default '';
    declare p int default 2;
    declare t int;
    declare i int;
    declare r int;
    while p <= N do
        set t = 0;
        set i = 1;
        a:while i <= p do
            set r = p % i;
            if r = 0 and i not in (1, p)
                then begin
                        set t = 1;
                        leave a;
                     end;
            end if;
            set i = i + 1;
        end while a;
        if t = 0 then set c = concat(c, p, '&');
        end if;
        set p = p + 1;
    end while;
    set c = substring(c, 1, length(c)-1);
    select c;
end $
delimiter ;
call isprime(1000);
