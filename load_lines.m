
% example files
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
file(14) = "_01_No_fix.TXT";
file(15) = "_02_No_dia.TXT";
file(16) = "_03_No_comm.TXT";

clc

file_N = 15;

fid = fopen(strcat('examples2/', file(file_N))); %FIMXE: error check

% FIXME: maybe read all lines at ones, or append after error check
i = 0;
lines = "";
while ~feof(fid)
    i=i+1;
    lines(i, 1) = file_get_line(fid);
end
fclose(fid); %FIMXE: error check

% line1 = file_get_line(fid);
% line2 = file_get_line(fid);
% line3 = file_get_line(fid);
% line4 = file_get_line(fid);


State = get_file_state(lines);

disp('-----------------------')
disp(['File state: ' State.packing.char()])
disp(['Comms line: ' num2str(State.line_comm)])
disp(['Geom line: ' num2str(State.line_geom)])
disp(['FixV line: ' num2str(State.line_fix)])
disp(['Units line: ' num2str(State.line_units)])
disp('-----------------------')


% TODO: read about try-catch to check errors
if State.packing == File_packing.no_units
    error('no units in file header') 
end

% TODO: add comment parse function
% TODO: add geometry parse function
% TODO: add Fix values parse function


% TODO: make function
variant = get_variants();
present_variants = [];
for i = 1:numel(variant)
    ind = strfind(lines(State.line_units), variant(i));
    if ~isempty(ind)
        present_variants = [present_variants i];
        disp([num2str(i) ' : ' char(variant(i))]);
    end
end





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
