close all;
snr_db_array = [4 5 10 15 25 30 ];

%     knn
%     byn
%     svm
%     ann

% mat_sinc_4params = [ 43.9 75.3 89 100;
%                       39.2 69.6 88.3 99.9;
%                       40.9 69.3 85.6 100;
%                       35.6 64.4 84.5 100];

mat_sinc_relieff = [  100  100  100  100  100 100;
                      83.3 83.4 87.6 88.4 87  95.3;
                      67.2 69.5 75.5 72.4 72  72.9;
                      35.5 56.6 59.2 57.5 59.6 52.5];

mat_sinc_mrmr = [       100	    99.5	100	    100	    100	100;
                        83.3	91.4	93.3	87	    94	95.3;
                        67.2	68.9	69.6	69.2	75	72.9;
                        35.5	44.9	46.2	51.4	53	52.5];


mat_gauss_relieff = [ 66.5	85.9	88.4	86.7	90	96.3
                        61.3	73.8	78.4	70.7	77.3	85.7
                        15.1	43.9	45.7	34.2	27.3	39.5
                        30.2	28.4	28.5	20.9	25	26.1
                                                                    ];

mat_gauss_mrmr = [      66.5	85.9	84.9	89.1	93.9	96.3
                        61.3	75	75.7	79.3	84.2	85.7
                        15.1	29.2	26	38.1	21.1	39.5
                        30.2	36.9	34	26.4	34.4	26.1
                                                                    ];

mat_chirp_relieff = [ 99.4	100	100	100	100	100
                        92.5	98.6	99.7	99.5	98.9	99.6
                        70	89.5	93	90.8	91.6	92.4
                        41.9	64.7	75	70.2	70.7	67.6
                        ];

mat_chirp_mrmr = [      99.4	100	100	100	100	100
                        92.5	97.3	98.5	99.6	99.5	99.6
                        70	76	86	91.4	90.5	92.4
                        41.9	50.1	57.7	67.6	62.2	67.6
                    ];

% mat_gauss_4params = [ 28.1 79.2 66.1 79.3;
%                       20.2 60.8 56.5 61.5;
%                       20 77.9 62.8 78.5;
%                       29.6 66 60.9 66.3];
% 
% mat_gauss_30params = [ 36 26.8 79.6 89.1;
%                       20 30 69.9 84.6;
%                       33.5 23.7 89 97.5;
%                       38.6 33.6 84.1 95.5]
% 
% mat_chirp_4params = [ 54.7 78.2 95.1 99.2;
%                       28.8 50.3 83.7 96.1;
%                       54 71.3 93.5 99.4;
%                       44.4 72.1 92.3 99.1];
% 
% mat_chirp_30params = [ 79.3 95.2 99.8 100;
%                       71.5 86.9 99.2 100;
%                       87.2 96.4 99.7 100;
%                       75.1 95.2 99.7 100]

figure
    subplot(2,1,1)
        plot(   snr_db_array,mat_sinc_relieff(1,:),'--o', ...
                snr_db_array,mat_sinc_relieff(2,:),'--o', ...
                snr_db_array,mat_sinc_relieff(3,:),'-o', ...
                snr_db_array,mat_sinc_relieff(4,:),'-o');
        xlabel( 'SubSet', 'FontSize', 10 )
        ylabel( 'Acc(%)', 'FontSize', 10, 'Rotation', 90 )
        legend({'25db','20db','15db','10db'},'Location','southeast')
        subtitle('Sinc RelieFF')
        grid on
        grid minor
    subplot(2,1,2) 
        title( 'Sinc 30 params', 'FontSize', 16 )
        plot(   snr_db_array,mat_sinc_mrmr(1,:),'--o', ...
                snr_db_array,mat_sinc_mrmr(2,:),'--o', ...
                snr_db_array,mat_sinc_mrmr(3,:),'-o', ...
                snr_db_array,mat_sinc_mrmr(4,:),'-o');
        xlabel(  'SubSet', 'FontSize', 10 )
        ylabel( 'Acc(%)', 'FontSize', 10, 'Rotation', 90 )
        legend({'25db','20db','15db','10db'},'Location','southeast')
        subtitle('Sinc MRMR')
        grid on
        grid minor
hold off

figure
    subplot(2,1,1)
        plot(   snr_db_array,mat_gauss_relieff(1,:),'--o', ...
                snr_db_array,mat_gauss_relieff(2,:),'--o', ...
                snr_db_array,mat_gauss_relieff(3,:),'-o', ...
                snr_db_array,mat_gauss_relieff(4,:),'-o');
        xlabel(  'SubSet', 'FontSize', 10 )
        ylabel( 'Acc(%)', 'FontSize', 10, 'Rotation', 90 )
        legend({'25db','20db','15db','10db'},'Location','southeast')
        subtitle('Gauss RelieFF')
        grid on
        grid minor
    subplot(2,1,2) 

        plot(   snr_db_array,mat_gauss_mrmr(1,:),'--o', ...
                snr_db_array,mat_gauss_mrmr(2,:),'--o', ...
                snr_db_array,mat_gauss_mrmr(3,:),'-o', ...
                snr_db_array,mat_gauss_mrmr(4,:),'-o');
        xlabel(  'SubSet', 'FontSize', 10 )
        ylabel( 'Acc(%)', 'FontSize', 10, 'Rotation', 90 )
        legend({'25db','20db','15db','10db'},'Location','southeast')
        subtitle('Gauss MRMR')
        grid on
        grid minor
hold off


figure
%     title( 'Sinc 4 params', 'FontSize', 16 )
    subplot(2,1,1)

        plot(   snr_db_array,mat_chirp_relieff(1,:),'--o', ...
                snr_db_array,mat_chirp_relieff(2,:),'--o', ...
                snr_db_array,mat_chirp_relieff(3,:),'-o', ...
                snr_db_array,mat_chirp_relieff(4,:),'-o');
        xlabel(  'SubSet', 'FontSize', 10 )
        ylabel( 'Acc(%)', 'FontSize', 10, 'Rotation', 90 )
        legend({'25db','20db','15db','10db'},'Location','southeast')
        subtitle('Chirp RelieFF')
        grid on
        grid minor
    subplot(2,1,2) 
        plot(   snr_db_array,mat_chirp_mrmr(1,:),'--o', ...
                snr_db_array,mat_chirp_mrmr(2,:),'--o', ...
                snr_db_array,mat_chirp_mrmr(3,:),'-o', ...
                snr_db_array,mat_chirp_mrmr(4,:),'-o');
        xlabel(  'SubSet', 'FontSize', 10 )
        ylabel( 'Acc(%)', 'FontSize', 10, 'Rotation', 90 )
        legend({'25db','20db','15db','10db'},'Location','southeast')
        subtitle('Chirp MRMR')
        grid on
        grid minor
hold off