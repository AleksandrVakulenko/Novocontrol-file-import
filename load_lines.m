

file(1) = "10.TXT";
file(2) = "20.TXT";
file(3) = "30.TXT";
file(4) = "40.TXT";
file(5) = "50.TXT";
file(6) = "60.TXT";
file(7) = "70.TXT";
file(8) = "ALL_IN_ONE.TXT";
file(9) = "ALL_IN_ONE_nopoints.TXT";
file(10) = "ALL_IN_ONE_nounits.TXT";
file(11) = "MANY_CO0.TXT";
file(12) = "ONE_COL0.TXT";
file(13) = "T0.TXT";

clc

i = 3;

fid = fopen(strcat('examples2/', file(i))); %FIMXE: error check


line1 = file_get_line(fid);
line2 = file_get_line(fid);
line3 = file_get_line(fid);
line4 = file_get_line(fid)


fclose(fid); %FIMXE: error check




function line = file_get_line(fid)
%FIXME: may be empty
line = fgets(fid);
if int8(line(end)) == 10
    line = line(1:end-1);
end
if int8(line(end)) == 13
    line = line(1:end-1);
end

end
