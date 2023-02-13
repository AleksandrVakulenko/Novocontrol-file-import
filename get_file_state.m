


function State = get_file_state(lines)

%FIXME: number of lines could be less than 4
% header_lines = lines(1:4);


pattern = 'Diameter';
line_number_Dia = find_pattern(lines, pattern);

pattern = 'Fixed';
line_number_Fix = find_pattern(lines, pattern);

pattern = 'Freq';
line_number_Fr = find_pattern(lines, pattern);

pattern = 'Temp';
line_number_Te = find_pattern(lines, pattern);


% units line cases
if line_number_Fr ~= 0 && line_number_Te == 0
    file_state = File_packing.temp;
    line_number_unit = line_number_Fr;
end
if line_number_Fr == 0 && line_number_Te ~= 0
    file_state = File_packing.freq;
    line_number_unit = line_number_Te;
end
if line_number_Fr ~= 0 && line_number_Te ~= 0 && line_number_Fr == line_number_Te
    file_state = File_packing.freq_temp;
    line_number_unit = line_number_Fr;
end
if line_number_Fr == 0 && line_number_Te == 0
    file_state = File_packing.no_units;
    line_number_unit = 0;
end
%FIXME: error on >> file_state = 'no units'

% comment line cases
if line_number_Dia > 1 || line_number_Fix > 1
    tmp = [line_number_Dia line_number_Fix];
    tmp(tmp==0) = [];
    line_number_comm = min(tmp)-1;
else
    line_number_comm = 0;
end


State.packing = file_state;
State.line_comm = line_number_comm;
State.line_geom = line_number_Dia;
State.line_fix = line_number_Fix;
State.line_units = line_number_unit;

end





function line_number = find_pattern(header_lines, pattern)
index = zeros(1, 4);
for i = 1:4 %FIXME: magic constant (4)
    line = char(header_lines(i));
    tmp = strfind(line(1:19), pattern); %FIXME: magic constant (19)
    if isempty(tmp)
        index(i) = 0;
    else
        index(i) = tmp;
    end
    
end
line_number = find(index);
if isempty(line_number)
    line_number = 0;
end
end



