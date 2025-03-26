function myMapset=MapSet()
    myMapset=cell(2,32);
    alphabet = 'abcdefghijklmnopqrstuvwxyz .,!";';
    for i = 1:32
        myMapset{1,i} = alphabet(i);
        myMapset{2,i} = dec2bin(i-1, 5); 
    end
    
end