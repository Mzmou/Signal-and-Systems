function MapSet=Build_mapset()
    MapSet=cell(2,32);
    alphabet = 'abcdefghijklmnopqrstuvwxyz .,!";';
    for i = 1:32
        MapSet{1,i} = alphabet(i);
        MapSet{2,i} = dec2bin(i-1, 5); 
    end
    