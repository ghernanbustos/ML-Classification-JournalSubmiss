% GeneraGrafSens: Gráficos de sensibilidad para el paper NNSSC
clear all,clc;
%%%% Datos
Dir_calc = 'C:\Users\guill\OneDrive\Escritorio\Master_ann_paper_hpo\0_PAPER_Review_ML_Traditional_ClassificationLearner\Chirp_ann_manually';
%nom_arch_txt = 'DeltaSigmaMat_Sinc';
%nom_arch_txt = 'DeltaSigmaMat_Gauss';
nom_arch_txt = 'SensAuxOutput_deltaSigma';
nom_Dir_arch = [Dir_calc,'\',nom_arch_txt];

arch_txt = 0;
[arch_txt,mensaje_arch] = fopen([nom_Dir_arch,'.txt'],'rt');
if arch_txt == -1 
    disp(mensaje_arch);
    return
end

frewind(arch_txt);
vint = [];
vsig = [];
vder = [];
for nparam = 1:10
    cad = fgetl(arch_txt);
    %disp(cad);
    if isempty(cad) == 0
        cad_dat = sscanf(cad,'%E,%E,%E,%E,%E');
        for nfil = 1:5
            vint(nfil,nparam) = cad_dat(nfil);
        end
        if feof(arch_txt) == 1
            break;
        end
    end
end
for nparam = 1:10
    cad = fgetl(arch_txt);
    %disp(cad);
    if isempty(cad) == 0
        cad_dat = sscanf(cad,'%E,%E,%E,%E,%E');
        for nfil = 1:5
            vsig(nfil,nparam) = cad_dat(nfil);
        end
        if feof(arch_txt) == 1
            break;
        end
    end
end
for nparam = 1:10
    cad = fgetl(arch_txt);
    %disp(cad);
    if isempty(cad) == 0
    cad_dat = sscanf(cad,'%E,%E,%E,%E,%E');
        for nfil = 1:5
            vder(nfil,nparam) = cad_dat(nfil);
        end
        if feof(arch_txt) == 1
            break;
        end
    end
end


%%%% Datos-----------------------------------------------------------------
vsiglog = log10(vsig);
vderlog = log10(vder);
vintlog = log10(vint);


tamfont = 14;
vsum = [];
ffig = figure;
ffig.Position(1) = 100;
ffig.Position(2) = 50;
ffig.Position(3) = ffig.Position(3) * 1.5;
ffig.Position(4) = ffig.Position(4) * 1.75;
for nf = 1:5
    valp = [];
    for n=1:10
        valp = [valp; vintlog(nf,n) vsiglog(nf,n) vderlog(nf,n)];
    end

    fgp = subplot(5,1,nf);
    fpos1 = get(fgp,'Position');
    fpos1(1) = fpos1(1) - 0.03;
    fpos1(2) = fpos1(2) - 0.02;
    fpos1(3) = fpos1(3) * 1.15;
    fpos1(4) = fpos1(4) * 1.2;
    set(fgp,'Position',fpos1)

    gb = bar(valp,'FaceColor','flat');
    gb(1).CData = [0 1 0];
    gb(2).CData = [1 0 0];
    gb(3).CData = [0 0 1];

    ylim([-1,2]);
    ax = gca;
    ax.XGrid = 'on';
    ax.YGrid = 'on';
    ax.Box = 'on';
    ax.FontName = 'Times New Roman';
    ax.FontWeight = 'bold';
    ax.LineWidth = 2;
    ax.FontSize = tamfont;
    % yticks([0 25 50 75 100]);
    xticklabels([]);
end

