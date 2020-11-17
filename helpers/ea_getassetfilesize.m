function fsize = ea_getassetfilesize(id)

% first get the correct name for the file as on the server based on
% selected asset to download
switch id
    case 'fliplr'
        servername = 'fliplr.zip';
    case '7tcgflash'
        servername = '7T_Flash_Horn_2019.mat';
    case '7tev100um'
        servername = '7T_100um_Edlow_2019.mat';
    case 'macroscalehc'
        servername = 'Macroscale_Human_Connectome_Atlas_Yeh_2018.zip';
    case 'group2013'
        servername = 'groupconnectome_horn_2013.zip'
    case 'group2016'
        servername = 'groupconnectome_nki_169_horn_2016.zip';
    case 'group2017'
        servername = 'groupconnectome_HCP_MGH_32fold_horn_2017.zip';
    case 'group2017_ppmi'
        servername = 'groupconnectome_ppmi_85_ewert_2017.zip';
    case 'fgroup2017_ppmi'
        servername = 'functional_groupconnectome_ppmi_74_15_horn_2017.zip';
end


if exist('servername', 'var')
    webdata = webread('https://filedn.com/lsPIJ4ragTWjjmV6PvlDQLu/data/');  % read html content
    split_webdata = regexp(webdata, '{', 'split');
    
    % now go through all the lines and find the matching name
    for i=1:length(split_webdata)
        idx_name = regexp(split_webdata{i}, servername);
        if ~isempty(idx_name)
            fsize_unclean = regexp(split_webdata{i}, '\s\d+\x2C', 'match'); % this but with a comma at the end
            fsize = str2double(strip(fsize_unclean{1}, 'right', ','));      % clean up size from the comma
        end
    end

else
    disp('Could not find file on server')
    fsize = 0;
end
