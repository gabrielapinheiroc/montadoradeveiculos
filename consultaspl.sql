DECLARE    
    nv_num_linha INTEGER;
    nv_capacidade INTEGER;
    nv_nivelcapacidade VARCHAR2(255);
BEGIN
    SELECT capacidade INTO nv_capacidade FROM Linha_montagem WHERE num_linha = nv_num_linha;
    CASE nv_capacidade
        WHEN 10 THEN nv_nivelcapacidade := 'nivel A';
        WHEN 11 THEN nv_nivelcapacidade := 'nivel B';
        WHEN 12 THEN nv_nivelcapacidade := 'nivel C';
        WHEN 13 THEN nv_nivelcapacidade := 'nivel D';
        WHEN 14 THEN nv_nivelcapacidade := 'nivel E';
        WHEN 15 THEN nv_nivelcapacidade := 'nivel F';
        WHEN 16 THEN nv_nivelcapacidade := 'nivel G';
        WHEN 17 THEN nv_nivelcapacidade := 'nivel H';
        WHEN 18 THEN nv_nivelcapacidade := 'nivel I';
    END CASE;
        dbms_output.put_line(nv_nivelcapacidade);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Não foi possivel identificar a capacidade');
END;