


str1 = " Freq. [Hz]	 Eps'    	  Cp' [F]	Tan(Delta)  	 Zs'' [Ohms]	 Eps''   	 Sig' [S/cm]	 Zs' [Ohms]	M Temp [K]";



variant = [
"Freq. [Hz]";
"Temp. [K]";
"Eps' ";
"Eps''";
"Cp' [F]";
"Tan(Delta)";
"Sig' [S/cm]";
"Sig'' [S/cm]";
"Zs' [Ohms]";
"Zs'' [Ohms]";
"Zp' [Ohms]";
"M Temp [K]";
"M Time M[s]";
];


clc
present_variants = [];
for i = 1:numel(variant)
    
    ind = strfind(str1, variant(i));
    
    if ~isempty(ind)
        present_variants = [present_variants i];
        disp(variant(i));
    end
end



